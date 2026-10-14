-file("src/gm/t.erl", 1).

-module(t).

-lager_records([{item_make_args,
		 [base_id, bind, quantity, step, flag]},
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
		{name_index, [name, id, acc, pid, conn_pid]},
		{id_index, [id, name, acc, pid, conn_pid, login_err]},
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
		{holy_eqm_set_cell, [ver, id, partner_id, name, list]},
		{m_holy_eqm_set, [ver, num, buy_num, next_id, list]},
		{holy_eqm_attr_data,
		 [group_id, attr, time_min, time_max, val_range,
		  first_pro, reset_pro]},
		{m_arena_elite_war_order,
		 [ver, period, period_day, end_time, win_count,
		  rmb_status, card, lev_reward, start_time, ext]},
		{arena_replay_partner, [pos, bid, lev, star, ext]},
		{arena_replay_info,
		 [id, round, ret, time, a_id, a_power, a_formation_type,
		  a_order, a_end_hp, b_id, b_power, b_formation_type,
		  b_order, b_end_hp, a_plist, b_plist, ext]},
		{arena_elite_log,
		 [id, atk_id, atk_name, atk_face, atk_lev, atk_rank,
		  atk_elite_lev, def_id, def_name, def_face, def_lev,
		  def_rank, def_elite_lev, ret, win_count, lose_count,
		  combat_type, replay_list, time, atk_face_update_time,
		  atk_face_file, def_face_update_time, def_face_file]},
		{role_arena_elite_log, [id, list]},
		{arena_elite_rank,
		 [ver, rank, id, name, power, lev, face, look_id, score,
		  elite_lev, time, avatar_id, face_update_time,
		  face_file]},
		{arena_partners_info,
		 [pos, id, bid, lev, star, break_lev, power, dower_skill,
		  set_skill, attr, extra]},
		{arena_elite_rival_defense,
		 [order, formation_type, hallows_id, hallows_lev,
		  hallows_skill_lev, partner_infos, hallows_look_id,
		  hallows_lucky, hallows_seal, hallows_all_look_ids,
		  extra]},
		{c_e_role,
		 [ver, id, name, power, lev, face, look_id, score,
		  elite_lev, avatar_id, is_king, match_power, all_star,
		  win_rio, zid, face_update_time, face_file]},
		{arena_elite_role,
		 [ver, id, name, lev, sex, gid, gname, face, power,
		  look_id, score, elite_lev, time, avatar_id, is_king,
		  defense, manifesto, face_update_time, face_file,
		  break_groups]},
		{c_elite_srv_info,
		 [type, sid, num, world_lev, open_time, merge_srvs]},
		{m_arena_elite_defens, [type, formations]},
		{m_arena_elite_log,
		 [ver, period, max_lev, max_score, combat_win_count1,
		  combat_all_count1, combat_win_count2, combat_all_count2,
		  max_dps, mvp_info, winning_streak, winning_streak_now,
		  beast_rivl_info, extra, log_zone_id, log_rank]},
		{arena_elite_role_best,
		 [id, name, lev, sex, gid, gname, face, power, look_id,
		  score, elite_lev, time, avatar_id, is_king, extra,
		  face_update_time, face_file]},
		{m_arena_elite,
		 [ver, lev, init_lev, period, score, day_combat_count,
		  day_buy_count, frist_ref_time, ref_count, match_cd_time,
		  had_combat_num, acc_combat_num, lev_reward,
		  last_combat_id, promoted_info, rival_info, defens,
		  old_rank, day_point_count, log, extra, last_reset_time,
		  max_day_buy_count, is_skip]},
		{link, [socket, conn_pid, ip, port, lag]},
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
		  p_eqm, p_home]},
		{combat_buff_data,
		 [bid, name, group, join_type, lev, join_num, duration,
		  buff_result_type, buff_result, desc,
		  positive_or_negative, can_reduce, probability,
		  clean_when_dead, clean_next_wave, is_show, group_pro,
		  dot_type]},
		{effect_data,
		 [bid, group, target_type, target_num, effect_type,
		  hurt_type, base_hit, hit_type, effect_param, condition,
		  condition_param, extra_param, passive_effect,
		  effect_desc]},
		{skill_data,
		 [bid, name, owner, group, next_id, min_play_time, level,
		  is_normal_skill, type, trigger_condition, trigger_param,
		  target, effect_list, add_attr, cd, count, best_target,
		  fit_combat_type, skill_changed, power, is_combat_hidden,
		  priority]},
		{m_skill, [skills_used, skills_owned]},
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
		{rank_cfg,
		 [type, num, keys, min_val, nologin, zone, exit_rank]},
		{rank_rc,
		 [ver, id, idx, val1, val2, val3, rid, srv_id, name,
		  look_id, sex, lev, face_id, vip_lev, guild_name, power,
		  all_power, desc, looks, ext, time, is_cross, avatar_bid,
		  face_update_time, face_file]},
		{rank, [type, list, last_val, len, is_cross, ctime]}]).

-compile(export_all).

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

-file("src/gm/t.erl", 8).

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

-file("src/gm/t.erl", 9).

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

-file("src/gm/t.erl", 10).

-file("inc/skill.hrl", 1).

-record(m_skill,
	{skills_used = [], skills_owned = []  :: [integer()]}).

-record(skill_data,
	{bid, name, owner, group, next_id = 0,
	 min_play_time = 0, level, is_normal_skill = 0,
	 type  ::
	     passive_skill | active_skill | eqm_passive_skill,
	 trigger_condition = none, trigger_param = 0, target,
	 effect_list = [], add_attr = [], cd, count,
	 best_target = normal, fit_combat_type = all,
	 skill_changed = none, power = 0, is_combat_hidden = 0,
	 priority = 0}).

-record(effect_data,
	{bid, group, target_type, target_num, effect_type,
	 hurt_type, base_hit, hit_type = effect_hit,
	 effect_param, condition = none, condition_param = none,
	 extra_param = [], passive_effect = none,
	 effect_desc = <<>>}).

-record(combat_buff_data,
	{bid, name, group, join_type, lev, join_num, duration,
	 buff_result_type, buff_result = [], desc,
	 positive_or_negative, can_reduce, probability = 1000,
	 clean_when_dead = true, clean_next_wave = 0,
	 is_show = true, group_pro = 0, dot_type = 0}).

-file("src/gm/t.erl", 11).

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

-file("src/gm/t.erl", 12).

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

-file("src/gm/t.erl", 13).

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

-file("src/gm/t.erl", 14).

-file("inc/link.hrl", 1).

-record(link,
	{socket, conn_pid, ip = {127, 0, 0, 1}, port, lag}).

-file("src/gm/t.erl", 15).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("src/gm/t.erl", 16).

-file("inc/arena_elite.hrl", 1).

-record(m_arena_elite,
	{ver = 6, lev = 1, init_lev = 1, period = 0, score = 0,
	 day_combat_count = 0, day_buy_count = 0,
	 frist_ref_time = 0, ref_count = 0, match_cd_time = 0,
	 had_combat_num = 0, acc_combat_num = 0, lev_reward = [],
	 last_combat_id = {0, <<>>}, promoted_info = [],
	 rival_info = [], defens = [], old_rank = [],
	 day_point_count = [], log = [], extra = [],
	 last_reset_time = 0, max_day_buy_count = 0,
	 is_skip = 0}).

-record(arena_elite_role_best,
	{id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = [],
	 look_id = 0, score = 0, elite_lev = 0, time = 0,
	 avatar_id = 0, is_king = 0, extra = [],
	 face_update_time = 0, face_file = <<>>}).

-record(m_arena_elite_log,
	{ver = 2, period = 0, max_lev = 1, max_score = 1000,
	 combat_win_count1 = 0, combat_all_count1 = 0,
	 combat_win_count2 = 0, combat_all_count2 = 0,
	 max_dps = 0, mvp_info = [], winning_streak = 0,
	 winning_streak_now = 0,
	 beast_rivl_info = #arena_elite_role_best{}, extra = [],
	 log_zone_id = 0, log_rank = 0}).

-record(m_arena_elite_defens,
	{type = 1, formations = []}).

-record(c_elite_srv_info,
	{type = 1, sid = <<>>, num = 0, world_lev = 0,
	 open_time = 0, merge_srvs = []}).

-record(arena_elite_role,
	{ver = 4, id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 look_id = 0, score = 0, elite_lev = 0, time = 0,
	 avatar_id = 0, is_king = 0, defense = [],
	 manifesto = [], face_update_time = 0, face_file = <<>>,
	 break_groups = []}).

-record(c_e_role,
	{ver = 4, id = {0, <<>>}, name = <<>>, power = 0,
	 lev = 0, face = 0, look_id = 0, score = 0,
	 elite_lev = 0, avatar_id = 0, is_king = 0,
	 match_power = 1, all_star = 1, win_rio = 1, zid = 1,
	 face_update_time = 0, face_file = <<>>}).

-record(arena_elite_rival_defense,
	{order, formation_type, hallows_id, hallows_lev,
	 hallows_skill_lev, partner_infos, hallows_look_id,
	 hallows_lucky, hallows_seal, hallows_all_look_ids = [],
	 extra = []}).

-record(arena_partners_info,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, dower_skill = [],
	 set_skill = [], attr, extra = []}).

-record(arena_elite_rank,
	{ver = 2, rank = 0, id = {0, <<>>}, name = <<>>,
	 power = 0, lev = 0, face = 0, look_id = 0, score = 0,
	 elite_lev = 0, time = 0, avatar_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(role_arena_elite_log,
	{id = {0, <<>>}, list = []}).

-record(arena_elite_log,
	{id = 0, atk_id = {0, <<>>}, atk_name = <<>>,
	 atk_face = 0, atk_lev = 0, atk_rank = 0,
	 atk_elite_lev = 0, def_id = {0, <<>>}, def_name = <<>>,
	 def_face = 0, def_lev = 0, def_rank = 0,
	 def_elite_lev = 0, ret = 1, win_count = 0,
	 lose_count = 0, combat_type = 0, replay_list = [],
	 time = 0, atk_face_update_time = 0,
	 atk_face_file = <<>>, def_face_update_time = 0,
	 def_face_file = <<>>}).

-record(arena_replay_info,
	{id = 0, round = 0, ret = 0, time = 0, a_id = {0, <<>>},
	 a_power = 0, a_formation_type = 0, a_order = 0,
	 a_end_hp = 0, b_id = {0, <<>>}, b_power = 0,
	 b_formation_type = 0, b_order = 0, b_end_hp = 0,
	 a_plist = [], b_plist = [], ext = []}).

-record(arena_replay_partner,
	{pos = 0, bid = 0, lev = 0, star = 0, ext = []}).

-record(m_arena_elite_war_order,
	{ver = 2, period = 0, period_day = 0, end_time = 0,
	 win_count = 0, rmb_status = 0, card = [],
	 lev_reward = [], start_time = 0, ext = []}).

-file("src/gm/t.erl", 17).

-file("inc/holy_eqm.hrl", 1).

-record(holy_eqm_attr_data,
	{group_id = 0, attr, time_min = 0, time_max = 0,
	 val_range = [], first_pro = 0, reset_pro = 0}).

-record(m_holy_eqm_set,
	{ver = 1, num = 0, buy_num = 0, next_id = 1,
	 list = []}).

-record(holy_eqm_set_cell,
	{ver = 1, id = 0, partner_id = 0, name = <<>>,
	 list = []}).

-file("src/gm/t.erl", 18).

-file("inc/log.hrl", 1).

-file("src/gm/t.erl", 19).

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

-file("src/gm/t.erl", 20).

-file("inc/role_query.hrl", 1).

-record(id_index,
	{id = {0, <<>>}, name = <<>>, acc = <<>>, pid, conn_pid,
	 login_err = 0}).

-record(name_index,
	{name = <<>>, id = {0, <<>>}, acc = <<>>, pid,
	 conn_pid}).

-file("src/gm/t.erl", 21).

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

-file("src/gm/t.erl", 22).

match_bak(_Role, MatchList1, _) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidt24, _, {__Levelt24, __Tracest24}}
	  when __Levelt24 band 64 /= 0 orelse __Tracest24 /= [] ->
	  lager:do_log(info,
		       [{module, t}, {function, match_bak}, {line, 24},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("==== ~w", [MatchList1]), none, 4096, 64,
		       __Levelt24, __Tracest24, lager_event, __Pidt24);
      _ -> ok
    end,
    ok.

partners(N) ->
    case ets:match(role_id_index,
		   #id_index{id = '$1', _ = '_'}, N)
	of
      {RoleIds, _} -> do_partners_roleids(RoleIds, #{});
      _ -> ok
    end.

do_partners_roleids([], _Ext) -> ok;
do_partners_roleids([[{Rid, SrvId}] | T], Ext) ->
    case gm_tools:info({Rid, SrvId}, partner_bag, 0) of
      {_, _, #partner_bag{partner_list = ParnterList}} ->
	  NewExt = do_partners(util:keys_sort([#partner.power],
					      ParnterList),
			       Ext),
	  do_partners_roleids(T, NewExt);
      _ -> do_partners_roleids(T, Ext)
    end.

do_partners([], Ext) -> Ext;
do_partners([#partner{bid = Bid, name = Name,
		      power = Power, lev = Lev, star = Star,
		      break_lev = BreakLev, all_attr = AllAttr,
		      break_skills = BreakSkills, set_skills = SetSkills,
		      hidden_skills = HiddenSkills, type = Type, eqm = Eqm,
		      artifacts = Artifacts, holy_eqm = HolyEqm}
	     | T],
	    Ext) ->
    Bids = [10501, 10502, 10504, 10510, 10511, 10512, 20501,
	    20504, 20505, 20507, 20508, 20509, 20510, 20511, 30501,
	    30502, 30504, 30506, 30507, 30508, 30509, 30510, 30511,
	    40502, 40503, 40504, 40506, 40507, 40508, 40509, 40510,
	    50502, 50503, 50504, 50505, 50507, 50508, 50509, 50510],
    case lists:member(Bid, Bids) of
      true when Lev > 50 andalso Star >= 5 ->
	  case maps:get({Bid, Star}, Ext, undefined) of
	    undefined ->
		#partner_base_data{break_id = BreakId} =
		    partner_data:get_base(Bid),
		SkillNum = partner_data:get_skill_num({Type, BreakId,
						       BreakLev}),
		Skills = partner_data:get_skills({Bid, Star}),
		Skills = [{SkillM, SkillId}
			  || {SkillM, SkillId} <- Skills, SkillM =< SkillNum],
		AttrL = [{AttrName, AttrVal}
			 || {AttrName, AttrVal}
				<- attr_data:attr2atom_kv(AllAttr),
			    AttrVal > 0],
		EqmInfo = [ItemBid || #item{base_id = ItemBid} <- Eqm],
		HolyEqmInfo = [{ItemBid, MainAttr}
			       || #item{base_id = ItemBid, main_attr = MainAttr}
				      <- HolyEqm],
		ArtifactsInfo = [{ItemBid, Attr, Extra}
				 || {_,
				     #item{base_id = ItemBid, attr = Attr,
					   extra = Extra}}
					<- Artifacts],
		io:format("~ts",
			  [io_lib:format("bid=~w power=~w name=~ts lev=~w star=~w "
					 "break_lev=~w break_skills=~w set_skills=~w "
					 "hidden_skills=~w skills=~w attr=~w eqm=~w "
					 "holy_eqm=~w artifacts=~w ~n",
					 [Bid, Power, Name, Lev, Star, BreakLev,
					  BreakSkills, SetSkills, HiddenSkills,
					  Skills, AttrL, EqmInfo, HolyEqmInfo,
					  ArtifactsInfo])]),
		do_partners(T, Ext#{{Bid, Star} => 1});
	    _ -> do_partners(T, Ext)
	  end;
      _ -> do_partners(T, Ext)
    end.

print() ->
    io:format("~ts",
	      [io_lib:format("open_day=~w, world_lev=~w",
			     [game_lib:server_open_time(day),
			      world_lev:get_world_lev()])]).

print_arena_elite(0) ->
    do_print_arena_elite(ets:tab2list(arena_elite_role)),
    ok;
print_arena_elite(21) -> ok;
print_arena_elite(N) ->
    io:format("~ts",
	      [io_lib:format("============~w=====start=~n", [N])]),
    do_print_arena_elite(ets:tab2list(c_arena_elite_mgr:tab(N))),
    io:format("~ts",
	      [io_lib:format("============~w=====end===~n", [N])]),
    print_arena_elite(N + 1).

do_print_arena_elite(L) ->
    SortL = lists:keysort(#c_e_role.match_power, L),
    [do_print_arena_elite_r(R) || R <- SortL].

do_print_arena_elite_r(#c_e_role{id = {Rid, SrvId},
				 name = Name, match_power = MatchPower,
				 elite_lev = EliteLev, lev = Lev, power = Power,
				 score = Score}) ->
    io:format("~ts",
	      [io_lib:format("~w,~s,~ts lev=~w, score=~w power=~w "
			     "elite_lev=~w match_power=~w~n",
			     [Rid, SrvId, Name, Lev, Score, Power, EliteLev,
			      MatchPower])]).

ets(N) ->
    case ets:info(oracle_test) of
      undefined ->
	  ets:new(test_r,
		  [set, named_table, public, {keypos, #rank_rc.rid}]);
      _ -> ets:delete_all_objects(test_r)
    end,
    [ets:insert(test_r, #rank_rc{rid = I})
     || I <- lists:seq(101, 10000)],
    [ets:insert(test_r, #rank_rc{rid = I, idx = I})
     || I <- lists:seq(1, 100)],
    put(test_r,
	[ets:insert(test_r, #rank_rc{rid = I, idx = I})
	 || I <- lists:seq(1, 100)]),
    Fun1 = fun (_) -> L = ets:tab2list(test_r), get_rank(L)
	   end,
    Fun2 = fun (_) ->
		   Ms = [{#rank_rc{idx = '$1', _ = '_'},
			  [{'andalso', {'>=', '$1', 1}, {'=<', '$1', 100}}],
			  ['$_']}],
		   {L, _} = ets:select(test_r, Ms, 100)
	   end,
    Fun3 = fun (_) -> get(test_r) end,
    ptester:run(N,
		[{"ets:tab2list", Fun1}, {"ets:select", Fun2},
		 {"erlang:get", Fun3}]).

get_rank(List) -> get_rank(1, 101, List, []).

get_rank(Satrt, Satrt, _List, L) -> L;
get_rank(Satrt, End, List, L) ->
    case lists:keyfind(Satrt, #rank_rc.idx, List) of
      false -> L;
      Rf -> get_rank(Satrt + 1, End, List, [Rf | L])
    end.

tuple(N) ->
    R = #role{},
    Data = {[{skill_play, 9, 2, 501436, 0, <<>>,
	      [{effect_play, 58, 9, 2, 5014305, 1, 1, -61948, 0, [],
		[], -1, 1, [], 0, 501436, 0, 0, 0, 0, []},
	       {effect_play, 59, 9, 9, 8351402, 1, 0, 0, 204930, [],
		[], -1, 0, [], 0, 835142, 0, 0, 0, 0, []},
	       {effect_play, 60, 9, 2, 5014315, 1, 1, -61948, 0, [],
		[], -1, 1, [], 0, 501436, 0, 0, 0, 0, []},
	       {effect_play, 61, 9, 9, 8351402, 1, 0, 0, 204930, [],
		[], -1, 0, [], 0, 835142, 0, 0, 0, 0, []},
	       {effect_play, 62, 9, 2, 5014325, 1, 1, -61948, 0, [],
		[], -1, 1, [], 0, 501436, 0, 0, 0, 0, []},
	       {effect_play, 63, 9, 9, 8351402, 1, 0, 0, 204930, [],
		[], -1, 0, [], 0, 835142, 0, 0, 0, 0, []},
	       {effect_play, 64, 9, 9, 5014331, 1, 0, 0, 204930, [],
		[], -1, 0, [], 0, 501436, 0, 0, 0, 0, []},
	       {effect_play, 65, 2, 2, 5012401, 1, 0, 379, 379, [], [],
		-1, 0, [], 0, 501241, 0, 0, 0, 0, []}]}],
	    [{buff_play, 9, 31010, 2, 0, 2, 0, 0, 0, 25},
	     {buff_play, 9, 31020, 2, 0, 2, 0, 0, 0, 26},
	     {buff_play, 9, 31170, 999, 997, 3, 0, 0, 0, 8}],
	    0, []},
    Fun1 = fun (I) -> element(I rem 100 + 1, R) end,
    Fun2 = fun (I) -> tuple_size(R) > I rem 100 end,
    Fun3 = fun (I) -> erlang:append_element(R, I rem 100)
	   end,
    Fun4 = fun (_I) -> proto_200:convert_data(20004, Data)
	   end,
    ptester:run(N,
		[{"element", Fun1}, {"get_size", Fun2},
		 {"appand", Fun3}, {"convert", Fun4}]).

test_file(N) ->
    Fun1 = fun (I) ->
		   replay_hall_file:replay_info_path(I, true)
	   end,
    Fun2 = fun (I) ->
		   replay_hall_file:replay_info_path(I, false)
	   end,
    Fun3 = fun (I) ->
		   Path = replay_hall_file:replay_info_path(I, false),
		   filelib:is_file(Path)
	   end,
    Fun4 = fun (I) -> replay_hall_file:load_replay_info(I)
	   end,
    ptester:run(N,
		[{"file1", Fun1}, {"file2", Fun2}, {"file3", Fun3},
		 {"file4", Fun4}]).

test_date(N) ->
    Fun1 = fun (I) -> date:next_time_correction(I) end,
    ptester:run(N, [{"next_time_correction", Fun1}]).

write_file_log(N) ->
    {ok, F1} = file:open("file_1.log",
			 [append, raw, {delayed_write, 16 * 1024, 2}]),
    {ok, F2} = file:open("file_2.log",
			 [append, raw, {delayed_write, 16 * 1024, 2}]),
    Sample = #{"account_id" => <<"abp1">>,
	       "account_name" => <<"abp1">>,
	       "career" =>
		   <<229, 143, 172, 229, 148, 164, 229, 184, 136>>,
	       "carrier" => <<>>, "channel_name" => <<"demo">>,
	       "chr_id" => <<"1_gylocal_1">>, "chr_level" => 43,
	       "chr_level_vip" => 0,
	       "chr_name" =>
		   <<230, 154, 151, 228, 185, 139, 229, 135, 175, 228, 188,
		     138>>,
	       "date_time" => <<"2018-07-20 14:58:22">>,
	       "device_id" => <<"mac">>, "device_key" => <<>>,
	       "device_type" => <<"mac">>, "gameserver_no" => 1,
	       "gender" => <<230, 151, 160>>,
	       "header_type" => <<"virtual-items">>,
	       "info" =>
		   <<229, 137, 175, 230, 156, 172, 233, 162, 157, 229, 164,
		     150, 229, 165, 150, 229, 138, 177, 105, 100, 58, 50,
		     50>>,
	       "ip" => <<"192.168.2.113">>, "item_id" => 10102,
	       "item_name" =>
		   <<231, 178, 190, 231, 130, 188, 231, 159, 179>>,
	       "log_id" => 314,
	       "net_type" => <<230, 149, 176, 230, 141, 174>>,
	       "op_count" => 115, "os" => <<>>,
	       "platform_name" => <<"gylocal">>,
	       "product_name" => <<"sszg">>, "resolution" => <<>>,
	       "session_id" => <<"1_gylocal_1_1532066219_1">>,
	       "type_name" => <<229, 137, 175, 230, 156, 172>>,
	       "version" => <<"v1">>,
	       "info_1" =>
		   <<229, 137, 175, 230, 156, 172, 233, 162, 157, 229, 164,
		     150, 229, 165, 150, 229, 138, 177, 105, 100, 58, 50,
		     50>>,
	       "info_2" =>
		   <<229, 137, 175, 230, 156, 172, 233, 162, 157, 229, 164,
		     150, 229, 165, 150, 229, 138, 177, 105, 100, 58, 50,
		     50>>,
	       "info_3" =>
		   <<229, 137, 175, 230, 156, 172, 233, 162, 157, 229, 164,
		     150, 229, 165, 150, 229, 138, 177, 105, 100, 58, 50,
		     50>>,
	       "info_4" =>
		   <<229, 137, 175, 230, 156, 172, 233, 162, 157, 229, 164,
		     150, 229, 165, 150, 229, 138, 177, 105, 100, 58, 50,
		     50>>,
	       "info_5" =>
		   <<229, 137, 175, 230, 156, 172, 233, 162, 157, 229, 164,
		     150, 229, 165, 150, 229, 138, 177, 105, 100, 58, 50,
		     50>>,
	       "info_6" =>
		   <<229, 137, 175, 230, 156, 172, 233, 162, 157, 229, 164,
		     150, 229, 165, 150, 229, 138, 177, 105, 100, 58, 50,
		     50>>,
	       "info_7" =>
		   <<229, 137, 175, 230, 156, 172, 233, 162, 157, 229, 164,
		     150, 229, 165, 150, 229, 138, 177, 105, 100, 58, 50,
		     50>>,
	       "info_8" =>
		   <<229, 137, 175, 230, 156, 172, 233, 162, 157, 229, 164,
		     150, 229, 165, 150, 229, 138, 177, 105, 100, 58, 50,
		     50>>},
    EncodeFun = json:encoder([{utf8, true}]),
    Fun1 = fun (_Inc) ->
		   write_file_log_1(F1, EncodeFun, Sample)
	   end,
    Fun2 = fun (_Inc) -> write_file_log_2(F2, Sample) end,
    FunL = [{"write_1", Fun1}, {"write_2", Fun2}],
    ptester:run(N, FunL),
    file:close(F1),
    file:close(F2),
    ok.

write_file_log_1(_F, _EncodeFun,
		 #{"header_type" := <<"chat">>}) ->
    put(chat, true), true;
write_file_log_1(F, EncodeFun, Log) ->
    try Bin = util:fbin("~ts~n",
			[list_to_binary(EncodeFun({struct,
						   maps:to_list(Log)}))]),
	ok = file:write(F, Bin),
	true
    catch
      Type:Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidt266, _, {__Levelt266, __Tracest266}}
		when __Levelt266 band 8 /= 0 orelse
		       __Tracest266 /= [] ->
		lager:do_log(error,
			     [{module, t}, {function, write_file_log_1},
			      {line, 266}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("ERR===>Type:~w,Reason:~w",
					   [Type, Reason]),
			     none, 4096, 8, __Levelt266, __Tracest266,
			     lager_event, __Pidt266);
	    _ -> ok
	  end,
	  false
    end.

write_file_log_2(_F, #{"header_type" := <<"chat">>}) ->
    put(chat, true), true;
write_file_log_2(F, Log) ->
    case catch util:fbin("~ts~n",
			 [json:encode({struct, maps:to_list(Log)})])
	of
      Bin when is_binary(Bin) ->
	  case catch file:write(F, Bin) of
	    ok -> ok;
	    Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidt279, _, {__Levelt279, __Tracest279}}
		      when __Levelt279 band 8 /= 0 orelse
			     __Tracest279 /= [] ->
		      lager:do_log(error,
				   [{module, t}, {function, write_file_log_2},
				    {line, 279}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("写日志操作失败: ~w", [Err]), none,
				   4096, 8, __Levelt279, __Tracest279,
				   lager_event, __Pidt279);
		  _ -> ok
		end
	  end,
	  true;
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidt283, _, {__Levelt283, __Tracest283}}
		when __Levelt283 band 8 /= 0 orelse
		       __Tracest283 /= [] ->
		lager:do_log(error,
			     [{module, t}, {function, write_file_log_2},
			      {line, 283}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("err===>~w", [_Err]), none, 4096, 8,
			     __Levelt283, __Tracest283, lager_event, __Pidt283);
	    _ -> ok
	  end,
	  false
    end.

test_2(_, _, N) ->
    ets:insert(arena_champion_ext, {test, []}),
    Fun = fun ({K, V}) ->
		  L = arena_champion_lib:get_ext(test, []),
		  ets:insert(arena_champion_ext, {test, [{K, V} | L]})
	  end,
    [Fun({I, I * N}) || I <- lists:seq(1, 10)],
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidt294, _, {__Levelt294, __Tracest294}}
	  when __Levelt294 band 64 /= 0 orelse
		 __Tracest294 /= [] ->
	  lager:do_log(info,
		       [{module, t}, {function, test_2}, {line, 294},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("====~w",
				     [arena_champion_lib:get_ext(test, [])]),
		       none, 4096, 64, __Levelt294, __Tracest294, lager_event,
		       __Pidt294);
      _ -> ok
    end.

check_data() ->
    put(check_info, #{}),
    io:format("~ts",
	      [io_lib:format("============check_skill_data_start~n",
			     [])]),
    skill_data:check_skill_data(),
    io:format("~ts",
	      [io_lib:format("============check_skill_data_end~n",
			     [])]),
    io:format("~ts",
	      [io_lib:format("============check_unit_data_start~n",
			     [])]),
    unit_data:check_unit_data(),
    io:format("~ts",
	      [io_lib:format("============check_unit_data_end~n",
			     [])]),
    io:format("~ts",
	      [io_lib:format("============check_dungeon_data_start~n",
			     [])]),
    check_dungeon_data(),
    io:format("~ts",
	      [io_lib:format("============check_dungeon_data_end~n",
			     [])]),
    io:format("~ts",
	      [io_lib:format("============check_partner_data_start~n",
			     [])]),
    check_partner_data(),
    io:format("~ts",
	      [io_lib:format("============check_partner_data_end~n",
			     [])]),
    io:format("~ts",
	      [io_lib:format("============check_guild_dun_data_start~n",
			     [])]),
    check_guild_dun_data(),
    io:format("~ts",
	      [io_lib:format("============check_guild_dun_data_end~n",
			     [])]),
    io:format("~ts",
	      [io_lib:format("============check_holy_eqm_data_start~n",
			     [])]),
    check_holy_eqm_data(),
    io:format("~ts",
	      [io_lib:format("============check_holy_eqm_data_end~n",
			     [])]),
    io:format("~ts",
	      [io_lib:format("============check_robot_data_start~n",
			     [])]),
    check_robot_data(),
    io:format("~ts",
	      [io_lib:format("============check_robot_data_end~n",
			     [])]),
    io:format("~ts",
	      [io_lib:format("============check_holiday_data_start~n",
			     [])]),
    io:format("~ts",
	      [io_lib:format("============check_holiday_data_end~n",
			     [])]),
    erase(check_info),
    ok.

is_check_data(Key) ->
    Map = get(check_info),
    put(check_info, maps:put(Key, 1, Map)),
    maps:get(Key, Map, 0) =:= 0.

check_dungeon_data() ->
    [check_dungeon_data_chapter(I)
     || I <- dungeon_data:list_chapter(1)].

check_dungeon_data_chapter(ChapterId) ->
    [check_dungeon_data_id(Id)
     || Id <- dungeon_data:list({1, ChapterId})].

check_dungeon_data_id(DunId) ->
    #dungeon_data{unit_id = UnitId,
		  hook_unit_id = HookUnitId} =
	dungeon_data:get(DunId),
    unit_data:check_unit_data_id_scene(UnitId),
    unit_data:check_unit_data_id_scene(HookUnitId).

check_guild_dun_data() ->
    [check_guild_dun_data_f_id(I)
     || I <- guild_dun_data:get_all_fid()].

check_guild_dun_data_f_id(Fid) ->
    [check_guild_dun_data(Id)
     || {Id, _} <- guild_dun_data:get_boss_ids(Fid)].

check_guild_dun_data(BossId) ->
    UnitId = guild_dun_data:get_unit_id(BossId),
    unit_data:check_unit_data_id_scene(UnitId).

check_holiday_data() ->
    check_camp_id_repeat(holiday_role_data:all_son() ++
			   holiday_role_data:all_son2(),
			 #{}),
    put(check_holiday_data, #{}),
    [check_holiday_data_id(Id)
     || Id
	    <- holiday_role_data:all_son() ++
		 holiday_role_data:all_son2()].

check_camp_id_repeat([], IdMap) -> IdMap;
check_camp_id_repeat([Id | T], IdMap) ->
    case maps:get(Id, IdMap, 0) of
      0 -> check_camp_id_repeat(T, maps:put(Id, 1, IdMap));
      _ ->
	  logger:data_error("活动ID重复了:~w", [Id], t, 360),
	  check_camp_id_repeat(T, IdMap)
    end.

check_holiday_data_id(Id) ->
    case is_check_data({holiday, Id}) of
      true ->
	  case holiday_role_data:get_open(Id) of
	    #holiday{bid = Bid, start_time = StartTime,
		     end_time = EndTime} ->
		check_holiday_bid_time(Bid, StartTime, EndTime);
	    _ ->
		case holiday_role_data:get(Id) of
		  #holiday{bid = Bid, start_time = StartTime,
			   end_time = EndTime} ->
		      check_holiday_bid_time(Bid, StartTime, EndTime);
		  _ -> pass
		end
	  end;
      _ -> pass
    end.

check_holiday_bid_time(Bid, StartTime, EndTime) ->
    Map = get(check_holiday_data),
    case maps:get(Bid, Map, []) of
      List = [_ | _] ->
	  check_time(Bid, List, StartTime, EndTime);
      _ ->
	  put(check_holiday_data,
	      maps:put(Bid, [{StartTime, EndTime}], Map)),
	  pass
    end.

check_time(_Bid, [], _StartTime, _EndTime) -> pass;
check_time(Bid, [{ST, ET} | T], StartTime, EndTime) ->
    Map = get(check_holiday_data),
    case StartTime >= ST andalso StartTime =< ET orelse
	   EndTime >= ST andalso EndTime =< ET
	of
      true -> ok;
      _ ->
	  put(check_holiday_data,
	      maps:put(Bid, [{StartTime, EndTime}], Map)),
	  check_time(Bid, T, StartTime, EndTime)
    end.

check_adventure_data() -> check_adventure_data(1).

check_adventure_data(N) ->
    case adventure_data:get_floor(N) of
      D = #{init_evts := InitEvts, evt_list := EvtList} ->
	  [check_adventure_data_evt(EvtId) || EvtId <- InitEvts],
	  [check_adventure_data_evt(EvtId)
	   || {EvtId, _} <- EvtList],
	  [check_adventure_data_evt(EvtId)
	   || {_, EvtId} <- maps:get(pos_evt_list, D, [])],
	  check_adventure_data(N + 1);
      _ -> pass
    end.

check_adventure_data_evt(EvtId) ->
    case adventure_data:get_evt(EvtId) of
      #{evt_type := EvtType}
	  when EvtType =:= npc orelse EvtType =:= npc2 ->
	  case adventure_data:list_npc_talk(EvtId) of
	    [_ | _] -> pass;
	    _ ->
		logger:data_error("err_evt_id_not_npc_talk==~w",
				  [EvtId], t, 421)
	  end;
      _ -> pass
    end.

check_partner_data() ->
    [check_partner_data_id(Id)
     || Id <- partner_data:list()].

check_partner_data_id(Id) ->
    #partner_base_data{other_skills = SkillIds,
		       init_star = InitStar} =
	partner_data:get_base(Id),
    [skill_data:check_skill_data_id(SId)
     || SId <- SkillIds],
    Stars = partner_data:get_stars_by_bid(Id),
    Skills = partner_data:get_skills({Id,
				      lists:max(Stars)}),
    SkillIds1 = [begin
		   skill_data:check_skill_data_id(element(2, I)),
		   element(2, I)
		 end
		 || I <- Skills]
		  ++ SkillIds,
    OrderSkillIds = partner_data:get_skill_order({Id,
						  lists:max(Stars)}),
    case OrderSkillIds of
      [] -> logger:data_error("伙伴[~w]没有配置出招技能", [Id], t, 437);
      _ -> skip
    end,
    [catch check_skill_data_group(Group, SkillIds1,
				  {partner_data_skill_order, Id})
     || Group <- OrderSkillIds],
    case lists:member(InitStar, Stars) of
      true -> pass;
      _ ->
	  logger:data_error("伙伴[~w]初始星级[~w]存在问题:~w",
			    [Id, InitStar, Stars], t, 445)
    end.

check_skill_data_group(Group, SkillIds, From) ->
    case [SkillId
	  || SkillId <- SkillIds,
	     (skill_data:get_skill(SkillId))#skill_data.group ==
	       Group]
	of
      [SkillId | _] ->
	  skill_data:check_skill_data_active(SkillId, From);
      _ ->
	  logger:data_error("技能组[~w]不在所有技能~w中存在:~w",
			    [Group, SkillIds, From], t, 453)
    end.

check_holy_eqm_data() ->
    [check_holy_eqm_data(GroupId)
     || GroupId <- partner_holy_eqm_data:group_list()].

check_holy_eqm_data(GroupId) ->
    List = partner_holy_eqm_data:attr_rand_list(GroupId),
    AttrMaxL = partner_holy_eqm_data:get_group_max(GroupId),
    [check_holy_eqm_max_data(GroupId, D) || D <- AttrMaxL],
    [check_holy_eqm_rand_data(D, GroupId, AttrMaxL)
     || D <- List],
    ok.

check_holy_eqm_rand_data(#holy_eqm_attr_data{attr =
						 AttrId,
					     val_range = {MinVal, MaxVal}},
			 GroupId, AttrMaxL) ->
    case lists:keyfind(AttrId, 1, AttrMaxL) of
      _ when AttrId =:= undefined ->
	  logger:data_error("神装的~w随机库有不存在的技能", [GroupId], t, 469);
      {_, MaxLimit, _} ->
	  case MaxLimit >= MinVal andalso MaxLimit >= MaxVal of
	    true -> pass;
	    _ ->
		logger:data_error("神装的~w随机库~w属性有超出最大范围",
				  [GroupId, AttrId], t, 474)
	  end;
      _ ->
	  logger:data_error("神装的~w随机库~w属性没有配最大属性",
			    [GroupId, AttrId], t, 477)
    end;
check_holy_eqm_rand_data(_, GroupId, _) ->
    logger:data_error("神装的~w随机库中存在异常配置", [GroupId], t, 480).

check_holy_eqm_max_data(_, {_, _, 0}) -> pass;
check_holy_eqm_max_data(GroupId, {AttrId, _, 1}) ->
    logger:data_error("神装的~w随机库~w的属性允许可重复",
		      [GroupId, AttrId], t, 484);
check_holy_eqm_max_data(GroupId, _) ->
    logger:data_error("神装的~w随机库最大值里有错误配置", [GroupId], t,
		      486).

check_robot_data() ->
    [check_robot_data(Id) || Id <- robot_data:list()].

check_robot_data(Id) ->
    case robot_data:get(Id) of
      #{partners := Partners, formation := Formation,
	lev := Lev, face := Face} ->
	  Fun = fun (Info) ->
			case Info of
			  {PId, _, Star, _} ->
			      partner_data:get_skills({PId, Star}),
			      check_partner_data_id(PId);
			  {PId, _, Star, _, _} ->
			      partner_data:get_skills({PId, Star}),
			      check_partner_data_id(PId);
			  _Err ->
			      logger:data_error("err robot_id=~w err=~w",
						[Id, _Err], t, 502)
			end
		end,
	  [Fun(Data) || Data <- Partners];
      _ ->
	  logger:data_error("机器人配置数据存在异常:~w", [Id], t, 507), skip
    end.

resave_role(N) ->
    SrvId = <<"sygame_1">>,
    {ok, Min} =
	db:get_one("select min(rid) from role where srv_id "
		   "= ?",
		   [SrvId]),
    [spawn(fun () ->
		   do_resave_role(I, N, max(0, Min - 1) + I, SrvId)
	   end)
     || I <- lists:seq(1, N)].

do_resave_role(Idx, Max, Id, SrvId) ->
    put('@timer_idx', 1),
    put('@conn_pid', self()),
    case catch role_data:local_fetch(by_id, {Id, SrvId}) of
      {ok, normal, Role = #role{}} ->
	  {ok, NRole} = role_login:do(Role#role{link =
						    #link{conn_pid = self()}}),
	  role_data:save_base(NRole),
	  case Id rem 100 of
	    Idx ->
		io:format("doing,idx=~w, max=~w, id=~w~n",
			  [Idx, Max, Id]);
	    _ -> pass
	  end,
	  do_resave_role(Idx, Max, Id + Max, SrvId);
      _ ->
	  io:format("finish_num,idx=~w, max=~w, id=~w~n",
		    [Idx, Max, Id])
    end.

calc_partner() ->
    L = [{948, <<"symlf_152">>}, {625, <<"symlf_214">>},
	 {3157, <<"symlf_245">>}, {2291, <<"symlf_229">>},
	 {3698, <<"symlf_280">>}, {3052, <<"symlf_265">>},
	 {1275, <<"symlf_302">>}, {3428, <<"symlf_197">>},
	 {3170, <<"symlf_266">>}, {1302, <<"symlf_117">>},
	 {324, <<"symlf_51">>}, {1875, <<"symlf_302">>}],
    [calc_partner(I) || I <- L].

calc_partner({Rid, SrvId}) ->
    Ret = cluster_lib:call(SrvId, gm_tools, info,
			   [{Rid, SrvId}, func,
			    {partner_lib, gm_partner_num, [role]}]),
    io:format("~ts",
	      [io_lib:format("~w:~s ret=> ~p~n", [Rid, SrvId, Ret])]),
    {{Rid, SrvId}, Ret}.

str_match(S) ->
    re:run(S, "(\\w+)=([^\\s>]+)",
	   [unicode, {capture, [1, 2], list}, global]).

test_log() ->
    server_monitor:error_log({2, <<"测试"/utf8>>,
			      <<"测试内容"/utf8>>, t, 556, util:get_stacktrace()}).

kill_egd() ->
    io:format("~ts",
	      [io_lib:format("======~w~n",
			     [length(erlang:processes())])]),
    [kill_egd(Pid) || Pid <- erlang:processes()],
    io:format("~ts",
	      [io_lib:format("======~w~n",
			     [length(erlang:processes())])]),
    ok.

kill_egd(Pid) ->
    case erlang:process_info(Pid, current_function) of
      {current_function, {egd, loop, 1}} ->
	  io:format("~ts",
		    [io_lib:format("关掉验证码进程:~w~n", [Pid])]),
	  erlang:unlink(Pid),
	  egd:destroy(Pid),
	  ok;
      _ -> skip
    end.

gm_mail() ->
    case sys_env:get(gm_mail) of
      undefined ->
	  L = gm_mail_roles(),
	  [gm_mail(I) || I <- L],
	  sys_env:set(gm_mail, true);
      _ -> skip
    end.

gm_mail({Rid, SrvId, Items}) ->
    case sys_lib:is_local(SrvId) of
      true ->
	  mail:local_send({Rid, SrvId},
			  {lang:get(<<"每日礼包调整补偿公告"/utf8>>),
			   lang:get(<<"亲爱的冒险者大人：\n    因收到大量玩家反馈，希望将【每日礼包】调整回原有形式，我们于"
				      "2020年2月8日 17：15 对【每日礼包】活动及【英魂商店】活动进行了不停服调整更新。\n "
				      "   现将对<div fontcolor=#8b0715>在更新之前获取了【英魂之心】</"
				      "div>的用户进行活动奖励调整补偿，补偿规则如下：\n    <div "
				      "fontcolor=#8b0715>2020年2月8日 17：15之前</div>获取到【"
				      "英魂之心】的用户，将会根据<div fontcolor=#8b0715>更新时背包内所拥有"
				      "的【英魂之心】数量</div>按照<div fontcolor=#8b0715>1：100"
				      "的比例</div>，获得对应的钻石补偿\n    （例：小助手在更新时拥有8个【英魂之心】"
				      "，那么就会获取到 8*100 = 800钻石 的额外补偿，<div fontcolor=#"
				      "8b0715>【英魂之心】也不会被收回</div>）\n    附件是您所获得的补偿，请查"
				      "收确认。\n    \n    *<div fontcolor=#8b0715>注：由于数"
				      "据量较大，部分玩家可能存在发放延迟的情况，造成不便，还请谅解。</div>"/utf8>>),
			   [], Items, lang:get(<<"每日礼包调整补偿公告"/utf8>>)}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidt592, _, {__Levelt592, __Tracest592}}
		when __Levelt592 band 64 /= 0 orelse
		       __Tracest592 /= [] ->
		lager:do_log(info,
			     [{module, t}, {function, gm_mail}, {line, 592},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("gm_mail====~w,~s: ~w",
					   [Rid, SrvId, Items]),
			     none, 4096, 64, __Levelt592, __Tracest592,
			     lager_event, __Pidt592);
	    _ -> ok
	  end;
      _ -> skip
    end.

gm_mail_roles() -> [].


