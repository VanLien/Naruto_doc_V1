-file("src/mod/guild_secret_area/guild_secret_area_v"
      "er.erl",
      1).

-module(guild_secret_area_ver).

-lager_records([{guild_secret_area_rank,
		 [ver, id, rank_detail]},
		{secret_rank, [ver, number, chapter_id, dps_list]},
		{role_rank,
		 [ver, r_id, lev, face_id, avatar_bid, name, dps, rank,
		  max_dps, power, face_update_time, face_file]},
		{guild_secret_area,
		 [ver, id, boss_detail, boss_list, number,
		  fail_boss_list, last_crusade]},
		{boss_detail,
		 [ver, bid, hp, max_hp, end_time, count_time,
		  kill_time]},
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

-export([do/1, do_rank/1]).

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

-file("src/mod/guild_secret_area/guild_secret_area_v"
      "er.erl",
      12).

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

-file("src/mod/guild_secret_area/guild_secret_area_v"
      "er.erl",
      13).

-file("inc/guild_secret_area.hrl", 1).

-record(boss_detail,
	{ver = 2  :: pos_integer(), bid = 0  :: pos_integer(),
	 hp = 0  :: pos_integer(), max_hp = 0  :: pos_integer(),
	 end_time = 0  :: pos_integer(),
	 count_time = 0  :: pos_integer(),
	 kill_time = 0  :: pos_integer()}).

-record(guild_secret_area,
	{ver = 2  :: pos_integer(),
	 id = {0, <<>>}  :: {pos_integer(), binary()},
	 boss_detail = #boss_detail{}  :: tuple(),
	 boss_list = []  :: list(), number = 0  :: pos_integer(),
	 fail_boss_list = []  :: pos_integer(),
	 last_crusade = 0  :: pos_integer()}).

-record(role_rank,
	{ver = 2  :: pos_integer(),
	 r_id = {0, <<>>}  :: tuple(), lev = 0  :: pos_integer(),
	 face_id = 0  :: pos_integer(),
	 avatar_bid = 0  :: pos_integer(),
	 name = <<>>  :: string(), dps = 0  :: pos_integer(),
	 rank = 0  :: pos_integer(),
	 max_dps = 0  :: pos_integer(),
	 power = 0  :: pos_integer(),
	 face_update_time = 0  :: pos_integer(),
	 face_file = <<>>  :: string()}).

-record(secret_rank,
	{ver = 1  :: pos_integer(),
	 number = 0  :: pos_integer(),
	 chapter_id = 0  :: pos_integer(),
	 dps_list = []  :: list()}).

-record(guild_secret_area_rank,
	{ver = 1  :: pos_integer(),
	 id = {0, <<>>}  :: {pos_integer(), binary()},
	 rank_detail = []  :: list()}).

-file("src/mod/guild_secret_area/guild_secret_area_v"
      "er.erl",
      14).

do({guild_secret_area, Ver = 1, Id, BossDetail,
    BossList, Number, FailBossList}) ->
    LastCrusade = 0,
    do({guild_secret_area, Ver + 1, Id, BossDetail,
	BossList, Number, FailBossList, LastCrusade});
do(Data = #guild_secret_area{ver = 2,
			     boss_detail = BossDetail}) ->
    NewBossDetail = do_boss_detail(BossDetail),
    NewData = Data#guild_secret_area{boss_detail =
					 NewBossDetail},
    {ok, NewData};
do(_) -> {false, lang:get(<<"公会秘境数据转换失败"/utf8>>)}.

do_boss_detail({boss_detail, Ver = 1, Bid, Hp, MaxHp,
		EndTime, CountTime}) ->
    KillTime = 0,
    do_boss_detail({boss_detail, Ver + 1, Bid, Hp, MaxHp,
		    EndTime, CountTime, KillTime});
do_boss_detail(Data = #boss_detail{ver = 2}) -> Data;
do_boss_detail(Data) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_secret_area_ver33, _,
       {__Levelguild_secret_area_ver33,
	__Tracesguild_secret_area_ver33}}
	  when __Levelguild_secret_area_ver33 band 8 /= 0 orelse
		 __Tracesguild_secret_area_ver33 /= [] ->
	  lager:do_log(error,
		       [{module, guild_secret_area_ver},
			{function, do_boss_detail}, {line, 33},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "公会秘境boss数据转换失败", none, 4096, 8,
		       __Levelguild_secret_area_ver33,
		       __Tracesguild_secret_area_ver33, lager_event,
		       __Pidguild_secret_area_ver33);
      _ -> ok
    end,
    Data.

do_rank(Data = #guild_secret_area_rank{ver = 1,
				       rank_detail = RankDetailList}) ->
    NewRankDetailList = [do_rank_detail(RankDetail)
			 || RankDetail <- RankDetailList],
    NewData = Data#guild_secret_area_rank{rank_detail =
					      NewRankDetailList},
    {ok, NewData};
do_rank(_) ->
    {false, lang:get(<<"公会秘境排行榜数据转换失败"/utf8>>)}.

do_rank_detail(Data = #secret_rank{ver = 1,
				   dps_list = DpsList}) ->
    NewDpsList = [do_dps(Dps) || Dps <- DpsList],
    NewData = Data#secret_rank{dps_list = NewDpsList},
    NewData;
do_rank_detail(Data) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_secret_area_ver50, _,
       {__Levelguild_secret_area_ver50,
	__Tracesguild_secret_area_ver50}}
	  when __Levelguild_secret_area_ver50 band 8 /= 0 orelse
		 __Tracesguild_secret_area_ver50 /= [] ->
	  lager:do_log(error,
		       [{module, guild_secret_area_ver},
			{function, do_rank_detail}, {line, 50},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "公会秘境排行榜细节转换失败", none, 4096, 8,
		       __Levelguild_secret_area_ver50,
		       __Tracesguild_secret_area_ver50, lager_event,
		       __Pidguild_secret_area_ver50);
      _ -> ok
    end,
    Data.

do_dps({role_rank, Ver = 1, Rid, Lev, FaceId, AvatarBid,
	Name, Dps, Rank, MaxDps, Power}) ->
    FaceUpdateTime = 0,
    FaceFile = <<>>,
    do_dps({role_rank, Ver + 1, Rid, Lev, FaceId, AvatarBid,
	    Name, Dps, Rank, MaxDps, Power, FaceUpdateTime,
	    FaceFile});
do_dps(Data = #role_rank{ver = 2}) -> Data;
do_dps(Data) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_secret_area_ver61, _,
       {__Levelguild_secret_area_ver61,
	__Tracesguild_secret_area_ver61}}
	  when __Levelguild_secret_area_ver61 band 8 /= 0 orelse
		 __Tracesguild_secret_area_ver61 /= [] ->
	  lager:do_log(error,
		       [{module, guild_secret_area_ver}, {function, do_dps},
			{line, 61}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "公会秘境排行榜玩家排行榜信息转换失败", none, 4096, 8,
		       __Levelguild_secret_area_ver61,
		       __Tracesguild_secret_area_ver61, lager_event,
		       __Pidguild_secret_area_ver61);
      _ -> ok
    end,
    Data.


