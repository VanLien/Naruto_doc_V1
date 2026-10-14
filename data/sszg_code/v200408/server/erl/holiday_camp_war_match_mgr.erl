-file("src/mod/holiday_camp_war/holiday_camp_war_mat"
      "ch_mgr.erl",
      1).

-module(holiday_camp_war_match_mgr).

-lager_records([{guild_skill_break_group,
		 [ver, career, attr_formation, skill_formation, ext]},
		{guild_skill_group,
		 [ver, career, group_id, skill_ids, group_ids]},
		{m_guild_skill, [ver, groups, break_groups]},
		{group_attr, [atk, hp_max, def, speed]},
		{partner_base_p,
		 [partner_id, bid, lev, star, star_step, quality,
		  break_lev, power, skills, add_star, is_lock, use_skin,
		  end_time, resonate_lev, resonate_break_lev,
		  star_step_list]},
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
		  max_star, partner_decomposes, partner_skins,
		  partner_library_award]},
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
		  resonate_break_lev, step_list, step_type_list]},
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
		{sprite_plan, [ver, id, name, plan_sprites]},
		{team_sprite, [ver, team, plan_id, team_sprites]},
		{formation_sprite, [ver, type, team_list]},
		{m_sprite_tree,
		 [ver, lev, break_lev, all_attr, sprites, power,
		  max_power, formation_list, plan_list]},
		{sprite_hatch,
		 [ver, id, is_open, lev, do_id, need_point, do_point,
		  state, end_time, all_end_time]},
		{m_sprite_hatch,
		 [ver, list, day_privilege_mail, day_buy_list, handbook,
		  baodi_info]},
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
		  m_holiday_arena_team, m_holiday_practise_tower,
		  m_holiday_camp_war, p_bag, p_eqm, p_home]},
		{holiday_camp_war_log_partner,
		 [pos, id, bid, lev, star, power, skin_id, resonate_lev,
		  hurt, be_hurt, curt, ext]},
		{holiday_camp_war_log_info,
		 [id, round, ret, time, a_id, a_name, a_power,
		  a_formation_type, a_order, a_end_hp, a_hallows_id,
		  a_hallows_look_id, a_sprite_lev, a_sprites, b_id,
		  b_name, b_power, b_formation_type, b_order, b_end_hp,
		  b_hallows_id, b_hallows_look_id, b_sprite_lev,
		  b_sprites, a_plist, b_plist, ext]},
		{holiday_camp_war_log_face,
		 [id, pos, is_leader, lev, name, face_id, avatar_bid,
		  face_file, face_update_time]},
		{holiday_camp_war_log,
		 [id, is_atk, atk_id, atk_name, atk_power, atk_face,
		  def_id, def_name, def_power, def_face, ret, win_count,
		  lose_count, replay_list, time]},
		{role_holiday_camp_war_log, [id, list]},
		{holiday_camp_war_partners_info,
		 [pos, id, bid, lev, star, break_lev, power, use_skin,
		  resonate_lev, dower_skill, set_skill, attr, extra]},
		{holiday_camp_war_defense_role,
		 [id, name, face_id, power, avatar_bid, lev, pos,
		  is_leader, rank, score, face_update_time, face_file,
		  formation_type, hallows_id, hallows_lev,
		  hallows_skill_lev, partner_infos, hallows_look_id,
		  hallows_lucky, hallows_seal, hallows_all_look_ids,
		  hallows_refine, sprite_lev, sprite_breka_lev,
		  sprite_attr, sprites, ext, break_groups]},
		{holiday_camp_war_info,
		 [id, name, face_id, power, avatar_bid, lev, rank, score,
		  face_update_time, face_file, ext]},
		{holiday_camp_war_role,
		 [ver, id, camp_id, name, lev, face_id, avatar_bid,
		  power, camp_power, face_update_time, face_file, rank,
		  score, last_score, score_time, ext]},
		{holiday_camp_war_rank,
		 [rank, id, score, score_time, power]},
		{holiday_camp_war_camp_info,
		 [id, medal_score, score, score_time, member_num,
		  all_power, have_fort, can_combat_fort, vote_list,
		  old_fort_num, last_fort_num, old_medal_score,
		  last_medal_score, ext]},
		{holiday_camp_war_fort,
		 [id, a_score, b_score, unit_id, difficulty, belong, log,
		  state_log, a_up, b_up, ext]},
		{m_holiday_camp_war,
		 [ver, period, camp_id, old_data, last_camp, ref_count,
		  atk_defens, def_defens, end_time, is_enter, enter_flag,
		  vote_flag, first_flag, first_count, first_buy_count,
		  second_count, second_buy_count]},
		{state, []}]).

-behaviour(gen_server).

-export([call_apply/1, apply/1]).

-export([info/1, cast/1, call/1, start_link/1]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state, {}).

-export([do_open_match_pro/0, info/2, do_match/8]).

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

-file("src/mod/holiday_camp_war/holiday_camp_war_mat"
      "ch_mgr.erl",
      18).

-file("inc/holiday_camp_war.hrl", 1).

-record(m_holiday_camp_war,
	{ver = 1, period = 0, camp_id = 0, old_data = [],
	 last_camp = 0, ref_count = 0, atk_defens = [],
	 def_defens = [], end_time = 0, is_enter = 0,
	 enter_flag = 0, vote_flag = 0, first_flag = 0,
	 first_count = 0, first_buy_count = 0, second_count = 0,
	 second_buy_count = 0}).

-record(holiday_camp_war_fort,
	{id = {0, <<>>}, a_score = 0, b_score = 0, unit_id = 0,
	 difficulty = 0, belong = 0, log = [], state_log = [],
	 a_up = 0, b_up = 0, ext = []}).

-record(holiday_camp_war_camp_info,
	{id = {0, <<>>}, medal_score = 0, score = 0,
	 score_time = 0, member_num = 0, all_power = 0,
	 have_fort = [], can_combat_fort = [], vote_list = [],
	 old_fort_num = 0, last_fort_num = 0,
	 old_medal_score = 0, last_medal_score = 0, ext = []}).

-record(holiday_camp_war_rank,
	{rank = {0, 0, <<>>}, id = {0, <<>>}, score = 0,
	 score_time = 0, power = 0}).

-record(holiday_camp_war_role,
	{ver = 1, id = {{0, <<>>}, <<>>}, camp_id = 0,
	 name = <<>>, lev = 0, face_id = 0, avatar_bid = 0,
	 power = 0, camp_power = 0, face_update_time = 0,
	 face_file = <<>>, rank = 0, score = 0, last_score = 0,
	 score_time = 0, ext = []}).

-record(holiday_camp_war_info,
	{id = {0, <<>>}, name = <<>>, face_id = 0, power = 0,
	 avatar_bid = 0, lev = 0, rank = 0, score = 0,
	 face_update_time = 0, face_file = <<>>, ext = []}).

-record(holiday_camp_war_defense_role,
	{id = {0, <<>>}, name = <<>>, face_id = 0, power = 0,
	 avatar_bid = 0, lev = 0, pos = 1, is_leader = 1,
	 rank = 0, score = 0, face_update_time = 0,
	 face_file = <<>>, formation_type = 0, hallows_id = 0,
	 hallows_lev = 0, hallows_skill_lev = 0,
	 partner_infos = [], hallows_look_id = 0,
	 hallows_lucky = 0, hallows_seal = 0,
	 hallows_all_look_ids = [], hallows_refine = 0,
	 sprite_lev = 0, sprite_breka_lev = 0, sprite_attr,
	 sprites = [], ext = [], break_groups = []}).

-record(holiday_camp_war_partners_info,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, use_skin = 0,
	 resonate_lev = 0, dower_skill = [], set_skill = [],
	 attr, extra = []}).

-record(role_holiday_camp_war_log,
	{id = {0, <<>>}, list = []}).

-record(holiday_camp_war_log,
	{id = 0, is_atk = 0, atk_id = {0, <<>>},
	 atk_name = <<>>, atk_power = <<>>, atk_face = [],
	 def_id = {0, <<>>}, def_name = <<>>, def_power = <<>>,
	 def_face = [], ret = 1, win_count = 0, lose_count = 0,
	 replay_list = [], time = 0}).

-record(holiday_camp_war_log_face,
	{id = {0, <<>>}, pos = 1, is_leader = 1, lev = 1,
	 name = <<>>, face_id = 0, avatar_bid = 0,
	 face_file = <<>>, face_update_time = 0}).

-record(holiday_camp_war_log_info,
	{id = 0, round = 0, ret = 0, time = 0, a_id = {0, <<>>},
	 a_name = <<>>, a_power = 0, a_formation_type = 0,
	 a_order = 0, a_end_hp = 0, a_hallows_id = 1,
	 a_hallows_look_id = 0, a_sprite_lev = 0, a_sprites = [],
	 b_id = {0, <<>>}, b_name = <<>>, b_power = 0,
	 b_formation_type = 0, b_order = 0, b_end_hp = 0,
	 b_hallows_id = 1, b_hallows_look_id = 0,
	 b_sprite_lev = 0, b_sprites = [], a_plist = [],
	 b_plist = [], ext = []}).

-record(holiday_camp_war_log_partner,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0, power = 0,
	 skin_id = 0, resonate_lev = 0, hurt = 0, be_hurt = 0,
	 curt = 0, ext = #{}}).

-file("src/mod/holiday_camp_war/holiday_camp_war_mat"
      "ch_mgr.erl",
      19).

-file("inc/role.hrl", 1).

-record(role,
	{ver = 79, id = {0, <<>>}, need_sync = 0,
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
	 m_holiday_arena_team, m_holiday_practise_tower,
	 m_holiday_camp_war, p_bag, p_eqm, p_home}).

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

-file("src/mod/holiday_camp_war/holiday_camp_war_mat"
      "ch_mgr.erl",
      20).

-file("inc/sprite.hrl", 1).

-record(m_sprite_hatch,
	{ver = 5, list = [], day_privilege_mail = 0,
	 day_buy_list = [], handbook = [], baodi_info = []}).

-record(sprite_hatch,
	{ver = 2, id = 0, is_open = 0, lev = 0, do_id = 0,
	 need_point = 0, do_point = 0, state = 0, end_time = 0,
	 all_end_time = 0}).

-record(m_sprite_tree,
	{ver = 3, lev = 1, break_lev = 0, all_attr,
	 sprites = [], power = 0, max_power = 0,
	 formation_list = []  :: list(),
	 plan_list = []  :: list()}).

-record(formation_sprite,
	{ver = 1  :: pos_integer(), type = 0  :: pos_integer(),
	 team_list = []  :: list()}).

-record(team_sprite,
	{ver = 1  :: pos_integer(), team = 1  :: pos_integer(),
	 plan_id = 0  :: pos_integer(),
	 team_sprites = []  :: list()}).

-record(sprite_plan,
	{ver = 1  :: pos_integer(), id = 1  :: pos_integer(),
	 name = <<>>  :: string(),
	 plan_sprites = []  :: list()}).

-file("src/mod/holiday_camp_war/holiday_camp_war_mat"
      "ch_mgr.erl",
      21).

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

-file("src/mod/holiday_camp_war/holiday_camp_war_mat"
      "ch_mgr.erl",
      22).

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
	{ver = 8  :: non_neg_integer(),
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
	 resonate_break_lev = 0, step_list = []  :: list(),
	 step_type_list = []  :: list()}).

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
	 partner_skins = []  :: list(),
	 partner_library_award = []  :: list()}).

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
	 resonate_break_lev = 0, star_step_list = []}).

-record(group_attr,
	{atk = 0, hp_max = 0, def = 0, speed = 0}).

-file("src/mod/holiday_camp_war/holiday_camp_war_mat"
      "ch_mgr.erl",
      23).

-file("inc/guild_skill.hrl", 1).

-record(m_guild_skill,
	{ver = 2  :: pos_integer(), groups = []  :: list(),
	 break_groups = []  :: list()}).

-record(guild_skill_group,
	{ver = 1, career = 0, group_id = 0, skill_ids = [],
	 group_ids = []}).

-record(guild_skill_break_group,
	{ver = 1  :: pos_integer(),
	 career = 0  :: pos_integer(),
	 attr_formation = []  :: list(),
	 skill_formation = {0, 0}  :: tuple(),
	 ext = []  :: list()}).

-file("src/mod/holiday_camp_war/holiday_camp_war_mat"
      "ch_mgr.erl",
      24).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/holiday_camp_war/holiday_camp_war_mat"
      "ch_mgr.erl",
      25).

do_open_match_pro() -> do_open_match_pro(10).

do_open_match_pro(0) -> ok;
do_open_match_pro(N) ->
    holiday_camp_war_match_mgr:start_link(N),
    do_open_match_pro(N - 1).

tab(1) -> holiday_camp_war_match_mgr_1;
tab(2) -> holiday_camp_war_match_mgr_2;
tab(3) -> holiday_camp_war_match_mgr_3;
tab(4) -> holiday_camp_war_match_mgr_4;
tab(5) -> holiday_camp_war_match_mgr_5;
tab(6) -> holiday_camp_war_match_mgr_6;
tab(7) -> holiday_camp_war_match_mgr_7;
tab(8) -> holiday_camp_war_match_mgr_8;
tab(9) -> holiday_camp_war_match_mgr_9;
tab(10) -> holiday_camp_war_match_mgr_10;
tab(N) when N > 10 -> tab(N rem 10 + 1).

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> holiday_camp_war_match_mgr ! Info.

info({Rid, _}, Info) -> info(Rid, Info);
info(Rid, Info) ->
    LoaclName = tab(Rid), LoaclName ! Info.

cast(Info) ->
    gen_server:cast(holiday_camp_war_match_mgr, Info).

call(Info) ->
    case catch gen_server:call(holiday_camp_war_match_mgr,
			       Info, 10000)
	of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_camp_war_match_mgr71, _,
	     {__Levelholiday_camp_war_match_mgr71,
	      __Tracesholiday_camp_war_match_mgr71}}
		when __Levelholiday_camp_war_match_mgr71 band 8 /= 0
		       orelse __Tracesholiday_camp_war_match_mgr71 /= [] ->
		lager:do_log(error,
			     [{module, holiday_camp_war_match_mgr},
			      {function, call}, {line, 71},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [holiday_camp_war_match_mgr, Info,
					    10000, erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelholiday_camp_war_match_mgr71,
			     __Tracesholiday_camp_war_match_mgr71, lager_event,
			     __Pidholiday_camp_war_match_mgr71);
	    _ -> ok
	  end,
	  case _Call_Err of
	    {timeout, _} -> {error, timeout};
	    {noproc, _} -> {error, noproc};
	    {normal, _} -> {error, exit};
	    _ -> {error, _Call_Err}
	  end;
      _Call_Return -> _Call_Return
    end.

start_link(Num) ->
    LocalName =
	list_to_atom(lists:concat(["holiday_camp_war_match_mgr_",
				   Num])),
    gen_server:start_link({local, LocalName},
			  holiday_camp_war_match_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_camp_war_match_mgr78, _,
       {__Levelholiday_camp_war_match_mgr78,
	__Tracesholiday_camp_war_match_mgr78}}
	  when __Levelholiday_camp_war_match_mgr78 band 64 /= 0
		 orelse __Tracesholiday_camp_war_match_mgr78 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_camp_war_match_mgr}, {function, init},
			{line, 78}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...",
				     [holiday_camp_war_match_mgr]),
		       none, 4096, 64, __Levelholiday_camp_war_match_mgr78,
		       __Tracesholiday_camp_war_match_mgr78, lager_event,
		       __Pidholiday_camp_war_match_mgr78);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    put(idx, 0),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_camp_war_match_mgr82, _,
       {__Levelholiday_camp_war_match_mgr82,
	__Tracesholiday_camp_war_match_mgr82}}
	  when __Levelholiday_camp_war_match_mgr82 band 64 /= 0
		 orelse __Tracesholiday_camp_war_match_mgr82 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_camp_war_match_mgr}, {function, init},
			{line, 82}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成",
				     [holiday_camp_war_match_mgr]),
		       none, 4096, 64, __Levelholiday_camp_war_match_mgr82,
		       __Tracesholiday_camp_war_match_mgr82, lager_event,
		       __Pidholiday_camp_war_match_mgr82);
      _ -> ok
    end,
    {ok, State}.

handle_call(Request, From, State) ->
    case catch do_handle_call(Request, From, State) of
      {reply, Reply, NewState} -> {reply, Reply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_camp_war_match_mgr90, _,
	     {__Levelholiday_camp_war_match_mgr90,
	      __Tracesholiday_camp_war_match_mgr90}}
		when __Levelholiday_camp_war_match_mgr90 band 8 /= 0
		       orelse __Tracesholiday_camp_war_match_mgr90 /= [] ->
		lager:do_log(error,
			     [{module, holiday_camp_war_match_mgr},
			      {function, handle_call}, {line, 90},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelholiday_camp_war_match_mgr90,
			     __Tracesholiday_camp_war_match_mgr90, lager_event,
			     __Pidholiday_camp_war_match_mgr90);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    holiday_camp_war_match_mgr, 91, _Reason}),
	  {reply, {false, lang:get(<<"执行出错"/utf8>>)}, State}
    end.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(Info, State) ->
    case catch do_handle_info(Info, State) of
      {noreply, NewState} -> {noreply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_camp_war_match_mgr103, _,
	     {__Levelholiday_camp_war_match_mgr103,
	      __Tracesholiday_camp_war_match_mgr103}}
		when __Levelholiday_camp_war_match_mgr103 band 8 /= 0
		       orelse __Tracesholiday_camp_war_match_mgr103 /= [] ->
		lager:do_log(error,
			     [{module, holiday_camp_war_match_mgr},
			      {function, handle_info}, {line, 103},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8,
			     __Levelholiday_camp_war_match_mgr103,
			     __Tracesholiday_camp_war_match_mgr103, lager_event,
			     __Pidholiday_camp_war_match_mgr103);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    holiday_camp_war_match_mgr, 104, _Reason}),
	  {noreply, State}
    end.

terminate(_Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_camp_war_match_mgr109, _,
       {__Levelholiday_camp_war_match_mgr109,
	__Tracesholiday_camp_war_match_mgr109}}
	  when __Levelholiday_camp_war_match_mgr109 band 64 /= 0
		 orelse __Tracesholiday_camp_war_match_mgr109 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_camp_war_match_mgr},
			{function, terminate}, {line, 109},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64,
		       __Levelholiday_camp_war_match_mgr109,
		       __Tracesholiday_camp_war_match_mgr109, lager_event,
		       __Pidholiday_camp_war_match_mgr109);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_handle_call({apply, M, F, A}, _From, State) ->
    case util:exec_fun(M, F, [State | A]) of
      {ok, Reply, NewState} -> {reply, Reply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_camp_war_match_mgr121, _,
	     {__Levelholiday_camp_war_match_mgr121,
	      __Tracesholiday_camp_war_match_mgr121}}
		when __Levelholiday_camp_war_match_mgr121 band 8 /= 0
		       orelse __Tracesholiday_camp_war_match_mgr121 /= [] ->
		lager:do_log(error,
			     [{module, holiday_camp_war_match_mgr},
			      {function, do_handle_call}, {line, 121},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8,
			     __Levelholiday_camp_war_match_mgr121,
			     __Tracesholiday_camp_war_match_mgr121, lager_event,
			     __Pidholiday_camp_war_match_mgr121);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    holiday_camp_war_match_mgr, 122, _Reason}),
	  {reply, {false, lang:get(<<"执行错误"/utf8>>)}, State}
    end;
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_info({apply, M, F, A}, State) ->
    case util:exec_fun(M, F, [State | A]) of
      {ok, NewState} -> {noreply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_camp_war_match_mgr135, _,
	     {__Levelholiday_camp_war_match_mgr135,
	      __Tracesholiday_camp_war_match_mgr135}}
		when __Levelholiday_camp_war_match_mgr135 band 8 /= 0
		       orelse __Tracesholiday_camp_war_match_mgr135 /= [] ->
		lager:do_log(error,
			     [{module, holiday_camp_war_match_mgr},
			      {function, do_handle_info}, {line, 135},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8,
			     __Levelholiday_camp_war_match_mgr135,
			     __Tracesholiday_camp_war_match_mgr135, lager_event,
			     __Pidholiday_camp_war_match_mgr135);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    holiday_camp_war_match_mgr, 136, _Reason}),
	  {noreply, State}
    end;
do_handle_info({RolePid, RoleId, MaxPower, MainId,
		CampId, ExcludeAtkList, ExcludeDefList},
	       State) ->
    self() !
      {match, match, RolePid, RoleId, MaxPower, MainId,
       CampId, ExcludeAtkList, ExcludeDefList},
    {noreply, State};
do_handle_info({ref_match, RolePid, RoleId, MaxPower,
		MainId, CampId, ExcludeAtkList, ExcludeDefList},
	       State) ->
    erlang:send_after(util:rand(3000, 5000), self(),
		      {match, ref_match, RolePid, RoleId, MaxPower, MainId,
		       CampId, ExcludeAtkList, ExcludeDefList}),
    {noreply, State};
do_handle_info({match, Type, RolePid, RoleId, MaxPower,
		MainId, CampId, ExcludeAtkList, ExcludeDefList},
	       State) ->
    Idx = put(idx, get(idx) + 1),
    cluster_lib:cast(MainId, holiday_camp_war_match_mgr,
		     do_match,
		     [self(), Idx, RoleId, MaxPower, MainId, CampId,
		      ExcludeAtkList, ExcludeDefList]),
    put({idx, Idx},
	{RoleId, RolePid, Type,
	 erlang:send_after(5000, self(),
			   {match_timeout_fail, Idx})}),
    {noreply, State};
do_handle_info({match_timeout_fail, Idx}, State) ->
    case erase({idx, Idx}) of
      {RoleId, RolePid, ref_match, _TimeRef} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_camp_war_match_mgr156, _,
	     {__Levelholiday_camp_war_match_mgr156,
	      __Tracesholiday_camp_war_match_mgr156}}
		when __Levelholiday_camp_war_match_mgr156 band 8 /= 0
		       orelse __Tracesholiday_camp_war_match_mgr156 /= [] ->
		lager:do_log(error,
			     [{module, holiday_camp_war_match_mgr},
			      {function, do_handle_info}, {line, 156},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("match_timeout_fail===>~w ~w",
					   [Idx, RoleId]),
			     none, 4096, 8,
			     __Levelholiday_camp_war_match_mgr156,
			     __Tracesholiday_camp_war_match_mgr156, lager_event,
			     __Pidholiday_camp_war_match_mgr156);
	    _ -> ok
	  end,
	  role_lib:cast(by_pid, RolePid,
			{holiday_camp_war_team, match_over,
			 [{false, ref_match, lang:get(<<"匹配超时"/utf8>>)}]});
      {RoleId, RolePid, _Type, _TimeRef} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_camp_war_match_mgr159, _,
	     {__Levelholiday_camp_war_match_mgr159,
	      __Tracesholiday_camp_war_match_mgr159}}
		when __Levelholiday_camp_war_match_mgr159 band 8 /= 0
		       orelse __Tracesholiday_camp_war_match_mgr159 /= [] ->
		lager:do_log(error,
			     [{module, holiday_camp_war_match_mgr},
			      {function, do_handle_info}, {line, 159},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("match_timeout_fail===>~w ~w",
					   [Idx, RoleId]),
			     none, 4096, 8,
			     __Levelholiday_camp_war_match_mgr159,
			     __Tracesholiday_camp_war_match_mgr159, lager_event,
			     __Pidholiday_camp_war_match_mgr159);
	    _ -> ok
	  end,
	  role_lib:cast(by_pid, RolePid,
			{holiday_camp_war_team, match_over,
			 [{false, lang:get(<<"匹配超时"/utf8>>)}]});
      _ -> skip
    end,
    {noreply, State};
do_handle_info({match_ret, Idx, AtkIds, DefIds},
	       State) ->
    case erase({idx, Idx}) of
      {_RoleId, RolePid, ref_match, TimeRef} ->
	  catch erlang:cancel_timer(TimeRef),
	  case to_team_member_defense(AtkIds, []) of
	    {ok, NewAtkDefense} ->
		case to_team_member_defense(DefIds, []) of
		  {ok, NewDefDefense} ->
		      role_lib:cast(by_pid, RolePid,
				    {holiday_camp_war_team, match_over,
				     [{true, ref_match, NewAtkDefense,
				       NewDefDefense}]});
		  _ ->
		      role_lib:cast(by_pid, RolePid,
				    {holiday_camp_war_team, match_over,
				     [{false, ref_match,
				       lang:get(<<"匹配失败"/utf8>>)}]})
		end;
	    _ ->
		role_lib:cast(by_pid, RolePid,
			      {holiday_camp_war_team, match_over,
			       [{false, ref_match, lang:get(<<"匹配失败"/utf8>>)}]})
	  end;
      {_RoleId, RolePid, _Type, TimeRef} ->
	  catch erlang:cancel_timer(TimeRef),
	  case to_team_member_defense(AtkIds, []) of
	    {ok, NewAtkDefense} ->
		case to_team_member_defense(DefIds, []) of
		  {ok, NewDefDefense} ->
		      role_lib:cast(by_pid, RolePid,
				    {holiday_camp_war_team, match_over,
				     [{true, NewAtkDefense, NewDefDefense}]});
		  _ ->
		      role_lib:cast(by_pid, RolePid,
				    {holiday_camp_war_team, match_over,
				     [{false, lang:get(<<"匹配失败"/utf8>>)}]})
		end;
	    _ ->
		role_lib:cast(by_pid, RolePid,
			      {holiday_camp_war_team, match_over,
			       [{false, lang:get(<<"匹配失败"/utf8>>)}]})
	  end;
      _ -> skip
    end,
    {noreply, State};
do_handle_info(_Info, State) -> {noreply, State}.

do_match(MatchPid, Idx, RoleId, MaxPower, MainId,
	 CampId, ExcludeAtkList, ExcludeDefList) ->
    #holiday_camp_war_role{} =
	holiday_camp_war_db:get_camp_role(RoleId),
    OtherCampId = util:if_true(CampId =:= 100, 200, 100),
    AtkHolidayRoleLists = match_atk(RoleId, MaxPower,
				    MainId, CampId, ExcludeAtkList),
    DefHolidayRoleLists = match_def(MaxPower, MainId,
				    OtherCampId,
				    [Id
				     || #holiday_camp_war_defense_role{id = Id}
					    <- AtkHolidayRoleLists]
				      ++ ExcludeDefList),
    MatchPid !
      {match_ret, Idx, AtkHolidayRoleLists,
       DefHolidayRoleLists}.

match_atk(RoleId, MaxPower, MainId, CampId,
	  ExcludeList) ->
    L = [{holiday_camp_war_db:get_camp_role(RoleId), 1, 1}],
    L2 = do_match_(3 - length(L), [], MaxPower, MainId,
		   CampId,
		   ExcludeList ++
		     [Id
		      || {#holiday_camp_war_role{id = {Id, _}}, _, _} <- L],
		   1),
    Fun = fun (Data, {Pos, Acc}) ->
		  case Pos > 3 of
		    true -> {Pos, Acc};
		    _ -> {Pos + 1, [{Data, 0, Pos} | Acc]}
		  end
	  end,
    {_, L2_2} = lists:foldl(Fun, {length(L) + 1, []}, L2),
    MatchL = L ++ L2_2,
    [to_team_member(HolidayRole, IsLeasderT, PosT)
     || {HolidayRole, IsLeasderT, PosT} <- MatchL].

match_def(MaxPower, MainId, CampId, ExcludeList) ->
    [LeaderRole | OtherL] = do_match_(3, [], MaxPower,
				      MainId, CampId, ExcludeList, 10),
    [Pos | PosList] = list_util:shuffle(lists:seq(1, 3)),
    Fun = fun (Data, {PosListT, Acc}) ->
		  case PosListT of
		    [PosT | Other] -> {Other, [{Data, 0, PosT} | Acc]};
		    _ -> {PosListT, Acc}
		  end
	  end,
    {_, L2} = lists:foldl(Fun,
			  {PosList, [{LeaderRole, 1, Pos}]}, OtherL),
    [to_team_member(HolidayRole, IsLeasderT, PosT)
     || {HolidayRole, IsLeasderT, PosT} <- L2].

do_match_(Num, MatchList, MaxPower, MainId, CampId,
	  ExcludeList, RobotId) ->
    {Period, _State, _EndTime} =
	sys_env:get(holiday_camp_war_period, {0, 0, 0}),
    PowerRios =
	holiday_camp_war_data:get_match_info(Period),
    MatchL = do_match2_(1, Num, PowerRios, MaxPower, MainId,
			CampId, ExcludeList, []),
    MatchNum = length(MatchL),
    case MatchNum >= Num of
      true ->
	  MatchL1 = list_util:rand_more2(MatchL, Num),
	  MatchList ++ MatchL1;
      _ ->
	  MatchL2 = do_match2_(1, Num, PowerRios, MaxPower,
			       MainId, CampId, ExcludeList, []),
	  MatchNum2 = length(MatchL2),
	  case MatchNum2 >= Num of
	    true ->
		MatchL3 = list_util:rand_more2(MatchL2, Num),
		MatchList ++ MatchL3;
	    _ ->
		RobotNum = Num - MatchNum2,
		MatchList ++
		  MatchL2 ++
		    do_match_robot(RobotNum, MaxPower, MainId, CampId,
				   RobotId)
	  end
    end.

do_match2_(Round, Num, PowerRios, MaxPower, MainId,
	   CampId, ExcludeList, MatchList) ->
    case lists:keyfind(Round, 1, PowerRios) of
      false -> MatchList;
      {_, MinPowerRio, MaxPowerRio} ->
	  LimitMinMatchPower = trunc(MinPowerRio * MaxPower *
				       1.0e-3),
	  LimitMaxMatchPower = trunc(MaxPowerRio * 1.0e-3 *
				       MaxPower),
	  MatchL = do_match3_(Num, LimitMinMatchPower,
			      LimitMaxMatchPower, MainId, CampId, ExcludeList,
			      []),
	  MatchIds = [IdT
		      || #holiday_camp_war_role{id = {IdT, _}} <- MatchL],
	  MatchNum = length(MatchIds),
	  ok,
	  case MatchNum >= Num of
	    true ->
		MatchL1 = list_util:rand_more2(MatchL, Num),
		MatchList ++ MatchL1;
	    _ ->
		do_match2_(Round + 1, Num - MatchNum, PowerRios,
			   MaxPower, MainId, CampId, ExcludeList ++ MatchIds,
			   MatchList ++ MatchL)
	  end
    end.

do_match3_(Num, LimitMinMatchPower, LimitMaxMatchPower,
	   MainId, CampId, ExcludeList, MatchList) ->
    DoFun = [{{holiday_camp_war_role, '_', {'_', '$1'},
	       '$2', '_', '_', '_', '_', '$3', '$4', '_', '_', '_',
	       '_', '_', '_', '_'},
	      [{'andalso', {'=<', '$3', {const, LimitMaxMatchPower}},
		{'andalso', {'>=', '$3', {const, LimitMinMatchPower}},
		 {'andalso', {'>=', '$4', {'*', '$3', 8.0e-1}},
		  {'andalso', {'=:=', '$1', {const, MainId}},
		   {'=:=', '$2', {const, CampId}}}}}}],
	      ['$_']}],
    case ets:select(holiday_camp_war_role, DoFun, 20) of
      {L, _} ->
	  MatchL = [Data
		    || Data = #holiday_camp_war_role{id = {IdT, _}} <- L,
		       not lists:member(IdT, ExcludeList)],
	  MatchNum = length(MatchL),
	  ok,
	  MatchL1 = list_util:rand_more2(MatchL, Num),
	  MatchList ++ MatchL1;
      _ -> MatchList
    end.

do_match_robot(RobotNum, MaxPower, MainId, CampId,
	       RobotId) ->
    {Period, _State, _EndTime} =
	sys_env:get(holiday_camp_war_period, {0, 0, 0}),
    RobotInfo =
	holiday_camp_war_data:get_robot_list(Period),
    case [RobotIdsT
	  || {RobotIdsT, MinPowerT, MaxPowerT} <- RobotInfo,
	     MaxPower >= MinPowerT andalso MaxPower < MaxPowerT]
	of
      [AllRobotIds | _] ->
	  do_match_robot_(RobotNum, AllRobotIds, [], RobotId,
			  MainId, CampId);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_camp_war_match_mgr296, _,
	     {__Levelholiday_camp_war_match_mgr296,
	      __Tracesholiday_camp_war_match_mgr296}}
		when __Levelholiday_camp_war_match_mgr296 band 8 /= 0
		       orelse __Tracesholiday_camp_war_match_mgr296 /= [] ->
		lager:do_log(error,
			     [{module, holiday_camp_war_match_mgr},
			      {function, do_match_robot}, {line, 296},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("该战力找不到在区间内的机器人配置~w", [{MaxPower}]),
			     none, 4096, 8,
			     __Levelholiday_camp_war_match_mgr296,
			     __Tracesholiday_camp_war_match_mgr296, lager_event,
			     __Pidholiday_camp_war_match_mgr296);
	    _ -> ok
	  end,
	  [{AllRobotIds, _, _} | _] = RobotInfo,
	  do_match_robot_(RobotNum, AllRobotIds, [], RobotId,
			  MainId, CampId)
    end.

do_match_robot_(RobotNum, _AllRobotIds, MatchList,
		_RobotId, _MainId, _CampId)
    when RobotNum =< 0 ->
    MatchList;
do_match_robot_(RobotNum, AllRobotIds, MatchList,
		RobotRoleId, MainId, CampId) ->
    {RobotId, _} = util:rand_list(AllRobotIds, 2),
    MatchRole = #holiday_camp_war_role{id =
					   {{RobotId * 100 + RobotRoleId,
					     <<"robot">>},
					    MainId},
				       camp_id = CampId},
    do_match_robot_(RobotNum - 1, AllRobotIds,
		    [MatchRole | MatchList], RobotRoleId + 1, MainId,
		    CampId).

to_team_member(#holiday_camp_war_role{id = {RoleId, _},
				      name = Name, face_id = FaceId,
				      camp_power = CampPower,
				      avatar_bid = AvatarBid, lev = Lev,
				      face_update_time = FaceUpdateTime,
				      face_file = FaceFile, rank = Rank,
				      score = Score},
	       IsLeader, Pos) ->
    #holiday_camp_war_defense_role{id = RoleId, name = Name,
				   face_id = FaceId, power = CampPower,
				   avatar_bid = AvatarBid, lev = Lev, pos = Pos,
				   rank = Rank, score = Score,
				   face_update_time = FaceUpdateTime,
				   face_file = FaceFile, is_leader = IsLeader}.

to_team_member_defense([], L) -> {ok, L};
to_team_member_defense([Data | Other], L) ->
    case to_team_member_defense(Data) of
      NData = #holiday_camp_war_defense_role{} ->
	  to_team_member_defense(Other, [NData | L]);
      _ -> false
    end.

to_team_member_defense(Data =
			   #holiday_camp_war_defense_role{id =
							      {_,
							       <<"robot">>}}) ->
    Data;
to_team_member_defense(Data =
			   #holiday_camp_war_defense_role{id = RoleId}) ->
    case role_robot:get_role(RoleId) of
      {ok,
       Robot = #role_robot{face_update_time = FaceUpdateTime,
			   face_file = FaceFile,
			   m_sprite_tree =
			       #m_sprite_tree{all_attr = SpriteAttr,
					      break_lev = SpriteBreak},
			   m_guild_skill =
			       #m_guild_skill{break_groups = BreakGroups}}} ->
	  #formation_sys{type = FormationType, pos_info = PosInfo,
			 hallows_id = HallowsId} =
	      formation:get_sys_formation(Robot, 41),
	  TeamPower = formation:get_sys_formation_power(Robot,
							41),
	  TeamPartners = to_team_partner(Robot, PosInfo),
	  {HallowsId, HallowsLev, HallowsSkillLev, HallowsLookId,
	   HallowsLookIds, HallowsLucky, HallowsSeal} =
	      hallows_lib:get_hallows_info2(Robot, HallowsId),
	  HallowRefine = hallows_lib:get_hallows_refine(Robot,
							HallowsId),
	  {SpriteLev, Sprites} = sprite_tree:get_sprite_lev(Robot,
							    41),
	  Data#holiday_camp_war_defense_role{formation_type =
						 FormationType,
					     face_update_time = FaceUpdateTime,
					     face_file = FaceFile,
					     hallows_id = HallowsId,
					     hallows_lev = HallowsLev,
					     hallows_skill_lev =
						 HallowsSkillLev,
					     hallows_look_id = HallowsLookId,
					     hallows_lucky = HallowsLucky,
					     hallows_seal = HallowsSeal,
					     hallows_refine = HallowRefine,
					     hallows_all_look_ids =
						 HallowsLookIds,
					     sprite_breka_lev = SpriteBreak,
					     sprite_lev = SpriteLev,
					     sprites = Sprites,
					     sprite_attr = SpriteAttr,
					     partner_infos = TeamPartners,
					     power = TeamPower,
					     break_groups = BreakGroups};
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_camp_war_match_mgr364, _,
	     {__Levelholiday_camp_war_match_mgr364,
	      __Tracesholiday_camp_war_match_mgr364}}
		when __Levelholiday_camp_war_match_mgr364 band 8 /= 0
		       orelse __Tracesholiday_camp_war_match_mgr364 /= [] ->
		lager:do_log(error,
			     [{module, holiday_camp_war_match_mgr},
			      {function, to_team_member_defense}, {line, 364},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("找不到机器人数据~w err=~w", [RoleId, _Err]),
			     none, 4096, 8,
			     __Levelholiday_camp_war_match_mgr364,
			     __Tracesholiday_camp_war_match_mgr364, lager_event,
			     __Pidholiday_camp_war_match_mgr364);
	    _ -> ok
	  end,
	  false
    end.

to_team_partner(#role_robot{partners = PartnerList},
		PartnerId) ->
    to_team_partner(PartnerList, PartnerId);
to_team_partner(PartnerList, PartnerIds)
    when is_list(PartnerIds) ->
    [begin
       #partner{bid = Bid, use_skin = SkinId, lev = Lev,
		dower_skill = DowerSkill, set_skills = SetSkill,
		break_lev = BreakLev, all_attr = Attr, star = Star,
		power = Power, resonate_lev = ResonateLev} =
	   lists:keyfind(Id, #partner.id, PartnerList),
       #holiday_camp_war_partners_info{attr = Attr,
				       dower_skill = DowerSkill,
				       set_skill = SetSkill, id = Id, pos = Pos,
				       bid = Bid, lev = Lev,
				       break_lev = BreakLev, star = Star,
				       power = Power, use_skin = SkinId,
				       resonate_lev = ResonateLev}
     end
     || #formation_pos{id = Id, pos = Pos} <- PartnerIds].


