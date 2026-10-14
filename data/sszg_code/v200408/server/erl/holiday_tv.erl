-file("src/mod/holiday/holiday_tv.erl", 1).

-module(holiday_tv).

-lager_records([{holiday,
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

-export([init_val/1]).

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

-file("src/mod/holiday/holiday_tv.erl", 10).

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

-file("src/mod/holiday/holiday_tv.erl", 11).

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

-file("src/mod/holiday/holiday_tv.erl", 12).

-spec init_val(pos_integer()) -> any().

init_val(1003) -> {0, []};
init_val(91003) -> {0, []};
init_val(991003) -> {0, []};
init_val(1004) -> [];
init_val(91004) -> [];
init_val(991004) -> [];
init_val(1005) -> {[], []};
init_val(91005) -> {[], []};
init_val(991005) -> {[], []};
init_val(1006) -> [];
init_val(91006) -> [];
init_val(991006) -> [];
init_val(1007) -> {[], []};
init_val(91007) -> {[], []};
init_val(991007) -> {[], []};
init_val(1008) -> {0, []};
init_val(91008) -> {0, []};
init_val(991008) -> {0, []};
init_val(1009) -> [];
init_val(91009) -> [];
init_val(991009) -> [];
init_val(1011) -> {0, []};
init_val(91011) -> {0, []};
init_val(991011) -> {0, []};
init_val(1012) -> {[], []};
init_val(91012) -> {[], []};
init_val(991012) -> {[], []};
init_val(1013) -> {0, []};
init_val(91013) -> {0, []};
init_val(991013) -> {0, []};
init_val(1014) -> [];
init_val(91014) -> [];
init_val(991014) -> [];
init_val(1015) -> [];
init_val(91015) -> [];
init_val(991015) -> [];
init_val(1016) -> [];
init_val(91016) -> [];
init_val(991016) -> [];
init_val(1017) -> [];
init_val(91017) -> [];
init_val(991017) -> [];
init_val(1018) -> [];
init_val(91018) -> [];
init_val(991018) -> [];
init_val(1019) -> [];
init_val(91019) -> [];
init_val(991019) -> [];
init_val(1020) -> [];
init_val(91020) -> [];
init_val(991020) -> [];
init_val(1021) -> {0, []};
init_val(91021) -> {0, []};
init_val(991021) -> {0, []};
init_val(1022) -> {0, []};
init_val(91022) -> {0, []};
init_val(991022) -> {0, []};
init_val(1023) -> {0, []};
init_val(91023) -> {0, []};
init_val(991023) -> {0, []};
init_val(1024) -> {0, []};
init_val(91024) -> {0, []};
init_val(991024) -> {0, []};
init_val(1025) -> {0, []};
init_val(91025) -> {0, []};
init_val(991025) -> {0, []};
init_val(1026) -> [];
init_val(91026) -> [];
init_val(991026) -> [];
init_val(1027) -> {0, []};
init_val(91027) -> {0, []};
init_val(991027) -> {0, []};
init_val(1028) -> {0, []};
init_val(91028) -> {0, []};
init_val(991028) -> {0, []};
init_val(1029) -> [];
init_val(91029) -> [];
init_val(991029) -> [];
init_val(1030) -> [];
init_val(91030) -> [];
init_val(991030) -> [];
init_val(1033) -> [];
init_val(91033) -> [];
init_val(991033) -> [];
init_val(1034) -> [];
init_val(91034) -> [];
init_val(991034) -> [];
init_val(1035) -> [];
init_val(91035) -> [];
init_val(991035) -> [];
init_val(1032) -> 0;
init_val(91032) -> 0;
init_val(991032) -> 0;
init_val(1036) -> {0, 0, 0, 0, []};
init_val(91036) -> {0, 0, 0, 0, []};
init_val(991036) -> {0, 0, 0, 0, []};
init_val(1037) -> {0, []};
init_val(91037) -> {0, []};
init_val(991037) -> {0, []};
init_val(1038) -> {0, []};
init_val(91038) -> {0, []};
init_val(991038) -> {0, []};
init_val(1039) -> [];
init_val(91039) -> [];
init_val(991039) -> [];
init_val(9991039) -> [];
init_val(1040) -> {0, []};
init_val(91040) -> {0, []};
init_val(991040) -> {0, []};
init_val(9991040) -> {0, []};
init_val(1041) -> {0, []};
init_val(91041) -> {0, []};
init_val(991041) -> {0, []};
init_val(9991041) -> {0, []};
init_val(1042) -> [];
init_val(91042) -> [];
init_val(991042) -> [];
init_val(1043) -> [];
init_val(91043) -> [];
init_val(991043) -> [];
init_val(1045) -> {0, []};
init_val(91045) -> {0, []};
init_val(991045) -> {0, []};
init_val(1046) -> 0;
init_val(91046) -> 0;
init_val(991046) -> 0;
init_val(1048) -> [];
init_val(91048) -> [];
init_val(991048) -> [];
init_val(1049) -> [];
init_val(91049) -> [];
init_val(991049) -> [];
init_val(1051) -> {0, []};
init_val(91051) -> {0, []};
init_val(991051) -> {0, []};
init_val(1052) -> {0, []};
init_val(91052) -> {0, []};
init_val(991052) -> {0, []};
init_val(1053) -> [];
init_val(91053) -> [];
init_val(991053) -> [];
init_val(1054) -> {0, []};
init_val(91054) -> {0, []};
init_val(991054) -> {0, []};
init_val(3001) -> 0;
init_val(93001) -> 0;
init_val(993001) -> 0;
init_val(3003) -> [];
init_val(93003) -> [];
init_val(993003) -> [];
init_val(3010) -> [];
init_val(93010) -> [];
init_val(993010) -> [];
init_val(3011) -> [];
init_val(93011) -> [];
init_val(993011) -> [];
init_val(3012) -> [];
init_val(93012) -> [];
init_val(993012) -> [];
init_val(3017) -> [];
init_val(93017) -> [];
init_val(993017) -> [];
init_val(3013) -> [];
init_val(93013) -> [];
init_val(993013) -> [];
init_val(3014) -> [];
init_val(93014) -> [];
init_val(993014) -> [];
init_val(3026) -> [];
init_val(93026) -> [];
init_val(993026) -> [];
init_val(3027) -> [];
init_val(93027) -> [];
init_val(993027) -> [];
init_val(3009) -> {0, []};
init_val(93009) -> {0, []};
init_val(993009) -> {0, []};
init_val(3016) -> {1, 0, [], [], []};
init_val(93016) -> {1, 0, [], [], []};
init_val(993016) -> {1, 0, [], [], []};
init_val(3018) -> [];
init_val(93018) -> [];
init_val(993018) -> [];
init_val(3031) -> [];
init_val(93031) -> [];
init_val(993031) -> [];
init_val(3032) -> [];
init_val(93032) -> [];
init_val(993032) -> [];
init_val(3033) -> [];
init_val(93033) -> [];
init_val(993033) -> [];
init_val(9993033) -> [];
init_val(3021) -> [];
init_val(93021) -> [];
init_val(993021) -> [];
init_val(3023) -> {0, []};
init_val(93023) -> {0, []};
init_val(993023) -> {0, []};
init_val(3025) -> {0, []};
init_val(93025) -> {0, []};
init_val(993024) -> {0, []};
init_val(3028) -> {[], []};
init_val(93028) -> {[], []};
init_val(993028) -> {[], []};
init_val(3029) -> [];
init_val(93029) -> [];
init_val(993029) -> [];
init_val(3040) -> [];
init_val(93040) -> [];
init_val(993040) -> [];
init_val(3043) -> {0, 0, []};
init_val(93043) -> {0, 0, []};
init_val(993043) -> {0, 0, []};
init_val(3044) -> 0;
init_val(93044) -> 0;
init_val(993044) -> 0;
init_val(3048) -> {0, <<>>};
init_val(93048) -> {0, <<>>};
init_val(993048) -> {0, <<>>};
init_val(7001) -> {0, []};
init_val(97001) -> {0, []};
init_val(997001) -> {0, []};
init_val(7002) -> {0, []};
init_val(97002) -> {0, []};
init_val(997002) -> {0, []};
init_val(7003) -> {0, []};
init_val(97003) -> {0, []};
init_val(997003) -> {0, []};
init_val(7004) -> {0, 0, []};
init_val(97004) -> {0, 0, []};
init_val(997004) -> {0, 0, []};
init_val(7005) -> {0, 0, 0, []};
init_val(97005) -> {0, 0, 0, []};
init_val(997005) -> {0, 0, 0, []};
init_val(7009) -> {0, []};
init_val(97009) -> {0, []};
init_val(997009) -> {0, []};
init_val(3006) -> [];
init_val(93006) -> [];
init_val(993006) -> [];
init_val(3007) -> {0, []};
init_val(93007) -> {0, []};
init_val(993007) -> {0, []};
init_val(3020) -> [];
init_val(93020) -> [];
init_val(3036) -> {1, []};
init_val(93036) -> {1, []};
init_val(993036) -> {1, []};
init_val(3038) -> [];
init_val(93038) -> [];
init_val(993038) -> [];
init_val(3037) -> [];
init_val(93037) -> [];
init_val(993037) -> [];
init_val(3049) -> [];
init_val(93049) -> [];
init_val(993049) -> [];
init_val(_Bid) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_tv422, _,
       {__Levelholiday_tv422, __Tracesholiday_tv422}}
	  when __Levelholiday_tv422 band 8 /= 0 orelse
		 __Tracesholiday_tv422 /= [] ->
	  lager:do_log(error,
		       [{module, holiday_tv}, {function, init_val},
			{line, 422}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("init_val::Bid=~w", [_Bid]), none, 4096,
		       8, __Levelholiday_tv422, __Tracesholiday_tv422,
		       lager_event, __Pidholiday_tv422);
      _ -> ok
    end,
    undefined.


