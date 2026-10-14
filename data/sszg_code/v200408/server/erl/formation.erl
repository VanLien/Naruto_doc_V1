-file("src/mod/formation/formation.erl", 1).

-module(formation).

-lager_records([{group_attr, [atk, hp_max, def, speed]},
		{partner_base_p,
		 [partner_id, bid, lev, star, star_step, quality,
		  break_lev, power, skills, add_star, is_lock, use_skin,
		  end_time, resonate_lev, resonate_break_lev]},
		{partner_lev_data,
		 [add_hp, add_atk, add_def, add_speed]},
		{partner_base_data,
		 [bid, name, type, rare_type, init_star, show_star,
		  init_lev, pos_type, camp_type, break_lev, recruit_type,
		  skills, addition_skill, addition_skill2, skill_order,
		  ai, awake_items, awake_attr, awake_skill, init_power,
		  add_power, leader_skill, chips_num, chips_id,
		  hidden_skills, init_star5_num, hook_skills,
		  compose_expend, can_use_direct_item, awaken_info,
		  break_id, other_skills, item_id]},
		{partner_comment_p,
		 [comment_id, name, msg, like_num, no_like_num,
		  is_like]},
		{partner_comment,
		 [comment_id, partner_id, account, rid, sid, name,
		  post_time, msg, like_num, no_like_num]},
		{partner_bag,
		 [ver, type, num, buy_num, partner_list, partner_had,
		  comment_likes, partner_field, partner_star_lev,
		  max_star, partner_decomposes, partner_skins]},
		{partner_field, [lev, fields]},
		{partner_gemstone, [ver, type, gemstones]},
		{gemstone, [ver, pos, bid]},
		{partner_skin, [ver, id, end_time, ext]},
		{partner,
		 [ver, id, bid, type, career, is_lock, pos_type,
		  camp_type, rare_type, lev, quality, exp, name, star,
		  star_step, step_attr, break_lev, break_attr, power,
		  base_attr, group_attr, all_attr, skills, break_skills,
		  set_skills, eqm, hidden_skills, artifacts, fetter,
		  fetter_attr, fetter_power, score_lists, gemstones,
		  awaken_count, awaken_skills, add_star, dower_skill,
		  holy_eqm, use_skin, end_time, resonate_lev,
		  resonate_break_lev]},
		{package,
		 [type, next_id, volume, open_times, free_cell, items]},
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
		{formation_attr_data,
		 [type, lev, expend, attr_1, attr_2, attr_3, attr_4,
		  attr_5, attr_6, attr_7, attr_8, attr_9, power]},
		{formation_data,
		 [type, pos, need_lev, name, need_items, restrain_s,
		  restrain_w]},
		{formation_info_p, [id, name, power, pos_info]},
		{pk_formation_info,
		 [id, name, formation, ffor_target, power, is_ready,
		  guild_name, lev, face_id, pid]},
		{formation_fight_info, [pos, fight_pos, id]},
		{formation_base_p,
		 [id, lev, exp, pos_info, formation_list, power,
		  hallows_id, all_lineups]},
		{formation_pos, [pos, id]},
		{formation_lineup,
		 [id, name, power, pos_info, max_power, type,
		  hallows_id]},
		{formation_sys, [id, type, pos_info, hallows_id]},
		{m_formation,
		 [ver, list, use_lineup, all_lineups, sys_formations]},
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

-export([check_formation_pos_info/4,
	 check_formation_pos_info/5,
	 do_check_formation_pos_info/4,
	 get_sys_formation_power/2, get_sys_formation/2,
	 init_sys_formation/2, push_sys_formation/2,
	 set_sys_formation/5, save_sys_formation/2,
	 get_in_formation_partners/2]).

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

-file("src/mod/formation/formation.erl", 20).

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

-file("src/mod/formation/formation.erl", 21).

-file("inc/formation.hrl", 1).

-record(m_formation,
	{ver = 1, list = [], use_lineup = 1, all_lineups = [],
	 sys_formations = []}).

-record(formation_sys,
	{id = 1, type = 1, pos_info = [], hallows_id = 0}).

-record(formation_lineup,
	{id = 1, name = <<>>, power = 0, pos_info = [],
	 max_power = 0, type = 1, hallows_id = 0}).

-record(formation_pos, {pos, id = 0}).

-record(formation_base_p,
	{id, lev, exp, pos_info, formation_list, power,
	 hallows_id = 0, all_lineups}).

-record(formation_fight_info, {pos, fight_pos, id = 0}).

-record(pk_formation_info,
	{id, name, formation, ffor_target, power,
	 is_ready = false, guild_name = <<>>, lev = 0, face_id,
	 pid = none}).

-record(formation_info_p,
	{id = 0, name = <<>>, power = 0, pos_info = []}).

-record(formation_data,
	{type, pos, need_lev, name, need_items = [],
	 restrain_s = [], restrain_w = []}).

-record(formation_attr_data,
	{type, lev, expend = [], attr_1 = [], attr_2 = [],
	 attr_3 = [], attr_4 = [], attr_5 = [], attr_6 = [],
	 attr_7 = [], attr_8 = [], attr_9 = [], power}).

-file("src/mod/formation/formation.erl", 22).

-file("inc/partner.hrl", 1).

-file("inc/attr.hrl", 1).

-record(attr,
	{fc = 0, toughness = 0, atk = 0, def = 0, def_s = 0,
	 def_p = 0, hp_max = 0, hp = 0, speed = 0, hit_rate = 0,
	 dodge_rate = 0, crit_rate = 0, crit_ratio = 0,
	 hit_magic = 0, dodge_magic = 0, dam = 0, res = 0,
	 cure = 0, be_cure = 0, dam_p = 0, res_p = 0, dam_s = 0,
	 res_s = 0, tenacity = 0}).

-record(attr_calc,
	{attr = #attr{}  :: #attr{},
	 attr_no_ratio = #attr{}  :: #attr{},
	 ratio = #attr{}  :: #attr{},
	 attr_no_fc = #attr{}  :: #attr{},
	 ratio_no_fc = #attr{}  :: #attr{}}).

-file("inc/partner.hrl", 11).

-file("inc/package.hrl", 1).

-record(package,
	{type = 1  :: integer(), next_id = 1  :: pos_integer(),
	 volume = 0  :: non_neg_integer(),
	 open_times = 0  :: non_neg_integer(),
	 free_cell = []  :: list(), items = []  :: [tuple()]}).

-file("inc/partner.hrl", 12).

-file("inc/common.hrl", 1).

-file("inc/partner.hrl", 13).

-record(partner,
	{ver = 7  :: non_neg_integer(),
	 id = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer(),
	 type = 0  :: non_neg_integer(), career = 0,
	 is_lock = []  :: list(),
	 pos_type = 0  :: non_neg_integer(),
	 camp_type = 0  :: non_neg_integer(),
	 rare_type = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 quality = 0  :: non_neg_integer(),
	 exp = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 star = 1  :: non_neg_integer(),
	 star_step = 0  :: non_neg_integer(), step_attr = [],
	 break_lev = 0  :: non_neg_integer(),
	 break_attr = []  :: list(),
	 power = 0  :: non_neg_integer(), base_attr  :: #attr{},
	 group_attr = [], all_attr  :: #attr{},
	 skills = []  :: [non_neg_integer()],
	 break_skills = []  ::
	     [{non_neg_integer(), non_neg_integer()}],
	 set_skills = []  :: [non_neg_integer()], eqm = [],
	 hidden_skills = [], artifacts = [], fetter = [],
	 fetter_attr = [], fetter_power = 0, score_lists = [],
	 gemstones = [], awaken_count = 0, awaken_skills = [],
	 add_star = 0, dower_skill = [], holy_eqm = [],
	 use_skin = 0, end_time = 0, resonate_lev = 0,
	 resonate_break_lev = 0}).

-record(partner_skin,
	{ver = 1, id = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 ext = []  :: list()}).

-record(gemstone,
	{ver = 1, pos = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer()}).

-record(partner_gemstone,
	{ver = 1, type = 0  :: non_neg_integer(),
	 gemstones = []  :: [#gemstone{}]}).

-record(partner_field,
	{lev = 1  :: non_neg_integer(),
	 fields = []  ::
	     [{non_neg_integer(), non_neg_integer()}]}).

-record(partner_bag,
	{ver = -1  :: non_neg_integer(),
	 type = 0  :: non_neg_integer(),
	 num = 0  :: non_neg_integer(),
	 buy_num = 0  :: non_neg_integer(),
	 partner_list = []  :: [#partner{}],
	 partner_had = []  ::
	     [{non_neg_integer(), non_neg_integer(),
	       non_neg_integer()}],
	 comment_likes = []  ::
	     [{non_neg_integer(), non_neg_integer()}],
	 partner_field = []  :: #partner_field{},
	 partner_star_lev = 0  :: non_neg_integer(),
	 max_star = 0  :: non_neg_integer(),
	 partner_decomposes = []  :: non_neg_integer(),
	 partner_skins = []  :: list()}).

-record(partner_comment,
	{comment_id = 0, partner_id = 0, account = <<>>,
	 rid = 0, sid = <<>>, name = <<>>, post_time = 0,
	 msg = <<>>, like_num = 0, no_like_num = 0}).

-record(partner_comment_p,
	{comment_id = 0, name = <<>>, msg = <<>>, like_num = 0,
	 no_like_num = 0, is_like = 0}).

-record(partner_base_data,
	{bid, name, type, rare_type, init_star = 0,
	 show_star = 0, init_lev = 1, pos_type = 0,
	 camp_type = 0, break_lev = 0, recruit_type = 0,
	 skills = [], addition_skill = 0, addition_skill2 = 0,
	 skill_order = [], ai = 0, awake_items = [],
	 awake_attr = [], awake_skill = none, init_power = 0,
	 add_power = 0, leader_skill = 0, chips_num = 0,
	 chips_id = 0, hidden_skills = [], init_star5_num = 0,
	 hook_skills = [], compose_expend = [],
	 can_use_direct_item = 0, awaken_info = [], break_id = 0,
	 other_skills = [], item_id = 0}).

-record(partner_lev_data,
	{add_hp = 1000, add_atk = 1000, add_def = 1000,
	 add_speed = 1000}).

-record(partner_base_p,
	{partner_id, bid, lev, star, star_step, quality,
	 break_lev, power, skills, add_star, is_lock,
	 use_skin = 0, end_time = 0, resonate_lev = 0,
	 resonate_break_lev = 0}).

-record(group_attr,
	{atk = 0, hp_max = 0, def = 0, speed = 0}).

-file("src/mod/formation/formation.erl", 23).

-spec get_in_formation_partners(#role{} | #role_robot{},
				pos_integer()) -> [#partner{}].

get_in_formation_partners(Role = #role{partner_bag =
					   #partner_bag{partner_list =
							    PartnerList}},
			  SysType) ->
    #formation_sys{pos_info = PosInfo} =
	get_sys_formation(Role, SysType),
    [P
     || P = #partner{id = Id} <- PartnerList,
	lists:keymember(Id, #formation_pos.id, PosInfo)];
get_in_formation_partners(Role = #role_robot{partners =
						 PartnerList},
			  SysType) ->
    #formation_sys{pos_info = PosInfo} =
	get_sys_formation(Role, SysType),
    [P
     || P = #partner{id = Id} <- PartnerList,
	lists:keymember(Id, #formation_pos.id, PosInfo)].

-spec check_formation_pos_info(#role{},
			       FormationType :: pos_integer(), list(),
			       pos_integer()) -> {ok, list()} |
						 {false, binary()}.

check_formation_pos_info(Role, FormationType, PosInfo,
			 HallowsId) ->
    check_formation_pos_info(Role, FormationType, PosInfo,
			     HallowsId, 1).

check_formation_pos_info(Role = #role{m_formation =
					  #m_formation{list = List}},
			 FormationType, PosInfo, HallowsId, SysType) ->
    case lists:member(FormationType, List) of
      false -> {false, lang:get(<<"相关阵法不存在或未激活"/utf8>>)};
      _ ->
	  case hallows:get_hallows(Role, HallowsId) of
	    false when HallowsId =/= 0 ->
		{false, lang:get(<<"未激活该圣器"/utf8>>)};
	    _ ->
		CanResonate = lists:member(SysType,
					   [0, 17, 4, 12, 13, 14, 15, 16]),
		check_formation_pos_info_(PosInfo, Role, [], [],
					  CanResonate, false)
	  end
    end.

check_formation_pos_info_([], _Role, L, _L2, _,
			  IsNotLimit) ->
    case L == [] orelse IsNotLimit of
      true -> {ok, L};
      _ -> {false, lang:get(<<"至少上阵一个非赋能英雄"/utf8>>)}
    end;
check_formation_pos_info_([{_Pos, 0} | T], Role, L, L2,
			  CanResonate, IsNotLimit) ->
    check_formation_pos_info_(T, Role, L, L2, CanResonate,
			      IsNotLimit);
check_formation_pos_info_([{Pos, PId} | T], Role, L, L2,
			  CanResonate, IsNotLimit)
    when Pos >= 1 andalso Pos =< 5 ->
    case lists:keymember(PId, #formation_pos.id, L) of
      true -> {false, lang:get(<<"伙伴重复上阵"/utf8>>)};
      _ ->
	  case partner_lib:get_partner(Role, PId) of
	    #partner{end_time = EndTime}
		when EndTime =/= 0 andalso CanResonate == false ->
		{false, lang:get(<<"赋能英雄不能参与该玩法"/utf8>>)};
	    #partner{bid = Bid, end_time = EndTime} ->
		case lists:member(Bid, L2) of
		  false ->
		      case lists:keymember(Pos, #formation_pos.pos, L) of
			true -> {false, lang:get(<<"一个位置只能上一个英雄"/utf8>>)};
			_ ->
			    NewIsNotLimit = util:if_true(EndTime == 0, true,
							 IsNotLimit),
			    check_formation_pos_info_(T, Role,
						      [#formation_pos{pos = Pos,
								      id = PId}
						       | L],
						      [Bid | L2], CanResonate,
						      NewIsNotLimit)
		      end;
		  _ -> {false, lang:get(<<"不能同时上阵2个相同英雄"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"没有该伙伴"/utf8>>)}
	  end
    end;
check_formation_pos_info_(_, _Role, _L, _L2, _, _) ->
    {false, lang:get(<<"参数非法"/utf8>>)}.

-spec do_check_formation_pos_info(#role{},
				  FormationType :: pos_integer(), list(),
				  pos_integer()) -> {ok, list()} |
						    {false, binary()}.

do_check_formation_pos_info(Role = #role{m_formation =
					     #m_formation{list = List}},
			    FormationType, PosInfo, HallowsId) ->
    case lists:member(FormationType, List) of
      false -> {false, lang:get(<<"相关阵法不存在或未激活"/utf8>>)};
      _ ->
	  case hallows:get_hallows(Role, HallowsId) of
	    false when HallowsId =/= 0 ->
		{false, lang:get(<<"未激活该圣器"/utf8>>)};
	    _ -> do_check_formation_pos_info_(PosInfo, Role, [])
	  end
    end.

do_check_formation_pos_info_([], _Role, L) -> {ok, L};
do_check_formation_pos_info_([{_Pos, 0} | T], Role,
			     L) ->
    do_check_formation_pos_info_(T, Role, L);
do_check_formation_pos_info_([{Pos, PId} | T], Role, L)
    when Pos >= 1 andalso Pos =< 5 ->
    case lists:keymember(PId, #formation_pos.id, L) of
      true -> {false, lang:get(<<"伙伴重复上阵"/utf8>>)};
      _ ->
	  case lists:keymember(Pos, #formation_pos.pos, L) of
	    true -> {false, lang:get(<<"一个位置只能上一个英雄"/utf8>>)};
	    _ ->
		do_check_formation_pos_info_(T, Role,
					     [#formation_pos{pos = Pos,
							     id = PId}
					      | L])
	  end
    end;
do_check_formation_pos_info_(_, _Role, _L) ->
    {false, lang:get(<<"参数非法"/utf8>>)}.

-spec get_sys_formation_power(#role{},
			      pos_integer()) -> pos_integer().

get_sys_formation_power(Role, SysType) ->
    #formation_sys{pos_info = PosInfo} =
	get_sys_formation(Role, SysType),
    PIds = [PId || #formation_pos{id = PId} <- PosInfo],
    partner_lib:get_power(Role, PIds).

-spec get_sys_formation(#role{} | #role_robot{},
			pos_integer()) -> #formation_sys{}.

get_sys_formation(Role = #role{m_formation =
				   #m_formation{sys_formations = SysFormations},
			       partner_bag =
				   #partner_bag{partner_list = PList}},
		  SysType) ->
    case lists:keyfind(SysType, #formation_sys.id,
		       SysFormations)
	of
      false ->
	  init_sys_formation_(Role, SysType,
			      sys_formation_init_mode(SysType));
      SysFormation ->
	  case check_partner_has(SysFormation, PList) of
	    RoomFormation = #formation_sys{pos_info = []} ->
		case SysType =:= 22 of
		  true -> RoomFormation;
		  _ ->
		      init_sys_formation_(Role, SysType,
					  sys_formation_init_mode(SysType))
		end;
	    NewSysFormation -> NewSysFormation
	  end
    end;
get_sys_formation(Robot = #role_robot{m_formation =
					  #m_formation{sys_formations =
							   SysFormations,
						       use_lineup = UseId,
						       all_lineups = AllLine},
				      partners = PList},
		  SysType) ->
    case lists:keyfind(SysType, #formation_sys.id,
		       SysFormations)
	of
      false ->
	  init_sys_formation_(Robot, SysType,
			      sys_formation_init_mode(SysType));
      SysFormation ->
	  case check_partner_has(SysFormation, PList) of
	    #formation_sys{pos_info = []} ->
		init_sys_formation_(Robot, SysType,
				    sys_formation_init_mode(SysType));
	    NewSysFormation -> NewSysFormation
	  end
    end.

check_partner_has(SysFormation = #formation_sys{pos_info
						    = PosInfo},
		  PList) ->
    NewPosInfo = [P
		  || P <- PosInfo,
		     lists:keymember(P#formation_pos.id, #partner.id,
				     PList)],
    SysFormation#formation_sys{pos_info = NewPosInfo}.

-spec init_sys_formation(#role{},
			 pos_integer()) -> #role{}.

init_sys_formation(Role = #role{m_formation =
				    MFormation = #m_formation{sys_formations =
								  SysFormations}},
		   SysType) ->
    SysFormation = init_sys_formation_(Role, SysType,
				       sys_formation_init_mode(SysType)),
    Role#role{m_formation =
		  MFormation#m_formation{sys_formations =
					     lists:keystore(SysType,
							    #formation_sys.id,
							    SysFormations,
							    SysFormation)}}.

init_sys_formation_(#role{partner_bag =
			      #partner_bag{partner_list = PList}},
		    SysType, power) ->
    PList1 = util:keys_sort([#partner.power], PList),
    PosInfo = top5partners_pos_info(PList1, 0, [], []),
    #formation_sys{id = SysType, type = 1,
		   pos_info = PosInfo};
init_sys_formation_(Role, SysType, new_endless) ->
    #formation_lineup{type = FormationType,
		      hallows_id = HallowsId} =
	case lists:member(SysType,
			  [0, 17, 4, 12, 13, 14, 15, 16])
	    of
	  true -> formation_lib:query_formation_info(Role);
	  _ ->
	      formation_lib:query_formation_info_without_resonate(Role)
	end,
    #formation_sys{id = SysType, type = FormationType,
		   hallows_id = HallowsId};
init_sys_formation_(Role, SysType, _Mode) ->
    #formation_lineup{type = FormationType,
		      pos_info = PosInfo, hallows_id = HallowsId} =
	case lists:member(SysType,
			  [0, 17, 4, 12, 13, 14, 15, 16])
	    of
	  true -> formation_lib:query_formation_info(Role);
	  _ ->
	      formation_lib:query_formation_info_without_resonate(Role)
	end,
    #formation_sys{id = SysType, type = FormationType,
		   pos_info = PosInfo, hallows_id = HallowsId}.

top5partners_pos_info([], _, _, PosInfo) -> PosInfo;
top5partners_pos_info(_, 5, _, PosInfo) -> PosInfo;
top5partners_pos_info([#partner{id = PId, bid = Bid}
		       | T],
		      Pos, Bids, PosInfo) ->
    case lists:member(Bid, Bids) of
      true -> top5partners_pos_info(T, Pos, Bids, PosInfo);
      _ ->
	  top5partners_pos_info(T, Pos + 1, [Bid | Bids],
				[#formation_pos{pos = Pos + 1, id = PId}
				 | PosInfo])
    end.

-spec push_sys_formation(#role{}, pos_integer()) -> ok.

push_sys_formation(Role, 0) ->
    {ok, formation_lib:get_info(Role)};
push_sys_formation(Role, SysType = 10) ->
    {FormationType, PosInfo, HallowsId} =
	expedition:get_formation(Role, SysType),
    sys_conn:pack_send(11211,
		       {SysType, FormationType, PosInfo, HallowsId});
push_sys_formation(Role, SysType = 21) ->
    {FormationType, PosInfo, HallowsId} =
	holiday_boss_new:get_formation(Role, SysType),
    sys_conn:pack_send(11211,
		       {SysType, FormationType, PosInfo, HallowsId});
push_sys_formation(Role, SysType) ->
    #formation_sys{type = FormationType, pos_info = PosInfo,
		   hallows_id = HallowsId} =
	get_sys_formation(Role, SysType),
    sys_conn:pack_send(11211,
		       {SysType, FormationType, PosInfo, HallowsId}).

-spec set_sys_formation(#role{}, pos_integer(),
			pos_integer(), list(), pos_integer()) -> {ok, #role{}} |
								 {false,
								  binary()}.

set_sys_formation(Role, SysType, FormationType, PosInfo,
		  HallowsId) ->
    CanEmpty = check_can_empty(SysType),
    case SysType =:= 22 of
      true ->
	  case do_check_formation_pos_info(Role, FormationType,
					   PosInfo, HallowsId)
	      of
	    {false, Reason} -> {false, Reason};
	    {ok, _} when CanEmpty =:= undefined ->
		{false, lang:get(<<"功能类型不存在"/utf8>>)};
	    {ok, []} when CanEmpty =:= false ->
		{false, lang:get(<<"至少需要上阵一个英雄"/utf8>>)};
	    {ok, NewPosInfo} ->
		set_sys_formation_(Role, SysType, FormationType,
				   NewPosInfo, HallowsId)
	  end;
      _ ->
	  case check_formation_pos_info(Role, FormationType,
					PosInfo, HallowsId, SysType)
	      of
	    {false, Reason} -> {false, Reason};
	    {ok, _} when CanEmpty =:= undefined ->
		{false, lang:get(<<"功能类型不存在"/utf8>>)};
	    {ok, []} when CanEmpty =:= false ->
		{false, lang:get(<<"至少需要上阵一个英雄"/utf8>>)};
	    {ok, NewPosInfo} ->
		set_sys_formation_(Role, SysType, FormationType,
				   NewPosInfo, HallowsId)
	  end
    end.

set_sys_formation_(Role, SysType = 1, FormationType,
		   PosInfo, HallowsId) ->
    arena:set_formation(Role,
			#formation_sys{id = SysType, type = FormationType,
				       pos_info = PosInfo,
				       hallows_id = HallowsId});
set_sys_formation_(Role, SysType = 6, FormationType,
		   PosInfo, HallowsId) ->
    arena_champion:set_formation(Role,
				 #formation_sys{id = SysType,
						type = FormationType,
						pos_info = PosInfo,
						hallows_id = HallowsId});
set_sys_formation_(Role, SysType = 8, FormationType,
		   PosInfo, HallowsId) ->
    zs_war:set_formation(Role,
			 #formation_sys{id = SysType, type = FormationType,
					pos_info = PosInfo,
					hallows_id = HallowsId});
set_sys_formation_(Role, SysType = 9, FormationType,
		   PosInfo, HallowsId) ->
    sky_ladder:set_formation(Role,
			     #formation_sys{id = SysType, type = FormationType,
					    pos_info = PosInfo,
					    hallows_id = HallowsId});
set_sys_formation_(Role, SysType = 21, FormationType,
		   PosInfo, HallowsId) ->
    holiday_boss_new:set_formation(Role,
				   #formation_sys{id = SysType,
						  type = FormationType,
						  pos_info = PosInfo,
						  hallows_id = HallowsId});
set_sys_formation_(Role, SysType, FormationType,
		   PosInfo, HallowsId) ->
    save_sys_formation(Role,
		       #formation_sys{id = SysType, type = FormationType,
				      pos_info = PosInfo,
				      hallows_id = HallowsId}).

-spec save_sys_formation(#role{},
			 #formation_sys{}) -> {false, binary()} | {ok, #role{}}.

save_sys_formation(Role = #role{m_formation =
				    MFormation = #m_formation{sys_formations =
								  SysFormations}},
		   SysFormation = #formation_sys{id = SysType}) ->
    NRole = Role#role{m_formation =
			  MFormation#m_formation{sys_formations =
						     lists:keystore(SysType,
								    #formation_sys.id,
								    SysFormations,
								    SysFormation)}},
    case SysType == 28 of
      true ->
	  arena_team_member:update_member(NRole,
					  set_sys_formation);
      _ -> skip
    end,
    NRole1 =
	holiday_arena_team_lib:push_save_sys_formation(NRole),
    {ok, NRole1}.

sys_formation_init_mode(34) -> new_endless;
sys_formation_init_mode(35) -> new_endless;
sys_formation_init_mode(36) -> new_endless;
sys_formation_init_mode(37) -> new_endless;
sys_formation_init_mode(_SysType) -> default.

check_can_empty(1) -> false;
check_can_empty(6) -> false;
check_can_empty(4) -> false;
check_can_empty(7) -> false;
check_can_empty(8) -> false;
check_can_empty(9) -> false;
check_can_empty(10) -> false;
check_can_empty(11) -> false;
check_can_empty(12) -> false;
check_can_empty(13) -> false;
check_can_empty(14) -> false;
check_can_empty(15) -> false;
check_can_empty(16) -> false;
check_can_empty(17) -> false;
check_can_empty(18) -> false;
check_can_empty(21) -> false;
check_can_empty(23) -> false;
check_can_empty(24) -> false;
check_can_empty(22) -> true;
check_can_empty(25) -> false;
check_can_empty(26) -> false;
check_can_empty(27) -> false;
check_can_empty(29) -> false;
check_can_empty(30) -> false;
check_can_empty(28) -> false;
check_can_empty(31) -> false;
check_can_empty(32) -> false;
check_can_empty(33) -> false;
check_can_empty(34) -> false;
check_can_empty(35) -> false;
check_can_empty(36) -> false;
check_can_empty(37) -> false;
check_can_empty(38) -> false;
check_can_empty(39) -> false;
check_can_empty(_SysType) -> undefined.


