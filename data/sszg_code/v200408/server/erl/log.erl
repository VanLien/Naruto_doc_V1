-file("src/mod/log/log.erl", 1).

-module(log).

-lager_records([{dungeon_replay, [dun_id, replays]},
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
		{m_star, [ver, star_list, fetter_list, all_attr]},
		{star_tower_replay, [tower, replays]},
		{tower_replay_data,
		 [type, rid, sid, name, face_id, time, power, repaly_id,
		  face_update_time, face_file]},
		{m_star_divination,
		 [ver, luck, quality, all_count, flag, ref_count,
		  day_gold_count, day_hun_count]},
		{m_star_tower, [ver, max_tower, award_list]},
		{star,
		 [ver, set_id, break_lev, lev, natals, add_attr,
		  fetter_attr, set_skill_id, power]},
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
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{rank_cfg,
		 [type, num, keys, min_val, nologin, zone, exit_rank]},
		{rank_rc,
		 [ver, id, idx, val1, val2, val3, rid, srv_id, name,
		  look_id, sex, lev, face_id, vip_lev, guild_name, power,
		  all_power, desc, looks, ext, time, is_cross, avatar_bid,
		  face_update_time, face_file]},
		{rank, [type, list, last_val, len, is_cross, ctime]},
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
		{role_feedback_info,
		 [role_id, id, state, status2, start_time, end_msg_time,
		  finish_time, score_time, title, content,
		  questions_lists, answer_lists, score]},
		{feedback,
		 [sess, rid, feedback_id, status, score, send_time,
		  time_out]},
		{gmail,
		 [id, type, mail_type, subject, content, assets, items,
		  start_time, end_time, conds, source, can_del]},
		{mail,
		 [sess, to, to_name, from, from_name, type, group_id,
		  status, subject, content, assets, items, source, rev_ts,
		  read_time, send_time, time_out, can_del]},
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
		{violators_record, [id, name, lists]},
		{say_history, [id, clear_time, lists]},
		{say_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{say_frame, [ver, base_id, expire_time]},
		{m_say, [ver, used, frames]},
		{say_subtitle_msg, [id, role_id, name, msg, time]},
		{say_subtitle_role, [pid, conn_pid, type]},
		{say_msg, [len, msg, tick]},
		{say_send,
		 [id, name, sex, career, lev, face_id, vip_lev, capacity,
		  head_bid, chat_bubble, msg_list, face_update_time,
		  face_file]},
		{say_mon,
		 [rid, srv_id, name, ctime, lev, vip_lev, msg, remark]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
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
		{link, [socket, conn_pid, ip, port, lag]},
		{login,
		 [login_time, logout_time, prev_logout_time,
		  prev_login_time, log_login_time]},
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

-export([buff_start/0, buff_clean/0, buff_clean_all/0,
	 buff_commit/0, show_buff/0, save/2, log_gain/5,
	 log_assets/5, gain_item/3, gain_item/4, loss_item/3,
	 loss_item/4, apply_log/2, chat/5]).

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

-file("src/mod/log/log.erl", 28).

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

-file("src/mod/log/log.erl", 29).

-file("inc/login.hrl", 1).

-record(login,
	{login_time = 0, logout_time = 0, prev_logout_time = 0,
	 prev_login_time = 0, log_login_time = 0}).

-file("src/mod/log/log.erl", 30).

-file("inc/log.hrl", 1).

-file("src/mod/log/log.erl", 31).

-file("inc/link.hrl", 1).

-record(link,
	{socket, conn_pid, ip = {127, 0, 0, 1}, port, lag}).

-file("src/mod/log/log.erl", 32).

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

-file("src/mod/log/log.erl", 33).

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

-file("src/mod/log/log.erl", 34).

-file("inc/say.hrl", 1).

-record(say_mon,
	{rid = 0  :: pos_integer(), srv_id = <<>>  :: binary(),
	 name = <<>>  :: bitstring(),
	 ctime = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 msg = <<>>  :: binary(), remark = <<>>  :: binary()}).

-record(say_send,
	{id = {0, <<>>}, name = <<>>, sex = 0, career = 0,
	 lev = 0, face_id = 0, vip_lev = 0, capacity = 0,
	 head_bid = 0, chat_bubble = 0, msg_list = [],
	 face_update_time = 0, face_file = <<>>}).

-record(say_msg, {len = 0, msg = <<>>, tick = 0}).

-record(say_subtitle_role,
	{pid = 0  :: 0 | pid(), conn_pid = 0  :: 0 | pid(),
	 type = 0  :: integer()}).

-record(say_subtitle_msg,
	{id = 0  :: non_neg_integer(),
	 role_id = {0, <<>>}  ::
	     {non_neg_integer(), bitstring()},
	 name = <<>>  :: bitstring(), msg = <<>>  :: bitstring(),
	 time = 0  :: non_neg_integer()}).

-record(m_say, {ver = 1, used = 0, frames = []}).

-record(say_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(say_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-record(say_history,
	{id = {0, <<>>}, clear_time = 0, lists = []}).

-record(violators_record,
	{id = {0, <<>>}, name = <<>>, lists = []}).

-file("src/mod/log/log.erl", 35).

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

-file("src/mod/log/log.erl", 36).

-file("inc/mail.hrl", 1).

-record(mail,
	{sess  :: {pos_integer(), bitstring()},
	 to  :: {pos_integer(), bitstring()},
	 to_name = <<>>  :: bitstring(),
	 from  :: {non_neg_integer(), bitstring()},
	 from_name = <<>>  :: bitstring(), type = 1  :: 0..1,
	 group_id = 0  :: non_neg_integer(), status = 0  :: 0..1,
	 subject = <<>>  :: bitstring(),
	 content = <<>>  :: bitstring(),
	 assets = []  :: [tuple()], items = []  :: [tuple()],
	 source = <<>>  :: pos_integer(),
	 rev_ts = 0  :: pos_integer(),
	 read_time = 0  :: pos_integer(),
	 send_time = 0  :: pos_integer(),
	 time_out = 0  :: pos_integer(), can_del = 1  :: 0..1}).

-record(gmail,
	{id = 0, type = 0  :: non_neg_integer(),
	 mail_type = 1  :: non_neg_integer(),
	 subject = <<>>  :: bitstring(),
	 content = <<>>  :: bitstring(),
	 assets = []  :: [tuple()], items = []  :: [tuple()],
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 conds = []  :: list(), source = <<>>  :: pos_integer(),
	 can_del = 1  :: 0..1}).

-record(feedback,
	{sess, rid, feedback_id = 0, status = 0, score = 0,
	 send_time = 0, time_out = 0}).

-record(role_feedback_info,
	{role_id, id = 0, state = 0, status2 = 0,
	 start_time = 0, end_msg_time = 0, finish_time = 0,
	 score_time = 0, title = <<>>, content = <<>>,
	 questions_lists = [], answer_lists = [], score = 0}).

-file("src/mod/log/log.erl", 37).

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

-file("src/mod/log/log.erl", 38).

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

-file("src/mod/log/log.erl", 39).

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

-file("src/mod/log/log.erl", 40).

-file("inc/attr.hrl", 1).

-file("src/mod/log/log.erl", 41).

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

-file("src/mod/log/log.erl", 42).

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

-file("src/mod/log/log.erl", 43).

-file("inc/star.hrl", 1).

-record(star,
	{ver = 1  :: non_neg_integer(),
	 set_id = 0  :: non_neg_integer(),
	 break_lev = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(), natals = []  :: list(),
	 add_attr = []  :: list(), fetter_attr = []  :: list(),
	 set_skill_id = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer()}).

-record(m_star_tower,
	{ver = 1  :: non_neg_integer(),
	 max_tower = 0  :: non_neg_integer(),
	 award_list = []  :: list()}).

-record(m_star_divination,
	{ver = 1  :: non_neg_integer(),
	 luck = 1  :: non_neg_integer(),
	 quality = 1  :: non_neg_integer(),
	 all_count = 0  :: non_neg_integer(),
	 flag = 0  :: non_neg_integer(),
	 ref_count = 0  :: non_neg_integer(),
	 day_gold_count = 0  :: non_neg_integer(),
	 day_hun_count = 0  :: non_neg_integer()}).

-record(tower_replay_data,
	{type = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(), sid = 0  :: binary(),
	 name = <<>>  :: binary(),
	 face_id = 0  :: non_neg_integer(),
	 time = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 repaly_id = 0  :: non_neg_integer(),
	 face_update_time = 0, face_file = <<>>}).

-record(star_tower_replay,
	{tower = 0  :: non_neg_integer(),
	 replays = []  :: [#tower_replay_data{}]}).

-record(m_star,
	{ver = 1  :: non_neg_integer(),
	 star_list = []  :: [#star{}],
	 fetter_list = []  :: list(), all_attr = []  :: list()}).

-file("src/mod/log/log.erl", 44).

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

-file("src/mod/log/log.erl", 45).

log_gain([I | T], OldRole, NewRole, Type, Msg) ->
    log_gain(I, OldRole, NewRole, Type, Msg),
    T1 = del_same_gain(I, T),
    log_gain(T1, OldRole, NewRole, Type, Msg);
log_gain(G = #gain{val = Val}, OldRole, NewRole, Type,
	 Msg)
    when is_integer(Val) ->
    log_assets(G, OldRole, NewRole, Type, Msg);
log_gain(G = #loss{val = Val}, OldRole, NewRole, Type,
	 Msg)
    when is_integer(Val) ->
    log_assets(G, OldRole, NewRole, Type, Msg);
log_gain(G = #gain{}, OldRole, NewRole, Type, Msg) ->
    gain_item(G, OldRole, NewRole, Type, Msg);
log_gain(G = #loss{}, OldRole, NewRole, Type, Msg) ->
    loss_item(G, OldRole, NewRole, Type, Msg);
log_gain(#gain_loss_opts{return_gl = NewGL}, OldRole,
	 NewRole, Type, Msg) ->
    log_gain(NewGL, OldRole, NewRole, Type, Msg);
log_gain([], _OldRole, _NewRole, _Type, _Msg) -> ok;
log_gain(_Data, _OldRole, _NewRole, _Type, _Msg) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidlog64, _, {__Levellog64, __Traceslog64}}
	  when __Levellog64 band 8 /= 0 orelse
		 __Traceslog64 /= [] ->
	  lager:do_log(error,
		       [{module, log}, {function, log_gain}, {line, 64},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("日志上传失败:~w", [{_Data, _Type, _Msg}]),
		       none, 4096, 8, __Levellog64, __Traceslog64, lager_event,
		       __Pidlog64);
      _ -> ok
    end,
    ok.

del_same_gain(#gain{label = Label, val = Val}, List)
    when is_atom(Label) andalso is_integer(Val) ->
    do_del_same_gain(List, Label, []);
del_same_gain(_G, List) -> List.

do_del_same_gain([], _, List) -> List;
do_del_same_gain([#gain{label = Label, val = Val} | T],
		 Label, List)
    when is_integer(Val) ->
    do_del_same_gain(T, Label, List);
do_del_same_gain([I | T], Label, List) ->
    do_del_same_gain(T, Label, [I | List]).

-spec log_assets(list() | atom() | tuple(),
		 OldRole :: #role{}, NewRole :: #role{},
		 _Type :: binary(), _Msg :: binary()) -> ok.

log_assets([I | T], OldRole, NewRole, Type, Msg) ->
    log_assets(I, OldRole, NewRole, Type, Msg),
    log_assets(T, OldRole, NewRole, Type, Msg);
log_assets(#gain{label = coin}, OldRole, NewRole, Type,
	   Msg) ->
    save(coin, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = coin}, OldRole, NewRole, Type,
	   Msg) ->
    save(coin, {OldRole, NewRole, Type, Msg});
log_assets(coin, OldRole, NewRole, Type, Msg) ->
    save(coin, {OldRole, NewRole, Type, Msg});
log_assets({1, _}, OldRole, NewRole, Type, Msg) ->
    save(coin, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = silver_coin}, OldRole, NewRole,
	   Type, Msg) ->
    save(silver_coin, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = silver_coin}, OldRole, NewRole,
	   Type, Msg) ->
    save(silver_coin, {OldRole, NewRole, Type, Msg});
log_assets(silver_coin, OldRole, NewRole, Type, Msg) ->
    save(silver_coin, {OldRole, NewRole, Type, Msg});
log_assets({2, _}, OldRole, NewRole, Type, Msg) ->
    save(silver_coin, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = gold}, OldRole, NewRole, Type,
	   Msg) ->
    save(gold, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = gold}, OldRole, NewRole, Type,
	   Msg) ->
    save(gold, {OldRole, NewRole, Type, Msg});
log_assets(gold, OldRole, NewRole, Type, Msg) ->
    save(gold, {OldRole, NewRole, Type, Msg});
log_assets({3, _}, OldRole, NewRole, Type, Msg) ->
    save(gold, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = red_gold}, OldRole, NewRole,
	   Type, Msg) ->
    save(red_gold, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = red_gold}, OldRole, NewRole,
	   Type, Msg) ->
    save(red_gold, {OldRole, NewRole, Type, Msg});
log_assets(red_gold, OldRole, NewRole, Type, Msg) ->
    save(red_gold, {OldRole, NewRole, Type, Msg});
log_assets({4, _}, OldRole, NewRole, Type, Msg) ->
    save(red_gold, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = exp}, OldRole, NewRole, Type,
	   Msg) ->
    save(exp, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = exp}, OldRole, NewRole, Type,
	   Msg) ->
    save(exp, {OldRole, NewRole, Type, Msg});
log_assets(exp, OldRole, NewRole, Type, Msg) ->
    save(exp, {OldRole, NewRole, Type, Msg});
log_assets({5, _}, OldRole, NewRole, Type, Msg) ->
    save(exp, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = guild}, OldRole, NewRole, Type,
	   Msg) ->
    save(guild, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = guild}, OldRole, NewRole, Type,
	   Msg) ->
    save(guild, {OldRole, NewRole, Type, Msg});
log_assets(guild, OldRole, NewRole, Type, Msg) ->
    save(guild, {OldRole, NewRole, Type, Msg});
log_assets({10, _}, OldRole, NewRole, Type, Msg) ->
    save(guild, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = arena_cent}, OldRole, NewRole,
	   Type, Msg) ->
    save(arena_cent, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = arena_cent}, OldRole, NewRole,
	   Type, Msg) ->
    save(arena_cent, {OldRole, NewRole, Type, Msg});
log_assets(arena_cent, OldRole, NewRole, Type, Msg) ->
    save(arena_cent, {OldRole, NewRole, Type, Msg});
log_assets({8, _}, OldRole, NewRole, Type, Msg) ->
    save(arena_cent, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = cluster_guess_cent}, OldRole,
	   NewRole, Type, Msg) ->
    save(cluster_guess_cent, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = cluster_guess_cent}, OldRole,
	   NewRole, Type, Msg) ->
    save(cluster_guess_cent, {OldRole, NewRole, Type, Msg});
log_assets(cluster_guess_cent, OldRole, NewRole, Type,
	   Msg) ->
    save(cluster_guess_cent, {OldRole, NewRole, Type, Msg});
log_assets({34, _}, OldRole, NewRole, Type, Msg) ->
    save(cluster_guess_cent, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = peak_guess_cent}, OldRole,
	   NewRole, Type, Msg) ->
    save(peak_guess_cent, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = peak_guess_cent}, OldRole,
	   NewRole, Type, Msg) ->
    save(peak_guess_cent, {OldRole, NewRole, Type, Msg});
log_assets(peak_guess_cent, OldRole, NewRole, Type,
	   Msg) ->
    save(peak_guess_cent, {OldRole, NewRole, Type, Msg});
log_assets({38, _}, OldRole, NewRole, Type, Msg) ->
    save(peak_guess_cent, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = feather_exchange}, OldRole,
	   NewRole, Type, Msg) ->
    save(feather_exchange, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = feather_exchange}, OldRole,
	   NewRole, Type, Msg) ->
    save(feather_exchange, {OldRole, NewRole, Type, Msg});
log_assets(feather_exchange, OldRole, NewRole, Type,
	   Msg) ->
    save(feather_exchange, {OldRole, NewRole, Type, Msg});
log_assets({35, _}, OldRole, NewRole, Type, Msg) ->
    save(feather_exchange, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = brave_symbol}, OldRole,
	   NewRole, Type, Msg) ->
    save(brave_symbol, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = brave_symbol}, OldRole,
	   NewRole, Type, Msg) ->
    save(brave_symbol, {OldRole, NewRole, Type, Msg});
log_assets(brave_symbol, OldRole, NewRole, Type, Msg) ->
    save(brave_symbol, {OldRole, NewRole, Type, Msg});
log_assets({36, _}, OldRole, NewRole, Type, Msg) ->
    save(brave_symbol, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = arena_guesscent}, OldRole,
	   NewRole, Type, Msg) ->
    save(arena_guesscent, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = arena_guesscent}, OldRole,
	   NewRole, Type, Msg) ->
    save(arena_guesscent, {OldRole, NewRole, Type, Msg});
log_assets(arena_guesscent, OldRole, NewRole, Type,
	   Msg) ->
    save(arena_guesscent, {OldRole, NewRole, Type, Msg});
log_assets({20, _}, OldRole, NewRole, Type, Msg) ->
    save(arena_guesscent, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = energy}, OldRole, NewRole,
	   Type, Msg) ->
    save(energy, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = energy}, OldRole, NewRole,
	   Type, Msg) ->
    save(energy, {OldRole, NewRole, Type, Msg});
log_assets(energy, OldRole, NewRole, Type, Msg) ->
    save(energy, {OldRole, NewRole, Type, Msg});
log_assets({7, _}, OldRole, NewRole, Type, Msg) ->
    save(energy, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = hero_soul}, OldRole, NewRole,
	   Type, Msg) ->
    save(hero_soul, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = hero_soul}, OldRole, NewRole,
	   Type, Msg) ->
    save(hero_soul, {OldRole, NewRole, Type, Msg});
log_assets(hero_soul, OldRole, NewRole, Type, Msg) ->
    save(hero_soul, {OldRole, NewRole, Type, Msg});
log_assets({11, _}, OldRole, NewRole, Type, Msg) ->
    save(hero_soul, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = boss_point}, OldRole, NewRole,
	   Type, Msg) ->
    save(boss_point, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = boss_point}, OldRole, NewRole,
	   Type, Msg) ->
    save(boss_point, {OldRole, NewRole, Type, Msg});
log_assets(boss_point, OldRole, NewRole, Type, Msg) ->
    save(boss_point, {OldRole, NewRole, Type, Msg});
log_assets({13, _}, OldRole, NewRole, Type, Msg) ->
    save(boss_point, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = star_hun}, OldRole, NewRole,
	   Type, Msg) ->
    save(star_hun, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = star_hun}, OldRole, NewRole,
	   Type, Msg) ->
    save(star_hun, {OldRole, NewRole, Type, Msg});
log_assets(star_hun, OldRole, NewRole, Type, Msg) ->
    save(star_hun, {OldRole, NewRole, Type, Msg});
log_assets({17, _}, OldRole, NewRole, Type, Msg) ->
    save(star_hun, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = star_point}, OldRole, NewRole,
	   Type, Msg) ->
    save(star_point, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = star_point}, OldRole, NewRole,
	   Type, Msg) ->
    save(star_point, {OldRole, NewRole, Type, Msg});
log_assets(star_point, OldRole, NewRole, Type, Msg) ->
    save(star_point, {OldRole, NewRole, Type, Msg});
log_assets({18, _}, OldRole, NewRole, Type, Msg) ->
    save(star_point, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = friend_point}, OldRole,
	   NewRole, Type, Msg) ->
    save(friend_point, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = friend_point}, OldRole,
	   NewRole, Type, Msg) ->
    save(friend_point, {OldRole, NewRole, Type, Msg});
log_assets(friend_point, OldRole, NewRole, Type, Msg) ->
    save(friend_point, {OldRole, NewRole, Type, Msg});
log_assets({14, _}, OldRole, NewRole, Type, Msg) ->
    save(friend_point, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = red_gold_or_gold}, OldRole,
	   NewRole, Type, Msg) ->
    save(gold, {OldRole, NewRole, Type, Msg}),
    save(red_gold, {OldRole, NewRole, Type, Msg});
log_assets(red_gold_or_gold, OldRole, NewRole, Type,
	   Msg) ->
    save(gold, {OldRole, NewRole, Type, Msg}),
    save(red_gold, {OldRole, NewRole, Type, Msg});
log_assets({15, _}, OldRole, NewRole, Type, Msg) ->
    save(gold, {OldRole, NewRole, Type, Msg}),
    save(red_gold, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = sky_coin}, OldRole, NewRole,
	   Type, Msg) ->
    save(sky_coin, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = sky_coin}, OldRole, NewRole,
	   Type, Msg) ->
    save(sky_coin, {OldRole, NewRole, Type, Msg});
log_assets(sky_coin, OldRole, NewRole, Type, Msg) ->
    save(sky_coin, {OldRole, NewRole, Type, Msg});
log_assets({21, _}, OldRole, NewRole, Type, Msg) ->
    save(sky_coin, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = hero_exp}, OldRole, NewRole,
	   Type, Msg) ->
    save(hero_exp, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = hero_exp}, OldRole, NewRole,
	   Type, Msg) ->
    save(hero_exp, {OldRole, NewRole, Type, Msg});
log_assets(hero_exp, OldRole, NewRole, Type, Msg) ->
    save(hero_exp, {OldRole, NewRole, Type, Msg});
log_assets({22, _}, OldRole, NewRole, Type, Msg) ->
    save(hero_exp, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = recruit_hero}, OldRole,
	   NewRole, Type, Msg) ->
    save(recruit_hero, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = recruit_hero}, OldRole,
	   NewRole, Type, Msg) ->
    save(recruit_hero, {OldRole, NewRole, Type, Msg});
log_assets(recruit_hero, OldRole, NewRole, Type, Msg) ->
    save(recruit_hero, {OldRole, NewRole, Type, Msg});
log_assets({23, _}, OldRole, NewRole, Type, Msg) ->
    save(recruit_hero, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = predict_point}, OldRole,
	   NewRole, Type, Msg) ->
    save(predict_point, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = predict_point}, OldRole,
	   NewRole, Type, Msg) ->
    save(predict_point, {OldRole, NewRole, Type, Msg});
log_assets(predict_point, OldRole, NewRole, Type,
	   Msg) ->
    save(predict_point, {OldRole, NewRole, Type, Msg});
log_assets({39, _}, OldRole, NewRole, Type, Msg) ->
    save(predict_point, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = recruithigh_hero}, OldRole,
	   NewRole, Type, Msg) ->
    save(recruithigh_hero, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = recruithigh_hero}, OldRole,
	   NewRole, Type, Msg) ->
    save(recruithigh_hero, {OldRole, NewRole, Type, Msg});
log_assets(recruithigh_hero, OldRole, NewRole, Type,
	   Msg) ->
    save(recruithigh_hero, {OldRole, NewRole, Type, Msg});
log_assets({24, _}, OldRole, NewRole, Type, Msg) ->
    save(recruithigh_hero, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = expedition_medal}, OldRole,
	   NewRole, Type, Msg) ->
    save(expedition_medal, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = expedition_medal}, OldRole,
	   NewRole, Type, Msg) ->
    save(expedition_medal, {OldRole, NewRole, Type, Msg});
log_assets(expedition_medal, OldRole, NewRole, Type,
	   Msg) ->
    save(expedition_medal, {OldRole, NewRole, Type, Msg});
log_assets({25, _}, OldRole, NewRole, Type, Msg) ->
    save(expedition_medal, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = elite_coin}, OldRole, NewRole,
	   Type, Msg) ->
    save(elite_coin, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = elite_coin}, OldRole, NewRole,
	   Type, Msg) ->
    save(elite_coin, {OldRole, NewRole, Type, Msg});
log_assets(elite_coin, OldRole, NewRole, Type, Msg) ->
    save(elite_coin, {OldRole, NewRole, Type, Msg});
log_assets({27, _}, OldRole, NewRole, Type, Msg) ->
    save(elite_coin, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = holy_eqm_coin}, OldRole,
	   NewRole, Type, Msg) ->
    save(holy_eqm_coin, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = holy_eqm_coin}, OldRole,
	   NewRole, Type, Msg) ->
    save(holy_eqm_coin, {OldRole, NewRole, Type, Msg});
log_assets(holy_eqm_coin, OldRole, NewRole, Type,
	   Msg) ->
    save(holy_eqm_coin, {OldRole, NewRole, Type, Msg});
log_assets({28, _}, OldRole, NewRole, Type, Msg) ->
    save(holy_eqm_coin, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = skin_debris}, OldRole, NewRole,
	   Type, Msg) ->
    save(skin_debris, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = skin_debris}, OldRole, NewRole,
	   Type, Msg) ->
    save(skin_debris, {OldRole, NewRole, Type, Msg});
log_assets(skin_debris, OldRole, NewRole, Type, Msg) ->
    save(skin_debris, {OldRole, NewRole, Type, Msg});
log_assets({29, _}, OldRole, NewRole, Type, Msg) ->
    save(skin_debris, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = cluster_coin}, OldRole,
	   NewRole, Type, Msg) ->
    save(cluster_coin, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = cluster_coin}, OldRole,
	   NewRole, Type, Msg) ->
    save(cluster_coin, {OldRole, NewRole, Type, Msg});
log_assets(cluster_coin, OldRole, NewRole, Type, Msg) ->
    save(cluster_coin, {OldRole, NewRole, Type, Msg});
log_assets({30, _}, OldRole, NewRole, Type, Msg) ->
    save(cluster_coin, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = home_coin}, OldRole, NewRole,
	   Type, Msg) ->
    save(home_coin, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = home_coin}, OldRole, NewRole,
	   Type, Msg) ->
    save(home_coin, {OldRole, NewRole, Type, Msg});
log_assets(home_coin, OldRole, NewRole, Type, Msg) ->
    save(home_coin, {OldRole, NewRole, Type, Msg});
log_assets({31, _}, OldRole, NewRole, Type, Msg) ->
    save(home_coin, {OldRole, NewRole, Type, Msg});
log_assets(#gain{label = hallow_refine}, OldRole,
	   NewRole, Type, Msg) ->
    save(hallow_refine, {OldRole, NewRole, Type, Msg});
log_assets(#loss{label = hallow_refine}, OldRole,
	   NewRole, Type, Msg) ->
    save(hallow_refine, {OldRole, NewRole, Type, Msg});
log_assets(hallow_refine, OldRole, NewRole, Type,
	   Msg) ->
    save(hallow_refine, {OldRole, NewRole, Type, Msg});
log_assets({32, _}, OldRole, NewRole, Type, Msg) ->
    save(hallow_refine, {OldRole, NewRole, Type, Msg});
log_assets(all, OldRole, NewRole, Type, Msg) ->
    save(gold, {OldRole, NewRole, Type, Msg}),
    save(red_gold, {OldRole, NewRole, Type, Msg}),
    save(coin, {OldRole, NewRole, Type, Msg}),
    save(silver_coin, {OldRole, NewRole, Type, Msg}),
    save(energy, {OldRole, NewRole, Type, Msg}),
    save(arena_cent, {OldRole, NewRole, Type, Msg}),
    save(cluster_guess_cent, {OldRole, NewRole, Type, Msg}),
    save(peak_guess_cent, {OldRole, NewRole, Type, Msg}),
    save(hero_soul_coin, {OldRole, NewRole, Type, Msg}),
    save(feather_exchange, {OldRole, NewRole, Type, Msg}),
    save(brave_symbol, {OldRole, NewRole, Type, Msg}),
    save(arena_guesscent, {OldRole, NewRole, Type, Msg}),
    save(guild, {OldRole, NewRole, Type, Msg}),
    save(boss_point, {OldRole, NewRole, Type, Msg}),
    save(star_hun, {OldRole, NewRole, Type, Msg}),
    save(star_point, {OldRole, NewRole, Type, Msg}),
    save(sky_coin, {OldRole, NewRole, Type, Msg}),
    save(recruit_hero, {OldRole, NewRole, Type, Msg}),
    save(recruithigh_hero, {OldRole, NewRole, Type, Msg}),
    save(expedition_medal, {OldRole, NewRole, Type, Msg}),
    save(elite_coin, {OldRole, NewRole, Type, Msg}),
    save(holy_eqm_coin, {OldRole, NewRole, Type, Msg}),
    save(skin_debris, {OldRole, NewRole, Type, Msg}),
    save(cluster_coin, {OldRole, NewRole, Type, Msg}),
    save(home_coin, {OldRole, NewRole, Type, Msg}),
    save(hallow_refine, {OldRole, NewRole, Type, Msg}),
    save(friend_point, {OldRole, NewRole, Type, Msg});
log_assets(_, _OldRole, _NewRole, _Type, _Msg) -> ok.

-spec gain_item(list() | tuple(), #role{},
		binary()) -> ok.

gain_item(L, Role, Type) ->
    gain_item(L, Role, Type, <<>>).

gain_item([I | T], Role, Type, Msg) ->
    gain_item(I, Role, Role, Type, Msg),
    gain_item(T, Role, Type, Msg);
gain_item(_, _Role, _Type, _Msg) -> ok.

-spec gain_item(list() | tuple(), #role{}, #role{},
		binary()) -> ok.

gain_item([I | T], OldRole, Role, Type, Msg) ->
    gain_item(I, OldRole, Role, Type, Msg),
    gain_item(T, OldRole, Role, Type, Msg);
gain_item(#gain{label = items, val = Items}, OldRole,
	  Role, Type, Msg) ->
    gain_item(Items, OldRole, Role, Type, Msg);
gain_item(#gain{label = item_base_id, val = BaseIds},
	  OldRole, Role, Type, Msg) ->
    gain_item(BaseIds, OldRole, Role, Type, Msg);
gain_item(#gain{label = item_base_id_to_bag,
		val = BaseIds},
	  OldRole, Role, Type, Msg) ->
    gain_item(BaseIds, OldRole, Role, Type, Msg);
gain_item(#gain{label = items_to_bag, val = BaseIds},
	  OldRole, Role, Type, Msg) ->
    gain_item(BaseIds, OldRole, Role, Type, Msg);
gain_item(#gain{label = items_to_partner_bag,
		val = BaseIds},
	  OldRole, Role, Type, Msg) ->
    gain_item(BaseIds, OldRole, Role, Type, Msg);
gain_item(#gain{label = partner_chip_id, val = BaseIds},
	  OldRole, Role, Type, Msg) ->
    gain_item(BaseIds, OldRole, Role, Type, Msg);
gain_item(#gain{label = use_item, val = BaseIds},
	  OldRole, Role, Type, Msg) ->
    gain_item(BaseIds, OldRole, Role, Type, Msg);
gain_item(#gain{label = holiday_item, val = BaseIds},
	  OldRole, Role, Type, Msg) ->
    gain_item(BaseIds, OldRole, Role, Type, Msg);
gain_item(Item = #item{}, _OldRole, Role, Type, Msg) ->
    save(gain_item, {Role, Item, Type, Msg});
gain_item({ItemBid, Num}, OldRole, Role, Type, Msg) ->
    case item_data:assets_code2atom(ItemBid) of
      undefined ->
	  save(gain_item, {Role, {ItemBid, Num}, Type, Msg});
      Label ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlog442, _, {__Levellog442, __Traceslog442}}
		when __Levellog442 band 64 /= 0 orelse
		       __Traceslog442 /= [] ->
		lager:do_log(info,
			     [{module, log}, {function, gain_item}, {line, 442},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]道具获得日志里包含了资产:~w, Type:~w, Msg:~ts",
					   [Role#role.name,
					    {ItemBid, Label, Num}, Type, Msg]),
			     none, 4096, 64, __Levellog442, __Traceslog442,
			     lager_event, __Pidlog442);
	    _ -> ok
	  end,
	  log_assets(#gain{label = Label, val = Num}, OldRole,
		     Role, Type, Msg)
    end;
gain_item({ItemBid, _Bind, Num}, OldRole, Role, Type,
	  Msg) ->
    gain_item({ItemBid, Num}, OldRole, Role, Type, Msg);
gain_item(_, _OldRole, _NewRole, _Type, _Msg) -> ok.

-spec loss_item(list() | tuple(), #role{},
		binary()) -> ok.

loss_item(L, Role, Type) ->
    loss_item(L, Role, Type, <<>>).

loss_item([I | T], Role, Type, Msg) ->
    loss_item(I, Role, Role, Type, Msg),
    loss_item(T, Role, Type, Msg);
loss_item(_, _Role, _Type, _Msg) -> ok.

loss_item([I | T], OldRole, Role, Type, Msg) ->
    loss_item(I, OldRole, Role, Type, Msg),
    loss_item(T, OldRole, Role, Type, Msg);
loss_item(#loss{label = item_base_id, val = BaseIds},
	  OldRole, Role, Type, Msg) ->
    loss_item(BaseIds, OldRole, Role, Type, Msg);
loss_item(#loss{label = holiday_item, val = BaseIds},
	  OldRole, Role, Type, Msg) ->
    loss_item(BaseIds, OldRole, Role, Type, Msg);
loss_item(#loss{label = item_base_id_from_eqm,
		val = BaseIds},
	  OldRole, Role, Type, Msg) ->
    loss_item(BaseIds, OldRole, Role, Type, Msg);
loss_item(#loss{label = pet_item_base_id,
		val = BaseIds},
	  OldRole, Role, Type, Msg) ->
    loss_item(BaseIds, OldRole, Role, Type, Msg);
loss_item(Loss = #loss{label = item_id,
		       val = [{ItemId, Num} | Other]},
	  OldRole, Role, Type, Msg) ->
    case package:find(by_id, ItemId, OldRole#role.p_bag) of
      {ok, #item{base_id = BaseId}} ->
	  save(loss_item, {Role, {BaseId, Num}, Type, Msg}),
	  loss_item(Loss#loss{val = Other}, OldRole, Role, Type,
		    Msg);
      _ -> ok
    end;
loss_item(Loss = #loss{label = eqm_item_id,
		       val = [{ItemId, Num} | Other]},
	  OldRole, Role, Type, Msg) ->
    case package:find(by_id, ItemId, OldRole#role.p_eqm) of
      {ok, #item{base_id = BaseId}} ->
	  save(loss_item, {Role, {BaseId, Num}, Type, Msg}),
	  loss_item(Loss#loss{val = Other}, OldRole, Role, Type,
		    Msg);
      _ -> ok
    end;
loss_item(Loss = #loss{label = pet_item_id,
		       val = [{ItemId, Num} | Other]},
	  OldRole, Role, Type, Msg) ->
    case package:find(by_id, ItemId, OldRole#role.pet_bag)
	of
      {ok, #item{base_id = BaseId}} ->
	  save(loss_item, {Role, {BaseId, Num}, Type, Msg}),
	  loss_item(Loss#loss{val = Other}, OldRole, Role, Type,
		    Msg);
      _ -> ok
    end;
loss_item(Item = #item{}, _OldRole, Role, Type, Msg) ->
    save(loss_item, {Role, Item, Type, Msg});
loss_item({ItemBid, Num}, OldRole, Role, Type, Msg) ->
    case item_data:assets_code2atom(ItemBid) of
      undefined ->
	  save(loss_item, {Role, {ItemBid, Num}, Type, Msg});
      Label ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlog497, _, {__Levellog497, __Traceslog497}}
		when __Levellog497 band 64 /= 0 orelse
		       __Traceslog497 /= [] ->
		lager:do_log(info,
			     [{module, log}, {function, loss_item}, {line, 497},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]道具扣除日志里包含了资产:~w, Type:~w, Msg:~ts",
					   [Role#role.name,
					    {ItemBid, Label, Num}, Type, Msg]),
			     none, 4096, 64, __Levellog497, __Traceslog497,
			     lager_event, __Pidlog497);
	    _ -> ok
	  end,
	  log_assets(#loss{label = Label, val = Num}, OldRole,
		     Role, Type, Msg)
    end;
loss_item({ItemBid, _Bind, Num}, OldRole, Role, Type,
	  Msg) ->
    loss_item({ItemBid, Num}, OldRole, Role, Type, Msg);
loss_item(_, _OldRole, _Role, _Type, _Msg) -> ok.

buff_start() -> util:apply_begin('@log_write_buffs').

buff_clean() -> util:apply_clean('@log_write_buffs').

buff_clean_all() ->
    case util:apply_clean_all('@log_write_buffs') of
      undefined -> ok;
      [] -> ok;
      L ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlog516, _, {__Levellog516, __Traceslog516}}
		when __Levellog516 band 8 /= 0 orelse
		       __Traceslog516 /= [] ->
		lager:do_log(error,
			     [{module, log}, {function, buff_clean_all},
			      {line, 516}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("缓冲调用未被清除~w", [L]), none, 4096, 8,
			     __Levellog516, __Traceslog516, lager_event,
			     __Pidlog516);
	    _ -> ok
	  end
    end.

show_buff() -> get('@log_write_buffs').

buff_commit() -> util:apply_commit('@log_write_buffs').

chat(Role, Type, Target, Content, Keywords) ->
    save(chat, {Role, Type, Target, Content, Keywords}).

-spec save(atom(), tuple()) -> ok.

save(gold,
     {#role{assets = #assets{gold = OldGold}},
      Role = #role{assets = #assets{gold = NewGold}}, Type,
      Msg})
    when OldGold =/= NewGold ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Gold = NewGold - OldGold,
    Log = Log0#{"category" => <<"钻石"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Gold,
		"quantity_before" => OldGold},
    do_save(log_mgr, write, [Log]);
save(gold, _) -> ok;
save(red_gold,
     {#role{assets = #assets{red_gold = OldGold}},
      Role = #role{assets = #assets{red_gold = NewGold}},
      Type, Msg})
    when OldGold =/= NewGold ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Gold = NewGold - OldGold,
    Log = Log0#{"category" => <<"红钻"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Gold,
		"quantity_before" => OldGold},
    do_save(log_mgr, write, [Log]);
save(red_gold, _) -> ok;
save(coin,
     {#role{assets = #assets{coin = OldVal}},
      Role = #role{assets = #assets{coin = NewVal}}, Type,
      Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"金币"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(coin, _) -> ok;
save(silver_coin,
     {#role{assets = #assets{silver_coin = OldVal}},
      Role = #role{assets = #assets{silver_coin = NewVal}},
      Type, Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"银币"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(silver_coin, _) -> ok;
save(exp, _) -> ok;
save(energy,
     {#role{assets = #assets{energy = OldVal}},
      Role = #role{assets = #assets{energy = NewVal}}, Type,
      Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role, <<"experience">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"冒险情报"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(energy, _) -> ok;
save(guild,
     {#role{assets = #assets{guild = OldVal}},
      Role = #role{assets = #assets{guild = NewVal}}, Type,
      Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"联盟贡献"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(guild, _) -> ok;
save(arena_cent,
     {#role{assets = #assets{arena_cent = OldVal}},
      Role = #role{assets = #assets{arena_cent = NewVal}},
      Type, Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"竞技声望"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(arena_cent, _) -> ok;
save(cluster_guess_cent,
     {#role{assets = #assets{cluster_guess_cent = OldVal}},
      Role = #role{assets =
		       #assets{cluster_guess_cent = NewVal}},
      Type, Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"冠军币"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(cluster_guess_cent, _) -> ok;
save(peak_guess_cent,
     {#role{assets = #assets{peak_guess_cent = OldVal}},
      Role = #role{assets =
		       #assets{peak_guess_cent = NewVal}},
      Type, Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"巅峰币"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(peak_guess_cent, _) -> ok;
save(hero_soul_coin,
     {#role{assets = #assets{hero_soul_coin = OldVal}},
      Role = #role{assets = #assets{hero_soul_coin = NewVal}},
      Type, Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"英魂之心"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(hero_soul_coin, _) -> ok;
save(feather_exchange,
     {#role{assets = #assets{feather_exchange = OldVal}},
      Role = #role{assets =
		       #assets{feather_exchange = NewVal}},
      Type, Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"圣羽"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(feather_exchange, _) -> ok;
save(brave_symbol,
     {#role{assets = #assets{brave_symbol = OldVal}},
      Role = #role{assets = #assets{brave_symbol = NewVal}},
      Type, Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"勇者凭证"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(brave_symbol, _) -> ok;
save(arena_guesscent,
     {#role{assets = #assets{arena_guesscent = OldVal}},
      Role = #role{assets =
		       #assets{arena_guesscent = NewVal}},
      Type, Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"竞猜积分"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(arena_guesscent, _) -> ok;
save(hero_soul,
     {#role{assets = #assets{hero_soul = OldVal}},
      Role = #role{assets = #assets{hero_soul = NewVal}},
      Type, Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"神格"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(hero_soul, _) -> ok;
save(boss_point,
     {#role{assets = #assets{boss_point = OldVal}},
      Role = #role{assets = #assets{boss_point = NewVal}},
      Type, Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"橙装碎片"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(boss_point, _) -> ok;
save(star_hun,
     {#role{assets = #assets{star_hun = OldVal}},
      Role = #role{assets = #assets{star_hun = NewVal}}, Type,
      Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"星魂"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(star_hun, _) -> ok;
save(star_point,
     {#role{assets = #assets{star_point = OldVal}},
      Role = #role{assets = #assets{star_point = NewVal}},
      Type, Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"探宝积分"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(star_point, _) -> ok;
save(friend_point,
     {#role{assets = #assets{friend_point = OldVal}},
      Role = #role{assets = #assets{friend_point = NewVal}},
      Type, Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"友情点"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(friend_point, _) -> ok;
save(sky_coin,
     {#role{assets = #assets{sky_coin = OldVal}},
      Role = #role{assets = #assets{sky_coin = NewVal}}, Type,
      Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"天梯积分"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(sky_coin, _) -> ok;
save(hero_exp,
     {#role{assets = #assets{hero_exp = OldVal}},
      Role = #role{assets = #assets{hero_exp = NewVal}}, Type,
      Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role, <<"experience">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"英雄经验"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(hero_exp, _) -> ok;
save(recruit_hero,
     {#role{assets = #assets{recruit_hero = OldVal}},
      Role = #role{assets = #assets{recruit_hero = NewVal}},
      Type, Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"召唤积分"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(recruit_hero, _) -> ok;
save(recruithigh_hero,
     {#role{assets = #assets{recruithigh_hero = OldVal}},
      Role = #role{assets =
		       #assets{recruithigh_hero = NewVal}},
      Type, Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"先知结晶"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(recruithigh_hero, _) -> ok;
save(predict_point,
     {#role{assets = #assets{predict_point = OldVal}},
      Role = #role{assets = #assets{predict_point = NewVal}},
      Type, Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"星命卡牌"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(predict_point, _) -> ok;
save(expedition_medal,
     {#role{assets = #assets{expedition_medal = OldVal}},
      Role = #role{assets =
		       #assets{expedition_medal = NewVal}},
      Type, Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"远征勋章"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(expedition_medal, _) -> ok;
save(elite_coin,
     {#role{assets = #assets{elite_coin = OldVal}},
      Role = #role{assets = #assets{elite_coin = NewVal}},
      Type, Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"荣誉徽章"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(elite_coin, _) -> ok;
save(holy_eqm_coin,
     {#role{assets = #assets{holy_eqm_coin = OldVal}},
      Role = #role{assets = #assets{holy_eqm_coin = NewVal}},
      Type, Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"神装碎片"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(holy_eqm_coin, _) -> ok;
save(skin_debris,
     {#role{assets = #assets{skin_debris = OldVal}},
      Role = #role{assets = #assets{skin_debris = NewVal}},
      Type, Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"皮肤碎片"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(skin_debris, _) -> ok;
save(cluster_coin,
     {#role{assets = #assets{cluster_coin = OldVal}},
      Role = #role{assets = #assets{cluster_coin = NewVal}},
      Type, Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"跨服竞技声望"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(cluster_coin, _) -> ok;
save(home_coin,
     {#role{assets = #assets{home_coin = OldVal}},
      Role = #role{assets = #assets{home_coin = NewVal}},
      Type, Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"家园币"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(home_coin, _) -> ok;
save(hallow_refine,
     {#role{assets = #assets{hallow_refine = OldVal}},
      Role = #role{assets = #assets{hallow_refine = NewVal}},
      Type, Msg})
    when OldVal =/= NewVal ->
    Log0 = log_util:role_to_map(Role,
				<<"virtual-currencies">>),
    Val = NewVal - OldVal,
    Log = Log0#{"category" => <<"烈阳晶石"/utf8>>,
		"project" => Type, "info" => Msg, "op_count" => Val,
		"quantity_before" => OldVal},
    do_save(log_mgr, write, [Log]);
save(hallow_refine, _) -> ok;
save(gain_item,
     {Role, #item{base_id = ItemBid, quantity = Num}, Type,
      Msg}) ->
    save(gain_item, {Role, {ItemBid, Num}, Type, Msg});
save(gain_item, {Role, {ItemBid, Num}, Type, Msg}) ->
    Log0 = log_util:role_to_map(Role, <<"virtual-items">>),
    ItemName = item:attr(name, ItemBid),
    Log = Log0#{"item_id" => ItemBid,
		"item_name" => ItemName, "type_name" => Type,
		"op_count" => Num, "info" => Msg},
    do_save(log_mgr, write, [Log]);
save(loss_item,
     {Role, #item{base_id = ItemBid, quantity = Num}, Type,
      Msg}) ->
    save(loss_item, {Role, {ItemBid, Num}, Type, Msg});
save(loss_item, {Role, {ItemBid, Num}, Type, Msg}) ->
    Log0 = log_util:role_to_map(Role, <<"virtual-items">>),
    ItemName = item:attr(name, ItemBid),
    Log = Log0#{"item_id" => ItemBid,
		"item_name" => ItemName, "type_name" => Type,
		"op_count" => -Num, "info" => Msg},
    do_save(log_mgr, write, [Log]);
save(uplev,
     {Role = #role{lev = Lev,
		   assets = #assets{exp = Exp}}}) ->
    Log0 = log_util:role_to_map(Role, <<"level-up">>),
    Log = Log0#{"currently_exp" => Exp,
		"exp" => role_career_data:get_exp(Lev)},
    do_save(log_mgr, write, [Log]);
save(task, {Role, Operate, TaskId}) ->
    case quest_data:get(TaskId) of
      #quest_data{id = 33031, type = Type} ->
	  save(task,
	       {Role, Operate, TaskId, <<"a">>, Type,
		quest_data:type_name(Type), <<>>});
      #quest_data{name = TaskName, type = Type} ->
	  save(task,
	       {Role, Operate, TaskId, TaskName, Type,
		quest_data:type_name(Type), <<>>});
      _ -> skip
    end;
save(task,
     {Role, Operate, TaskId, TaskName, TypeId, TypeName,
      Reason}) ->
    Log0 = log_util:role_to_map(Role, <<"task-log">>),
    Log = Log0#{"operate" => Operate, "task_id" => TaskId,
		"name" => TaskName, "type_id" => TypeId,
		"type" => TypeName, "reason" => Reason, "result" => 1},
    do_save(log_mgr, write, [Log]);
save(custom, {Role, EvtName, Data = #{}}) ->
    save(custom, {Role, EvtName, maps:to_list(Data)});
save(custom, {Role, EvtName, Data}) ->
    Log0 = log_util:role_to_map(Role, <<"custom-event">>),
    Log = Log0#{"event_name" => EvtName,
		"comments" => {struct, Data}},
    do_save(log_mgr, write, [Log]);
save(join, {Role, Type, Name}) ->
    save(join, {Role, Type, Name, 1});
save(join, {Role, Type, Name, Ret}) ->
    Log0 = log_util:role_to_map(Role, <<"join-log">>),
    Log = Log0#{"type" => Type, "name" => Name,
		"result" => Ret},
    do_save(log_mgr, write, [Log]);
save(join, {Role, Type, Name, Ret, Power}) ->
    Log0 = log_util:role_to_map(Role, <<"join-log">>),
    Log = Log0#{"type" => Type, "name" => Name,
		"result" => Ret, "power" => Power},
    do_save(log_mgr, write, [Log]);
save(join, {Role, Type, Name, Ret, Power, Info}) ->
    Log0 = log_util:role_to_map(Role, <<"join-log">>),
    Log = Log0#{"type" => Type, "name" => Name,
		"result" => Ret, "power" => Power, "info" => Info},
    do_save(log_mgr, write, [Log]);
save(pvp,
     {Role, Type, Round, RoundRet, Ret, Mark, Phase,
      PhaseMark, ExtInfo}) ->
    Log0 = log_util:role_to_map(Role, <<"pvp">>),
    Log = Log0#{"type" => Type, "bout" => max(1, Round),
		"bout_result" => RoundRet, "result" => Ret,
		"mark" => Mark, "phase" => Phase,
		"phase_mark" => PhaseMark, "info" => ExtInfo},
    do_save(log_mgr, write, [Log]);
save(primus,
     {Role, Type, Round, RoundRet, Ret, Mark, Phase,
      PhaseMark, ExtInfo}) ->
    Log0 = log_util:role_to_map(Role, <<"primus">>),
    Log = Log0#{"type" => Type, "bout" => max(1, Round),
		"bout_result" => RoundRet, "result" => Ret,
		"mark" => Mark, "phase" => Phase,
		"phase_mark" => PhaseMark, "info" => ExtInfo},
    do_save(log_mgr, write, [Log]);
save(pay,
     {Role,
      Opt = #{sn := Sn, currency_type := CurrencyType,
	      money := CurrencyAmount, category := PayCateGory,
	      package_id := PackageId, pay_channel := PayChannel,
	      gold := VirtualAmount, channel := Channel}})
    when Sn =/= <<>> ->
    Log0 = log_util:role_to_map(Role, <<"payment">>),
    Amount = maps:get(db_money, Opt, CurrencyAmount),
    Log = Log0#{order_id => Sn,
		currency_type => CurrencyType,
		currency_amount => Amount, pay_category => PayCateGory,
		package_name => util:to_binary(PackageId),
		pay_channel => PayChannel,
		virtual_amount => VirtualAmount,
		"channel_name" := Channel},
    do_save(log_mgr, write, [Log]);
save(login, {Role = #role{getui_cid = GetuiCid}}) ->
    Log1 = log_util:role_to_map(Role, <<"login">>),
    Log = Log1#{getui_cid => GetuiCid},
    do_save(log_mgr, write, [Log]);
save(logout, {Role = #role{}}) ->
    Log = log_util:role_to_map(Role, <<"session">>),
    do_save(log_mgr, write, [Log]);
save(logout_role_info, {Role = #role{}}) ->
    Comments = [{msg, to_role_info_comments(Role)}],
    save(custom, {Role, <<"logout_role_info">>, Comments});
save(log_mail,
     {#mail{to = {ToRid, ToSrvId}, sess = {Id, _},
	    subject = Subject, content = Content, assets = Assets,
	    items = Items0, source = Source}}) ->
    Items = [{Bid, Num}
	     || #item{base_id = Bid, quantity = Num} <- Items0],
    Rewards = Assets ++ Items,
    ItemsMsg =
	unicode:characters_to_binary(string:join([io_lib:format("~ts(~w):数量:~w",
								[item:attr(name,
									   Bid),
								 Bid, Num])
						  || {Bid, Num} <- Rewards],
						 "</br>")),
    Log0 = log_util:role_to_map(#{id => ToRid,
				  srv_id => ToSrvId, name => <<"--">>},
				<<"mail">>),
    Log = Log0#{title => Subject, content => Content,
		options => ItemsMsg,
		info => util:fbin("id:~w,source:~ts", [Id, Source]),
		op_type => <<"发送"/utf8>>},
    do_save(log_mgr, write, [Log]);
save(log_mail,
     {Role = #role{channel = Channel},
      #mail{sess = {Id, _}, to = {ToRid, ToSrvId},
	    type = Type, from_name = FromName, group_id = GroupId,
	    subject = Subject, content = Content, assets = Assets,
	    items = Items0, source = Source}}) ->
    Items = [{Bid, Num}
	     || #item{base_id = Bid, quantity = Num} <- Items0],
    Rewards = Assets ++ Items,
    ItemsMsg =
	unicode:characters_to_binary(string:join([io_lib:format("~ts(~w):数量:~w",
								[item:attr(name,
									   Bid),
								 Bid, Num])
						  || {Bid, Num} <- Rewards],
						 "</br>")),
    Log0 = log_util:role_to_map(Role, <<"mail">>),
    Log = Log0#{title => Subject, content => Content,
		options => ItemsMsg,
		info => util:fbin("id:~w,source:~ts", [Id, Source]),
		op_type => <<"领取附件"/utf8>>},
    do_save(log_mgr, write, [Log]),
    Gold =
	list_util:keyfind(item_data:assets_atom2code(gold),
			  Assets, 0),
    Coin =
	list_util:keyfind(item_data:assets_atom2code(coin),
			  Assets, 0),
    DbAssetsMsg = string:join([io_lib:format("~ts:~w",
					     [item_data:assets_code2name(Code),
					      Val])
			       || {Code, Val} <- Assets],
			      "</br>"),
    DbItemsMsg = string:join([io_lib:format("~ts(~w):数量:~w",
					    [item:attr(name, Bid), Bid, Num])
			      || {Bid, Num} <- Items],
			     "</br>"),
    do_save(db_buffer, send_query,
	    [log_mail, undefined,
	     [Id, GroupId, Type, FromName, ToRid, ToSrvId, Channel,
	      Gold, Coin, Subject, Content, DbAssetsMsg, DbItemsMsg,
	      date:unixtime(), Source]]);
save(log_up_speed, {Role, Count}) ->
    Data = [{count, Count}],
    save(custom, {Role, <<"up_speed">>, Data});
save(log_up_speed, {Role, Count, Diff}) ->
    Data = [{count, Count}, {time, Diff}],
    save(custom, {Role, <<"up_speed">>, Data});
save(rank,
     {RType, Idx, {Rid, SrvId}, Name, Val, Comments}) ->
    Log0 = log_util:role_to_map(#{id => Rid,
				  srv_id => SrvId, name => Name},
				<<"rank-list">>),
    Log = Log0#{type => log_rank:rank_name(RType),
		value => Val, rank => Idx, comments => Comments},
    do_save(log_mgr, write, [Log]);
save(log_partner,
     {Role, #partner{bid = PartnerBid, name = Name}}) ->
    Log0 = log_util:role_to_map(Role, <<"pet">>),
    Event = util:fbin(lang:get(<<"获得伙伴:~w"/utf8>>),
		      [PartnerBid]),
    Log = Log0#{"pet_id" => PartnerBid, "pet_name" => Name,
		"event_type" => lang:get(<<"获得伙伴"/utf8>>),
		"event" => lang:get(<<"获得伙伴"/utf8>>), "info" => Event},
    do_save(log_mgr, write, [Log]);
save(log_partner_num, {Role, Star, Num, Msg}) ->
    Log0 = log_util:role_to_map(Role, <<"pet">>),
    EventType = util:fbin(lang:get(<<"~w星"/utf8>>), [Star]),
    Event = util:fbin(lang:get(<<"~w"/utf8>>), [Num]),
    PetId = 100001 + Star - 3,
    Log = Log0#{"pet_id" => PetId,
		"pet_name" =>
		    util:fbin(lang:get(<<"~w星伙伴数量"/utf8>>), [Star]),
		"event_type" => EventType,
		"event" => lang:get(<<"当前状态"/utf8>>), "info" => Msg,
		"ext" => Event},
    do_save(log_mgr, write, [Log]);
save(role_power_info,
     {Role = #role{max_power = MaxPower,
		   assets = #assets{gold = Gold}}}) ->
    Log0 = log_util:role_to_map(Role, <<"combat-eff">>),
    Log = Log0#{"power" => MaxPower, "currency" => Gold,
		"schedule" => 0.0, "type" => <<"历史最大战力"/utf8>>,
		"info" => <<>>, "gain" => <<>>, "bak_type" => 0},
    do_save(log_mgr, write, [Log]);
save(role_power_info,
     {Role = #role{max_power = MaxPower,
		   assets = #assets{gold = Gold}},
      Type, ScheduleT, WorldLev}) ->
    Log0 = log_util:role_to_map(Role, <<"combat-eff">>),
    Schedule = util:round(ScheduleT * 100) / 100,
    Log = Log0#{"power" => MaxPower, "currency" => Gold,
		"schedule" => Schedule, "type" => Type,
		"info" => WorldLev, "gain" => <<>>, "bak_type" => 0},
    do_save(log_mgr, write, [Log]);
save(role_power_info,
     {Role = #role{max_power = MaxPower,
		   assets = #assets{gold = Gold}},
      Type, ScheduleT, WorldLev, LogInfo}) ->
    Log0 = log_util:role_to_map(Role, <<"combat-eff">>),
    Schedule = util:round(ScheduleT * 100) / 100,
    Log = Log0#{"power" => MaxPower, "currency" => Gold,
		"schedule" => Schedule, "type" => Type,
		"info" => WorldLev, "gain" => <<>>, "bak_type" => 0,
		"ext" => LogInfo},
    do_save(log_mgr, write, [Log]);
save(chat, {Role, Type, Target, Content, Keywords}) ->
    Log0 = log_util:role_to_map(Role, <<"chat">>),
    Log = Log0#{"type" => get_channel_name(Type),
		"content" => Content, "target" => Target,
		"keyword" => gen_keyword_str(Keywords)},
    do_save(log_mgr, write, [Log]);
save(partner,
     {Role,
      _Partner = #partner{bid = PartnerBid, name = Name},
      EventType, Event})
    when is_binary(EventType) ->
    Log0 = log_util:role_to_map(Role, <<"pet">>),
    Log = Log0#{"pet_id" => PartnerBid, "pet_name" => Name,
		"event_type" => EventType, "event" => EventType,
		"info" => Event},
    do_save(log_mgr, write, [Log]);
save(partner,
     {Role,
      OldPartner = #partner{bid = PartnerBid, name = Name},
      Partner, EventType, Event}) ->
    Log0 = log_util:role_to_map(Role, <<"pet">>),
    Log = Log0#{"pet_id" => PartnerBid, "pet_name" => Name,
		"event_type" => EventType, "event" => EventType,
		"info" => Event,
		"old_pet" =>
		    unicode:characters_to_binary(pet_log(OldPartner)),
		"new_pet" =>
		    unicode:characters_to_binary(pet_log(Partner))},
    do_save(log_mgr, write, [Log]);
save(shop,
     {Role, Type, ItemBid, ItemNum, AssetsType, AssetsVal,
      Msg}) ->
    ItemName = item:attr(name, ItemBid),
    AssetsName = if is_integer(AssetsType) ->
			case item_data:get(AssetsType) of
			  #item_base{name = AssetsName1} -> AssetsName1;
			  _ -> <<"未知"/utf8>>
			end;
		    is_atom(AssetsType) ->
			item_data:assets_atom2name(AssetsType);
		    true -> AssetsType
		 end,
    Log0 = log_util:role_to_map(Role, <<"shop">>),
    Log = Log0#{"type" => Type, "item_id" => ItemBid,
		"item_name" => ItemName, "item_count" => ItemNum,
		"category" => AssetsName, "category_count" => AssetsVal,
		"info" => Msg},
    do_save(log_mgr, write, [Log]);
save(log_profile, {GL, Role, NRole, Type, Msg}) ->
    Data = [{msg, Msg}],
    log_gain(GL, Role, NRole, Type, Msg),
    save(custom, {Role, <<"profile">>, Data});
save(log_agenda, {Role, Msg}) ->
    Data = [{msg, Msg}],
    save(custom, {Role, <<"agenda">>, Data});
save(market_gold, {Role, Msg}) ->
    Data = [{msg, Msg}],
    save(custom, {Role, <<"market_gold">>, Data});
save(market_silver, {Role, Msg}) ->
    Data = [{msg, Msg}],
    save(custom, {Role, <<"market_silver">>, Data});
save(partner_star, {Role, Msg}) ->
    Data = [{msg, Msg}],
    save(custom, {Role, <<"partner_star">>, Data});
save(personal_gift_cyb, {Role, Msg}) ->
    Data = [{msg, Msg}],
    save(custom, {Role, <<"personal_gift_cyb">>, Data});
save(personal_gift_cyb_test, {Role, Msg}) ->
    Data = [{msg, Msg}],
    save(custom,
	 {Role, <<"personal_gift_cyb_test">>, Data});
save(personal_gift, {Role, Msg}) ->
    Data = [{msg, Msg}],
    save(custom, {Role, <<"personal_gift">>, Data});
save(test_personal_gift, {Role, Msg}) ->
    Data = [{msg, Msg}],
    save(custom, {Role, <<"test_personal_gift">>, Data});
save(return_new_login, {Role, Msg}) ->
    Data = [{msg, Msg}],
    save(custom, {Role, <<"return_new_login">>, Data});
save(return_new_charge, {Role, Msg}) ->
    Data = [{msg, Msg}],
    save(custom, {Role, <<"return_new_charge">>, Data});
save(charge_rebate_residue, {Role, Msg}) ->
    Data = [{msg, Msg}],
    save(custom, {Role, <<"charge_rebate_residue">>, Data});
save(optional_lottery_info, {Role, Msg}) ->
    Data = [{msg, Msg}],
    save(custom, {Role, <<"optional_lottery_info">>, Data});
save(holiday_lucky_dog_info, {Role, Msg}) ->
    Data = [{msg, Msg}],
    save(custom,
	 {Role, <<"holiday_lucky_dog_info">>, Data});
save(fire_time_award, {Role, Msg}) ->
    Data = [{msg, Msg}],
    save(custom, {Role, <<"fire_time_award">>, Data});
save(resonate_cystal_lev, {Role, Msg}) ->
    Data = [{msg, Msg}],
    save(custom, {Role, <<"resonate_cystal_lev">>, Data});
save(resonate_cystal_cell, {Role, Msg}) ->
    Data = [{msg, Msg}],
    save(custom, {Role, <<"resonate_cystal_cell">>, Data});
save(partner_convert, {Role, Msg}) ->
    Data = [{msg, Msg}],
    save(custom, {Role, <<"partner_convert">>, Data});
save(report, {Role, Msg}) ->
    Data = [{msg, Msg}],
    save(custom, {Role, <<"report">>, Data});
save(soft, {Role, Msg}) ->
    Data = [{msg, Msg}],
    save(custom, {Role, <<"home_soft">>, Data});
save(mine, {Role, Msg}) ->
    Data = [{msg, Msg}],
    save(custom, {Role, <<"mine">>, Data});
save(combat_end,
     {VipLev, NewName, BStar, CombatName, Num}) ->
    Platform = sys_env:get(platform),
    ZoneId = sys_env:get(zone_id),
    Log = #{"product_name" => <<"sszg">>,
	    "platform_name" => erlang:list_to_binary(Platform),
	    "gameserver_no" => ZoneId,
	    "date_time" => log_util:date_time(),
	    "header_type" => <<"formation">>,
	    "chr_level_vip" => VipLev, "name" => NewName,
	    "star" => BStar, "type" => CombatName, "num" => Num,
	    "log_type" => 2},
    do_save(log_mgr, write, [Log]);
save(log_cli_error,
     {#role{id = {Rid, SrvId}, channel = Channel},
      ErrMsg}) ->
    do_save(db_buffer, send_query,
	    [log_cli_error, undefined,
	     [Rid, SrvId, Channel, ErrMsg]]);
save(_Type, _Data) -> ok.

apply_log(Role, {log_up_speed, Count}) ->
    save(log_up_speed, {Role, Count}), ok;
apply_log(Role, {log_up_speed, Count, Diff}) ->
    case var:get_var(Role, day, log_up_speed, 0) of
      0 ->
	  save(log_up_speed, {Role, Count, Diff}),
	  {ok, var:set_var(Role, day, log_up_speed, 1)};
      _ -> ok
    end;
apply_log(_Role, _Log) -> ok.

do_save(Mod, Fun, Args) ->
    case get('@log_write_buffs') of
      undefined -> apply(Mod, Fun, Args);
      _Buff -> util:apply('@log_write_buffs', Mod, Fun, Args)
    end.

get_channel_name(1) -> <<"世界"/utf8>>;
get_channel_name(4) -> <<"联盟"/utf8>>;
get_channel_name(999999999) -> <<"私聊"/utf8>>;
get_channel_name(999999998) -> <<"弹幕"/utf8>>;
get_channel_name(1024) -> <<"跨服"/utf8>>;
get_channel_name(2048) -> <<"同省"/utf8>>;
get_channel_name(_) -> <<"未处理频道!"/utf8>>.

gen_keyword_str(Keywords) ->
    color:bin_join(Keywords, <<"|">>, <<>>).

pet_log(Pets) when is_list(Pets) ->
    string:join([util:to_list(pet_log(Pet)) || Pet <- Pets],
		"");
pet_log(#partner{id = Id, name = Name, bid = BaseId,
		 lev = Lev, exp = Exp, star = Star, star_step = StarStep,
		 break_lev = BreakLev, group_attr = GroupAttr,
		 all_attr = AllAttr, skills = Skills0,
		 break_skills = BreakSkills0, artifacts = Artifacts}) ->
    Skills =
	unicode:characters_to_binary(string:join([io_lib:format("天赋技能ID:~w",
								[SkillId])
						  || SkillId <- Skills0],
						 "</br>")),
    Fun = fun ({_PosId,
		#item{id = IdT, base_id = BaseIdT, extra = Extra}},
	       Acc) ->
		  ExtraSkill1 = case lists:keyfind(1, 1, Extra) of
				  {_, ExtraSkillT1} -> ExtraSkillT1;
				  _ -> 0
				end,
		  ExtraSkill2 = case lists:keyfind(2, 1, Extra) of
				  {_, ExtraSkillT2} -> ExtraSkillT2;
				  _ -> 0
				end,
		  [{IdT, BaseIdT, ExtraSkill1, ExtraSkill2} | Acc]
	  end,
    ArtifactSkills = lists:foldl(Fun, [], Artifacts),
    Skills2 =
	unicode:characters_to_binary(string:join([io_lib:format("神器id:~w 神器bid:~w 神器技能1:~w  神器技能2:~w",
								[IdT, BaseIdT,
								 ExtraSkill1,
								 ExtraSkill2])
						  || {IdT, BaseIdT, ExtraSkill1,
						      ExtraSkill2}
							 <- ArtifactSkills],
						 "</br>")),
    Skills3 =
	unicode:characters_to_binary(string:join([io_lib:format("突破技能位置:~w 技能:~w",
								[Pos, SkillIdT])
						  || {Pos, SkillIdT}
							 <- BreakSkills0],
						 "</br>")),
    AllAttrs = util:fbin(<<"属性:~w"/utf8>>, [AllAttr]),
    GroupAttrs = util:fbin(<<"成长属性:~w"/utf8>>, [GroupAttr]),
    Restore =
	unicode:characters_to_binary(string:join([io_lib:format("bid:~w",
								[BaseId]),
						  io_lib:format("star:~w",
								[Star]),
						  io_lib:format("break_lev:~w",
								[BreakLev]),
						  io_lib:format("lev:~w",
								[Lev])],
						 "</br>")),
    util:flist("[~ts:~w:~w][等级:~w][经验:~w][星数:~w][星数子阶段:~w][突破"
	       "次数:~w][天赋技能:~ts][神器技能:~ts][突破技能:~ts][总属性:~ts]"
	       "[成长属性:~ts][Restore:~ts]",
	       [Name, Id, BaseId, Lev, Exp, Star, StarStep, BreakLev,
		Skills, Skills2, Skills3, AllAttrs, GroupAttrs,
		Restore]);
pet_log(_Pet) -> not_pet_record.

to_role_info_comments(Role = #role{id = RoleId,
				   assets = Assets, power = Power,
				   login =
				       #login{login_time = LoginTime,
					      logout_time = LogOutTime},
				   m_var =
				       #m_var{last_acc_time = LastAccTime,
					      acc_login_count = AccLogin,
					      login_charge_count =
						  LoginChargeCount,
					      login_charge_num = LoginChargeNum,
					      acc_charge_count = AccChargeCount,
					      acc_days = AccDays,
					      total_acc_time = TotalAccTime},
				   m_dungeon = #m_dungeon{max_dun_id = DunId},
				   m_star_tower =
				       #m_star_tower{max_tower = MaxTower},
				   m_endless =
				       #m_endless{max_id = EndLessMaxId},
				   partner_bag =
				       #partner_bag{partner_list = PL},
				   reg_time = RegTime}) ->
    PartnerNum = length([Star
			 || #partner{star = Star} <- PL, Star >= 5]),
    ArenaRank = arena_lib:role_score(RoleId),
    Now = date:unixtime(),
    AddT = min(180, Now - LastAccTime),
    {_, BreakItemCount} = package:count(by_base_id, 10001,
					Role#role.p_bag),
    util:fbin("角色注册日期:~w|累计登录次数:~w|累计登录天数:~w|角色战力:~w|此次登录充值次"
	      "数:~w|累计充值次数:~w|此次登录充值额度:~w|累计充值额度:~w|角色当前钻石量:"
	      "~w|角色当前金币量:~w|角色当前英雄经验量:~w|角色当前进阶石量:~w|此次登录在线"
	      "时长:~w|累计在线时长:~w|当前最大副本关卡ID:~w|当前最大试炼塔副本ID:~w|"
	      "当前无尽试炼最大层数:~w|当前拥有5星及以上伙伴数:~w|当前竞技场积分:~w",
	      [RegTime, AccLogin, AccDays, Power, LoginChargeCount,
	       AccChargeCount, LoginChargeNum, Assets#assets.vip_exp,
	       Assets#assets.gold, Assets#assets.coin,
	       Assets#assets.hero_exp, BreakItemCount, AddT,
	       TotalAccTime, DunId, MaxTower, EndLessMaxId, PartnerNum,
	       ArenaRank]).


