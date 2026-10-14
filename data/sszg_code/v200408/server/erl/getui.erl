-file("src/mod/getui/getui.erl", 1).

-module(getui).

-lager_records([{world_boss_data,
		 [id, name, lev, ref_time, ref_item_num, base_items,
		  show_lev]},
		{boss_data,
		 [id, name, lev, base_items, drop_ids, month_boss_tag,
		  show_lev, first_items, hook_lose]},
		{world_boss_role,
		 [id, name, sex, face, lev, hurt, power, time]},
		{world_boss,
		 [id, hp, hp_max, rnum, start_time, ref_time, role_list,
		  kill_log]},
		{boss, [id, win, status]},
		{m_boss,
		 [ver, boss_list, world_num_time, world_can_num,
		  world_had_num, world_buy_num, world_remind,
		  extra_boss]},
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
		{dungeon_replay, [dun_id, replays]},
		{dungeon_replay_log,
		 [type, rid, sid, name, face_id, time, power, repaly_id,
		  face_update_time, face_file]},
		{dungeon_data,
		 [id, name, chapter_id, mode, next_id, unit_id, items,
		  drop_ids, hook_unit_id, hook_items, hook_drop_ids,
		  hook_lev_add, time, is_big, energy_max, auto_items,
		  power, lev_limit, floor]},
		{dungeon, [id, status, cool_time, auto_num]},
		{dun_chapter, [id, status, list]},
		{m_dungeon,
		 [ver, mode, chapter_id, dun_id, max_dun_id,
		  last_hook_time, list, drop_idx, ext_reward, buff_list,
		  fast_combat_add_time, auto_combat_id, auto_combat_num,
		  auto_combat_items, chapter_awrads, is_first,
		  acc_hook_time, acc_hook_items]},
		{getui_msg, [id, name, timeout, ext]},
		{getui_role, [id, getui_cid, package_name, os_name]},
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

-export([online/1, offline/1, is_open/0,
	 deal_getui_msg/1, batch_send_msg/3]).

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

-file("src/mod/getui/getui.erl", 14).

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

-file("src/mod/getui/getui.erl", 15).

-file("inc/getui.hrl", 1).

-record(getui_role,
	{id = {0, <<>>}, getui_cid = <<>>, package_name = <<>>,
	 os_name = <<>>}).

-record(getui_msg,
	{id = {{0, <<>>}, 0}, name = <<>>, timeout = 0,
	 ext = []}).

-file("src/mod/getui/getui.erl", 16).

-file("inc/dungeon.hrl", 1).

-record(m_dungeon,
	{ver = 6, mode = 1, chapter_id = 0, dun_id = 0,
	 max_dun_id = 0, last_hook_time = 0, list = [],
	 drop_idx = 0, ext_reward = [], buff_list = [],
	 fast_combat_add_time = 0, auto_combat_id = 0,
	 auto_combat_num = 0, auto_combat_items = [],
	 chapter_awrads = [], is_first = 1, acc_hook_time = 0,
	 acc_hook_items = []}).

-record(dun_chapter, {id = 0, status = 0, list = []}).

-record(dungeon,
	{id = 0, status = 0, cool_time = 0, auto_num = 0}).

-record(dungeon_data,
	{id = 0, name = <<>>, chapter_id = 0, mode = 1,
	 next_id = 0, unit_id = 0, items = [], drop_ids = [],
	 hook_unit_id = 0, hook_items = [], hook_drop_ids = [],
	 hook_lev_add = [], time = 0, is_big = 0, energy_max = 0,
	 auto_items = [], power = 0, lev_limit = 0, floor = 0}).

-record(dungeon_replay_log,
	{type = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(), sid = 0  :: binary(),
	 name = <<>>  :: binary(),
	 face_id = 0  :: non_neg_integer(),
	 time = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 repaly_id = 0  :: non_neg_integer(),
	 face_update_time = 0, face_file = <<>>}).

-record(dungeon_replay,
	{dun_id = 0  :: non_neg_integer(),
	 replays = []  :: [#dungeon_replay_log{}]}).

-file("src/mod/getui/getui.erl", 17).

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

-file("src/mod/getui/getui.erl", 18).

-file("inc/boss.hrl", 1).

-record(m_boss,
	{ver = 2, boss_list = [], world_num_time = 0,
	 world_can_num = 0, world_had_num = 0, world_buy_num = 0,
	 world_remind = [], extra_boss = []}).

-record(boss, {id = 0, win = 0, status = 0}).

-record(world_boss,
	{id = 0, hp = 0, hp_max = 0, rnum = 0, start_time = 0,
	 ref_time = 0, role_list = [], kill_log = []}).

-record(world_boss_role,
	{id = {0, <<>>}, name = <<>>, sex = 0, face = 0,
	 lev = 0, hurt = 0, power = 0, time = 0}).

-record(boss_data,
	{id = 0, name = <<>>, lev = 0, base_items = [],
	 drop_ids = [], month_boss_tag = 0, show_lev = 0,
	 first_items = [], hook_lose = []}).

-record(world_boss_data,
	{id = 0, name = <<>>, lev = 0, ref_time = 0,
	 ref_item_num = 0, base_items = [], show_lev = 0}).

-file("src/mod/getui/getui.erl", 19).

-spec online(#role{}) -> ok | {ok, #role{}}.

online(#role{id = RoleId,
	     m_dungeon = #m_dungeon{max_dun_id = MaxDunId}})
    when MaxDunId > 0 ->
    ets:delete(getui_msg, {RoleId, 1}),
    ets:delete(getui_msg, {RoleId, 2}),
    ets:delete(getui_msg, {RoleId, 3}),
    ets:delete(getui_msg, {RoleId, 4}),
    ok;
online(_Role) -> ok.

-spec offline(#role{}) -> ok | {ok, #role{}}.

offline(Role = #role{m_dungeon =
			 #m_dungeon{max_dun_id = MaxDunId}})
    when MaxDunId > 0 ->
    Now = date:unixtime(), ok;
offline(_Role) -> ok.

set_getui_msg_timer(Type = 2,
		    #role{id = RoleId, name = Name,
			  m_dungeon = #m_dungeon{max_dun_id = MaxDunId},
			  assets = #assets{energy = Energy}},
		    Now) ->
    #dungeon_data{hook_items = HookItems,
		  energy_max = EnergyMax} =
	dungeon_data:get(max(MaxDunId, 10010)),
    case list_util:keyfind(7, HookItems, 0) of
      0 -> ok;
      MinuEnergy ->
	  FullTime = Now +
		       (EnergyMax - Energy) div MinuEnergy * 60
		       + 300,
	  ets:insert(getui_msg,
		     #getui_msg{id = {RoleId, Type}, name = Name,
				timeout = FullTime})
    end;
set_getui_msg_timer(Type = 4,
		    #role{id = RoleId, name = Name,
			  m_dungeon =
			      #m_dungeon{acc_hook_time = AccHookTime,
					 max_dun_id = MaxDunId}},
		    Now)
    when MaxDunId > 0 ->
    Time = max(180,
	       dungeon_data:get_const(income_receipt_time) -
		 AccHookTime),
    FullTime = Now + Time,
    ets:insert(getui_msg,
	       #getui_msg{id = {RoleId, Type}, name = Name,
			  timeout = FullTime});
set_getui_msg_timer(_Type, _Role, _Now) -> ok.

-spec is_open() -> true | false.

is_open() ->
    case sys_env:get(platform) of
      "local" -> false;
      "lab" -> false;
      "dev" -> false;
      "verifyios" -> false;
      _ -> true
    end.

-spec deal_getui_msg(#getui_msg{}) -> ok.

deal_getui_msg(GetuiMsg) ->
    case is_open() of
      true -> do_deal_getui_msg(GetuiMsg);
      _ -> pass
    end.

do_deal_getui_msg(#getui_msg{id = {RoleId, 1},
			     name = Name}) ->
    getui_mgr:send_msg(RoleId, lang:get(<<"装备可熔炼"/utf8>>),
		       util:fbin(lang:get(<<"亲爱的冒险者大人，您在【~ts】的【~ts】背包已满，上线熔炼即可获得精炼石咯!!!"/utf8>>),
				 [sys_env:get(zone_name), Name]));
do_deal_getui_msg(#getui_msg{id = {RoleId, 2},
			     name = Name}) ->
    getui_mgr:send_msg(RoleId, lang:get(<<"冒险可探索"/utf8>>),
		       util:fbin(lang:get(<<"亲爱的冒险者大人，您在【~ts】的【~ts】冒险情报已满，上线即可冒险，获得更多金币和宝物"
					    "哟!!!"/utf8>>),
				 [sys_env:get(zone_name), Name]));
do_deal_getui_msg(#getui_msg{id = {RoleId, 3},
			     name = Name}) ->
    getui_mgr:send_msg(RoleId,
		       lang:get(<<"世界Boss可挑战"/utf8>>),
		       util:fbin(lang:get(<<"亲爱的冒险者大人，您在【~ts】的【~ts】世界Boss挑战次数已满，上线即可挑战，获得更"
					    "多橙装碎片!!!"/utf8>>),
				 [sys_env:get(zone_name), Name]));
do_deal_getui_msg(#getui_msg{id = {RoleId, 4},
			     name = Name}) ->
    getui_mgr:send_msg(RoleId, lang:get(<<"挂机收益将满"/utf8>>),
		       util:fbin(lang:get(<<"亲爱的冒险者大人，您在【~ts]的【~ts】挂机收益即将达到上限，请尽快前往出击界面领取!!!"/utf8>>),
				 [sys_env:get(zone_name), Name]));
do_deal_getui_msg(GetuiMsg) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidgetui102, _, {__Levelgetui102, __Tracesgetui102}}
	  when __Levelgetui102 band 8 /= 0 orelse
		 __Tracesgetui102 /= [] ->
	  lager:do_log(error,
		       [{module, getui}, {function, do_deal_getui_msg},
			{line, 102}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("个推信息匹配不到处理方法:~w", [GetuiMsg]), none,
		       4096, 8, __Levelgetui102, __Tracesgetui102, lager_event,
		       __Pidgetui102);
      _ -> ok
    end.

-spec batch_send_msg(pos_integer(), binary(),
		     binary()) -> ok.

batch_send_msg(Type, Title, Msg) ->
    case is_open() of
      true ->
	  spawn(fun () -> do_batch_send_msg(Type, Title, Msg)
		end);
      _ -> pass
    end.

do_batch_send_msg(100, Title, Msg) ->
    case
      db:get_all("select getui_cid, package_name, os_name "
		 "from role where lev >= 20 and getui_cid "
		 "!= '' and logout_time > ?",
		 [date:unixtime() - 86400 * 3])
	of
      {ok, L} -> do_batch_send_msg(L, Title, Msg);
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidgetui117, _, {__Levelgetui117, __Tracesgetui117}}
		when __Levelgetui117 band 8 /= 0 orelse
		       __Tracesgetui117 /= [] ->
		lager:do_log(error,
			     [{module, getui}, {function, do_batch_send_msg},
			      {line, 117}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("发送个推信息失败:~w", [_Err]), none, 4096,
			     8, __Levelgetui117, __Tracesgetui117, lager_event,
			     __Pidgetui117);
	    _ -> ok
	  end
    end;
do_batch_send_msg(List, Title, Msg) ->
    L1 = [{getui_mgr:get_appid(OsName, PackageName),
	   GetuiCid}
	  || [GetuiCid, PackageName, OsName] <- List],
    do_batch_send_msg_(L1, Title, Msg).

do_batch_send_msg_(List = [{AppId, _Cid} | _T], Title,
		   Msg) ->
    L1 = [Cid || {AppId1, Cid} <- List, AppId =:= AppId1],
    L2 = [I || I = {AppId1, _} <- List, AppId =/= AppId1],
    log_http:send_getui(AppId, L1, Title, Msg),
    do_batch_send_msg_(L2, Title, Msg);
do_batch_send_msg_([], _Title, _Msg) -> ok.


