-file("src/mod/rank/rank_pack.erl", 1).

-module(rank_pack).

-lager_records([{heaven_dun,
		 [ver, id, state, star, star_info]},
		{heaven_chapter,
		 [ver, id, star, chapter_awards, dun_list]},
		{m_dungeon_heaven,
		 [ver, count, buy_count, chapter_list, formations]},
		{sky_ladder_result,
		 [result, id, def_name, def_lev, def_face,
		  def_change_rank, def_rank, def_old_rank,
		  is_change_best_rank, atk_change_rank, atk_rank,
		  atk_old_rank, atk_cont_win, reward,
		  def_face_update_time, def_face_file]},
		{sky_ladder_highlight,
		 [id, atk_id, atk_name, atk_face, atk_rank, def_id,
		  def_name, def_face, def_rank, ret, replay_id, time,
		  atk_face_update_time, atk_face_file,
		  def_face_update_time, def_face_file]},
		{sky_ladder_pk_log,
		 [id, rid, name, lev, sex, face, avatar_id, power,
		  atk_power, enemy_old_rank, old_rank, type, ret,
		  replay_id, rank_type, rank, time, face_update_time,
		  face_file]},
		{sky_ladder_role_log,
		 [id, name, face, logs, face_update_time, face_file]},
		{sky_ladder_rank,
		 [rank, id, is_fight, fight_rid, fight_pid]},
		{sky_ladder_role,
		 [id, name, vip, lev, sex, gid, gname, face, power,
		  max_power, lookid, rank, best_rank, time, avatar_id,
		  robot_unit, cont_win, face_update_time, face_file]},
		{sky_ladder_f_pos,
		 [pos, id, bid, lev, use_skin, star, break_lev, power,
		  speed, atk, def, hp, attr_ratio, is_robot]},
		{sky_ladder_f,
		 [id, name, gname, idx, lev, vip_lev, sex, face, power,
		  rank, formation_type, formation_lev, hallows_id,
		  pos_info, robot_id, avatar_id, look, face_update_time,
		  face_file]},
		{m_sky_ladder,
		 [ver, ref_time, combat_time, ref_list, best_rank,
		  can_combat_num, had_combat_num, buy_combat_num,
		  acc_combat_num, first_reward, next_reset_nine, worship,
		  worship_list, season_idx, merge_index, now_combat_num]},
		{endless_robot_data,
		 [id, bid, rname, group_id, unit_id, lev, star, quality,
		  power]},
		{endless_employ,
		 [id, rid, rname, bid, plev, star, quality, break_lev,
		  power, num, ext]},
		{endless_data,
		 [type, id, name, lev, unit_ids, is_reset, formation]},
		{new_endless,
		 [ver, type, max_id, ext_reward, day_begin, day_pass,
		  ext]},
		{m_endless,
		 [ver, r_id, max_id, ext_reward, day_begin, day_pass,
		  day_reward, employ, appoint, type, select_type,
		  new_endless_list, ext, flag]},
		{avatar_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{avatar_frame, [ver, base_id, expire_time]},
		{m_avatar, [ver, used, frames]}, {role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{item_make_args, [base_id, bind, quantity, step, flag]},
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
		{unit_make_args, [pos, evts, disabled]},
		{map_unit,
		 [id, type, activity, status, guide_lev, name, layer,
		  base_id, lev, career, sex, hp, hp_max, speed, x, y, gx,
		  gy, looks]},
		{unit,
		 [id, type, minor_type, pid, activity, combat_pid, name,
		  status, guide_lev, nature, quality, layer, disabled,
		  base_id, lev, career, sex, hp, hp_max, speed, lock,
		  def_status, pos, looks, evt, ts, timeout, t_move, t_atk,
		  extra]},
		{unit_data,
		 [bid, type, minor_type, name, activity, cli_create,
		  guide_lev, status, nature, disabled, condition, lev,
		  career, sex, hp, mp, hp_max, mp_max, speed, lock,
		  t_move, t_atk, range_trace, range_atk, gain, slave,
		  waves, talk, looks, order, data, layer, def_status,
		  status_list, drop_id, act_drops, tran_pos,
		  reward_panel_type, reward, formation, camp_type]},
		{unit_order, [order, type, arg, data, condition, over]},
		{arena_pk_log,
		 [id, rid, name, lev, sex, face, avatar_id, power, type,
		  ret, replay_id, score, time, face_update_time,
		  face_file]},
		{arena_role_log, [id, logs]},
		{arena_rank, [rank, id, score]},
		{arena_role,
		 [id, name, lev, sex, gid, gname, face, power, max_power,
		  lookid, score, rank, time, avatar_id, champion_power,
		  face_update_time, face_file]},
		{arena_f_pos,
		 [pos, id, bid, lev, quality, star, break_lev, power,
		  speed, atk, def, hp, attr_ratio, ext]},
		{arena_f,
		 [id, name, idx, lev, sex, face, power, status,
		  formation_type, formation_lev, pos_info, robot_id,
		  avatar_id, face_update_time, face_file, gid, gname]},
		{m_arena,
		 [ver, ref_time, ref_list, cont_win, buff_id,
		  season_ref_time, can_combat_num, had_combat_num,
		  buy_combat_num, acc_combat_num, season_reward]},
		{g_mem_red_packet,
		 [id, rid, name, face_id, avatar_bid, post, type, num,
		  max_num, val, max_val, list, mems, start_time, end_time,
		  msg_id, face_update_time, face_file]},
		{guild_data, [lev, exp, num, maintain]},
		{guild_position, [id, name, limit]},
		{g_merge,
		 [gid, gname, gid2, gname2, role_id, rname, end_time,
		  gold]},
		{guild_rank,
		 [id, name, lev, exp, leader_name, leader_id,
		  leader_face, leader_lev, members_num, members_max,
		  apply_lev, apply_type, create_time, power, index,
		  leader_avatar_bid, leader_look_id,
		  leader_face_update_time, leader_face_file,
		  apply_power]},
		{guild_apply,
		 [gid, id, pid, name, face, lev, power, post, vip_lev,
		  online, apply_time, face_update_time, face_file]},
		{guild_member,
		 [ver, id, pid, name, face, lev, sex, power, post,
		  vip_lev, online, join_time, login_time, donate,
		  day_donate, avatar_bid, red_packet_num,
		  red_packet_price, red_packet_time, red_packet_recv_num,
		  red_packet_recv_time, active_lev, day_donate_type,
		  day_donate_time, day_dun_time, day_war_time, look_id,
		  face_update_time, face_file]},
		{guild_war_box,
		 [order, rid, sid, name, item_id, item_num]},
		{guild_cache, []},
		{guild,
		 [ver, id, name, lev, exp, day_exp, pid, leader_name,
		  leader_id, members, members_num, members_max, next_id,
		  sign, apply_lev, apply_type, recruit_num, cache, sync,
		  create_time, power, rename_time, lock_time, donate_exp,
		  red_packet, guild_war_box_end_time, guild_war_relust,
		  guild_war_box, guild_war_sign, day_var,
		  vice_leader_mail, normal_mail, vitality, apply_power]},
		{guild_bag,
		 [ver, id, pid, name, post, lev, join_time, quit_time,
		  send_time, send_num, recv_num, true_quit_time,
		  quit_post]},
		{guild_log_info,
		 [id, guild_id, type, time, role_id, role_name, msg]},
		{guild_log, [key, list]},
		{rank_cfg,
		 [type, num, keys, min_val, nologin, zone, exit_rank]},
		{rank_rc,
		 [ver, id, idx, val1, val2, val3, rid, srv_id, name,
		  look_id, sex, lev, face_id, vip_lev, guild_name, power,
		  all_power, desc, looks, ext, time, is_cross, avatar_bid,
		  face_update_time, face_file]},
		{rank, [type, list, last_val, len, is_cross, ctime]},
		{group_attr, [atk, hp_max, def, speed]},
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

-export([get_last_update_time/1, pack/4, show/1]).

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

-file("src/mod/rank/rank_pack.erl", 12).

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

-file("src/mod/rank/rank_pack.erl", 13).

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

-file("src/mod/rank/rank_pack.erl", 14).

-file("inc/rank.hrl", 1).

-record(rank,
	{type = 0  :: non_neg_integer(), list = []  :: list(),
	 last_val = 0  :: non_neg_integer(),
	 len = 0  :: non_neg_integer(), is_cross = 0  :: 0 | 1,
	 ctime = 0  :: non_neg_integer()}).

-record(rank_rc,
	{ver = 3  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 idx = 0  :: non_neg_integer(),
	 val1 = 0  :: non_neg_integer(),
	 val2 = 0  :: non_neg_integer(),
	 val3 = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(),
	 srv_id = <<>>  :: bitstring(),
	 name = <<>>  :: bitstring(),
	 look_id = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 face_id = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 guild_name = <<>>  :: bitstring(),
	 power = 0  :: non_neg_integer(),
	 all_power = 0  :: non_neg_integer(),
	 desc = <<>>  :: bitstring(), looks = []  :: list(),
	 ext = []  :: list(), time = 0  :: non_neg_integer(),
	 is_cross = false, avatar_bid = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(rank_cfg,
	{type = 0  :: non_neg_integer(),
	 num = 300  :: non_neg_integer(),
	 keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1],
	 min_val = 1  :: non_neg_integer(),
	 nologin = 0  :: non_neg_integer(),
	 zone = rank_zone_1  :: atom(), exit_rank = 0  :: 0..1}).

-file("src/mod/rank/rank_pack.erl", 15).

-file("inc/guild.hrl", 1).

-record(guild_log, {key = {0, <<>>}, list = []}).

-record(guild_log_info,
	{id = 0, guild_id = {0, <<>>}, type = 0, time = 0,
	 role_id = {0, <<>>}, role_name = 0, msg = <<>>}).

-record(guild_bag,
	{ver = 2, id = {0, <<>>}, pid, name = <<>>, post = 0,
	 lev = 0, join_time = 0, quit_time = 0, send_time = 0,
	 send_num = 0, recv_num = 0, true_quit_time = 0,
	 quit_post = 0}).

-record(guild,
	{ver = 7, id = {0, <<>>}, name = <<>>, lev = 1, exp = 0,
	 day_exp = 0, pid = 0, leader_name = <<>>,
	 leader_id = {0, <<>>}, members = [], members_num = 1,
	 members_max = 50, next_id = 1, sign = <<>>,
	 apply_lev = guild_data:get_const(guild_min_lev),
	 apply_type = 1, recruit_num = 0, cache, sync = 0,
	 create_time = 0, power = 0, rename_time = 0,
	 lock_time = 0, donate_exp = 0, red_packet = [],
	 guild_war_box_end_time = 0, guild_war_relust = 0,
	 guild_war_box = [], guild_war_sign = [], day_var = [],
	 vice_leader_mail = 0, normal_mail = 0, vitality = 0,
	 apply_power = 0}).

-record(guild_cache, {}).

-record(guild_war_box,
	{order = 0, rid = 0, sid = <<>>, name = <<>>,
	 item_id = 0, item_num = 0}).

-record(guild_member,
	{ver = 6, id = {0, <<>>}, pid = 0, name = <<>>,
	 face = 0, lev = 0, sex = 1, power = 0, post = 0,
	 vip_lev = 0, online = 1, join_time = 0, login_time = 0,
	 donate = 0, day_donate = 0, avatar_bid = 0,
	 red_packet_num = 0, red_packet_price = 0,
	 red_packet_time = 0, red_packet_recv_num = 0,
	 red_packet_recv_time = 0, active_lev = 0,
	 day_donate_type = 0, day_donate_time = 0,
	 day_dun_time = 0, day_war_time = 0, look_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(guild_apply,
	{gid = {0, <<>>}, id = {0, <<>>}, pid = 0, name = <<>>,
	 face = 0, lev = 0, power = 0, post = 0, vip_lev = 0,
	 online = 1, apply_time = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(guild_rank,
	{id = {0, <<>>}, name = <<>>, lev = 1, exp = 0,
	 leader_name = <<>>, leader_id = {0, <<>>},
	 leader_face = 0, leader_lev = 0, members_num = 1,
	 members_max = 50, apply_lev = 0, apply_type = 1,
	 create_time = 0, power = 0, index = 0,
	 leader_avatar_bid = 0, leader_look_id = 0,
	 leader_face_update_time = 0, leader_face_file = <<>>,
	 apply_power = 0}).

-record(g_merge,
	{gid = {0, <<>>}, gname = <<>>, gid2 = {0, <<>>},
	 gname2 = <<>>, role_id = {0, <<>>}, rname = <<>>,
	 end_time = 0, gold = 0}).

-record(guild_position,
	{id = 0, name = <<>>, limit = []}).

-record(guild_data,
	{lev = 0, exp = 0, num = 0, maintain = 0}).

-record(g_mem_red_packet,
	{id = {{0, <<>>}, 0}, rid = {0, <<>>}, name = <<>>,
	 face_id = 0, avatar_bid = 0, post = <<>>, type = 0,
	 num = 0, max_num = 0, val = 0, max_val = 0, list = [],
	 mems = [], start_time = 0, end_time = 0, msg_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-file("src/mod/rank/rank_pack.erl", 16).

-file("inc/arena.hrl", 1).

-record(m_arena,
	{ver = 1, ref_time = 0, ref_list = [], cont_win = 0,
	 buff_id = 0, season_ref_time = 0, can_combat_num = 0,
	 had_combat_num = 0, buy_combat_num = 0,
	 acc_combat_num = 0, season_reward = []}).

-record(arena_f,
	{id = {0, <<>>}, name = <<>>, idx = 0, lev = 0, sex = 0,
	 face = 0, power = 0, status = 0, formation_type = 0,
	 formation_lev = 0, pos_info = [], robot_id = 0,
	 avatar_id = 0, face_update_time = 0, face_file = <<>>,
	 gid = {0, <<>>}, gname = <<>>}).

-record(arena_f_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, quality = 0,
	 star = 0, break_lev = 0, power = 0, speed = 0, atk = 0,
	 def = 0, hp = 0, attr_ratio = 1000, ext}).

-record(arena_role,
	{id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 max_power = 0, lookid = 0, score = 0, rank = 0,
	 time = 0, avatar_id = 0, champion_power = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(arena_rank,
	{rank = 0, id = {0, <<>>}, score = 0}).

-record(arena_role_log, {id = {0, <<>>}, logs = []}).

-record(arena_pk_log,
	{id = 0, rid = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 face = 0, avatar_id = 0, power = 0, type = 1, ret = 1,
	 replay_id = 0, score = 0, time = 0,
	 face_update_time = 0, face_file = <<>>}).

-file("src/mod/rank/rank_pack.erl", 17).

-file("inc/unit.hrl", 1).

-record(unit_order,
	{order  :: move | guard | attack | atom(),
	 type = 0  :: 0..2,
	 arg  :: undefined | tuple() | [tuple()],
	 data  :: undefined | term(), condition = []  :: list(),
	 over  :: undefined | defense | stop | atom()}).

-record(unit_data,
	{bid = auto  :: auto | pos_integer(),
	 type = 200  :: non_neg_integer(),
	 minor_type = 1  :: non_neg_integer(),
	 name = ""  :: bitstring(), activity = 0  :: 0..1,
	 cli_create = 0  :: 0..1,
	 guide_lev = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 nature = 0  :: non_neg_integer(),
	 disabled = <<>>  :: bitstring(),
	 condition = []  :: [tuple()],
	 lev = 0  :: non_neg_integer(),
	 career = 0  :: non_neg_integer(),
	 sex = 2  :: non_neg_integer(),
	 hp = 0  :: non_neg_integer(),
	 mp = 0  :: non_neg_integer(),
	 hp_max = 0  :: non_neg_integer(),
	 mp_max = 0  :: non_neg_integer(),
	 speed = 180  :: pos_integer(), lock = 0  :: 0 | 1,
	 t_move = 3  :: pos_integer(),
	 t_atk = 3  :: pos_integer(),
	 range_trace = 200  :: pos_integer(),
	 range_atk = 100  :: pos_integer(), gain = []  :: list(),
	 slave = []  :: list(), waves = []  :: list(),
	 talk = []  :: list(), looks = []  :: list(),
	 order = []  :: list(), data = []  :: list(),
	 layer = 0  :: non_neg_integer(),
	 def_status = defense  :: defense | patrol | loaf,
	 status_list = []  :: list(),
	 drop_id = 0  :: non_neg_integer(),
	 act_drops = []  :: list(), tran_pos = [],
	 reward_panel_type = 1, reward = [], formation = {1, 1},
	 camp_type = 0}).

-record(unit,
	{id = {1, 1}  :: {pos_integer(), pos_integer()},
	 type = 200  :: non_neg_integer(),
	 minor_type = 1  :: non_neg_integer(),
	 pid = 0  :: non_neg_integer() | pid(),
	 activity = 0  :: 0..1,
	 combat_pid = 0  :: non_neg_integer() | pid(),
	 name = ""  :: bitstring(),
	 status = 0  :: non_neg_integer(),
	 guide_lev = 0  :: non_neg_integer(),
	 nature = 0  :: non_neg_integer(), quality = 0  :: 0..4,
	 layer = 0  :: non_neg_integer(),
	 disabled = <<>>  :: bitstring(),
	 base_id = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 career = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 hp = 0  :: non_neg_integer(),
	 hp_max = 0  :: non_neg_integer(),
	 speed = 1  :: pos_integer(), lock = 0  :: 0 | 1,
	 def_status = defense  :: defense,
	 pos  :: undefined | tuple(), looks = []  :: [tuple()],
	 evt = []  :: [atom()],
	 ts = {1, 1, 1}  ::
	     {pos_integer(), pos_integer(), pos_integer()},
	 timeout = 864000  :: non_neg_integer(),
	 t_move = 1  :: pos_integer(),
	 t_atk = 1  :: pos_integer(), extra = []  :: [tuple()]}).

-record(map_unit,
	{id = {1, 1}  :: {pos_integer(), pos_integer()},
	 type = 200  :: pos_integer(), activity = 0  :: 0..1,
	 status = 0  :: non_neg_integer(),
	 guide_lev = 0  :: non_neg_integer(),
	 name = ""  :: bitstring(),
	 layer = 0  :: non_neg_integer(),
	 base_id = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 career = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 hp = 0  :: non_neg_integer(),
	 hp_max = 0  :: non_neg_integer(),
	 speed = 1  :: pos_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer(),
	 gx = 0  :: non_neg_integer(),
	 gy = 0  :: non_neg_integer(),
	 looks = []  :: [tuple()]}).

-record(unit_make_args,
	{pos = {0, 0, 0}, evts = [], disabled = 0  :: 0 | 1}).

-file("src/mod/rank/rank_pack.erl", 18).

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

-file("src/mod/rank/rank_pack.erl", 19).

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

-file("src/mod/rank/rank_pack.erl", 20).

-file("inc/avatar.hrl", 1).

-record(m_avatar, {ver = 1, used = 0, frames = []}).

-record(avatar_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(avatar_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-file("src/mod/rank/rank_pack.erl", 21).

-file("inc/endless.hrl", 1).

-record(m_endless,
	{ver = 2  :: pos_integer(), r_id = 0  :: pos_integer(),
	 max_id = 0  :: pos_integer(),
	 ext_reward = []  :: list(),
	 day_begin = 1  :: pos_integer(),
	 day_pass = 0  :: pos_integer(),
	 day_reward = []  :: list(), employ = []  :: list(),
	 appoint = []  :: list(), type = 0  :: pos_integer(),
	 select_type = 0  :: pos_integer(),
	 new_endless_list = []  :: list(), ext = []  :: list(),
	 flag = 0  :: pos_integer()}).

-record(new_endless,
	{ver = 1  :: pos_integer(), type = 0  :: pos_integer(),
	 max_id = 0  :: pos_integer(),
	 ext_reward = []  :: list(),
	 day_begin = 1  :: pos_integer(),
	 day_pass = 0  :: pos_integer(), ext = []  :: list()}).

-record(endless_data,
	{type = 0, id = 0, name = <<>>, lev = 0, unit_ids = [],
	 is_reset = 0, formation = undefined}).

-record(endless_employ,
	{id = {{0, <<>>}, 0}, rid = {0, <<>>}, rname = <<>>,
	 bid = 0, plev = 0, star = 0, quality = 0, break_lev = 0,
	 power = 0, num = 0, ext = []}).

-record(endless_robot_data,
	{id = 0, bid = 0, rname = <<>>, group_id = 0,
	 unit_id = 0, lev = 0, star = 0, quality = 0,
	 power = 0}).

-file("src/mod/rank/rank_pack.erl", 22).

-file("inc/sky_ladder.hrl", 1).

-record(m_sky_ladder,
	{ver = 2, ref_time = 0, combat_time = 0, ref_list = [],
	 best_rank = 0,
	 can_combat_num = sky_ladder_data:get_const(join_times),
	 had_combat_num = 0, buy_combat_num = 0,
	 acc_combat_num = 0, first_reward = [],
	 next_reset_nine = 0, worship = 0, worship_list = [],
	 season_idx = 0, merge_index = 0, now_combat_num = 0}).

-record(sky_ladder_f,
	{id = {0, <<>>}, name = <<>>, gname = <<>>, idx = 0,
	 lev = 0, vip_lev = 0, sex = 0, face = 0, power = 0,
	 rank = 0, formation_type = 0, formation_lev = 0,
	 hallows_id = 0, pos_info = [], robot_id = 0,
	 avatar_id = 0, look = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(sky_ladder_f_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, use_skin = 0,
	 star = 0, break_lev = 0, power = 0, speed = 0, atk = 0,
	 def = 0, hp = 0, attr_ratio = 1000, is_robot = 0}).

-record(sky_ladder_role,
	{id = {0, <<>>}, name = <<>>, vip = 0, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 max_power = 0, lookid = 0, rank = 0, best_rank = 0,
	 time = 0, avatar_id = 0, robot_unit = 0, cont_win = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(sky_ladder_rank,
	{rank = 0, id = {0, <<>>}, is_fight = 0,
	 fight_rid = {0, <<>>}, fight_pid = 0}).

-record(sky_ladder_role_log,
	{id = {0, <<>>}, name = <<>>, face = 0, logs = [],
	 face_update_time = 0, face_file = <<>>}).

-record(sky_ladder_pk_log,
	{id = 0, rid = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 face = 0, avatar_id = 0, power = 0, atk_power = 0,
	 enemy_old_rank = 0, old_rank = 0, type = 1, ret = 1,
	 replay_id = 0, rank_type = 0, rank = 0, time = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(sky_ladder_highlight,
	{id = 0, atk_id = {0, <<>>}, atk_name = <<>>,
	 atk_face = 0, atk_rank = 0, def_id = {0, <<>>},
	 def_name = <<>>, def_face = 0, def_rank = 0, ret = 1,
	 replay_id = 0, time = 0, atk_face_update_time = 0,
	 atk_face_file = <<>>, def_face_update_time = 0,
	 def_face_file = <<>>}).

-record(sky_ladder_result,
	{result = 0, id = {0, <<>>}, def_name = <<>>,
	 def_lev = 0, def_face = 0, def_change_rank = 0,
	 def_rank = 0, def_old_rank = 0, is_change_best_rank = 0,
	 atk_change_rank = 0, atk_rank = 0, atk_old_rank = 0,
	 atk_cont_win = 0, reward = [], def_face_update_time = 0,
	 def_face_file = <<>>}).

-file("src/mod/rank/rank_pack.erl", 23).

-file("inc/dungeon_heaven.hrl", 1).

-record(m_dungeon_heaven,
	{ver = 1, count = 0, buy_count = 0, chapter_list = [],
	 formations = []}).

-record(heaven_chapter,
	{ver = 1, id = 0, star = 0, chapter_awards = [],
	 dun_list = []}).

-record(heaven_dun,
	{ver = 1, id = 0, state = 0, star = 0, star_info = []}).

-file("src/mod/rank/rank_pack.erl", 24).

-spec get_last_update_time(RType ::
			       non_neg_integer()) -> non_neg_integer().

get_last_update_time(4) ->
    guild_rank:get_rank_list_last_time();
get_last_update_time(5) ->
    arena_mgr:get_rank_list_last_time();
get_last_update_time(9) -> get_last_update_time(2);
get_last_update_time(10) -> get_last_update_time(3);
get_last_update_time(11) -> get_last_update_time(5);
get_last_update_time(12) -> get_last_update_time(6);
get_last_update_time(29) -> get_last_update_time(18);
get_last_update_time(31) -> get_last_update_time(21);
get_last_update_time(25) -> get_last_update_time(1006);
get_last_update_time(RType) ->
    try ets:lookup_element(sys_rank, RType, #rank.ctime)
    catch
      _:_ -> 0
    end.

calc_last_update_time(Type, Time, TimeoutSec) ->
    Now = date:unixtime(),
    {OldTime, LastRpcTime} = get_rpc_last_update_time(Type,
						      {Time, Now}),
    case Time =:= OldTime of
      false ->
	  set_rpc_last_update_time(Type, {Time, Now}), Time;
      true ->
	  RpcTime = LastRpcTime + TimeoutSec,
	  case Now > RpcTime of
	    true ->
		set_rpc_last_update_time(Type, {Time, Now}), Time + 1;
	    false -> Time
	  end
    end.

set_rpc_last_update_time(Type, Val) ->
    put({rank_rpc_last_update_time, Type}, Val).

get_rpc_last_update_time(Type, DefVal) ->
    case get({rank_rpc_last_update_time, Type}) of
      undefined ->
	  set_rpc_last_update_time(Type, DefVal), DefVal;
      Val -> Val
    end.

-spec pack(#role{}, RType :: pos_integer(),
	   Start :: pos_integer(),
	   Num :: pos_integer()) -> Result :: tuple().

pack(Role, RType, Page, Num)
    when Num < 1 orelse Num > 1000 ->
    pack(Role, RType, Page, 100);
pack(#role{guild_bag =
	       #guild_bag{id = Gid, name = Gname}},
     4, Start0, Num) ->
    case guild_rank:call(get_rank_list) of
      {ok, CTime, L} ->
	  Len = length(L),
	  Start = util:check_range(Start0, 1, max(1, Len)),
	  PageList = lists:sublist(L, Start, Num),
	  {MyRank, Lev, Power, LeaderName} = case
					       lists:keyfind(Gid,
							     #guild_rank.id, L)
						 of
					       #guild_rank{index = Idx,
							   lev = Lev1,
							   power = Power1,
							   leader_name =
							       LeaderName1} ->
						   {Idx, Lev1, Power1,
						    LeaderName1};
					       _ -> {0, 0, 0, <<>>}
					     end,
	  {Start, Num, Len, CTime, MyRank, Gname, LeaderName, Lev,
	   Power, PageList};
      _ -> error
    end;
pack(#role{guild_bag =
	       #guild_bag{id = Gid, name = Gname}},
     RType = 1004, Start0, Num) ->
    #rank{list = L, ctime = CTime} = rank_mgr:lookup(RType),
    Len = length(L),
    Start = util:check_range(Start0, 1, max(1, Len)),
    List = [to_cli(RType, RankRc) || RankRc <- L],
    PageList = lists:sublist(List, Start, Num),
    {MyRank, Lev, Power, LeaderName} = case
					 lists:keyfind(Gid, #guild_rank.id,
						       List)
					   of
					 #guild_rank{index = Idx, lev = Lev1,
						     power = Power1,
						     leader_name =
							 LeaderName1} ->
					     {Idx, Lev1, Power1, LeaderName1};
					 _ -> {0, 0, 0, <<>>}
				       end,
    {Start, Num, Len, CTime, MyRank, Gname, LeaderName, Lev,
     Power, PageList};
pack(#role{id = RoleId, power = Power, lev = Lev,
	   face_id = FaceId, name = Name,
	   m_avatar = #m_avatar{used = AvatarId}},
     RType = 1033, Start0, Num) ->
    RankL = sky_ladder:list_rank(Num),
    List = [to_cli(RType, SkyLadderRole)
	    || SkyLadderRole <- RankL],
    Len = length(List),
    MyRank = sky_ladder:role_rank(RoleId),
    {RType, Start0, Num, Len, 0, MyRank, Lev, FaceId,
     AvatarId, Name, Power, 0, 0, List};
pack(Role, RType = 9, Start0, Num) ->
    case days_rank_mgr:check_open_type([RType]) of
      [] ->
	  case days_rank_mgr:get_rank_bak(by_type, RType) of
	    {ok, #{rank := Rank}} ->
		do_pack(Role, RType, Start0, Num, Rank);
	    Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidrank_pack127, _,
		   {__Levelrank_pack127, __Tracesrank_pack127}}
		      when __Levelrank_pack127 band 8 /= 0 orelse
			     __Tracesrank_pack127 /= [] ->
		      lager:do_log(error,
				   [{module, rank_pack}, {function, pack},
				    {line, 127}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]无法找到七天排行榜:~w",
						 [Role#role.name, Err]),
				   none, 4096, 8, __Levelrank_pack127,
				   __Tracesrank_pack127, lager_event,
				   __Pidrank_pack127);
		  _ -> ok
		end,
		error
	  end;
      _ -> pack(Role, 2, Start0, Num)
    end;
pack(Role, RType = 10, Start0, Num) ->
    case days_rank_mgr:check_open_type([RType]) of
      [] ->
	  case days_rank_mgr:get_rank_bak(by_type, RType) of
	    {ok, #{rank := Rank}} ->
		do_pack(Role, RType, Start0, Num, Rank);
	    Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidrank_pack141, _,
		   {__Levelrank_pack141, __Tracesrank_pack141}}
		      when __Levelrank_pack141 band 8 /= 0 orelse
			     __Tracesrank_pack141 /= [] ->
		      lager:do_log(error,
				   [{module, rank_pack}, {function, pack},
				    {line, 141}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]无法找到七天排行榜:~w",
						 [Role#role.name, Err]),
				   none, 4096, 8, __Levelrank_pack141,
				   __Tracesrank_pack141, lager_event,
				   __Pidrank_pack141);
		  _ -> ok
		end,
		error
	  end;
      _ -> pack(Role, 3, Start0, Num)
    end;
pack(Role, RType = 11, Start0, Num) ->
    case days_rank_mgr:check_open_type([RType]) of
      [] ->
	  case days_rank_mgr:get_rank_bak(by_type, RType) of
	    {ok, #{rank := Rank}} ->
		do_pack(Role, RType, Start0, Num, Rank);
	    Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidrank_pack155, _,
		   {__Levelrank_pack155, __Tracesrank_pack155}}
		      when __Levelrank_pack155 band 8 /= 0 orelse
			     __Tracesrank_pack155 /= [] ->
		      lager:do_log(error,
				   [{module, rank_pack}, {function, pack},
				    {line, 155}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]无法找到七天排行榜:~w",
						 [Role#role.name, Err]),
				   none, 4096, 8, __Levelrank_pack155,
				   __Tracesrank_pack155, lager_event,
				   __Pidrank_pack155);
		  _ -> ok
		end,
		error
	  end;
      _ ->
	  Rank = days_rank_mgr:arena_to_rank(),
	  do_pack(Role, RType, Start0, Num, Rank)
    end;
pack(Role, RType = 12, Start0, Num) ->
    case days_rank_mgr:check_open_type([RType]) of
      [] ->
	  case days_rank_mgr:get_rank_bak(by_type, RType) of
	    {ok, #{rank := Rank}} ->
		do_pack(Role, RType, Start0, Num, Rank);
	    Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidrank_pack170, _,
		   {__Levelrank_pack170, __Tracesrank_pack170}}
		      when __Levelrank_pack170 band 8 /= 0 orelse
			     __Tracesrank_pack170 /= [] ->
		      lager:do_log(error,
				   [{module, rank_pack}, {function, pack},
				    {line, 170}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]无法找到七天排行榜:~w",
						 [Role#role.name, Err]),
				   none, 4096, 8, __Levelrank_pack170,
				   __Tracesrank_pack170, lager_event,
				   __Pidrank_pack170);
		  _ -> ok
		end,
		error
	  end;
      _ -> pack(Role, 6, Start0, Num)
    end;
pack(Role = #role{id = Rid, lev = Lev, face_id = FaceId,
		  name = Name, m_avatar = #m_avatar{used = AvatarId}},
     RType = 14, Start0, Num) ->
    #rank{list = L, len = Len, ctime = CTime} = case
						  days_rank_mgr:check_open_type([RType])
						    of
						  [] ->
						      case
							days_rank_mgr:get_rank_bak(by_type,
										   RType)
							  of
							{ok, #{rank := Rank}} ->
							    Rank;
							Err ->
							    case
							      {whereis(lager_event),
							       whereis(lager_event),
							       lager_config:get({lager_event,
										 loglevel},
										{0,
										 []})}
								of
							      {undefined,
							       undefined, _} ->
								  fun () ->
									  {error,
									   lager_not_running}
								  end();
							      {undefined, _,
							       _} ->
								  fun () ->
									  {error,
									   {sink_not_configured,
									    lager_event}}
								  end();
							      {__Pidrank_pack185,
							       _,
							       {__Levelrank_pack185,
								__Tracesrank_pack185}}
								  when
								    __Levelrank_pack185
								      band 8
								      /= 0
								      orelse
								      __Tracesrank_pack185
									/= [] ->
								  lager:do_log(error,
									       [{module,
										 rank_pack},
										{function,
										 pack},
										{line,
										 185},
										{pid,
										 pid_to_list(self())},
										{node,
										 node()}
										| lager:md()],
									       io_lib:format("[~ts]无法找到七天排行榜:~w",
											     [Role#role.name,
											      Err]),
									       none,
									       4096,
									       8,
									       __Levelrank_pack185,
									       __Tracesrank_pack185,
									       lager_event,
									       __Pidrank_pack185);
							      _ -> ok
							    end,
							    #rank{}
						      end;
						  _ -> rank_mgr:lookup(RType)
						end,
    Start = util:check_range(Start0, 1, max(1, Len)),
    PageList = lists:sublist(L, Start, Num),
    {_, FaceFile, FaceUpdateTime} =
	role_face:face_info(Role),
    {MyRank, Pid, PBid, PLev, PQuality, PStar, PPower} =
	case lists:keyfind(Rid, #rank_rc.id, L) of
	  #rank_rc{idx = Idx, val1 = PPower1,
		   ext = #partner{id = Pid1, bid = PBid1, lev = PLev1},
		   val2 = PQuality1, val3 = PStar1} ->
	      {Idx, Pid1, PBid1, PLev1, PQuality1, PStar1, PPower1};
	  _ ->
	      [#partner{id = Pid1, bid = PBid1, lev = PLev1,
			quality = PQuality1, star = PStar1, power = PPower1}
	       | _] =
		  rank:get_partners_in_rank(Role, 0),
	      {0, Pid1, PBid1, PLev1, PQuality1, PStar1, PPower1}
	end,
    PageList1 = [to_cli(RType, I) || I <- PageList],
    {Start, Num, Len, CTime, MyRank, Lev, FaceId, AvatarId,
     Name, Pid, PBid, PLev, PQuality, PStar, PPower,
     FaceUpdateTime, FaceFile, PageList1};
pack(Role, RType = 29, Start0, Num) ->
    case days_rank_mgr:check_open_type([RType]) of
      [] ->
	  case days_rank_mgr:get_rank_bak(by_type, RType) of
	    {ok, #{rank := Rank}} ->
		do_pack(Role, RType, Start0, Num, Rank);
	    Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidrank_pack212, _,
		   {__Levelrank_pack212, __Tracesrank_pack212}}
		      when __Levelrank_pack212 band 8 /= 0 orelse
			     __Tracesrank_pack212 /= [] ->
		      lager:do_log(error,
				   [{module, rank_pack}, {function, pack},
				    {line, 212}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]无法找到七天排行榜:~w",
						 [Role#role.name, Err]),
				   none, 4096, 8, __Levelrank_pack212,
				   __Tracesrank_pack212, lager_event,
				   __Pidrank_pack212);
		  _ -> ok
		end,
		error
	  end;
      _ -> pack(Role, 18, Start0, Num)
    end;
pack(Role, RType = 31, Start0, Num) ->
    case days_rank_mgr:check_open_type([RType]) of
      [] ->
	  case days_rank_mgr:get_rank_bak(by_type, RType) of
	    {ok, #{rank := Rank}} ->
		do_pack(Role, RType, Start0, Num, Rank);
	    Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidrank_pack226, _,
		   {__Levelrank_pack226, __Tracesrank_pack226}}
		      when __Levelrank_pack226 band 8 /= 0 orelse
			     __Tracesrank_pack226 /= [] ->
		      lager:do_log(error,
				   [{module, rank_pack}, {function, pack},
				    {line, 226}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]无法找到七天排行榜:~w",
						 [Role#role.name, Err]),
				   none, 4096, 8, __Levelrank_pack226,
				   __Tracesrank_pack226, lager_event,
				   __Pidrank_pack226);
		  _ -> ok
		end,
		error
	  end;
      _ -> pack(Role, 32, Start0, Num)
    end;
pack(Role = #role{}, RType, Start0, Num)
    when RType =:= 15 orelse
	   RType =:= 23 orelse RType =:= 28 ->
    case days_rank_mgr:check_open_type([RType]) of
      [] ->
	  case days_rank_mgr:get_rank_bak(by_type, RType) of
	    {ok, #{rank := Rank}} ->
		do_pack(Role, RType, Start0, Num, Rank);
	    Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidrank_pack241, _,
		   {__Levelrank_pack241, __Tracesrank_pack241}}
		      when __Levelrank_pack241 band 8 /= 0 orelse
			     __Tracesrank_pack241 /= [] ->
		      lager:do_log(error,
				   [{module, rank_pack}, {function, pack},
				    {line, 241}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]无法找到七天排行榜:~w",
						 [Role#role.name, Err]),
				   none, 4096, 8, __Levelrank_pack241,
				   __Tracesrank_pack241, lager_event,
				   __Pidrank_pack241);
		  _ -> ok
		end,
		error
	  end;
      _ ->
	  Rank = rank_mgr:lookup(RType),
	  do_pack(Role, RType, Start0, Num, Rank)
    end;
pack(Role, RType = 25, Start0, Num) ->
    case days_rank_mgr:check_open_cluster_type([RType]) of
      [] ->
	  case days_rank_mgr:get_rank_bak(by_type, RType) of
	    {ok, #{rank := Rank}} ->
		do_pack(Role, RType, Start0, Num, Rank);
	    Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidrank_pack256, _,
		   {__Levelrank_pack256, __Tracesrank_pack256}}
		      when __Levelrank_pack256 band 8 /= 0 orelse
			     __Tracesrank_pack256 /= [] ->
		      lager:do_log(error,
				   [{module, rank_pack}, {function, pack},
				    {line, 256}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]无法找到七天跨服排行榜:~w",
						 [Role#role.name, Err]),
				   none, 4096, 8, __Levelrank_pack256,
				   __Tracesrank_pack256, lager_event,
				   __Pidrank_pack256);
		  _ -> ok
		end,
		error
	  end;
      _ -> pack(Role, 1006, Start0, Num)
    end;
pack(Role, RType, Start0, Num) ->
    Rank = rank_mgr:lookup(RType),
    do_pack(Role, RType, Start0, Num, Rank).

do_pack(Role = #role{id = Rid, lev = Lev,
		     face_id = FaceId, name = Name,
		     m_avatar = #m_avatar{used = AvatarId}},
	RType, Start0, Num,
	#rank{list = L, len = Len, ctime = CTime}) ->
    Start = util:check_range(Start0, 1, max(1, Len)),
    PageList = lists:sublist(L, Start, Num),
    {MyRank, MyVal1, MyVal2, MyVal3} =
	def_val(rank:my_rank(Rid, L), RType, Role),
    {RType, Start, Num, Len, CTime, MyRank, Lev, FaceId,
     AvatarId, Name, MyVal1, MyVal2, MyVal3, PageList}.

to_cli(14,
       #rank_rc{rid = Rid, srv_id = SrvId, name = Name,
		lev = Lev, face_id = FaceId, avatar_bid = AvatarId,
		idx = Idx, val1 = PPower,
		ext = #partner{id = Pid, bid = PBid, lev = PLev},
		val2 = PQuality, val3 = PStar, look_id = LookId,
		face_update_time = FaceUpdateTime,
		face_file = FaceFile}) ->
    {Rid, SrvId, Name, Lev, FaceId, AvatarId, PPower, Idx,
     Pid, PBid, PLev, PQuality, PStar, LookId,
     FaceUpdateTime, FaceFile};
to_cli(1033,
       #sky_ladder_role{id = {Rid, SrvId}, name = Name,
			gname = GName, face = FaceId, rank = Rank, lev = Lev,
			avatar_id = AvatarId, power = Power,
			lookid = LookId}) ->
    #rank_rc{rid = Rid, srv_id = SrvId, name = Name,
	     guild_name = GName, lev = Lev, face_id = FaceId,
	     avatar_bid = AvatarId, val1 = Power, idx = Rank,
	     look_id = LookId};
to_cli(1004,
       #rank_rc{idx = Idx, id = Gid, guild_name = Gname,
		lev = Lev, power = Power, val1 = Power,
		val2 = MembersNum, val3 = MembersMax, time = CreateTime,
		face_id = Face, avatar_bid = AvatarId,
		all_power = Power, is_cross = true, rid = LeaderRId,
		srv_id = LeaderSrvId, name = LeaderName,
		look_id = LookId, ext = [#{rlev := RLev}]}) ->
    #guild_rank{index = Idx, id = Gid, name = Gname,
		lev = Lev, leader_name = LeaderName,
		leader_id = {LeaderRId, LeaderSrvId},
		members_max = MembersMax, members_num = MembersNum,
		create_time = CreateTime, power = Power,
		leader_face = Face, leader_lev = RLev,
		leader_avatar_bid = AvatarId, leader_look_id = LookId};
to_cli(_RType, Rc) -> Rc.

def_val({0, 0, 0, 0}, 6,
	#role{power = Power, lev = Lev}) ->
    {0, Power, Lev, 0};
def_val({0, 0, 0, 0}, 1006,
	#role{power = Power, lev = Lev}) ->
    {0, Power, Lev, 0};
def_val({0, 0, 0, 0}, 18,
	#role{m_endless = #m_endless{max_id = MaxId}}) ->
    {0, MaxId, 0, 0};
def_val({0, 0, 0, 0}, 42,
	#role{m_dun_heaven =
		  #m_dungeon_heaven{chapter_list = L}}) ->
    Star = lists:sum([Star
		      || #heaven_chapter{star = Star} <- L]),
    {0, Star, 0, 0};
def_val(Data, _RType, _R) -> Data.

-spec show(pos_integer()) -> list().

show(1) ->
    Temp = days_rank_mgr:check_open_cluster_type([]),
    show([1004, 1006, 1033] ++ Temp, []);
show(_) ->
    Temp = days_rank_mgr:check_open_type([14, 15, 31, 23,
					  28]),
    show([2, 3, 4, 5, 6] ++ Temp, []).

show([], Acc) -> Acc;
show([Type | Rest], Acc) ->
    case show_type(Type) of
      Data = {_, _} -> show(Rest, [Data | Acc]);
      _ -> show(Rest, Acc)
    end.

show_type(RType = 5) ->
    case arena_lib:rank_role(1) of
      {ok,
       #arena_role{id = {Rid, SrvId}, name = Name,
		   gname = GName, score = Score, face = FaceId,
		   avatar_id = AvatarId, face_update_time = FaceUpdateTime,
		   face_file = FaceFile}} ->
	  {RType,
	   {Name, Rid, SrvId, GName, FaceId, AvatarId, Score, 0, 0,
	    FaceUpdateTime, FaceFile}};
      false ->
	  {RType, {<<>>, 0, <<>>, <<>>, 0, 0, 0, 0, 0, 0, <<>>}}
    end;
show_type(RType = 4) ->
    case guild_rank:call(get_rank_list) of
      {ok, _CTime, L} ->
	  case lists:keyfind(1, #guild_rank.index, L) of
	    #guild_rank{id = {Gid, SrvId}, name = GName,
			power = Val1, lev = Val2, exp = Val3,
			leader_name = LName, leader_face = FaceId,
			leader_avatar_bid = AvatarId,
			leader_face_update_time = FaceUpdateTime,
			leader_face_file = FaceFile} ->
		{RType,
		 {LName, Gid, SrvId, GName, FaceId, AvatarId, Val1, Val2,
		  Val3, FaceUpdateTime, FaceFile}};
	    _ ->
		{RType, {<<>>, 0, <<>>, <<>>, 0, 0, 0, 0, 0, 0, <<>>}}
	  end;
      _ ->
	  {RType, {<<>>, 0, <<>>, <<>>, 0, 0, 0, 0, 0, 0, <<>>}}
    end;
show_type(RType = 1033) ->
    RType0 = rank_zone:group_type_local_type(RType),
    case sky_ladder:list_rank(1) of
      [#sky_ladder_role{name = Name, id = {Rid, SrvId},
			gname = GName, face = FaceId, avatar_id = AvatarId,
			power = Val1, face_update_time = FaceUpdateTime,
			face_file = FaceFile}
       | _] ->
	  {RType0,
	   {Name, Rid, SrvId, GName, FaceId, AvatarId, Val1, 0, 0,
	    FaceUpdateTime, FaceFile}};
      _ ->
	  {RType0, {<<>>, 0, <<>>, <<>>, 0, 0, 0, 0, 0, 0, <<>>}}
    end;
show_type(RType) when RType > 1000 ->
    #rank{list = RankList} = rank_mgr:lookup(RType),
    RType0 = rank_zone:group_type_local_type(RType),
    case lists:keyfind(1, #rank_rc.idx, RankList) of
      #rank_rc{rid = Rid, srv_id = SrvId, name = Name,
	       face_id = FaceId, guild_name = GName, val1 = Val1,
	       val2 = Val2, val3 = Val3, avatar_bid = AvatarId,
	       face_update_time = FaceUpdateTime,
	       face_file = FaceFile} ->
	  {RType0,
	   {Name, Rid, SrvId, GName, FaceId, AvatarId, Val1, Val2,
	    Val3, FaceUpdateTime, FaceFile}};
      _ ->
	  {RType0, {<<>>, 0, <<>>, <<>>, 0, 0, 0, 0, 0, 0, <<>>}}
    end;
show_type(RType = 31) ->
    #rank{list = RankList} = rank_mgr:lookup(32),
    case lists:keyfind(1, #rank_rc.idx, RankList) of
      #rank_rc{rid = Rid, srv_id = SrvId, name = Name,
	       face_id = FaceId, guild_name = GName, val1 = Val1,
	       val2 = Val2, val3 = Val3, avatar_bid = AvatarId,
	       face_update_time = FaceUpdateTime,
	       face_file = FaceFile} ->
	  {RType,
	   {Name, Rid, SrvId, GName, FaceId, AvatarId, Val1, Val2,
	    Val3, FaceUpdateTime, FaceFile}};
      _ ->
	  {RType, {<<>>, 0, <<>>, <<>>, 0, 0, 0, 0, 0, 0, <<>>}}
    end;
show_type(RType) ->
    #rank{list = RankList} = rank_mgr:lookup(RType),
    case lists:keyfind(1, #rank_rc.idx, RankList) of
      #rank_rc{rid = Rid, srv_id = SrvId, name = Name,
	       face_id = FaceId, guild_name = GName, val1 = Val1,
	       val2 = Val2, val3 = Val3, avatar_bid = AvatarId,
	       face_update_time = FaceUpdateTime,
	       face_file = FaceFile} ->
	  {RType,
	   {Name, Rid, SrvId, GName, FaceId, AvatarId, Val1, Val2,
	    Val3, FaceUpdateTime, FaceFile}};
      _ ->
	  {RType, {<<>>, 0, <<>>, <<>>, 0, 0, 0, 0, 0, 0, <<>>}}
    end.


