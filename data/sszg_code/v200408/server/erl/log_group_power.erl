-file("src/mod/log/log_group_power.erl", 1).

-module(log_group_power).

-lager_records([{holiday_practise_tower_rank,
		 [ver, platform_zone, camp_id, rank_list, old_rank_list,
		  ext]},
		{practise_role_rank,
		 [ver, id, lev, face_id, avatar_bid, name, val, unixtime,
		  power, rank, video_id, face_update_time, face_file,
		  ext]},
		{m_holiday_practise_tower,
		 [ver, camp_id, id, times, last_buy_times,
		  last_anew_times, update_unixtime, hp_radio, is_combat,
		  is_recombat, save_list, ext]},
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
		{holiday_arena_team_log_partner,
		 [pos, id, bid, lev, star, power, skin_id, resonate_lev,
		  hurt, be_hurt, curt, ext]},
		{holiday_arena_team_log_info,
		 [id, round, ret, time, a_id, a_name, a_power,
		  a_formation_type, a_order, a_end_hp, a_hallows_id,
		  a_hallows_look_id, a_sprite_lev, a_sprites, b_id,
		  b_name, b_power, b_formation_type, b_order, b_end_hp,
		  b_hallows_id, b_hallows_look_id, b_sprite_lev,
		  b_sprites, a_plist, b_plist, ext]},
		{holiday_arena_team_log_face,
		 [id, pos, is_leader, lev, name, face_id, avatar_bid,
		  face_file, face_update_time]},
		{holiday_arena_team_log,
		 [id, is_atk, atk_id, atk_name, atk_power, atk_face,
		  atk_ole_rank, atk_rank, atk_ole_score, atk_score,
		  def_id, def_name, def_power, def_face, def_ole_rank,
		  def_rank, def_ole_score, def_score, ret, win_count,
		  lose_count, replay_list, time]},
		{role_holiday_arena_team_log, [id, list]},
		{holiday_arena_team_partners_info,
		 [pos, id, bid, lev, star, break_lev, power, use_skin,
		  resonate_lev, dower_skill, set_skill, attr, extra]},
		{holiday_arena_team_defense_role,
		 [id, name, face_id, power, avatar_bid, lev, pos,
		  is_leader, rank, score, score_lev, face_update_time,
		  face_file, formation_type, hallows_id, hallows_lev,
		  hallows_skill_lev, partner_infos, hallows_look_id,
		  hallows_lucky, hallows_seal, hallows_all_look_ids,
		  hallows_refine, sprite_lev, sprite_breka_lev,
		  sprite_attr, sprites, ext, break_groups]},
		{holiday_arena_team_member,
		 [id, name, face_id, power, avatar_bid, lev, pos,
		  is_leader, rank, score, score_lev, face_update_time,
		  face_file, is_online, ext]},
		{holiday_arena_team_role,
		 [ver, id, name, lev, face_id, avatar_bid, power,
		  team_power, face_update_time, face_file, is_online,
		  rank, score, score_lev, score_time, ext]},
		{holiday_arena_team_team,
		 [id, team_role_id, is_leader, pos, is_lock,
		  match_time]},
		{holiday_arena_team_rank,
		 [rank, score, score_lev, id, score_time, power]},
		{m_holiday_arena_team,
		 [ver, period, award_lists, old_data, ref_count,
		  atk_defens, def_defens, end_time, is_enter, is_mail]},
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
		{guild_skill_break_group,
		 [ver, career, attr_formation, skill_formation, ext]},
		{guild_skill_group,
		 [ver, career, group_id, skill_ids, group_ids]},
		{m_guild_skill, [ver, groups, break_groups]},
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
		{halidom, [ver, id, lev, exp, lev_num, step, all_attr]},
		{m_halidom, [ver, list]},
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
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
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

-export([login/1, logout/1]).

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

-file("src/mod/log/log_group_power.erl", 12).

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

-file("src/mod/log/log_group_power.erl", 13).

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

-file("src/mod/log/log_group_power.erl", 14).

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

-file("src/mod/log/log_group_power.erl", 15).

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

-file("src/mod/log/log_group_power.erl", 16).

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

-file("src/mod/log/log_group_power.erl", 17).

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

-file("src/mod/log/log_group_power.erl", 18).

-file("inc/halidom.hrl", 1).

-record(m_halidom, {ver = 1, list = []}).

-record(halidom,
	{ver = 1, id = 0, lev = 1, exp = 0, lev_num = 0,
	 step = 0, all_attr = []}).

-file("src/mod/log/log_group_power.erl", 19).

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

-file("src/mod/log/log_group_power.erl", 20).

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

-file("src/mod/log/log_group_power.erl", 21).

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

-file("src/mod/log/log_group_power.erl", 22).

-file("inc/holiday_arena_team.hrl", 1).

-record(m_holiday_arena_team,
	{ver = 3, period = 0, award_lists = [], old_data = [],
	 ref_count = 0, atk_defens = [], def_defens = [],
	 end_time = 0, is_enter = 0, is_mail = 0}).

-record(holiday_arena_team_rank,
	{rank = 0, score = 1000, score_lev = 1, id = {0, <<>>},
	 score_time = 0, power = 0}).

-record(holiday_arena_team_team,
	{id = {0, <<>>}, team_role_id = {0, <<>>},
	 is_leader = 0, pos = 0, is_lock = 0, match_time = 0}).

-record(holiday_arena_team_role,
	{ver = 1, id = {0, <<>>}, name = <<>>, lev = 0,
	 face_id = 0, avatar_bid = 0, power = 0, team_power = 0,
	 face_update_time = 0, face_file = <<>>, is_online = 0,
	 rank = 0, score = 1000, score_lev = 1, score_time = 0,
	 ext = []}).

-record(holiday_arena_team_member,
	{id = {0, <<>>}, name = <<>>, face_id = 0, power = 0,
	 avatar_bid = 0, lev = 0, pos = 1, is_leader = 1,
	 rank = 0, score = 0, score_lev = 0,
	 face_update_time = 0, face_file = <<>>, is_online = 0,
	 ext = []}).

-record(holiday_arena_team_defense_role,
	{id = {0, <<>>}, name = <<>>, face_id = 0, power = 0,
	 avatar_bid = 0, lev = 0, pos = 1, is_leader = 1,
	 rank = 0, score = 0, score_lev = 0,
	 face_update_time = 0, face_file = <<>>,
	 formation_type = 0, hallows_id = 0, hallows_lev = 0,
	 hallows_skill_lev = 0, partner_infos = [],
	 hallows_look_id = 0, hallows_lucky = 0,
	 hallows_seal = 0, hallows_all_look_ids = [],
	 hallows_refine = 0, sprite_lev = 0,
	 sprite_breka_lev = 0, sprite_attr, sprites = [],
	 ext = [], break_groups = []}).

-record(holiday_arena_team_partners_info,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, use_skin = 0,
	 resonate_lev = 0, dower_skill = [], set_skill = [],
	 attr, extra = []}).

-record(role_holiday_arena_team_log,
	{id = {0, <<>>}, list = []}).

-record(holiday_arena_team_log,
	{id = 0, is_atk = 0, atk_id = {0, <<>>},
	 atk_name = <<>>, atk_power = <<>>, atk_face = [],
	 atk_ole_rank = 0, atk_rank = 0, atk_ole_score = 0,
	 atk_score = 0, def_id = {0, <<>>}, def_name = <<>>,
	 def_power = <<>>, def_face = [], def_ole_rank = 0,
	 def_rank = 0, def_ole_score = 0, def_score = 0, ret = 1,
	 win_count = 0, lose_count = 0, replay_list = [],
	 time = 0}).

-record(holiday_arena_team_log_face,
	{id = {0, <<>>}, pos = 1, is_leader = 1, lev = 1,
	 name = <<>>, face_id = 0, avatar_bid = 0,
	 face_file = <<>>, face_update_time = 0}).

-record(holiday_arena_team_log_info,
	{id = 0, round = 0, ret = 0, time = 0, a_id = {0, <<>>},
	 a_name = <<>>, a_power = 0, a_formation_type = 0,
	 a_order = 0, a_end_hp = 0, a_hallows_id = 1,
	 a_hallows_look_id = 0, a_sprite_lev = 0, a_sprites = [],
	 b_id = {0, <<>>}, b_name = <<>>, b_power = 0,
	 b_formation_type = 0, b_order = 0, b_end_hp = 0,
	 b_hallows_id = 1, b_hallows_look_id = 0,
	 b_sprite_lev = 0, b_sprites = [], a_plist = [],
	 b_plist = [], ext = []}).

-record(holiday_arena_team_log_partner,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0, power = 0,
	 skin_id = 0, resonate_lev = 0, hurt = 0, be_hurt = 0,
	 curt = 0, ext = #{}}).

-file("src/mod/log/log_group_power.erl", 23).

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

-file("src/mod/log/log_group_power.erl", 24).

-file("inc/holiday_practise_tower.hrl", 1).

-record(m_holiday_practise_tower,
	{ver = 1  :: pos_integer(),
	 camp_id = 0  :: pos_integer(), id = 0  :: pos_integer(),
	 times = 0  :: pos_integer(),
	 last_buy_times = 0  :: pos_integer(),
	 last_anew_times = 0  :: pos_integer(),
	 update_unixtime = 0  :: pos_integer(),
	 hp_radio = []  :: list(),
	 is_combat = {0, []}  :: tuple(),
	 is_recombat = 0  :: list(), save_list = []  :: list(),
	 ext = []  :: list()}).

-record(practise_role_rank,
	{ver = 1  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 lev = 0  :: pos_integer(),
	 face_id = 0  :: pos_integer(),
	 avatar_bid = 0  :: pos_integer(),
	 name = <<>>  :: string(), val = 0  :: pos_integer(),
	 unixtime = 0  :: pos_integer(),
	 power = 0  :: pos_integer(), rank = 0  :: pos_integer(),
	 video_id = 0  :: pos_integer(),
	 face_update_time = 0  :: pos_integer(),
	 face_file = <<>>  :: string(), ext = []  :: list()}).

-record(holiday_practise_tower_rank,
	{ver = 1  :: pos_integer(),
	 platform_zone = {<<>>, 0}  :: tuple(),
	 camp_id = 0  :: pos_integer(),
	 rank_list = []  :: list(),
	 old_rank_list = []  :: list(), ext = []  :: list()}).

-file("src/mod/log/log_group_power.erl", 25).

login(Role) ->
    WorldLevStr = util:fbin("~w",
			    [world_lev:get_world_lev()]),
    NRole = save_log(Role, WorldLevStr,
		     [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
		      17, 19]),
    {ok, NRole}.

logout(Role) ->
    WorldLevStr = util:fbin("~w",
			    [world_lev:get_world_lev()]),
    NRole = save_log(Role, WorldLevStr, [18, 20]),
    {ok, NRole}.

save_log(Role, _WorldLev, []) -> Role;
save_log(Role = #role{lev = Lev}, WorldLev, [1 | Other])
    when Lev >= 50 ->
    case var:get_var(Role, day, 133, 0) of
      0 ->
	  [save_partner_star_log(Role, Star, WorldLev)
	   || Star <- [5, 9, 10]],
	  NRole = var:set_var(Role, day, 133, 1),
	  save_log(NRole, WorldLev, Other);
      _ -> save_log(Role, WorldLev, Other)
    end;
save_log(Role = #role{lev = Lev}, WorldLev, [2 | Other])
    when Lev >= 50 ->
    case var:get_var(Role, day, 134, 0) of
      0 ->
	  case partner:check_star_limit(Role, 11) of
	    true ->
		save_partner_star_log(Role, 11, WorldLev),
		NRole = var:set_var(Role, day, 134, 1),
		save_log(NRole, WorldLev, Other);
	    _ -> save_log(Role, WorldLev, Other)
	  end;
      _ -> save_log(Role, WorldLev, Other)
    end;
save_log(Role = #role{lev = Lev}, WorldLev, [3 | Other])
    when Lev >= 50 ->
    case var:get_var(Role, day, 135, 0) of
      0 ->
	  case partner:check_star_limit(Role, 12) of
	    true ->
		save_partner_star_log(Role, 12, WorldLev),
		NRole = var:set_var(Role, day, 135, 1),
		save_log(NRole, WorldLev, Other);
	    _ -> save_log(Role, WorldLev, Other)
	  end;
      _ -> save_log(Role, WorldLev, Other)
    end;
save_log(Role = #role{lev = Lev}, WorldLev, [4 | Other])
    when Lev >= 50 ->
    case var:get_var(Role, day, 136, 0) of
      0 ->
	  case partner:check_star_limit(Role, 13) of
	    true ->
		save_partner_star_log(Role, 13, WorldLev),
		NRole = var:set_var(Role, day, 136, 1),
		save_log(NRole, WorldLev, Other);
	    _ -> save_log(Role, WorldLev, Other)
	  end;
      _ -> save_log(Role, WorldLev, Other)
    end;
save_log(Role = #role{lev = Lev}, WorldLev, [5 | Other])
    when Lev >= 50 ->
    case var:get_var(Role, day, 137, 0) of
      0 ->
	  case check_holy_open(Role) of
	    true ->
		LogData = calc_holy_eqm_log(Role),
		[do_save_log(Role, util:fbin("~w星神装", [Star]),
			     list_util:keyfind(Star, LogData, 0), WorldLev)
		 || Star <- lists:seq(3, 5)],
		NRole = var:set_var(Role, day, 137, 1),
		save_log(NRole, WorldLev, Other);
	    _ -> save_log(Role, WorldLev, Other)
	  end;
      _ -> save_log(Role, WorldLev, Other)
    end;
save_log(Role = #role{lev = Lev,
		      m_sprite_tree = #m_sprite_tree{lev = TreeLev}},
	 WorldLev, [6 | Other])
    when Lev >= 80 ->
    case var:get_var(Role, day, 138, 0) of
      0 ->
	  Type = <<"古树等级"/utf8>>,
	  log:save(role_power_info,
		   {Role, Type, TreeLev, WorldLev}),
	  NRole = var:set_var(Role, day, 138, 1),
	  save_log(NRole, WorldLev, Other);
      _ -> save_log(Role, WorldLev, Other)
    end;
save_log(Role = #role{lev = Lev}, WorldLev, [7 | Other])
    when Lev >= 80 ->
    case var:get_var(Role, day, 139, 0) of
      0 ->
	  LogData = calc_sprite_log(Role),
	  [do_save_log(Role, util:fbin("~w星橙色精灵", [Star]),
		       list_util:keyfind(Star, LogData, 0), WorldLev)
	   || Star <- lists:seq(1, 5)],
	  NRole = var:set_var(Role, day, 139, 1),
	  save_log(NRole, WorldLev, Other);
      _ -> save_log(Role, WorldLev, Other)
    end;
save_log(Role = #role{lev = Lev}, WorldLev, [8 | Other])
    when Lev >= 50 ->
    case var:get_var(Role, day, 140, 0) of
      0 ->
	  LogData = calc_eqm_log(Role),
	  [do_save_log(Role, util:fbin("~w星红装", [Star]),
		       list_util:keyfind(Star, LogData, 0), WorldLev)
	   || Star <- lists:seq(4, 6)],
	  NRole = var:set_var(Role, day, 140, 1),
	  save_log(NRole, WorldLev, Other);
      _ -> save_log(Role, WorldLev, Other)
    end;
save_log(Role = #role{m_halidom =
			  #m_halidom{list = List},
		      lev = Lev},
	 WorldLev, [9 | Other])
    when Lev >= 90 ->
    case var:get_var(Role, day, 141, 0) of
      0 ->
	  LogData = [{Id, HalidomLev}
		     || #halidom{id = Id, lev = HalidomLev} <- List],
	  [do_save_log(Role, get_halodom_name(Id),
		       list_util:keyfind(Id, LogData, 0), WorldLev)
	   || Id <- lists:seq(1, 5)],
	  NRole = var:set_var(Role, day, 141, 1),
	  save_log(NRole, WorldLev, Other);
      _ -> save_log(Role, WorldLev, Other)
    end;
save_log(Role = #role{lev = Lev}, WorldLev,
	 [10 | Other])
    when Lev >= 50 ->
    case var:get_var(Role, day, 142, 0) of
      0 ->
	  Num = calc_partner_artifact_num(Role),
	  Type = <<"闪烁符文养成"/utf8>>,
	  do_save_log(Role, Type, Num, WorldLev),
	  NRole = var:set_var(Role, day, 142, 1),
	  save_log(NRole, WorldLev, Other);
      _ -> save_log(Role, WorldLev, Other)
    end;
save_log(Role = #role{m_hallows =
			  #m_hallows{hallows_list = List},
		      lev = Lev},
	 WorldLev, [11 | Other])
    when Lev >= 50 ->
    case var:get_var(Role, day, 143, 0) of
      0 ->
	  HallowsLev = util:if_true(length(List) < 5, 0,
				    util:round(lists:sum([Step
							  || #hallows{step =
									  Step}
								 <- List])
						 / 5
						 * 100)
				      / 100),
	  Type1 = <<"神器平均等级"/utf8>>,
	  do_save_log(Role, Type1, HallowsLev, WorldLev),
	  RefineLev = util:if_true(length(List) < 5, 0,
				   util:round(lists:sum([RefineLevT
							 || #hallows{refine_lev
									 =
									 RefineLevT}
								<- List])
						/ 5
						* 100)
				     / 100),
	  Type2 = <<"神器精炼平均等级"/utf8>>,
	  do_save_log(Role, Type2, RefineLev, WorldLev),
	  NRole = var:set_var(Role, day, 143, 1),
	  save_log(NRole, WorldLev, Other);
      _ -> save_log(Role, WorldLev, Other)
    end;
save_log(Role = #role{guild_bag = #guild_bag{id = Gid},
		      m_guild_skill = #m_guild_skill{groups = List},
		      lev = Lev},
	 WorldLev, [12 | Other])
    when Lev >= 50 ->
    case var:get_var(Role, day, 144, 0) of
      0 ->
	  HallowsLev = util:if_true(length(List) < 4 orelse
				      Gid == {0, <<>>},
				    0,
				    util:round(lists:sum([length(Groupids) + 1
							  || #guild_skill_group{group_ids
										    =
										    Groupids}
								 <- List])
						 / 4
						 * 100)
				      / 100),
	  Type1 = <<"公会技能平均等级"/utf8>>,
	  do_save_log(Role, Type1, HallowsLev, WorldLev),
	  NRole = var:set_var(Role, day, 144, 1),
	  save_log(NRole, WorldLev, Other);
      _ -> save_log(Role, WorldLev, Other)
    end;
save_log(Role = #role{assets = #assets{gold = Gold},
		      lev = Lev},
	 WorldLev, [13 | Other])
    when Lev >= 50 ->
    case var:get_var(Role, day, 145, 0) of
      0 ->
	  Type1 = <<"钻石余量"/utf8>>,
	  do_save_log(Role, Type1, Gold, WorldLev),
	  NRole = var:set_var(Role, day, 145, 1),
	  save_log(NRole, WorldLev, Other);
      _ -> save_log(Role, WorldLev, Other)
    end;
save_log(Role = #role{assets = #assets{guild = Guild},
		      lev = Lev},
	 WorldLev, [17 | Other])
    when Lev >= 50 ->
    case var:get_var(Role, day, 154, 0) of
      0 ->
	  Type1 = <<"公会贡献余量"/utf8>>,
	  do_save_log(Role, Type1, Guild, WorldLev),
	  NRole = var:set_var(Role, day, 154, 1),
	  save_log(NRole, WorldLev, Other);
      _ -> save_log(Role, WorldLev, Other)
    end;
save_log(Role = #role{assets = #assets{coin = Coin},
		      lev = Lev},
	 WorldLev, [14 | Other])
    when Lev >= 50 ->
    case var:get_var(Role, day, 146, 0) of
      0 ->
	  Type1 = <<"金币余量"/utf8>>,
	  do_save_log(Role, Type1, Coin, WorldLev),
	  NRole = var:set_var(Role, day, 146, 1),
	  save_log(NRole, WorldLev, Other);
      _ -> save_log(Role, WorldLev, Other)
    end;
save_log(Role = #role{p_bag = Package, lev = Lev},
	 WorldLev, [15 | Other])
    when Lev >= 50 ->
    case var:get_var(Role, day, 147, 0) of
      0 ->
	  Type1 = <<"先知水晶余量"/utf8>>,
	  BaseId = 14001,
	  {_, HasCount} = package:count(by_base_id, BaseId,
					Package),
	  do_save_log(Role, Type1, HasCount, WorldLev),
	  NRole = var:set_var(Role, day, 147, 1),
	  save_log(NRole, WorldLev, Other);
      _ -> save_log(Role, WorldLev, Other)
    end;
save_log(Role = #role{p_bag = Package, lev = Lev},
	 WorldLev, [16 | Other])
    when Lev >= 50 ->
    case var:get_var(Role, day, 148, 0) of
      0 ->
	  Type1 = <<"高召余量"/utf8>>,
	  BaseId = 10403,
	  {_, HasCount} = package:count(by_base_id, BaseId,
					Package),
	  do_save_log(Role, Type1, HasCount, WorldLev),
	  NRole = var:set_var(Role, day, 148, 1),
	  save_log(NRole, WorldLev, Other);
      _ -> save_log(Role, WorldLev, Other)
    end;
save_log(Role = #role{id = RoleId, lev = Lev}, WorldLev,
	 [18 | Other])
    when Lev >= 55 ->
    case holiday_arena_team_lib:is_open(Role) of
      {true, Period, _EndTime} ->
	  case get(holiday_arena_team_login_score) of
	    ScoreLev when is_integer(ScoreLev) ->
		MainId = holiday_arena_team_db:get_main_id(RoleId,
							   Period),
		case catch cluster_lib:call(MainId,
					    holiday_arena_team_db,
					    get_team_role, [RoleId])
		    of
		  #holiday_arena_team_role{score_lev = ScoreLevT}
		      when ScoreLevT =/= ScoreLev ->
		      Type1 = <<"组队段位"/utf8>>,
		      do_save_log(Role, Type1, ScoreLevT, WorldLev),
		      save_log(Role, WorldLev, Other);
		  _ -> save_log(Role, WorldLev, Other)
		end;
	    _ -> save_log(Role, WorldLev, Other)
	  end;
      _ -> save_log(Role, WorldLev, Other)
    end;
save_log(Role = #role{m_guild_skill =
			  #m_guild_skill{groups = Groups,
					 break_groups = BreakGroups}},
	 WorldLev, [19 | Other]) ->
    case var:get_var(Role, day, 159, 0) of
      0 ->
	  save_guild_break_skill(Groups, BreakGroups, WorldLev,
				 Role),
	  NRole = var:set_var(Role, day, 159, 1),
	  save_log(NRole, WorldLev, Other);
      _ -> save_log(Role, WorldLev, Other)
    end;
save_log(Role = #role{m_holiday_practise_tower =
			  #m_holiday_practise_tower{id = Id, camp_id = CampId}},
	 WorldLev, [20 | Other]) ->
    case holiday_lib:get_open_holiday(Role,
				      [3053, 93053, 993053])
	of
      #holiday{camp_id = CampId} ->
	  case var:get_var(Role, day, 161, {0, 0}) of
	    {0, _} ->
		Type = <<"英灵武神殿层数"/utf8>>,
		do_save_log(Role, Type, Id, WorldLev),
		NRole = var:set_var(Role, day, 161, {1, Id}),
		save_log(NRole, WorldLev, Other);
	    {1, OldId} when Id > OldId ->
		Type = <<"英灵武神殿层数"/utf8>>,
		do_save_log(Role, Type, Id, WorldLev),
		NRole = var:set_var(Role, day, 161, {1, Id}),
		save_log(NRole, WorldLev, Other);
	    _ -> save_log(Role, WorldLev, Other)
	  end;
      _ -> save_log(Role, WorldLev, Other)
    end;
save_log(Role, WorldLev, [_ | Other]) ->
    save_log(Role, WorldLev, Other).

do_save_log(Role, Type, Num, WorldLev) ->
    log:save(role_power_info, {Role, Type, Num, WorldLev}),
    ok.

do_save_log(Role, Type, Num, WorldLev, LogInfo) ->
    log:save(role_power_info,
	     {Role, Type, Num, WorldLev, LogInfo}),
    ok.

get_halodom_name(1) -> <<"水系圣物"/utf8>>;
get_halodom_name(2) -> <<"火系圣物"/utf8>>;
get_halodom_name(3) -> <<"风系圣物"/utf8>>;
get_halodom_name(4) -> <<"光系圣物"/utf8>>;
get_halodom_name(5) -> <<"暗系圣物"/utf8>>;
get_halodom_name(Id) -> util:fbin("~w系圣物", [Id]).

get_career_type(2) -> <<"法师"/utf8>>;
get_career_type(3) -> <<"战士"/utf8>>;
get_career_type(4) -> <<"坦克"/utf8>>;
get_career_type(5) -> <<"辅助"/utf8>>;
get_career_type(Type) -> util:fbin("~w职业", [Type]).

save_partner_star_log(Role = #role{partner_bag =
				       #partner_bag{partner_list = PList}},
		      Star, WorldLev) ->
    Type = util:fbin("~w星英雄", [Star]),
    Schedule = length([StarT
		       || #partner{star = StarT} <- PList, StarT == Star]),
    do_save_log(Role, Type, Schedule, WorldLev),
    ok.

calc_eqm_log(#role{p_eqm = #package{items = Items},
		   partner_bag = #partner_bag{partner_list = PList}}) ->
    PartnerItems = lists:flatten([Eqms
				  || #partner{eqm = Eqms} <- PList]),
    AllItems = Items ++ PartnerItems,
    Fun = fun (#item{base_id = ItemBid, quantity = AddNum},
	       Acc) ->
		  case item_data:get_star_jie(ItemBid) of
		    {Star, _} when Star >= 4 ->
			case item_data:get(ItemBid) of
			  #item_base{quality = Quality} when Quality >= 5 ->
			      OldNum = list_util:keyfind(Star, Acc, 0),
			      lists:keystore(Star, 1, Acc,
					     {Star, OldNum + max(1, AddNum)});
			  _ -> Acc
			end;
		    _ -> Acc
		  end
	  end,
    lists:foldl(Fun, [], AllItems).

calc_sprite_log(#role{p_bag = #package{items = Items},
		      m_sprite_tree = #m_sprite_tree{sprites = Sprites}}) ->
    Fun = fun (Data, Acc) ->
		  {ItemBid, Num} = case Data of
				     #item{base_id = BidT, quantity = AddNum} ->
					 {BidT, AddNum};
				     {_, BidT} -> {BidT, 1}
				   end,
		  case ItemBid == 0 of
		    false ->
			case item_data:get(ItemBid) of
			  #item_base{quality = Quality, eqm_jie = Jie,
				     type = Type}
			      when Type =:= 36 andalso Quality >= 4 ->
			      OldNum = list_util:keyfind(Jie, Acc, 0),
			      lists:keystore(Jie, 1, Acc, {Jie, OldNum + Num});
			  _ -> Acc
			end;
		    _ -> Acc
		  end
	  end,
    lists:foldl(Fun, [], Items ++ Sprites).

calc_holy_eqm_log(#role{p_eqm = #package{items = Items},
			partner_bag = #partner_bag{partner_list = PList}}) ->
    PartnerItems = lists:flatten([HolyEqms
				  || #partner{holy_eqm = HolyEqms} <- PList]),
    AllItems = Items ++ PartnerItems,
    Fun = fun (#item{base_id = ItemBid, quantity = AddNum},
	       Acc) ->
		  case item_data:get_star_jie(ItemBid) of
		    {Star, _} when Star >= 3 ->
			case partner_holy_eqm_data:get_rand_attr_group(ItemBid)
			    of
			  {2, _} ->
			      OldNum = list_util:keyfind(Star, Acc, 0),
			      lists:keystore(Star, 1, Acc,
					     {Star, OldNum + max(1, AddNum)});
			  _ -> Acc
			end;
		    _ -> Acc
		  end
	  end,
    lists:foldl(Fun, [], AllItems).

calc_partner_artifact_num(#role{p_bag =
				    #package{items = Items},
				partner_bag =
				    #partner_bag{partner_list = PList}}) ->
    BaseId = 10455,
    Num1 = lists:sum(lists:flatten([[max(1, AddNum)
				     || {_,
					 I = #item{base_id = Bid,
						   quantity = AddNum}}
					    <- Artifacts,
					Bid == BaseId]
				    || #partner{artifacts = Artifacts}
					   <- PList])),
    Num2 = lists:sum([max(1, AddNum)
		      || I = #item{base_id = Bid, quantity = AddNum} <- Items,
			 Bid == BaseId]),
    Num1 + Num2.

check_holy_open(#role{lev = RLev}) ->
    WorldLev = world_lev:get_world_lev(),
    RLev >=
      partner_holy_eqm_data:get_const(open_lev_condition)
      andalso
      WorldLev >=
	partner_holy_eqm_data:get_const(open_worldlev_condition)
      orelse
      RLev >=
	partner_holy_eqm_data:get_const(open_lev_second_condition).

save_guild_break_skill([], _BreakGroups, _WorldLev,
		       _Role) ->
    ok;
save_guild_break_skill([#guild_skill_group{career =
					       Type,
					   group_ids = GroupIds}
			| Rest],
		       BreakGroups, WorldLev, Role) ->
    Return = case length(GroupIds) >= 40 of
	       true ->
		   case lists:keyfind(Type,
				      #guild_skill_break_group.career,
				      BreakGroups)
		       of
		     #guild_skill_break_group{attr_formation = AttrFormation,
					      skill_formation =
						  {_, SkillLev}} ->
			 Fun = fun ({AttrId, AttrLev}, AccList) ->
				       NewNumber = case
						     guild_skill_data:get_attr_num(AttrId)
						       of
						     Number
							 when
							   is_integer(Number) ->
							 Number;
						     _ -> 6
						   end,
				       [{NewNumber, AttrLev} | AccList]
			       end,
			 NewAttrFormation = lists:foldl(Fun, [], AttrFormation),
			 NewAttrFormation1 = NewAttrFormation ++
					       [{5, SkillLev}],
			 NewAttrFormation2 = lists:keysort(1,
							   NewAttrFormation1),
			 LogNum = lists:sum([LogLev
					     || {_, LogLev} <- AttrFormation]),
			 {ok, NewAttrFormation2, LogNum};
		     _ -> {ok, [{1, 0}, {2, 0}, {3, 0}, {4, 0}, {5, 0}], 0}
		   end;
	       _ ->
		   case lists:keyfind(Type,
				      #guild_skill_break_group.career,
				      BreakGroups)
		       of
		     #guild_skill_break_group{attr_formation = AttrFormation,
					      skill_formation =
						  {_, SkillLev}} ->
			 Fun = fun ({AttrId, AttrLev}, AccList) ->
				       NewNumber = case
						     guild_skill_data:get_attr_num(AttrId)
						       of
						     Number
							 when
							   is_integer(Number) ->
							 Number;
						     _ -> 6
						   end,
				       [{NewNumber, AttrLev} | AccList]
			       end,
			 NewAttrFormation = lists:foldl(Fun, [], AttrFormation),
			 NewAttrFormation1 = NewAttrFormation ++
					       [{5, SkillLev}],
			 NewAttrFormation2 = lists:keysort(1,
							   NewAttrFormation1),
			 LogNum = lists:sum([LogLev
					     || {_, LogLev} <- AttrFormation]),
			 {ok, NewAttrFormation2, LogNum};
		     _ -> false
		   end
	     end,
    case Return of
      {ok, Info, LogNum1} ->
	  TypeName = get_career_type(Type),
	  LogType = util:fbin(<<"~ts职业pvp技能等级"/utf8>>,
			      [TypeName]),
	  Fun1 = fun ({Id, Lev}, AccMsg) ->
			 Msg = util:fbin("~w-~w ", [Id, Lev]),
			 <<AccMsg/binary, Msg/binary>>
		 end,
	  LogInfo = lists:foldl(Fun1, <<>>, Info),
	  log:save(join,
		   {Role, <<"公会pvp技能"/utf8>>,
		    util:fbin(<<"~ts可升级玩家"/utf8>>, [TypeName])}),
	  do_save_log(Role, LogType, LogNum1, WorldLev, LogInfo);
      _ -> skip
    end,
    save_guild_break_skill(Rest, BreakGroups, WorldLev,
			   Role).


