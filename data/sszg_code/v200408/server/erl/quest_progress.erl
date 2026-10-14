-file("src/mod/quest/quest_progress.erl", 1).

-module(quest_progress).

-lager_records([{new_war_order_data,
		 [goal_id, period, quest_type, day, min_day, max_day,
		  min_lev, max_lev, status, condition, progress, award,
		  target_type]},
		{m_new_war_order,
		 [ver, period, period_day, period_lev, day_lev, week_lev,
		  start_time, end_time, rmb_status, quest_list, card,
		  lev_reward]},
		{holiday_return_new_feat_data,
		 [period, id, f_id, s_id, ref_day, progress, award]},
		{m_holiday_return_new,
		 [ver, period, start_time, end_time, gift_status,
		  sign_list, quest_list, exchange_day_list,
		  exchange_buy_list, free_draw_count, draw_count,
		  draw_info, draw_type_info, must_not, get_red_count,
		  red_packet_info, get_red_info, ext]},
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
		{m_home_pet,
		 [ver, name, id, rename_count, state, calc_time,
		  start_time, end_time, vigor, vigor_time, set_item,
		  next_evt_id, city, evt_list, do_evts, acc_evts,
		  fire_time, acc_out_time, acc_out_count, acc_items,
		  photos, diarys, day_talk, day_feed, photos_next_id,
		  diarys_next_id, photos_had]},
		{holiday_return_feat_data,
		 [period, id, f_id, s_id, ref_day, progress, award]},
		{m_holiday_return_feat,
		 [ver, quest_list, period, extra, old_data]},
		{m_holiday_return,
		 [ver, period, start_time, end_time, is_buy,
		  exchange_day_list, exchange_buy_list,
		  return_discount_buy_list, bind_code, bind_end_time,
		  bind_roleid, reward_list, old_data, bind_power,
		  bind_charge, partner_half]},
		{m_holiday_return_sign, [ver, status_list, login_day]},
		{room_rank_info,
		 [id, name, lev, face, avatar_bid, time, fans_num, rank,
		  look_id, face_update_time, face_file]},
		{room_fans_num, [id, fans]}, {room_fans, [myid, fid]},
		{room_bbs_message_below, [id, role_id, name, bbs_id]},
		{room_bbs_message,
		 [id, bbs_id, bbs_type, reply_name, reply_bbs_id,
		  reply_id, msg, time, tar_id, face_id, avatar_id, lev,
		  sex, name, face_update_time, face_file]},
		{room_honor_badges, [id, time]},
		{room_grow, [id, order, time, arge, ext]},
		{m_room_grow, [ver, finish, doing, info, next_id, ext]},
		{m_room_feat, [ver, flag, finish, doing, overdue, ext]},
		{m_room,
		 [ver, city_id, fanse_list, honor_badges, honor_point,
		  use_badges, room_bbs_set, room_bbs_num]},
		{war_order_data,
		 [goal_id, period, quest_type, day, min_day, max_day,
		  status, condition, lev, progress, award, target_type]},
		{m_war_order,
		 [ver, period, period_day, end_time, rmb_status,
		  exp_status, exp_num, quest_list, card, lev_reward]},
		{m_holiday_boss,
		 [ver, camp_id, count, buy_count, order_id, score,
		  boss_hp, boss_score, awards, old_info]},
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
		{holiday_lanterm_adventure_data,
		 [camp_id, id, f_id, s_id, ref_day, progress, award]},
		{m_lanterm_adventure3,
		 [ver, quest_list, camp_id, extra, old_data]},
		{m_lanterm_adventure2,
		 [ver, quest_list, camp_id, extra, old_data]},
		{m_lanterm_adventure1,
		 [ver, quest_list, camp_id, extra, old_data]},
		{m_lanterm_adventure,
		 [ver, quest_list, camp_id, extra, old_data]},
		{m_lanterm_festival,
		 [ver, all_count, all_num, award_list, camp_id, extra,
		  old_data]},
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
		{holiday_dial_rand_data,
		 [zid, id, name, award_type, item_id, item_num,
		  gold_rate, pro, limit_lev_min, limit_lev_max,
		  not_hit_in_m, not_hit_in_m_after, hit_when_m_after,
		  notice, notice_rank, limit_count]},
		{rand_data,
		 [rand_id, id, name, item_id, item_num, rare, pro,
		  limit_lev, not_hit_in_m, notice, limit_count,
		  max_count]},
		{dial_info,
		 [type, count, lucky, lucky_award, list, award_list,
		  day_award_list, frist_type, end_time, rand_lists,
		  pos_limit_count, item_limit_count]},
		{m_holiday_dial,
		 [ver, camp_id, award_list, num, count, list, logs, lev,
		  old_data]},
		{m_dial, [ver, info, reset_time]},
		{guild_quest_lev_data, [lev, exp, items, attr]},
		{guild_quest_data, [id, name, type, exp, progress]},
		{m_guild_quest,
		 [ver, lev, exp, day_exp, week_exp, list]},
		{grow_data,
		 [ver, day, goal_id, status, condition, lev, progress,
		  target_type]},
		{m_day_goals,
		 [ver, end_time, num, welfare_list, grow_list,
		  price_list, finish_list, period, charge, old_data,
		  period_day, new_grow_list, lev_reward, old_data2]},
		{m_days_rank, [ver, finish, doing, overdue]},
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
		{market_silver_draw_item,
		 [cell_id, base_id, num, rest, price, pcnt, attrs]},
		{market_silver_item_data,
		 [base_id, type, step, classes, min_lev, max_lev,
		  is_system, is_quest_need, def_price, min_price,
		  max_price, gain_label, open_lev, pre_base_id, pre_pcnt,
		  group, group_id, update_time, chain_type, fix_price,
		  make_pcnt, rand_num]},
		{market_silver_refresh,
		 [id, item_base_id, num, item_attrs, price, cell_id,
		  seller_id, status]},
		{market_silver_price,
		 [ver, item_base_id, price, sellers, deal_price,
		  recover_num, day_recover, day_auto, ext]},
		{market_silver_shop_cell,
		 [ver, cell_id, item_base_id, num, item_attrs, price,
		  expiry, sold_num, status, system_price, percent,
		  sale_time]},
		{market_silver_shop,
		 [ver, rid, max_cell_id, free_ids, cells, name, pid,
		  last_logout]},
		{m_market_silver,
		 [ver, refresh_time, is_first_on_sale, refresh]},
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
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{combat_drama,
		 [id, next, timeout, ts, winner, play_list, combat_list,
		  guide_list]},
		{item_reward_p, [bid, is_bind, num]},
		{assets_reward_p, [type, val]},
		{exp_reward_p,
		 [object_type, object_id, srv_id, career, sex, old_lev,
		  old_exp, new_lev, new_exp, is_die, assets_reward]},
		{combat_order_p, [pos, distance, group]},
		{skill_p, [skill_bid, end_round]},
		{fight_object_p,
		 [pos, group, owner_id, owner_srv_id, object_type,
		  object_id, object_bid, is_awake, star, object_name, sex,
		  career, lev, hp, hp_max, face_id, round, skills,
		  is_strong_partner, extra_data, camp_type, sprites]},
		{buff_play,
		 [target, buff_bid, end_round, remain_round, action_type,
		  change_type, change_value, is_dead, id, id2]},
		{sub_effect_play,
		 [sub_target, sub_effect_id, sub_hp_changed,
		  sub_distance, sub_is_hit, sub_skill_id, extra_effect]},
		{effect_play,
		 [order, actor, target, effect_bid, is_hit, is_crit,
		  hp_changed, hp, buff_list, summon_list, distance,
		  is_dead, sub_effect_play_list, is_blind,
		  skill_bid_of_effect, actor_hp_changed, actor_is_dead,
		  aid_actor, total_hurt, hurt_reward, camp_restrain]},
		{skill_play,
		 [order, actor, target, skill_bid, talk_pos,
		  talk_content, effect_play]},
		{mon_ai,
		 [bid, name, ai, is_loop, condition, rate, skill_target,
		  skill_id, talk_target, talk_content]},
		{combat_result,
		 [result, dead_monster_num, wave_num, dead_partner,
		  replay_id, a_stat_info, b_stat_info, end_type,
		  opponent_id, total_hurt, action_count, group_a_num,
		  hurt_statistics_a, curt_statistics_a, hurt_statistics,
		  replay_info, combat_pid, a_halo_dizzy_num,
		  a_max_num_def, a_control_info, a_kill_info,
		  a_continue_hurt, a_revive_info, a_dodge_count,
		  a_anti_kill_count, a_halo_kill_count, a_fire_buff_num,
		  hurt_statistics_b, curt_statistics_b, b_halo_dizzy_num,
		  b_max_num_def, b_control_info, b_kill_info,
		  b_continue_hurt, b_revive_info, b_dodge_count,
		  b_anti_kill_count, b_halo_kill_count, b_fire_buff_num,
		  is_balance, a_sprite_kill_count]},
		{partner_hurt,
		 [master_id, id, bid, star, lev, camp_type, dps, cure,
		  ext_data, be_hurt]},
		{combat,
		 [type, attack_list, defend_list, combat_roles,
		  formation, on_combat_begin, on_combat_end,
		  on_role_combat_end, state_end_time, round_countdown,
		  min_play_time, take_action, ext_args, wave, total_wave,
		  multi_wave_defend, combat_result, is_pause, combat_map,
		  combat_drama, target_role_name, is_combat_end, end_time,
		  begin_time, watching_roles, is_skip, round, is_robot,
		  select_buff_callback, terminate_func, attack_power,
		  defend_power, replay_info, other_arge]},
		{combat_buff,
		 [id, bid, actor, group, end_round, buff_result_type,
		  positive_or_negative, buff_result, join_num, can_reduce,
		  lev, probability, clean_when_dead, hit_count, is_show,
		  wave, group_pro]},
		{fight_object,
		 [master_id, master_pid, object_type, object_id,
		  object_bid, is_clone, is_auto, is_leader, host_bid,
		  object_name, is_awake, star, sex, career, lev, face_id,
		  hp, hp_max, pos, round, wave_round, distance,
		  rand_speed, init_attr, base_attr, fight_attr,
		  active_skills, passive_skills, skill_order, buff_list,
		  owner_id, passive_effects_of_skill, is_boss,
		  is_strong_partner, quality, initial_hp_max, extra_data,
		  awaken_type, camp_type, power, replay, hallows_looks,
		  sprites, guild_break_power]},
		{combat_role,
		 [id, pid, conn_pid, name, gid, gname, is_auto, is_ready,
		  is_play_over, is_offline, group, auto_watch_model, lev,
		  face_id, watching, is_load_map_finish]},
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
		{m_feat, [ver, finish, doing, overdue]},
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
		{pos,
		 [ver, srv_id, map_id, map_pid, map_bid, map_grid_pid,
		  last, hidden, x, y, dir]},
		{pos_history, [map_id, map_bid, srv_id, x, y]},
		{r_evt_partner_holy_eqpt, [cache]},
		{r_evt_guild_war_rank, [cache]},
		{r_evt_guild_dun_rank, [cache]},
		{r_evt_arena_like_number, [cache]},
		{r_evt_arena_firstrank_end, [cache]},
		{r_evt_arena_elite_end_rankget, [cache]},
		{r_evt_arena_elite_end_lev, [cache]},
		{r_evt_arena_elite_end_levget, [cache]},
		{r_evt_sky_ladder_end_rank, [cache]},
		{r_evt_championships_end_rank, [cache]},
		{r_evt_arena_cluster_rank, [cache]},
		{r_evt_arena_cluster_rankget, [cache]},
		{r_evt_friend_cluster_add, [cache]},
		{r_evt_friend_add, [cache]},
		{r_evt_room_liked, [cache]},
		{r_evt_hallows_rank, [cache]},
		{r_evt_build_guild, [cache]},
		{r_evt_join_guild, [cache]},
		{r_evt_first_partnerskill_learn, [cache]},
		{r_evt_partner_eqpt_item, [cache]},
		{r_evt_primus_first_fight_rank, [rank, cache]},
		{r_evt_primus_first_fight_pass, [rank, cache]},
		{r_evt_partner_get, [cache]},
		{r_evt_role_register_days, [cache]},
		{r_evt_expedition_pass, [cache]},
		{r_evt_endless_pass_light_dark, [round, cache]},
		{r_evt_endless_pass_wind, [round, cache]},
		{r_evt_endless_pass_fire, [round, cache]},
		{r_evt_endless_pass_water, [round, cache]},
		{r_evt_endless_pass, [round, cache]},
		{r_evt_star_tower_floor, [cache]},
		{r_evt_first_recruit, [cache]},
		{r_evt_hero_compose, [cache]},
		{r_evt_role_lev, [cache]},
		{r_evt_power, [power, cache]},
		{evt_guild_break_skill, []},
		{evt_holiday_arena_team_combat_win_count, []},
		{evt_holiday_arena_team_combat_count, []},
		{evt_holiday_arena_team_join_team, []},
		{evt_holiday_arena_team_lev_up, []},
		{evt_enter_holiday_arena_team, []}, {evt_skin, []},
		{evt_nian_fight_gold_monster, []},
		{evt_nian_firework, []}, {evt_nian_red_packet, []},
		{evt_nian_fight_big_monster, []},
		{evt_nian_fight_monster, []}, {evt_enter_nian, []},
		{evt_planes_kill_guard, []}, {evt_planes_pass, []},
		{evt_enter_secret_pass, [dun_id]},
		{evt_enter_secret_treasure, []},
		{evt_enter_secret_loan, []},
		{evt_enter_secret_reply, []},
		{evt_enter_secret_kill_monster2, [count]},
		{evt_enter_secret_kill_monster, []},
		{evt_enter_secret_dun, []},
		{evt_monopoly_kill_boss, []},
		{evt_monopoly_dungeon, []}, {evt_monopoly_dice, [type]},
		{evt_monopoly_develop, [stage_id, develop]},
		{evt_enter_monopoly, []}, {evt_sprite_tree, []},
		{evt_sprite_set_pos, []},
		{evt_sprite_hatch_expedite, []}, {evt_sprite_hatch, []},
		{evt_sprite_compound, []},
		{evt_guild_secret_area_combat, [count]},
		{evt_arena_team_double_kill, []},
		{evt_arena_team_defense_success, [count]},
		{evt_arena_team_join, [count]},
		{evt_arena_team_season_found_team, [count]},
		{evt_arena_team_last, [count]},
		{evt_arena_team_first, [count]},
		{evt_arena_team_season_one, [count]},
		{evt_arena_team_season_five, [count]},
		{evt_arena_team_two_win, [count]},
		{evt_arena_team_leader_join, [count]},
		{evt_arena_team_win, [count]},
		{evt_arena_use_sprite, [bids, result]},
		{evt_appoint_sprite_compound, [bids]},
		{evt_appoint_sprite, [bids]},
		{evt_recruit_lottery, [count]},
		{evt_sprite_lottery, [count]},
		{evt_elite_recruit_info, [partner_infos]},
		{evt_elite_recruit, [count]},
		{evt_normal_recruit, [count]},
		{evt_donate_sweet_score, [count]},
		{evt_use_petard, [count]}, {evt_petard_score, [count]},
		{evt_petard_send_red_packet, [count]},
		{evt_petard_red_packet, [count]},
		{evt_petard_firework, [count]},
		{evt_petard_meteor, [count]}, {evt_get_gold, [count]},
		{evt_get_friend_point, [count]},
		{evt_arena_cluster_champion_bet, [count]},
		{evt_get_hook_count, [count]},
		{evt_recruit_convert, [count]},
		{evt_partner_dungeon_stone_win, [count]},
		{evt_element_temple_win, [count]},
		{evt_dun_heaven_win, [count]},
		{evt_arena_elite_combat_count, [count]},
		{evt_holy_eqm_ref, [count]},
		{evt_holy_eqm_lottery, [count]},
		{evt_mystery_mall_buy, [count]},
		{evt_add_friend, [count]},
		{evt_term_beigns_boss, [count]},
		{evt_term_beigns_paper, [count]},
		{evt_term_beigns_win_order, [difficulty]},
		{evt_term_beigns_order, [count]},
		{evt_resonate_levup, []}, {evt_extract_award, []},
		{evt_extract_start, []}, {evt_get_furniture, [num]},
		{evt_travel_time, [time]}, {evt_get_speciality, []},
		{evt_cluster_champion_join, []},
		{evt_cluster_champion_sub_count, []},
		{evt_hallows_refine, [lev]}, {evt_mine_owned, []},
		{evt_mine_combat, []}, {evt_mine_buy_miner, []},
		{evt_mine_save_defense, []},
		{evt_enter_adventure_mine, []},
		{evt_home_pet_set_items, []}, {evt_home_soft, [soft]},
		{evt_rename_home, []}, {evt_gain_home_coin, []},
		{evt_worship, [type]}, {evt_visit_home, []},
		{evt_enter_home, []}, {evt_first_enter_home, []},
		{evt_partnerskill_learn, [lev]},
		{evt_combat_balance, []},
		{evt_arena_cluster_end_rank, [rank]},
		{evt_arena_cluster_win, []},
		{evt_dun_heaven_perfectpass, [chapter_id]},
		{evt_combat_over,
		 [hurt_statistics_a, curt_statistics_a, combat_type,
		  continue_hurt, anti_kill_num, halo_kill_num,
		  revive_info, dodge_count, max_fire_num,
		  sprite_kill_num]},
		{evt_combat_pvp_over,
		 [round, atk_power, def_power, halo_dizzy_num, result,
		  hp_info, max_num_diff, kill_info, dizzy_info]},
		{evt_element_temple_end_rank, [rank]},
		{evt_element_temple_pass, [round]},
		{evt_replay_hall_watch, []}, {evt_honor_share, []},
		{evt_grow_share, []}, {evt_replay_share, []},
		{evt_replay_hall_like, []},
		{evt_recruit_trial_partner, [bid]},
		{evt_pass_holiday_boss_new, [id, difficulty]},
		{evt_fight_holiday_boss_new, []},
		{evt_holiday_boss_get_score, []},
		{evt_pass_holiday_boss, [id]},
		{evt_fight_holiday_boss, []},
		{evt_holiday_break_egg, [count]},
		{evt_arena_elite_end_rank, [rank]},
		{evt_arena_elite_end_lev, [lev, score]},
		{evt_arena_elite_champion, [combat_type]},
		{evt_arena_elite_win_count, []},
		{evt_arena_elite_cont_win, [count]},
		{evt_arena_elite_rank, [rank]},
		{evt_sky_ladder_win, []},
		{evt_sky_ladder_end_rank, [rank]},
		{evt_sky_ladder_rank, [rank]},
		{evt_cluster_championships_end_rank, [rank]},
		{evt_championships_end_rank, [rank]},
		{evt_championships_32, []},
		{evt_cluster_championships_takepartin, []},
		{evt_peak_championships_takepartin, []},
		{evt_peak_championships_end_rank, [rank]},
		{evt_peak_championships_bet_cont_win_season, [count]},
		{evt_cluster_championships_bet_cont_win_day, [count]},
		{evt_championships_bet_cont_win_day, [count]},
		{evt_championships_bet_cont_win, [count]},
		{evt_championships_bet_win, []},
		{evt_championships_bet, []},
		{evt_cross_server_ladder, []},
		{evt_adventure_floor_count, []},
		{evt_holiday_make_dumplings, [count]},
		{evt_expedition_fight_count, [id, count]},
		{evt_artifact_compose_quality, [id]},
		{evt_artifact_recast_skills, [skills]},
		{evt_artifact_recast, []},
		{evt_hallows_step_intensify, []},
		{evt_adventure_item_expend_count, [id]},
		{evt_partner_add_new, [star]},
		{evt_equipment_compound, [count]},
		{evt_adventure_trade_count, []},
		{evt_adventure_treasure_open, []},
		{evt_partner_advance, []},
		{evt_adventure_boss_fight_count, []},
		{evt_artifact_compose, []}, {evt_primus_fight, []},
		{evt_expedition_open_box, []},
		{evt_expedition_fight,
		 [round, difficulty, count, is_rank]},
		{evt_eqm_compound, []}, {evt_mystery_buy, [type]},
		{evt_guild_war, []}, {evt_guild_quest_lev, [lev]},
		{evt_hook_time, []},
		{evt_loss_hallows_essence, [count]},
		{evt_dial, [count]}, {evt_guild_dun_buff, []},
		{evt_exchange, [type]}, {evt_guild_skill, []},
		{evt_partner_stone_all_lv, []}, {evt_stone_all_lv, []},
		{evt_hallows_step, []}, {evt_hallows_all_step, []},
		{evt_hallows_activate, [id]}, {evt_escort_fight, []},
		{evt_escort_enter, []},
		{evt_guild_war_join_and_win, []},
		{evt_guild_war_top, [rank]}, {evt_guild_war_join, []},
		{evt_shipping_refresh, []}, {evt_shipping, [quality]},
		{evt_dungeon_stone_fight, [type]},
		{evt_valentine_boss, []}, {evt_endless_appoint, []},
		{evt_endless_pass_light_dark, [round]},
		{evt_endless_pass_wind, [round]},
		{evt_endless_pass_fire, [round]},
		{evt_endless_pass_water, [round]},
		{evt_endless_pass, [round]}, {evt_endless_fight, []},
		{evt_guild_redpacket_best, []},
		{evt_guild_red_packet_reward, [type]},
		{evt_guild_mem_red_packet_price,
		 [type, max_val, assets]},
		{evt_guild_mem_red_packet_send, [type]},
		{evt_formation_level_up, [lev]},
		{evt_formation_open, []},
		{evt_star_natal_level_up, [natal]},
		{evt_star_level_up, []}, {evt_star_natal, []},
		{evt_star_divination, [type, count]},
		{evt_world_boss_fight_ko, []},
		{evt_world_boss_fight, []},
		{evt_boss_fight_result, [result, boss_id]},
		{evt_boss_fight, []},
		{evt_adventure_use_partner, [bids]},
		{evt_adventure_kill_mon, []},
		{evt_adventure_answer_all_right, []},
		{evt_adventure_room_finish, [evt_id, room_id]},
		{evt_adventure_box, [items]},
		{evt_adventure_finger_guessing, [result]},
		{evt_adventure_goto_floor, [id]},
		{evt_adventure_plunder_result, [result]},
		{evt_adventure_plunder, [status]},
		{evt_star_tower_floor_pass, []},
		{evt_adventure_explore, [num]}, {evt_say, [channel]},
		{evt_market_silver_buy, [price, num]},
		{evt_market_silver_sold, [assets, sold_items]},
		{evt_market_coin_sold, [base_id, price, num]},
		{evt_market_gold_buy, [assets, price, num]},
		{evt_market_silver_first_on_sale, []},
		{evt_eqm_sell, []}, {evt_login_days_reward, [day]},
		{evt_recruit_high, [group, count]},
		{evt_recruit, [group, count, partner_infos]},
		{evt_arena_use_partner, [bids, result]},
		{evt_arena_score2, [score]}, {evt_arena_score, [score]},
		{evt_arena_score_lev, [score_lev]},
		{evt_arena_rank, [rank]},
		{evt_arena_fight_result, [result, use_sprite]},
		{evt_arena_fight, []}, {evt_checkin, [now]},
		{evt_guild_dun_damage, [dps]},
		{evt_guild_dun_fight_ko, [boss_id]},
		{evt_guild_dun_fight, [count, boss_id]},
		{evt_partner_decompose, [count, star]},
		{evt_partner_artifact, []}, {evt_partner_eqm, []},
		{evt_partner_enchant_eqm, [count]},
		{evt_partner_levelup, [bid, lev]}, {evt_partner, [ext]},
		{evt_add_new_partner_bi_bid, [bid, star]},
		{evt_partner_star_up_specific, [bid, star]},
		{evt_partner_star_up, [bid, star]},
		{evt_partner_star, [star]},
		{evt_holiday, [camp_id, bid]}, {evt_invest, [type]},
		{evt_power, [combat_type]},
		{evt_guild_donate_expend, [type, loss]},
		{evt_guild_donate, [type]}, {evt_guild_join, []},
		{evt_combat_drama, [type, step, round, base_ids, ext]},
		{evt_combat_start, [fid, type, ext]},
		{evt_friend_present, [base_id, val]},
		{evt_gain_partner, [partners]}, {evt_friend_sns, []},
		{evt_friend_cluster, [num]}, {evt_friend, [num]},
		{evt_star_tower_pass, [tower]},
		{evt_enter_adventure, [floor, room_id, evt_id]},
		{evt_dungeon_fast_combat, []},
		{evt_dungeon_auto, [count]},
		{evt_dungeon_make, [dun_id]},
		{evt_dungeon_pass, [type, dungeon_id, info]},
		{evt_dungeon_enter, [type, count, info]},
		{holy_eqm_frist_open, []},
		{evt_finish_guide, [base_id]},
		{evt_broadcast_drama, [base_id]},
		{evt_move_map, [base_id, x, y]},
		{evt_leave_map, [id, base_id, x, y]},
		{evt_enter_map, [id, base_id, x, y]},
		{evt_cli_loaded, [mod]}, {evt_zero_push, []},
		{evt_loss_assets, [id, val]}, {evt_loss_guild, [val]},
		{evt_gain_guild, [val]}, {evt_gain_activity, [val]},
		{evt_loss_hero_soul, [val]}, {evt_loss_energy, [val]},
		{evt_gain_energy, [val]},
		{evt_loss_red_gold_or_gold, [val]},
		{evt_loss_red_gold, [val]}, {evt_gain_red_gold, [val]},
		{evt_loss_gold, [val]}, {evt_gain_gold, [val]},
		{evt_loss_silver_coin, [val]},
		{evt_loss_hero_exp, [val]},
		{evt_gain_silver_coin, [val]}, {evt_loss_coin, [val]},
		{evt_gain_coin, [val]},
		{evt_fight_unit, [id, base_id, host_base_id, num]},
		{evt_kill_npc_lose, [id, base_id, host_base_id, num]},
		{evt_kill_npc, [id, base_id, host_base_id, num]},
		{evt_combat_lose, [type]}, {evt_combat_win, [type]},
		{evt_giveup_quest, [id]}, {evt_finish_quest, [id]},
		{evt_commit_quest, [id, type]},
		{evt_accept_quest, [id]}, {evt_use_item_type, [type]},
		{evt_use_item, [base_id, num]},
		{evt_del_item, [base_id, num]},
		{evt_get_item, [base_id, num]},
		{evt_unit_click, [id, type, base_id, do_type]},
		{evt_levup, [old_lev, lev]}, {evt_convert, []},
		{evt_charge_acc, [gold]}, {evt_pay_acc, [gold]},
		{evt_recruit_high_gift, [count, info]},
		{evt_high_recruit, [count, info]},
		{evt_pay, [gold, info]}, {evt_charge_fund, []},
		{evt_charge_invest, []}, {evt_month_card, [type]},
		{evt_name, []}, {evt_create, []},
		{trigger, [id, label, m, f, type, a]},
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

-export([event/7, monitor_event/8, remove_monitor/4,
	 monitor_quest_prog/4]).

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

-file("src/mod/quest/quest_progress.erl", 15).

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

-file("src/mod/quest/quest_progress.erl", 16).

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

-file("src/mod/quest/quest_progress.erl", 17).

-file("inc/trigger.hrl", 1).

-record(trigger,
	{id = 1  :: pos_integer(), label  :: atom(),
	 m  :: undefined | atom(), f  :: function() | atom(),
	 type = 0  :: non_neg_integer(), a = []  :: list()}).

-record(evt_create, {}).

-record(evt_name, {}).

-record(evt_month_card, {type = 0}).

-record(evt_charge_invest, {}).

-record(evt_charge_fund, {}).

-record(evt_pay, {gold = 0, info = #{}}).

-record(evt_high_recruit, {count = 0, info = #{}}).

-record(evt_recruit_high_gift, {count = 0, info = #{}}).

-record(evt_pay_acc, {gold = 0}).

-record(evt_charge_acc, {gold = 0}).

-record(evt_convert, {}).

-record(evt_levup,
	{old_lev = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer()}).

-record(evt_unit_click,
	{id = 0  :: non_neg_integer(),
	 type = 0  :: non_neg_integer(),
	 base_id = 0  :: non_neg_integer(),
	 do_type = -1  :: integer()}).

-record(evt_get_item,
	{base_id = 1  :: pos_integer(),
	 num = 1  :: pos_integer()}).

-record(evt_del_item,
	{base_id  :: pos_integer(), num = 0  :: pos_integer()}).

-record(evt_use_item,
	{base_id  :: pos_integer(), num = 0  :: pos_integer()}).

-record(evt_use_item_type,
	{type = 0  :: non_neg_integer()}).

-record(evt_accept_quest, {id = 0  :: pos_integer()}).

-record(evt_commit_quest,
	{id = 0  :: pos_integer(), type = 0}).

-record(evt_finish_quest, {id = 0  :: pos_integer()}).

-record(evt_giveup_quest, {id = 0  :: pos_integer()}).

-record(evt_combat_win, {type = 0}).

-record(evt_combat_lose, {type = 0}).

-record(evt_kill_npc,
	{id = 0  :: non_neg_integer(),
	 base_id = 1  :: pos_integer(),
	 host_base_id = 1  :: pos_integer(),
	 num = 1  :: pos_integer()}).

-record(evt_kill_npc_lose,
	{id = 0  :: non_neg_integer(),
	 base_id = 1  :: pos_integer(),
	 host_base_id = 1  :: pos_integer(),
	 num = 1  :: pos_integer()}).

-record(evt_fight_unit,
	{id = 0  :: non_neg_integer(),
	 base_id = 1  :: pos_integer(),
	 host_base_id = 1  :: pos_integer(),
	 num = 1  :: pos_integer()}).

-record(evt_gain_coin, {val = 1  :: pos_integer()}).

-record(evt_loss_coin, {val = 1  :: pos_integer()}).

-record(evt_gain_silver_coin,
	{val = 1  :: pos_integer()}).

-record(evt_loss_hero_exp, {val = 1  :: pos_integer()}).

-record(evt_loss_silver_coin,
	{val = 1  :: pos_integer()}).

-record(evt_gain_gold, {val = 1  :: pos_integer()}).

-record(evt_loss_gold, {val = 1  :: pos_integer()}).

-record(evt_gain_red_gold, {val = 1  :: pos_integer()}).

-record(evt_loss_red_gold, {val = 1  :: pos_integer()}).

-record(evt_loss_red_gold_or_gold,
	{val = 1  :: pos_integer()}).

-record(evt_gain_energy, {val = 1  :: pos_integer()}).

-record(evt_loss_energy, {val = 1  :: pos_integer()}).

-record(evt_loss_hero_soul,
	{val = 1  :: pos_integer()}).

-record(evt_gain_activity, {val = 0}).

-record(evt_gain_guild, {val = 0}).

-record(evt_loss_guild, {val = 0}).

-record(evt_loss_assets, {id = 0, val = 0}).

-record(evt_zero_push, {}).

-record(evt_cli_loaded,
	{mod = 0  :: non_neg_integer()}).

-record(evt_enter_map,
	{id = 1  :: pos_integer(),
	 base_id = 1  :: pos_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer()}).

-record(evt_leave_map,
	{id = 1  :: pos_integer(),
	 base_id = 1  :: pos_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer()}).

-record(evt_move_map,
	{base_id = 1  :: non_neg_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer()}).

-record(evt_broadcast_drama, {base_id = 0}).

-record(evt_finish_guide, {base_id = 0}).

-record(holy_eqm_frist_open, {}).

-record(evt_dungeon_enter,
	{type = 0, count = 0, info = #{}}).

-record(evt_dungeon_pass,
	{type = 0, dungeon_id = 0, info = #{}}).

-record(evt_dungeon_make, {dun_id = 0}).

-record(evt_dungeon_auto, {count = 0}).

-record(evt_dungeon_fast_combat, {}).

-record(evt_enter_adventure,
	{floor = 0, room_id = 0, evt_id = 0}).

-record(evt_star_tower_pass, {tower = 0}).

-record(evt_friend, {num = 0}).

-record(evt_friend_cluster, {num = 0}).

-record(evt_friend_sns, {}).

-record(evt_gain_partner, {partners = []}).

-record(evt_friend_present, {base_id = 0, val = 0}).

-record(evt_combat_start, {fid, type, ext = #{}}).

-record(evt_combat_drama,
	{type = 0, step, round = 0, base_ids = [], ext = []}).

-record(evt_guild_join, {}).

-record(evt_guild_donate, {type = 0}).

-record(evt_guild_donate_expend, {type = 0, loss = []}).

-record(evt_power, {combat_type = 0}).

-record(evt_invest, {type = 0}).

-record(evt_holiday, {camp_id = 0, bid = 0}).

-record(evt_partner_star, {star = 0}).

-record(evt_partner_star_up, {bid = 0, star = 0}).

-record(evt_partner_star_up_specific,
	{bid = 0, star = 0}).

-record(evt_add_new_partner_bi_bid,
	{bid = 0, star = 0}).

-record(evt_partner, {ext = #{}}).

-record(evt_partner_levelup, {bid = 0, lev = 0}).

-record(evt_partner_enchant_eqm, {count}).

-record(evt_partner_eqm, {}).

-record(evt_partner_artifact, {}).

-record(evt_partner_decompose, {count = 0, star = 0}).

-record(evt_guild_dun_fight, {count, boss_id}).

-record(evt_guild_dun_fight_ko, {boss_id}).

-record(evt_guild_dun_damage, {dps = 0}).

-record(evt_checkin, {now = 0}).

-record(evt_arena_fight, {}).

-record(evt_arena_fight_result,
	{result, use_sprite = 0}).

-record(evt_arena_rank, {rank}).

-record(evt_arena_score_lev, {score_lev}).

-record(evt_arena_score, {score}).

-record(evt_arena_score2, {score}).

-record(evt_arena_use_partner, {bids = [], result = 0}).

-record(evt_recruit,
	{group = 0, count = 0, partner_infos = []}).

-record(evt_recruit_high, {group = 0, count = 0}).

-record(evt_login_days_reward, {day = 0}).

-record(evt_eqm_sell, {}).

-record(evt_market_silver_first_on_sale, {}).

-record(evt_market_gold_buy, {assets, price, num}).

-record(evt_market_coin_sold,
	{base_id = 0, price = 0, num}).

-record(evt_market_silver_sold,
	{assets = [], sold_items = []}).

-record(evt_market_silver_buy, {price, num = 0}).

-record(evt_say, {channel}).

-record(evt_adventure_explore, {num = 0}).

-record(evt_star_tower_floor_pass, {}).

-record(evt_adventure_plunder, {status}).

-record(evt_adventure_plunder_result, {result}).

-record(evt_adventure_goto_floor, {id}).

-record(evt_adventure_finger_guessing, {result}).

-record(evt_adventure_box, {items = []}).

-record(evt_adventure_room_finish,
	{evt_id = 0, room_id = 0}).

-record(evt_adventure_answer_all_right, {}).

-record(evt_adventure_kill_mon, {}).

-record(evt_adventure_use_partner, {bids = []}).

-record(evt_boss_fight, {}).

-record(evt_boss_fight_result, {result, boss_id}).

-record(evt_world_boss_fight, {}).

-record(evt_world_boss_fight_ko, {}).

-record(evt_star_divination, {type, count}).

-record(evt_star_natal, {}).

-record(evt_star_level_up, {}).

-record(evt_star_natal_level_up, {natal}).

-record(evt_formation_open, {}).

-record(evt_formation_level_up, {lev}).

-record(evt_guild_mem_red_packet_send, {type = 0}).

-record(evt_guild_mem_red_packet_price,
	{type = 0, max_val = 0, assets = 0}).

-record(evt_guild_red_packet_reward, {type = 0}).

-record(evt_guild_redpacket_best, {}).

-record(evt_endless_fight, {}).

-record(evt_endless_pass, {round = 0}).

-record(evt_endless_pass_water, {round = 0}).

-record(evt_endless_pass_fire, {round = 0}).

-record(evt_endless_pass_wind, {round = 0}).

-record(evt_endless_pass_light_dark, {round = 0}).

-record(evt_endless_appoint, {}).

-record(evt_valentine_boss, {}).

-record(evt_dungeon_stone_fight, {type = 0}).

-record(evt_shipping, {quality = 0}).

-record(evt_shipping_refresh, {}).

-record(evt_guild_war_join, {}).

-record(evt_guild_war_top, {rank = 0}).

-record(evt_guild_war_join_and_win, {}).

-record(evt_escort_enter, {}).

-record(evt_escort_fight, {}).

-record(evt_hallows_activate, {id = 0}).

-record(evt_hallows_all_step, {}).

-record(evt_hallows_step, {}).

-record(evt_stone_all_lv, {}).

-record(evt_partner_stone_all_lv, {}).

-record(evt_guild_skill, {}).

-record(evt_exchange, {type = 0}).

-record(evt_guild_dun_buff, {}).

-record(evt_dial, {count = 0}).

-record(evt_loss_hallows_essence, {count = 0}).

-record(evt_hook_time, {}).

-record(evt_guild_quest_lev, {lev = 0}).

-record(evt_guild_war, {}).

-record(evt_mystery_buy, {type = 0}).

-record(evt_eqm_compound, {}).

-record(evt_expedition_fight,
	{round = 0, difficulty = 0, count = 1, is_rank = 1}).

-record(evt_expedition_open_box, {}).

-record(evt_primus_fight, {}).

-record(evt_artifact_compose, {}).

-record(evt_adventure_boss_fight_count, {}).

-record(evt_partner_advance, {}).

-record(evt_adventure_treasure_open, {}).

-record(evt_adventure_trade_count, {}).

-record(evt_equipment_compound, {count = 0}).

-record(evt_partner_add_new, {star = 0}).

-record(evt_adventure_item_expend_count, {id = 0}).

-record(evt_hallows_step_intensify, {}).

-record(evt_artifact_recast, {}).

-record(evt_artifact_recast_skills, {skills = []}).

-record(evt_artifact_compose_quality, {id = 0}).

-record(evt_expedition_fight_count,
	{id = 0, count = 1}).

-record(evt_holiday_make_dumplings, {count = 0}).

-record(evt_adventure_floor_count, {}).

-record(evt_cross_server_ladder, {}).

-record(evt_championships_bet, {}).

-record(evt_championships_bet_win, {}).

-record(evt_championships_bet_cont_win, {count = 0}).

-record(evt_championships_bet_cont_win_day,
	{count = 0}).

-record(evt_cluster_championships_bet_cont_win_day,
	{count = 0}).

-record(evt_peak_championships_bet_cont_win_season,
	{count = 0}).

-record(evt_peak_championships_end_rank, {rank = 0}).

-record(evt_peak_championships_takepartin, {}).

-record(evt_cluster_championships_takepartin, {}).

-record(evt_championships_32, {}).

-record(evt_championships_end_rank, {rank = 0}).

-record(evt_cluster_championships_end_rank, {rank = 0}).

-record(evt_sky_ladder_rank, {rank = 0}).

-record(evt_sky_ladder_end_rank, {rank = 0}).

-record(evt_sky_ladder_win, {}).

-record(evt_arena_elite_rank, {rank = 0}).

-record(evt_arena_elite_cont_win, {count = 0}).

-record(evt_arena_elite_win_count, {}).

-record(evt_arena_elite_champion, {combat_type = 0}).

-record(evt_arena_elite_end_lev, {lev = 0, score = 0}).

-record(evt_arena_elite_end_rank, {rank = 0}).

-record(evt_holiday_break_egg, {count = 0}).

-record(evt_fight_holiday_boss, {}).

-record(evt_pass_holiday_boss, {id = 0}).

-record(evt_holiday_boss_get_score, {}).

-record(evt_fight_holiday_boss_new, {}).

-record(evt_pass_holiday_boss_new,
	{id = 0, difficulty = 0}).

-record(evt_recruit_trial_partner, {bid = 0}).

-record(evt_replay_hall_like, {}).

-record(evt_replay_share, {}).

-record(evt_grow_share, {}).

-record(evt_honor_share, {}).

-record(evt_replay_hall_watch, {}).

-record(evt_element_temple_pass, {round = 0}).

-record(evt_element_temple_end_rank, {rank = 0}).

-record(evt_combat_pvp_over,
	{round = 0, atk_power, def_power, halo_dizzy_num = 0,
	 result, hp_info, max_num_diff, kill_info, dizzy_info}).

-record(evt_combat_over,
	{hurt_statistics_a = [], curt_statistics_a = [],
	 combat_type = 0, continue_hurt = [], anti_kill_num = 0,
	 halo_kill_num = 0, revive_info = [], dodge_count = 0,
	 max_fire_num = 0, sprite_kill_num = 0}).

-record(evt_dun_heaven_perfectpass, {chapter_id = 0}).

-record(evt_arena_cluster_win, {}).

-record(evt_arena_cluster_end_rank, {rank = 0}).

-record(evt_combat_balance, {}).

-record(evt_partnerskill_learn, {lev = 0}).

-record(evt_first_enter_home, {}).

-record(evt_enter_home, {}).

-record(evt_visit_home, {}).

-record(evt_worship, {type = 0}).

-record(evt_gain_home_coin, {}).

-record(evt_rename_home, {}).

-record(evt_home_soft, {soft = 0}).

-record(evt_home_pet_set_items, {}).

-record(evt_enter_adventure_mine, {}).

-record(evt_mine_save_defense, {}).

-record(evt_mine_buy_miner, {}).

-record(evt_mine_combat, {}).

-record(evt_mine_owned, {}).

-record(evt_hallows_refine, {lev = 0}).

-record(evt_cluster_champion_sub_count, {}).

-record(evt_cluster_champion_join, {}).

-record(evt_get_speciality, {}).

-record(evt_travel_time, {time = 0}).

-record(evt_get_furniture, {num = 0}).

-record(evt_extract_start, {}).

-record(evt_extract_award, {}).

-record(evt_resonate_levup, {}).

-record(evt_term_beigns_order, {count = 0}).

-record(evt_term_beigns_win_order, {difficulty = 0}).

-record(evt_term_beigns_paper, {count = 0}).

-record(evt_term_beigns_boss, {count = 0}).

-record(evt_add_friend, {count = 0}).

-record(evt_mystery_mall_buy, {count = 0}).

-record(evt_holy_eqm_lottery, {count = 0}).

-record(evt_holy_eqm_ref, {count = 0}).

-record(evt_arena_elite_combat_count, {count = 0}).

-record(evt_dun_heaven_win, {count = 0}).

-record(evt_element_temple_win, {count = 0}).

-record(evt_partner_dungeon_stone_win, {count = 0}).

-record(evt_recruit_convert, {count = 0}).

-record(evt_get_hook_count, {count = 0}).

-record(evt_arena_cluster_champion_bet, {count = 0}).

-record(evt_get_friend_point, {count = 0}).

-record(evt_get_gold, {count = 0}).

-record(evt_petard_meteor, {count = 0}).

-record(evt_petard_firework, {count = 0}).

-record(evt_petard_red_packet, {count = 0}).

-record(evt_petard_send_red_packet, {count = 0}).

-record(evt_petard_score, {count = 0}).

-record(evt_use_petard, {count = 0}).

-record(evt_donate_sweet_score, {count = 0}).

-record(evt_normal_recruit, {count = 0}).

-record(evt_elite_recruit, {count = 0}).

-record(evt_elite_recruit_info, {partner_infos = []}).

-record(evt_sprite_lottery, {count = 0}).

-record(evt_recruit_lottery, {count = 0}).

-record(evt_appoint_sprite, {bids = []}).

-record(evt_appoint_sprite_compound, {bids = []}).

-record(evt_arena_use_sprite, {bids = [], result = 0}).

-record(evt_arena_team_win, {count = 0}).

-record(evt_arena_team_leader_join, {count = 0}).

-record(evt_arena_team_two_win, {count = 0}).

-record(evt_arena_team_season_five, {count = 0}).

-record(evt_arena_team_season_one, {count = 0}).

-record(evt_arena_team_first, {count = 0}).

-record(evt_arena_team_last, {count = 0}).

-record(evt_arena_team_season_found_team, {count = 0}).

-record(evt_arena_team_join, {count = 0}).

-record(evt_arena_team_defense_success, {count = 0}).

-record(evt_arena_team_double_kill, {}).

-record(evt_guild_secret_area_combat, {count = 0}).

-record(evt_sprite_compound, {}).

-record(evt_sprite_hatch, {}).

-record(evt_sprite_hatch_expedite, {}).

-record(evt_sprite_set_pos, {}).

-record(evt_sprite_tree, {}).

-record(evt_enter_monopoly, {}).

-record(evt_monopoly_develop,
	{stage_id = 0, develop = 0}).

-record(evt_monopoly_dice, {type = 0}).

-record(evt_monopoly_dungeon, {}).

-record(evt_monopoly_kill_boss, {}).

-record(evt_enter_secret_dun, {}).

-record(evt_enter_secret_kill_monster, {}).

-record(evt_enter_secret_kill_monster2, {count = 1}).

-record(evt_enter_secret_reply, {}).

-record(evt_enter_secret_loan, {}).

-record(evt_enter_secret_treasure, {}).

-record(evt_enter_secret_pass, {dun_id = 0}).

-record(evt_planes_pass, {}).

-record(evt_planes_kill_guard, {}).

-record(evt_enter_nian, {}).

-record(evt_nian_fight_monster, {}).

-record(evt_nian_fight_big_monster, {}).

-record(evt_nian_red_packet, {}).

-record(evt_nian_firework, {}).

-record(evt_nian_fight_gold_monster, {}).

-record(evt_skin, {}).

-record(evt_enter_holiday_arena_team, {}).

-record(evt_holiday_arena_team_lev_up, {}).

-record(evt_holiday_arena_team_join_team, {}).

-record(evt_holiday_arena_team_combat_count, {}).

-record(evt_holiday_arena_team_combat_win_count, {}).

-record(evt_guild_break_skill, {}).

-record(r_evt_power, {power = 0, cache = #{}}).

-record(r_evt_role_lev, {cache = #{}}).

-record(r_evt_hero_compose, {cache = #{}}).

-record(r_evt_first_recruit, {cache = #{}}).

-record(r_evt_star_tower_floor, {cache = #{}}).

-record(r_evt_endless_pass, {round = 0, cache = #{}}).

-record(r_evt_endless_pass_water,
	{round = 0, cache = #{}}).

-record(r_evt_endless_pass_fire,
	{round = 0, cache = #{}}).

-record(r_evt_endless_pass_wind,
	{round = 0, cache = #{}}).

-record(r_evt_endless_pass_light_dark,
	{round = 0, cache = #{}}).

-record(r_evt_expedition_pass, {cache = #{}}).

-record(r_evt_role_register_days, {cache = #{}}).

-record(r_evt_partner_get, {cache = #{}}).

-record(r_evt_primus_first_fight_pass,
	{rank = 0, cache = #{}}).

-record(r_evt_primus_first_fight_rank,
	{rank = 0, cache = #{}}).

-record(r_evt_partner_eqpt_item, {cache = #{}}).

-record(r_evt_first_partnerskill_learn, {cache = #{}}).

-record(r_evt_join_guild, {cache = #{}}).

-record(r_evt_build_guild, {cache = #{}}).

-record(r_evt_hallows_rank, {cache = #{}}).

-record(r_evt_room_liked, {cache = #{}}).

-record(r_evt_friend_add, {cache = #{}}).

-record(r_evt_friend_cluster_add, {cache = #{}}).

-record(r_evt_arena_cluster_rankget, {cache = #{}}).

-record(r_evt_arena_cluster_rank, {cache = #{}}).

-record(r_evt_championships_end_rank, {cache = #{}}).

-record(r_evt_sky_ladder_end_rank, {cache = #{}}).

-record(r_evt_arena_elite_end_levget, {cache = #{}}).

-record(r_evt_arena_elite_end_lev, {cache = #{}}).

-record(r_evt_arena_elite_end_rankget, {cache = #{}}).

-record(r_evt_arena_firstrank_end, {cache = #{}}).

-record(r_evt_arena_like_number, {cache = #{}}).

-record(r_evt_guild_dun_rank, {cache = #{}}).

-record(r_evt_guild_war_rank, {cache = #{}}).

-record(r_evt_partner_holy_eqpt, {cache = #{}}).

-file("src/mod/quest/quest_progress.erl", 18).

-file("inc/pos.hrl", 1).

-record(pos_history,
	{map_id = 0  :: non_neg_integer(),
	 map_bid = 0  :: non_neg_integer(),
	 srv_id = <<>>  :: bitstring(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer()}).

-record(pos,
	{ver = 2, srv_id = <<>>  :: bitstring(),
	 map_id = {0, <<>>}, map_pid = 0, map_bid = 0,
	 map_grid_pid = 0, last, hidden = 0, x = 0, y = 0,
	 dir = 5}).

-file("src/mod/quest/quest_progress.erl", 19).

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

-file("src/mod/quest/quest_progress.erl", 20).

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

-file("src/mod/quest/quest_progress.erl", 21).

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

-file("src/mod/quest/quest_progress.erl", 22).

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

-file("src/mod/quest/quest_progress.erl", 23).

-file("inc/feat.hrl", 1).

-record(m_feat,
	{ver = 1  :: pos_integer(),
	 finish = []  :: [{pos_integer(), pos_integer()}],
	 doing = []  :: [tuple()],
	 overdue = []  :: [pos_integer()]}).

-file("src/mod/quest/quest_progress.erl", 24).

-file("inc/combat.hrl", 1).

-file("inc/common.hrl", 1).

-file("inc/combat.hrl", 13).

-file("inc/attr.hrl", 1).

-file("inc/combat.hrl", 14).

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

-file("inc/combat.hrl", 15).

-record(combat_role,
	{id = {0, <<>>}, pid = none, conn_pid = none,
	 name = <<>>, gid = {0, <<>>}, gname = <<>>,
	 is_auto = true, is_ready = false, is_play_over = false,
	 is_offline = false, group = 0, auto_watch_model = 0,
	 lev = 0, face_id = 0, watching = 1,
	 is_load_map_finish = false}).

-record(fight_object,
	{master_id = {0, <<>>}, master_pid = none,
	 object_type = 0, object_id = 0  :: integer(),
	 object_bid = 0, is_clone = 0, is_auto = 0,
	 is_leader = 0, host_bid = 0, object_name = <<>>,
	 is_awake = 0, star = 0, sex = 0, career = 0, lev = 0,
	 face_id = 0, hp = 1, hp_max = 1, pos = 0, round = 0,
	 wave_round = 0, distance = 0, rand_speed = 0, init_attr,
	 base_attr, fight_attr = #attr{},
	 active_skills = []  :: [#skill_data{}],
	 passive_skills = []  :: [#skill_data{}],
	 skill_order = []  :: [#skill_data{}], buff_list = [],
	 owner_id = {0, <<>>},
	 passive_effects_of_skill = []  :: [#effect_data{}],
	 is_boss = false, is_strong_partner = 0, quality = 0,
	 initial_hp_max = 0, extra_data = [], awaken_type = 0,
	 camp_type = 0, power = 0, replay, hallows_looks = [],
	 sprites = [], guild_break_power = 0}).

-record(combat_buff,
	{id, bid, actor, group, end_round, buff_result_type,
	 positive_or_negative, buff_result = [], join_num,
	 can_reduce, lev, probability = 1000,
	 clean_when_dead = true, hit_count = 0, is_show = true,
	 wave = 1, group_pro = 0}).

-record(combat,
	{type = 0, attack_list = []  :: [#fight_object{}],
	 defend_list = []  :: [#fight_object{}],
	 combat_roles = []  :: [#combat_role{}],
	 formation = []  ::
	     [{pos_integer(), pos_integer(), pos_integer()}],
	 on_combat_begin, on_combat_end, on_role_combat_end,
	 state_end_time = 0, round_countdown = 0,
	 min_play_time = 0, take_action = {}, ext_args = [],
	 wave = 1, total_wave = undefined,
	 multi_wave_defend = [], combat_result,
	 is_pause = false  :: false | {true, integer()},
	 combat_map = 0, combat_drama, target_role_name = <<>>,
	 is_combat_end = {combat_util, is_combat_end, []},
	 end_time = 0, begin_time = 0, watching_roles = [],
	 is_skip = 0, round = 0, is_robot = 0,
	 select_buff_callback, terminate_func, attack_power = 0,
	 defend_power = 0, replay_info, other_arge = []}).

-record(partner_hurt,
	{master_id, id, bid, star, lev, camp_type, dps, cure,
	 ext_data = [], be_hurt = 0}).

-record(combat_result,
	{result  :: 1 | 2, dead_monster_num = 0, wave_num = 0,
	 dead_partner = [], replay_id = 0, a_stat_info = [],
	 b_stat_info = [], end_type = normal  :: normal | quit,
	 opponent_id = {0, <<>>}, total_hurt = 0,
	 action_count = 0, group_a_num = 0,
	 hurt_statistics_a = [], curt_statistics_a = [],
	 hurt_statistics = [], replay_info = [], combat_pid = 0,
	 a_halo_dizzy_num = 0, a_max_num_def = 0,
	 a_control_info = [], a_kill_info = [],
	 a_continue_hurt = [], a_revive_info = [],
	 a_dodge_count = 0, a_anti_kill_count = 0,
	 a_halo_kill_count = 0, a_fire_buff_num = 0,
	 hurt_statistics_b = [], curt_statistics_b = [],
	 b_halo_dizzy_num = 0, b_max_num_def = 0,
	 b_control_info = [], b_kill_info = [],
	 b_continue_hurt = [], b_revive_info = [],
	 b_dodge_count = 0, b_anti_kill_count = 0,
	 b_halo_kill_count = 0, b_fire_buff_num = 0,
	 is_balance = 0, a_sprite_kill_count = 0}).

-record(mon_ai,
	{bid, name, ai, is_loop, condition = [], rate,
	 skill_target = false, skill_id, talk_target = none,
	 talk_content = <<>>}).

-record(skill_play,
	{order, actor, target, skill_bid = 0, talk_pos = 0,
	 talk_content = <<>>, effect_play = []}).

-record(effect_play,
	{order, actor, target = 0, effect_bid = 0, is_hit = 1,
	 is_crit = 0, hp_changed = 0, hp = 0, buff_list = [],
	 summon_list = [], distance = -1, is_dead = 0,
	 sub_effect_play_list = [], is_blind = 0,
	 skill_bid_of_effect = 0, actor_hp_changed = 0,
	 actor_is_dead = 0, aid_actor = 0, total_hurt = 0,
	 hurt_reward = [], camp_restrain = 0}).

-record(sub_effect_play,
	{sub_target = 0, sub_effect_id = 0, sub_hp_changed = 0,
	 sub_distance = -1, sub_is_hit = 1, sub_skill_id = 0,
	 extra_effect = []}).

-record(buff_play,
	{target = 0, buff_bid = 0, end_round = 0,
	 remain_round = 0, action_type = 0, change_type = 0,
	 change_value = 0, is_dead = 0, id = 0, id2 = 0}).

-record(fight_object_p,
	{pos = 0, group = 0, owner_id = 0, owner_srv_id = <<>>,
	 object_type = 0, object_id = 0, object_bid = 0,
	 is_awake = 0, star = 0, object_name = <<>>, sex = 0,
	 career = 0, lev = 0, hp = 0, hp_max = 0, face_id = 0,
	 round = 0, skills = [], is_strong_partner = 0,
	 extra_data = [], camp_type = 0, sprites = []}).

-record(skill_p, {skill_bid = 0, end_round = 0}).

-record(combat_order_p,
	{pos = 0, distance = 0, group = 0}).

-record(exp_reward_p,
	{object_type, object_id = 0, srv_id = <<>>, career = 0,
	 sex = 0, old_lev, old_exp, new_lev, new_exp, is_die = 0,
	 assets_reward}).

-record(assets_reward_p, {type, val}).

-record(item_reward_p, {bid, is_bind, num}).

-record(combat_drama,
	{id, next, timeout = infinity, ts, winner,
	 play_list = []  :: [pos_integer()],
	 combat_list = []  :: [tuple()],
	 guide_list = []  :: [pos_integer()]}).

-file("src/mod/quest/quest_progress.erl", 25).

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

-file("src/mod/quest/quest_progress.erl", 26).

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

-file("src/mod/quest/quest_progress.erl", 27).

-file("inc/market_silver.hrl", 1).

-record(m_market_silver,
	{ver = 1, refresh_time = 0, is_first_on_sale = 1,
	 refresh = []}).

-record(market_silver_shop,
	{ver = 1, rid, max_cell_id = 0, free_ids = [],
	 cells = [], name = "", pid, last_logout = 0}).

-record(market_silver_shop_cell,
	{ver = 1, cell_id = 0, item_base_id = 0, num = 0,
	 item_attrs = [], price = 0, expiry = 0, sold_num = 0,
	 status = 0, system_price = 0, percent = 100,
	 sale_time = 0}).

-record(market_silver_price,
	{ver = 1, item_base_id = 0, price = 0, sellers = [],
	 deal_price = [], recover_num = 0, day_recover = 0,
	 day_auto = 0, ext = []}).

-record(market_silver_refresh,
	{id = 0, item_base_id = 0, num = 0, item_attrs = [],
	 price = 0, cell_id = 0, seller_id, status = 0}).

-record(market_silver_item_data,
	{base_id = 0, type = 0, step = 0, classes = 0,
	 min_lev = 0, max_lev = 0, is_system = 1,
	 is_quest_need = 0, def_price = 0, min_price = 0,
	 max_price = 0, gain_label = coin, open_lev = 0,
	 pre_base_id = 0, pre_pcnt = 1000, group = 0,
	 group_id = 0, update_time, chain_type = 0,
	 fix_price = 0, make_pcnt = 1000, rand_num = {1, 1}}).

-record(market_silver_draw_item,
	{cell_id = 0, base_id = 0, num = 0, rest = 0, price = 0,
	 pcnt = 0, attrs = []}).

-file("src/mod/quest/quest_progress.erl", 28).

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

-file("src/mod/quest/quest_progress.erl", 29).

-file("inc/days_rank.hrl", 1).

-record(m_days_rank,
	{ver = 1  :: pos_integer(),
	 finish = []  :: [{pos_integer(), pos_integer()}],
	 doing = []  :: [tuple()],
	 overdue = []  :: [pos_integer()]}).

-file("src/mod/quest/quest_progress.erl", 30).

-file("inc/day_goals.hrl", 1).

-record(m_day_goals,
	{ver = 3, end_time = 0  :: non_neg_integer(),
	 num = 0  :: non_neg_integer(),
	 welfare_list = []  :: list(), grow_list = []  :: list(),
	 price_list = []  :: list(), finish_list = []  :: list(),
	 period = 1  :: list(), charge = 0  :: list(),
	 old_data = [], period_day = 0, new_grow_list = [],
	 lev_reward = [], old_data2 = []}).

-record(grow_data,
	{ver = 2, day = 0  :: non_neg_integer(),
	 goal_id = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 condition = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(), progress = []  :: list(),
	 target_type = 1  :: non_neg_integer()}).

-file("src/mod/quest/quest_progress.erl", 31).

-file("inc/guild_quest.hrl", 1).

-record(m_guild_quest,
	{ver = 1, lev = 0  :: non_neg_integer(),
	 exp = 0  :: non_neg_integer(),
	 day_exp = 0  :: non_neg_integer(),
	 week_exp = 0  :: non_neg_integer(),
	 list = []  :: list()}).

-record(guild_quest_data,
	{id = 0, name = <<>>, type = 0, exp = 0,
	 progress = []}).

-record(guild_quest_lev_data,
	{lev = 0, exp = 0, items = [], attr = []}).

-file("src/mod/quest/quest_progress.erl", 32).

-file("inc/dial.hrl", 1).

-record(m_dial,
	{ver = 2  :: non_neg_integer(), info = [],
	 reset_time = 0}).

-record(m_holiday_dial,
	{ver = 1  :: non_neg_integer(), camp_id = 0,
	 award_list = [], num = 0, count = 0, list = [],
	 logs = [], lev = 0, old_data = []}).

-record(dial_info,
	{type = 0, count = 0, lucky = 0, lucky_award = [],
	 list = [], award_list = [], day_award_list = [],
	 frist_type = 0, end_time = 0, rand_lists = [],
	 pos_limit_count = [], item_limit_count = []}).

-record(rand_data,
	{rand_id = 0, id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 item_id = 0  :: non_neg_integer(),
	 item_num = 0  :: non_neg_integer(), rare = 0,
	 pro = 0  :: non_neg_integer(),
	 limit_lev = 0  :: non_neg_integer(),
	 not_hit_in_m = 0  :: non_neg_integer(),
	 notice = 0  :: non_neg_integer(),
	 limit_count = 0  :: non_neg_integer(),
	 max_count = 0  :: non_neg_integer()}).

-record(holiday_dial_rand_data,
	{zid = 0, id = 110, name = <<>>, award_type = 0,
	 item_id = 0, item_num = 0, gold_rate = 0, pro = 0,
	 limit_lev_min = 0, limit_lev_max = 9999,
	 not_hit_in_m = 0, not_hit_in_m_after = 0,
	 hit_when_m_after = 0, notice = 0, notice_rank = 0,
	 limit_count = 0}).

-file("src/mod/quest/quest_progress.erl", 33).

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

-file("src/mod/quest/quest_progress.erl", 34).

-file("inc/package.hrl", 1).

-file("src/mod/quest/quest_progress.erl", 35).

-file("inc/holiday_lanterm.hrl", 1).

-record(m_lanterm_festival,
	{ver = 1, all_count = []  :: non_neg_integer(),
	 all_num = 0  :: non_neg_integer(),
	 award_list = []  :: list(),
	 camp_id = 0  :: non_neg_integer(), extra = [],
	 old_data = []  :: list()}).

-record(m_lanterm_adventure,
	{ver = 1, quest_list = []  :: non_neg_integer(),
	 camp_id = 0  :: non_neg_integer(), extra = [],
	 old_data = []  :: list()}).

-record(m_lanterm_adventure1,
	{ver = 1, quest_list = []  :: non_neg_integer(),
	 camp_id = 0  :: non_neg_integer(), extra = [],
	 old_data = []  :: list()}).

-record(m_lanterm_adventure2,
	{ver = 1, quest_list = []  :: non_neg_integer(),
	 camp_id = 0  :: non_neg_integer(), extra = [],
	 old_data = []  :: list()}).

-record(m_lanterm_adventure3,
	{ver = 1, quest_list = []  :: non_neg_integer(),
	 camp_id = 0  :: non_neg_integer(), extra = [],
	 old_data = []  :: list()}).

-record(holiday_lanterm_adventure_data,
	{camp_id = 0  :: non_neg_integer(),
	 id = 0  :: non_neg_integer(), f_id = 0, s_id = 0,
	 ref_day = 0, progress = [], award = []}).

-file("src/mod/quest/quest_progress.erl", 36).

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

-file("src/mod/quest/quest_progress.erl", 37).

-file("inc/holiday_boss.hrl", 1).

-record(m_holiday_boss,
	{ver = 1, camp_id = 0, count = 0, buy_count = 0,
	 order_id = 1, score = 0, boss_hp = [], boss_score = 0,
	 awards = [], old_info = []}).

-file("src/mod/quest/quest_progress.erl", 38).

-file("inc/war_order.hrl", 1).

-record(m_war_order,
	{ver = 1, period = 0, period_day = 0, end_time = 0,
	 rmb_status = 0, exp_status = 0, exp_num = 0,
	 quest_list = [], card = [], lev_reward = []}).

-record(war_order_data,
	{goal_id = 0  :: non_neg_integer(), period = 0,
	 quest_type = 0, day = 0  :: non_neg_integer(),
	 min_day = 0  :: non_neg_integer(),
	 max_day = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 condition = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(), progress = []  :: list(),
	 award = [], target_type = 1  :: non_neg_integer()}).

-file("src/mod/quest/quest_progress.erl", 39).

-file("inc/combat.hrl", 1).

-file("src/mod/quest/quest_progress.erl", 40).

-file("inc/role_room.hrl", 1).

-record(m_room,
	{ver = 3, city_id = 0, fanse_list = [],
	 honor_badges = [], honor_point = 0, use_badges = [],
	 room_bbs_set = 1, room_bbs_num = 0}).

-record(m_room_feat,
	{ver = 1, flag = 0,
	 finish = []  :: [{pos_integer(), pos_integer()}],
	 doing = []  :: [tuple()],
	 overdue = []  :: [pos_integer()], ext = []}).

-record(m_room_grow,
	{ver = 1, finish = []  :: [pos_integer()],
	 doing = []  :: [tuple()], info = [], next_id = 1,
	 ext = []}).

-record(room_grow,
	{id = 0, order = 0, time = 0, arge = [], ext = []}).

-record(room_honor_badges, {id = 0, time = 0}).

-record(room_bbs_message,
	{id = {0, <<>>}, bbs_id = 0, bbs_type = 0,
	 reply_name = <<>>, reply_bbs_id = 0,
	 reply_id = {0, <<>>}, msg = <<>>, time = 0,
	 tar_id = {0, <<>>}, face_id = 0, avatar_id = 0, lev = 0,
	 sex = 0, name = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(room_bbs_message_below,
	{id = {0, <<>>}, role_id = {0, <<>>}, name = <<>>,
	 bbs_id = 0}).

-record(room_fans, {myid = {0, <<>>}, fid = {0, <<>>}}).

-record(room_fans_num, {id = {0, <<>>}, fans = 0}).

-record(room_rank_info,
	{id = {0, <<>>}, name = <<>>, lev = 0, face = 0,
	 avatar_bid = 0, time = 0, fans_num = 0, rank = 0,
	 look_id = 0, face_update_time = 0, face_file = <<>>}).

-file("src/mod/quest/quest_progress.erl", 41).

-file("inc/holiday_return.hrl", 1).

-record(m_holiday_return_sign,
	{ver = 2, status_list = [], login_day = 0}).

-record(m_holiday_return,
	{ver = 3, period = 0, start_time = 0, end_time = 0,
	 is_buy = 0, exchange_day_list = [],
	 exchange_buy_list = [], return_discount_buy_list = [],
	 bind_code = 0, bind_end_time = 0,
	 bind_roleid = {0, <<>>}, reward_list = [],
	 old_data = [], bind_power = 0, bind_charge = 0,
	 partner_half = []}).

-record(m_holiday_return_feat,
	{ver = 1, quest_list = []  :: non_neg_integer(),
	 period = 0  :: non_neg_integer(), extra = [],
	 old_data = []  :: list()}).

-record(holiday_return_feat_data,
	{period = 0  :: non_neg_integer(),
	 id = 0  :: non_neg_integer(), f_id = 0, s_id = 0,
	 ref_day = 0, progress = [], award = []}).

-file("src/mod/quest/quest_progress.erl", 42).

-file("inc/home_pet.hrl", 1).

-record(m_home_pet,
	{ver = 6, name = <<>>, id = 0, rename_count = 0,
	 state = 0, calc_time = 0, start_time = 0, end_time = 0,
	 vigor = 0, vigor_time = 0, set_item = [],
	 next_evt_id = 1, city = 0, evt_list = [], do_evts = [],
	 acc_evts = [], fire_time = 0, acc_out_time = 0,
	 acc_out_count = 0, acc_items = [], photos = [],
	 diarys = [], day_talk = 0, day_feed = 0,
	 photos_next_id = 1, diarys_next_id = 1,
	 photos_had = []}).

-file("src/mod/quest/quest_progress.erl", 43).

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

-file("src/mod/quest/quest_progress.erl", 44).

-file("inc/holiday_return_new.hrl", 1).

-record(m_holiday_return_new,
	{ver = 1, period = 0, start_time = 0, end_time = 0,
	 gift_status = 0, sign_list = [], quest_list = [],
	 exchange_day_list = [], exchange_buy_list = [],
	 free_draw_count = 0, draw_count = 0, draw_info = 0,
	 draw_type_info = [], must_not = [], get_red_count = 0,
	 red_packet_info = [], get_red_info = [], ext = []}).

-record(holiday_return_new_feat_data,
	{period = 0  :: non_neg_integer(),
	 id = 0  :: non_neg_integer(), f_id = 0, s_id = 0,
	 ref_day = 0, progress = [], award = []}).

-file("src/mod/quest/quest_progress.erl", 45).

-file("inc/new_war_order.hrl", 1).

-record(m_new_war_order,
	{ver = 1, period = 0, period_day = 0, period_lev = 0,
	 day_lev = 0, week_lev = 0, start_time = 0, end_time = 0,
	 rmb_status = 0, quest_list = [], card = [],
	 lev_reward = []}).

-record(new_war_order_data,
	{goal_id = 0  :: non_neg_integer(), period = 0,
	 quest_type = 0, day = 0  :: non_neg_integer(),
	 min_day = 0  :: non_neg_integer(),
	 max_day = 0  :: non_neg_integer(),
	 min_lev = 0  :: non_neg_integer(),
	 max_lev = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 condition = 0  :: non_neg_integer(),
	 progress = []  :: list(), award = [],
	 target_type = 1  :: non_neg_integer()}).

-file("src/mod/quest/quest_progress.erl", 46).

-spec fetch(#role{}, Label :: quest,
	    QuestId :: pos_integer(),
	    ProgressId :: pos_integer()) -> {ok, #quest{},
					     #quest_progress{}} |
					    {error, Reason :: term()}.

fetch(#role{name = _Name,
	    m_quest = #m_quest{quest = Quests}},
      quest, QuestId, ProgressId) ->
    case lists:keyfind(QuestId, #quest.id, Quests) of
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidquest_progress171, _,
	     {__Levelquest_progress171, __Tracesquest_progress171}}
		when __Levelquest_progress171 band 128 /= 0 orelse
		       __Tracesquest_progress171 /= [] ->
		lager:do_log(debug,
			     [{module, quest_progress}, {function, fetch},
			      {line, 171}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]未接受编号为[~w]的任务",
					   [_Name, QuestId]),
			     none, 4096, 128, __Levelquest_progress171,
			     __Tracesquest_progress171, lager_event,
			     __Pidquest_progress171);
	    _ -> ok
	  end,
	  {error, quest_not_found};
      Q = #quest{progress = Progress} ->
	  case lists:keyfind(ProgressId, #quest_progress.id,
			     Progress)
	      of
	    false ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidquest_progress176, _,
		   {__Levelquest_progress176, __Tracesquest_progress176}}
		      when __Levelquest_progress176 band 8 /= 0 orelse
			     __Tracesquest_progress176 /= [] ->
		      lager:do_log(error,
				   [{module, quest_progress}, {function, fetch},
				    {line, 176}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("任务[~w]中不存在编号为[~w]的进度",
						 [QuestId, ProgressId]),
				   none, 4096, 8, __Levelquest_progress176,
				   __Tracesquest_progress176, lager_event,
				   __Pidquest_progress176);
		  _ -> ok
		end,
		{error, progress_not_found};
	    P -> {ok, Q, P}
	  end
    end;
fetch(#role{name = Name,
	    m_feat = #m_feat{doing = Quests}},
      feat, QuestId, ProgressId) ->
    case lists:keyfind(QuestId, #quest.id, Quests) of
      Q = #quest{progress = Progress} ->
	  case lists:keyfind(ProgressId, #quest_progress.id,
			     Progress)
	      of
	    false ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidquest_progress186, _,
		   {__Levelquest_progress186, __Tracesquest_progress186}}
		      when __Levelquest_progress186 band 8 /= 0 orelse
			     __Tracesquest_progress186 /= [] ->
		      lager:do_log(error,
				   [{module, quest_progress}, {function, fetch},
				    {line, 186}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("成就[~w]中不存在编号为[~w]的进度",
						 [QuestId, ProgressId]),
				   none, 4096, 8, __Levelquest_progress186,
				   __Tracesquest_progress186, lager_event,
				   __Pidquest_progress186);
		  _ -> ok
		end,
		{error, progress_not_found};
	    P -> {ok, Q, P}
	  end;
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidquest_progress191, _,
	     {__Levelquest_progress191, __Tracesquest_progress191}}
		when __Levelquest_progress191 band 8 /= 0 orelse
		       __Tracesquest_progress191 /= [] ->
		lager:do_log(error,
			     [{module, quest_progress}, {function, fetch},
			      {line, 191}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]未接受编号为[~w]的成就",
					   [Name, QuestId]),
			     none, 4096, 8, __Levelquest_progress191,
			     __Tracesquest_progress191, lager_event,
			     __Pidquest_progress191);
	    _ -> ok
	  end,
	  {error, quest_not_found}
    end;
fetch(#role{name = Name,
	    m_room_feat = #m_room_feat{doing = Quests}},
      room_feat, QuestId, ProgressId) ->
    case lists:keyfind(QuestId, #quest.id, Quests) of
      Q = #quest{progress = Progress} ->
	  case lists:keyfind(ProgressId, #quest_progress.id,
			     Progress)
	      of
	    false ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidquest_progress199, _,
		   {__Levelquest_progress199, __Tracesquest_progress199}}
		      when __Levelquest_progress199 band 8 /= 0 orelse
			     __Tracesquest_progress199 /= [] ->
		      lager:do_log(error,
				   [{module, quest_progress}, {function, fetch},
				    {line, 199}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("个人空间成就[~w]中不存在编号为[~w]的进度",
						 [QuestId, ProgressId]),
				   none, 4096, 8, __Levelquest_progress199,
				   __Tracesquest_progress199, lager_event,
				   __Pidquest_progress199);
		  _ -> ok
		end,
		{error, progress_not_found};
	    P -> {ok, Q, P}
	  end;
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidquest_progress204, _,
	     {__Levelquest_progress204, __Tracesquest_progress204}}
		when __Levelquest_progress204 band 8 /= 0 orelse
		       __Tracesquest_progress204 /= [] ->
		lager:do_log(error,
			     [{module, quest_progress}, {function, fetch},
			      {line, 204}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]未接受编号为[~w]的个人空间成就",
					   [Name, QuestId]),
			     none, 4096, 8, __Levelquest_progress204,
			     __Tracesquest_progress204, lager_event,
			     __Pidquest_progress204);
	    _ -> ok
	  end,
	  {error, quest_not_found}
    end;
fetch(#role{name = Name,
	    m_room_grow = #m_room_grow{doing = Quests}},
      room_grow, QuestId, ProgressId) ->
    case lists:keyfind(QuestId, #quest.id, Quests) of
      Q = #quest{progress = Progress} ->
	  case lists:keyfind(ProgressId, #quest_progress.id,
			     Progress)
	      of
	    false -> {error, progress_not_found};
	    P -> {ok, Q, P}
	  end;
      false -> {error, quest_not_found}
    end;
fetch(#role{name = Name,
	    m_days_ranks = #m_days_rank{doing = Quests}},
      days_rank, QuestId, ProgressId) ->
    case lists:keyfind(QuestId, #quest.id, Quests) of
      Q = #quest{progress = Progress} ->
	  case lists:keyfind(ProgressId, #quest_progress.id,
			     Progress)
	      of
	    false ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidquest_progress225, _,
		   {__Levelquest_progress225, __Tracesquest_progress225}}
		      when __Levelquest_progress225 band 8 /= 0 orelse
			     __Tracesquest_progress225 /= [] ->
		      lager:do_log(error,
				   [{module, quest_progress}, {function, fetch},
				    {line, 225}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("成就[~w]中不存在编号为[~w]的进度",
						 [QuestId, ProgressId]),
				   none, 4096, 8, __Levelquest_progress225,
				   __Tracesquest_progress225, lager_event,
				   __Pidquest_progress225);
		  _ -> ok
		end,
		{error, progress_not_found};
	    P -> {ok, Q, P}
	  end;
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidquest_progress230, _,
	     {__Levelquest_progress230, __Tracesquest_progress230}}
		when __Levelquest_progress230 band 8 /= 0 orelse
		       __Tracesquest_progress230 /= [] ->
		lager:do_log(error,
			     [{module, quest_progress}, {function, fetch},
			      {line, 230}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]未接受编号为[~w]的成就",
					   [Name, QuestId]),
			     none, 4096, 8, __Levelquest_progress230,
			     __Tracesquest_progress230, lager_event,
			     __Pidquest_progress230);
	    _ -> ok
	  end,
	  {error, quest_not_found}
    end;
fetch(#role{name = Name,
	    m_day_goals = #m_day_goals{grow_list = GrowList}},
      day_goals, QuestId, ProgressId) ->
    case lists:keyfind(QuestId, #grow_data.goal_id,
		       GrowList)
	of
      Q = #grow_data{progress = Progress} ->
	  case lists:keyfind(ProgressId, #quest_progress.id,
			     Progress)
	      of
	    false ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidquest_progress238, _,
		   {__Levelquest_progress238, __Tracesquest_progress238}}
		      when __Levelquest_progress238 band 8 /= 0 orelse
			     __Tracesquest_progress238 /= [] ->
		      lager:do_log(error,
				   [{module, quest_progress}, {function, fetch},
				    {line, 238}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("七日目标[~w]中不存在编号为[~w]的进度",
						 [QuestId, ProgressId]),
				   none, 4096, 8, __Levelquest_progress238,
				   __Tracesquest_progress238, lager_event,
				   __Pidquest_progress238);
		  _ -> ok
		end,
		{error, progress_not_found};
	    P -> {ok, Q, P}
	  end;
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidquest_progress243, _,
	     {__Levelquest_progress243, __Tracesquest_progress243}}
		when __Levelquest_progress243 band 8 /= 0 orelse
		       __Tracesquest_progress243 /= [] ->
		lager:do_log(error,
			     [{module, quest_progress}, {function, fetch},
			      {line, 243}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]未接受编号为[~w]的七日目标",
					   [Name, QuestId]),
			     none, 4096, 8, __Levelquest_progress243,
			     __Tracesquest_progress243, lager_event,
			     __Pidquest_progress243);
	    _ -> ok
	  end,
	  {error, quest_not_found}
    end;
fetch(#role{name = Name,
	    m_guild_quest = #m_guild_quest{list = List}},
      guild_quest, QuestId, ProgressId) ->
    case lists:keyfind(QuestId, #quest.id, List) of
      Q = #quest{progress = Progress} ->
	  case lists:keyfind(ProgressId, #quest_progress.id,
			     Progress)
	      of
	    false ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidquest_progress251, _,
		   {__Levelquest_progress251, __Tracesquest_progress251}}
		      when __Levelquest_progress251 band 8 /= 0 orelse
			     __Tracesquest_progress251 /= [] ->
		      lager:do_log(error,
				   [{module, quest_progress}, {function, fetch},
				    {line, 251}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("guild_quest[~w]中不存在编号为[~w]的进度",
						 [QuestId, ProgressId]),
				   none, 4096, 8, __Levelquest_progress251,
				   __Tracesquest_progress251, lager_event,
				   __Pidquest_progress251);
		  _ -> ok
		end,
		{error, progress_not_found};
	    P -> {ok, Q, P}
	  end;
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidquest_progress256, _,
	     {__Levelquest_progress256, __Tracesquest_progress256}}
		when __Levelquest_progress256 band 8 /= 0 orelse
		       __Tracesquest_progress256 /= [] ->
		lager:do_log(error,
			     [{module, quest_progress}, {function, fetch},
			      {line, 256}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]未接受编号为[~w]的七日目标",
					   [Name, QuestId]),
			     none, 4096, 8, __Levelquest_progress256,
			     __Tracesquest_progress256, lager_event,
			     __Pidquest_progress256);
	    _ -> ok
	  end,
	  {error, quest_not_found}
    end;
fetch(#role{name = Name,
	    m_hallows = #m_hallows{quest_list = List}},
      hallows_quest, QuestId, ProgressId) ->
    case lists:keyfind(QuestId, #quest.id, List) of
      Q = #quest{progress = Progress} ->
	  case lists:keyfind(ProgressId, #quest_progress.id,
			     Progress)
	      of
	    false ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidquest_progress264, _,
		   {__Levelquest_progress264, __Tracesquest_progress264}}
		      when __Levelquest_progress264 band 8 /= 0 orelse
			     __Tracesquest_progress264 /= [] ->
		      lager:do_log(error,
				   [{module, quest_progress}, {function, fetch},
				    {line, 264}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("hallows_quest[~w]中不存在编号为[~w]的进度",
						 [QuestId, ProgressId]),
				   none, 4096, 8, __Levelquest_progress264,
				   __Tracesquest_progress264, lager_event,
				   __Pidquest_progress264);
		  _ -> ok
		end,
		{error, progress_not_found};
	    P -> {ok, Q, P}
	  end;
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidquest_progress269, _,
	     {__Levelquest_progress269, __Tracesquest_progress269}}
		when __Levelquest_progress269 band 8 /= 0 orelse
		       __Tracesquest_progress269 /= [] ->
		lager:do_log(error,
			     [{module, quest_progress}, {function, fetch},
			      {line, 269}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]未接受编号为[~w]的神器任务",
					   [Name, QuestId]),
			     none, 4096, 8, __Levelquest_progress269,
			     __Tracesquest_progress269, lager_event,
			     __Pidquest_progress269);
	    _ -> ok
	  end,
	  {error, quest_not_found}
    end;
fetch(#role{name = Name,
	    m_hallows = #m_hallows{look_quest_list = List}},
      hallows_look_quest, QuestId, ProgressId) ->
    case lists:keyfind(QuestId, #quest.id, List) of
      Q = #quest{progress = Progress} ->
	  case lists:keyfind(ProgressId, #quest_progress.id,
			     Progress)
	      of
	    false ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidquest_progress277, _,
		   {__Levelquest_progress277, __Tracesquest_progress277}}
		      when __Levelquest_progress277 band 8 /= 0 orelse
			     __Tracesquest_progress277 /= [] ->
		      lager:do_log(error,
				   [{module, quest_progress}, {function, fetch},
				    {line, 277}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("hallows_look_quest[~w]中不存在编号为[~w]的进度",
						 [QuestId, ProgressId]),
				   none, 4096, 8, __Levelquest_progress277,
				   __Tracesquest_progress277, lager_event,
				   __Pidquest_progress277);
		  _ -> ok
		end,
		{error, progress_not_found};
	    P -> {ok, Q, P}
	  end;
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidquest_progress282, _,
	     {__Levelquest_progress282, __Tracesquest_progress282}}
		when __Levelquest_progress282 band 8 /= 0 orelse
		       __Tracesquest_progress282 /= [] ->
		lager:do_log(error,
			     [{module, quest_progress}, {function, fetch},
			      {line, 282}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]未接受编号为[~w]的圣器幻化进度",
					   [Name, QuestId]),
			     none, 4096, 8, __Levelquest_progress282,
			     __Tracesquest_progress282, lager_event,
			     __Pidquest_progress282);
	    _ -> ok
	  end,
	  {error, quest_not_found}
    end;
fetch(#role{name = Name,
	    m_lanterm_adventure =
		#m_lanterm_adventure{quest_list = List}},
      holiday_lanterm_adventure, QuestId, ProgressId) ->
    case lists:keyfind(QuestId, #quest.id, List) of
      Q = #quest{progress = Progress} ->
	  case lists:keyfind(ProgressId, #quest_progress.id,
			     Progress)
	      of
	    false ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidquest_progress290, _,
		   {__Levelquest_progress290, __Tracesquest_progress290}}
		      when __Levelquest_progress290 band 8 /= 0 orelse
			     __Tracesquest_progress290 /= [] ->
		      lager:do_log(error,
				   [{module, quest_progress}, {function, fetch},
				    {line, 290}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("m_lanterm_adventure[~w]中不存在编号为[~w]的进度",
						 [QuestId, ProgressId]),
				   none, 4096, 8, __Levelquest_progress290,
				   __Tracesquest_progress290, lager_event,
				   __Pidquest_progress290);
		  _ -> ok
		end,
		{error, progress_not_found};
	    P -> {ok, Q, P}
	  end;
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidquest_progress295, _,
	     {__Levelquest_progress295, __Tracesquest_progress295}}
		when __Levelquest_progress295 band 8 /= 0 orelse
		       __Tracesquest_progress295 /= [] ->
		lager:do_log(error,
			     [{module, quest_progress}, {function, fetch},
			      {line, 295}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]未接受编号为[~w]的元宵冒险任务",
					   [Name, QuestId]),
			     none, 4096, 8, __Levelquest_progress295,
			     __Tracesquest_progress295, lager_event,
			     __Pidquest_progress295);
	    _ -> ok
	  end,
	  {error, quest_not_found}
    end;
fetch(#role{name = Name,
	    m_lanterm_adventure1 =
		#m_lanterm_adventure1{quest_list = List}},
      holiday_lanterm_adventure1, QuestId, ProgressId) ->
    case lists:keyfind(QuestId, #quest.id, List) of
      Q = #quest{progress = Progress} ->
	  case lists:keyfind(ProgressId, #quest_progress.id,
			     Progress)
	      of
	    false ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidquest_progress303, _,
		   {__Levelquest_progress303, __Tracesquest_progress303}}
		      when __Levelquest_progress303 band 8 /= 0 orelse
			     __Tracesquest_progress303 /= [] ->
		      lager:do_log(error,
				   [{module, quest_progress}, {function, fetch},
				    {line, 303}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("m_lanterm_adventure1[~w]中不存在编号为[~w]的进度",
						 [QuestId, ProgressId]),
				   none, 4096, 8, __Levelquest_progress303,
				   __Tracesquest_progress303, lager_event,
				   __Pidquest_progress303);
		  _ -> ok
		end,
		{error, progress_not_found};
	    P -> {ok, Q, P}
	  end;
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidquest_progress308, _,
	     {__Levelquest_progress308, __Tracesquest_progress308}}
		when __Levelquest_progress308 band 8 /= 0 orelse
		       __Tracesquest_progress308 /= [] ->
		lager:do_log(error,
			     [{module, quest_progress}, {function, fetch},
			      {line, 308}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]未接受编号为[~w]的元宵冒险任务",
					   [Name, QuestId]),
			     none, 4096, 8, __Levelquest_progress308,
			     __Tracesquest_progress308, lager_event,
			     __Pidquest_progress308);
	    _ -> ok
	  end,
	  {error, quest_not_found}
    end;
fetch(#role{name = Name,
	    m_lanterm_adventure2 =
		#m_lanterm_adventure2{quest_list = List}},
      holiday_lanterm_adventure2, QuestId, ProgressId) ->
    case lists:keyfind(QuestId, #quest.id, List) of
      Q = #quest{progress = Progress} ->
	  case lists:keyfind(ProgressId, #quest_progress.id,
			     Progress)
	      of
	    false ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidquest_progress316, _,
		   {__Levelquest_progress316, __Tracesquest_progress316}}
		      when __Levelquest_progress316 band 8 /= 0 orelse
			     __Tracesquest_progress316 /= [] ->
		      lager:do_log(error,
				   [{module, quest_progress}, {function, fetch},
				    {line, 316}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("m_lanterm_adventure2[~w]中不存在编号为[~w]的进度",
						 [QuestId, ProgressId]),
				   none, 4096, 8, __Levelquest_progress316,
				   __Tracesquest_progress316, lager_event,
				   __Pidquest_progress316);
		  _ -> ok
		end,
		{error, progress_not_found};
	    P -> {ok, Q, P}
	  end;
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidquest_progress321, _,
	     {__Levelquest_progress321, __Tracesquest_progress321}}
		when __Levelquest_progress321 band 8 /= 0 orelse
		       __Tracesquest_progress321 /= [] ->
		lager:do_log(error,
			     [{module, quest_progress}, {function, fetch},
			      {line, 321}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]未接受编号为[~w]的元宵冒险任务",
					   [Name, QuestId]),
			     none, 4096, 8, __Levelquest_progress321,
			     __Tracesquest_progress321, lager_event,
			     __Pidquest_progress321);
	    _ -> ok
	  end,
	  {error, quest_not_found}
    end;
fetch(#role{name = Name,
	    m_lanterm_adventure3 =
		#m_lanterm_adventure3{quest_list = List}},
      holiday_lanterm_adventure3, QuestId, ProgressId) ->
    case lists:keyfind(QuestId, #quest.id, List) of
      Q = #quest{progress = Progress} ->
	  case lists:keyfind(ProgressId, #quest_progress.id,
			     Progress)
	      of
	    false ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidquest_progress329, _,
		   {__Levelquest_progress329, __Tracesquest_progress329}}
		      when __Levelquest_progress329 band 8 /= 0 orelse
			     __Tracesquest_progress329 /= [] ->
		      lager:do_log(error,
				   [{module, quest_progress}, {function, fetch},
				    {line, 329}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("m_lanterm_adventure3[~w]中不存在编号为[~w]的进度",
						 [QuestId, ProgressId]),
				   none, 4096, 8, __Levelquest_progress329,
				   __Tracesquest_progress329, lager_event,
				   __Pidquest_progress329);
		  _ -> ok
		end,
		{error, progress_not_found};
	    P -> {ok, Q, P}
	  end;
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidquest_progress334, _,
	     {__Levelquest_progress334, __Tracesquest_progress334}}
		when __Levelquest_progress334 band 8 /= 0 orelse
		       __Tracesquest_progress334 /= [] ->
		lager:do_log(error,
			     [{module, quest_progress}, {function, fetch},
			      {line, 334}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]未接受编号为[~w]的元宵冒险任务",
					   [Name, QuestId]),
			     none, 4096, 8, __Levelquest_progress334,
			     __Tracesquest_progress334, lager_event,
			     __Pidquest_progress334);
	    _ -> ok
	  end,
	  {error, quest_not_found}
    end;
fetch(#role{name = Name,
	    m_holiday_return_feat =
		#m_holiday_return_feat{quest_list = List}},
      holiday_return_feat, QuestId, ProgressId) ->
    case lists:keyfind(QuestId, #quest.id, List) of
      Q = #quest{progress = Progress} ->
	  case lists:keyfind(ProgressId, #quest_progress.id,
			     Progress)
	      of
	    false ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidquest_progress342, _,
		   {__Levelquest_progress342, __Tracesquest_progress342}}
		      when __Levelquest_progress342 band 8 /= 0 orelse
			     __Tracesquest_progress342 /= [] ->
		      lager:do_log(error,
				   [{module, quest_progress}, {function, fetch},
				    {line, 342}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("m_lanterm_adventure[~w]中不存在编号为[~w]的进度",
						 [QuestId, ProgressId]),
				   none, 4096, 8, __Levelquest_progress342,
				   __Tracesquest_progress342, lager_event,
				   __Pidquest_progress342);
		  _ -> ok
		end,
		{error, progress_not_found};
	    P -> {ok, Q, P}
	  end;
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidquest_progress347, _,
	     {__Levelquest_progress347, __Tracesquest_progress347}}
		when __Levelquest_progress347 band 8 /= 0 orelse
		       __Tracesquest_progress347 /= [] ->
		lager:do_log(error,
			     [{module, quest_progress}, {function, fetch},
			      {line, 347}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]未接受编号为[~w]的元宵冒险任务",
					   [Name, QuestId]),
			     none, 4096, 8, __Levelquest_progress347,
			     __Tracesquest_progress347, lager_event,
			     __Pidquest_progress347);
	    _ -> ok
	  end,
	  {error, quest_not_found}
    end;
fetch(#role{name = Name,
	    m_holiday_return_new =
		#m_holiday_return_new{quest_list = List}},
      holiday_return_new_feat, QuestId, ProgressId) ->
    case lists:keyfind(QuestId, #quest.id, List) of
      Q = #quest{progress = Progress} ->
	  case lists:keyfind(ProgressId, #quest_progress.id,
			     Progress)
	      of
	    false ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidquest_progress355, _,
		   {__Levelquest_progress355, __Tracesquest_progress355}}
		      when __Levelquest_progress355 band 8 /= 0 orelse
			     __Tracesquest_progress355 /= [] ->
		      lager:do_log(error,
				   [{module, quest_progress}, {function, fetch},
				    {line, 355}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("m_holiday_return_new[~w]中不存在编号为[~w]的进度",
						 [QuestId, ProgressId]),
				   none, 4096, 8, __Levelquest_progress355,
				   __Tracesquest_progress355, lager_event,
				   __Pidquest_progress355);
		  _ -> ok
		end,
		{error, progress_not_found};
	    P -> {ok, Q, P}
	  end;
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidquest_progress360, _,
	     {__Levelquest_progress360, __Tracesquest_progress360}}
		when __Levelquest_progress360 band 8 /= 0 orelse
		       __Tracesquest_progress360 /= [] ->
		lager:do_log(error,
			     [{module, quest_progress}, {function, fetch},
			      {line, 360}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]未接受编号为[~w]的元宵冒险任务",
					   [Name, QuestId]),
			     none, 4096, 8, __Levelquest_progress360,
			     __Tracesquest_progress360, lager_event,
			     __Pidquest_progress360);
	    _ -> ok
	  end,
	  {error, quest_not_found}
    end;
fetch(#role{name = Name,
	    m_day_goals = #m_day_goals{new_grow_list = GrowList}},
      day_goals_new, QuestId, ProgressId) ->
    case lists:keyfind(QuestId, #quest.id, GrowList) of
      Q = #quest{progress = Progress} ->
	  case lists:keyfind(ProgressId, #quest_progress.id,
			     Progress)
	      of
	    false ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidquest_progress368, _,
		   {__Levelquest_progress368, __Tracesquest_progress368}}
		      when __Levelquest_progress368 band 8 /= 0 orelse
			     __Tracesquest_progress368 /= [] ->
		      lager:do_log(error,
				   [{module, quest_progress}, {function, fetch},
				    {line, 368}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("新七日目标[~w]中不存在编号为[~w]的进度",
						 [QuestId, ProgressId]),
				   none, 4096, 8, __Levelquest_progress368,
				   __Tracesquest_progress368, lager_event,
				   __Pidquest_progress368);
		  _ -> ok
		end,
		{error, progress_not_found};
	    P -> {ok, Q, P}
	  end;
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidquest_progress373, _,
	     {__Levelquest_progress373, __Tracesquest_progress373}}
		when __Levelquest_progress373 band 8 /= 0 orelse
		       __Tracesquest_progress373 /= [] ->
		lager:do_log(error,
			     [{module, quest_progress}, {function, fetch},
			      {line, 373}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]未接受编号为[~w]的新七日目标",
					   [Name, QuestId]),
			     none, 4096, 8, __Levelquest_progress373,
			     __Tracesquest_progress373, lager_event,
			     __Pidquest_progress373);
	    _ -> ok
	  end,
	  {error, quest_not_found}
    end;
fetch(#role{name = Name,
	    m_war_order = #m_war_order{quest_list = QuestList}},
      holiday_war_order, QuestId, ProgressId) ->
    case lists:keyfind(QuestId, #quest.id, QuestList) of
      Q = #quest{progress = Progress} ->
	  case lists:keyfind(ProgressId, #quest_progress.id,
			     Progress)
	      of
	    false ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidquest_progress381, _,
		   {__Levelquest_progress381, __Tracesquest_progress381}}
		      when __Levelquest_progress381 band 8 /= 0 orelse
			     __Tracesquest_progress381 /= [] ->
		      lager:do_log(error,
				   [{module, quest_progress}, {function, fetch},
				    {line, 381}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("m_war_order[~w]中不存在编号为[~w]的进度",
						 [QuestId, ProgressId]),
				   none, 4096, 8, __Levelquest_progress381,
				   __Tracesquest_progress381, lager_event,
				   __Pidquest_progress381);
		  _ -> ok
		end,
		{error, progress_not_found};
	    P -> {ok, Q, P}
	  end;
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidquest_progress386, _,
	     {__Levelquest_progress386, __Tracesquest_progress386}}
		when __Levelquest_progress386 band 8 /= 0 orelse
		       __Tracesquest_progress386 /= [] ->
		lager:do_log(error,
			     [{module, quest_progress}, {function, fetch},
			      {line, 386}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]未接受编号为[~w]的战令任务",
					   [Name, QuestId]),
			     none, 4096, 8, __Levelquest_progress386,
			     __Tracesquest_progress386, lager_event,
			     __Pidquest_progress386);
	    _ -> ok
	  end,
	  {error, quest_not_found}
    end;
fetch(#role{name = Name,
	    m_new_war_order =
		#m_new_war_order{quest_list = QuestList}},
      holiday_new_war_order, QuestId, ProgressId) ->
    case lists:keyfind(QuestId, #quest.id, QuestList) of
      Q = #quest{progress = Progress} ->
	  case lists:keyfind(ProgressId, #quest_progress.id,
			     Progress)
	      of
	    false ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidquest_progress394, _,
		   {__Levelquest_progress394, __Tracesquest_progress394}}
		      when __Levelquest_progress394 band 8 /= 0 orelse
			     __Tracesquest_progress394 /= [] ->
		      lager:do_log(error,
				   [{module, quest_progress}, {function, fetch},
				    {line, 394}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("m_new_war_order[~w]中不存在编号为[~w]的进度",
						 [QuestId, ProgressId]),
				   none, 4096, 8, __Levelquest_progress394,
				   __Tracesquest_progress394, lager_event,
				   __Pidquest_progress394);
		  _ -> ok
		end,
		{error, progress_not_found};
	    P -> {ok, Q, P}
	  end;
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidquest_progress399, _,
	     {__Levelquest_progress399, __Tracesquest_progress399}}
		when __Levelquest_progress399 band 8 /= 0 orelse
		       __Tracesquest_progress399 /= [] ->
		lager:do_log(error,
			     [{module, quest_progress}, {function, fetch},
			      {line, 399}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]未接受编号为[~w]的战令任务",
					   [Name, QuestId]),
			     none, 4096, 8, __Levelquest_progress399,
			     __Tracesquest_progress399, lager_event,
			     __Pidquest_progress399);
	    _ -> ok
	  end,
	  {error, quest_not_found}
    end;
fetch(Role, _Label, QuestId, ProgressId) ->
    fetch(Role, quest, QuestId, ProgressId).

-spec update(#role{}, Label :: quest,
	     QuestId :: pos_integer(), ProgressId :: pos_integer(),
	     #quest_progress{}) -> #role{}.

update(Role = #role{m_quest =
			Mquest = #m_quest{quest = Quests}},
       quest, Q = #quest{id = QuestId, progress = Progress},
       ProgressId, P) ->
    NewP = lists:keyreplace(ProgressId, #quest_progress.id,
			    Progress, P),
    case [false || #quest_progress{finish = 0} <- NewP] of
      [] ->
	  NewQ = Q#quest{progress = NewP, finish = 1},
	  NewQuests = lists:keyreplace(QuestId, #quest.id, Quests,
				       NewQ),
	  case quest_data:get(QuestId) of
	    #quest_data{commit_type = 2} ->
		role:redirect(Role, 10406, {QuestId}), ok;
	    _ -> role:pack_send(Role, 10409, {[NewQ]}), ok
	  end,
	  role_trigger:fire(#evt_finish_quest{id = QuestId},
			    Role#role{m_quest =
					  Mquest#m_quest{quest = NewQuests}});
      _ ->
	  NewQ = Q#quest{finish = 0, progress = NewP},
	  role:pack_send(Role, 10409, {[NewQ]}),
	  NewQuests = lists:keyreplace(QuestId, #quest.id, Quests,
				       NewQ),
	  Role#role{m_quest = Mquest#m_quest{quest = NewQuests}}
    end;
update(Role = #role{m_feat =
			MFeat = #m_feat{doing = Quests}},
       feat, Q = #quest{id = QuestId, progress = Progress},
       ProgressId, P) ->
    NewP = lists:keyreplace(ProgressId, #quest_progress.id,
			    Progress, P),
    case [false || #quest_progress{finish = 0} <- NewP] of
      [] ->
	  NewQuest = Q#quest{progress = NewP, finish = 1},
	  case feat_data:get(QuestId) of
	    #quest_data{commit_type = 2} ->
		role:redirect(Role, 16402, {QuestId}), ok;
	    _ -> feat:push_prog(Role, [NewQuest]), ok
	  end,
	  NewQuests = lists:keyreplace(QuestId, #quest.id, Quests,
				       NewQuest),
	  NRole = Role#role{m_feat =
				MFeat#m_feat{doing = NewQuests}},
	  feat:open_next(NRole, QuestId);
      _ ->
	  NewQuest = Q#quest{progress = NewP},
	  feat:push_prog(Role, [NewQuest]),
	  NewQuests = lists:keyreplace(QuestId, #quest.id, Quests,
				       NewQuest),
	  Role#role{m_feat = MFeat#m_feat{doing = NewQuests}}
    end;
update(Role = #role{m_room_feat =
			MFeat = #m_room_feat{doing = Quests}},
       room_feat,
       Q = #quest{id = QuestId, progress = Progress},
       ProgressId, P) ->
    NewP = lists:keyreplace(ProgressId, #quest_progress.id,
			    Progress, P),
    case [false || #quest_progress{finish = 0} <- NewP] of
      [] ->
	  NewQuest = Q#quest{progress = NewP, finish = 1},
	  case room_feat_data:get(QuestId) of
	    #quest_data{commit_type = 2} ->
		role:redirect(Role, 25812, {QuestId}), ok;
	    _ -> room_feat:push_prog(Role, [NewQuest]), ok
	  end,
	  NewQuests = lists:keyreplace(QuestId, #quest.id, Quests,
				       NewQuest),
	  NRole = Role#role{m_room_feat =
				MFeat#m_room_feat{doing = NewQuests}},
	  room_feat:open_next(NRole, QuestId);
      _ ->
	  NewQuest = Q#quest{progress = NewP},
	  room_feat:push_prog(Role, [NewQuest]),
	  NewQuests = lists:keyreplace(QuestId, #quest.id, Quests,
				       NewQuest),
	  Role#role{m_room_feat =
			MFeat#m_room_feat{doing = NewQuests}}
    end;
update(Role = #role{m_days_ranks =
			MFeat = #m_days_rank{doing = Quests}},
       days_rank,
       Q = #quest{id = QuestId, progress = Progress},
       ProgressId, P) ->
    NewP = lists:keyreplace(ProgressId, #quest_progress.id,
			    Progress, P),
    case [false || #quest_progress{finish = 0} <- NewP] of
      [] ->
	  NewQuest = Q#quest{progress = NewP, finish = 1},
	  case (days_rank:data_mod()):get_quest(QuestId) of
	    #quest_data{commit_type = 2} ->
		role:redirect(Role, 16402, {QuestId}), ok;
	    _ -> days_rank:push_prog(Role, [NewQuest]), ok
	  end,
	  NewQuests = lists:keyreplace(QuestId, #quest.id, Quests,
				       NewQuest),
	  Role#role{m_days_ranks =
			MFeat#m_days_rank{doing = NewQuests}};
      _ ->
	  NewQuest = Q#quest{progress = NewP},
	  days_rank:push_prog(Role, [NewQuest]),
	  NewQuests = lists:keyreplace(QuestId, #quest.id, Quests,
				       NewQuest),
	  Role#role{m_days_ranks =
			MFeat#m_days_rank{doing = NewQuests}}
    end;
update(Role = #role{m_day_goals =
			MGoals = #m_day_goals{grow_list = GrowList}},
       day_goals,
       Q = #grow_data{goal_id = QuestId, progress = Progress},
       ProgressId, P) ->
    NewP = lists:keyreplace(ProgressId, #quest_progress.id,
			    Progress, P),
    [#quest_progress{value = Val}] = NewP,
    case [false || #quest_progress{finish = 0} <- NewP] of
      [] ->
	  NewQuest = Q#grow_data{progress = NewP, condition = Val,
				 status = 1},
	  NewGrowList = lists:keyreplace(QuestId,
					 #grow_data.goal_id, GrowList,
					 NewQuest),
	  NewRole = Role#role{m_day_goals =
				  MGoals#m_day_goals{grow_list = NewGrowList}},
	  day_goals:push_quest(NewRole),
	  NewRole;
      _ ->
	  NewQuest = Q#grow_data{progress = NewP,
				 condition = Val},
	  NewGrowList = lists:keyreplace(QuestId,
					 #grow_data.goal_id, GrowList,
					 NewQuest),
	  Role#role{m_day_goals =
			MGoals#m_day_goals{grow_list = NewGrowList}}
    end;
update(Role, guild_quest, Q, _ProgressId, P) ->
    guild_quest:update(Role, Q, P);
update(Role, hallows_quest, Q, _ProgressId, P) ->
    hallows:update_quest(Role, Q, P);
update(Role, hallows_look_quest, Q, _ProgressId, P) ->
    hallows_look:update_quest(Role, Q, P);
update(Role = #role{m_lanterm_adventure =
			MLanterm = #m_lanterm_adventure{quest_list = Quests}},
       holiday_lanterm_adventure,
       Q = #quest{id = QuestId, progress = Progress},
       ProgressId, P) ->
    NewP = lists:keyreplace(ProgressId, #quest_progress.id,
			    Progress, P),
    case [false || #quest_progress{finish = 0} <- NewP] of
      [] ->
	  NewQuest = Q#quest{progress = NewP, finish = 1},
	  NewQuests = lists:keyreplace(QuestId, #quest.id, Quests,
				       NewQuest),
	  holiday_lanterm_adventure:push_quest_info(NewQuest),
	  NewRole = Role#role{m_lanterm_adventure =
				  MLanterm#m_lanterm_adventure{quest_list =
								   NewQuests}},
	  holiday:push_bid_can_reward(NewRole, 93018),
	  NewRole;
      _ ->
	  NewQuest = Q#quest{progress = NewP},
	  NewQuests = lists:keyreplace(QuestId, #quest.id, Quests,
				       NewQuest),
	  holiday_lanterm_adventure:push_quest_info(NewQuest),
	  Role#role{m_lanterm_adventure =
			MLanterm#m_lanterm_adventure{quest_list = NewQuests}}
    end;
update(Role = #role{m_lanterm_adventure1 =
			MLanterm = #m_lanterm_adventure1{quest_list = Quests}},
       holiday_lanterm_adventure1,
       Q = #quest{id = QuestId, progress = Progress},
       ProgressId, P) ->
    NewP = lists:keyreplace(ProgressId, #quest_progress.id,
			    Progress, P),
    case [false || #quest_progress{finish = 0} <- NewP] of
      [] ->
	  NewQuest = Q#quest{progress = NewP, finish = 1},
	  NewQuests = lists:keyreplace(QuestId, #quest.id, Quests,
				       NewQuest),
	  holiday_lanterm_adventure1:push_quest_info(NewQuest),
	  NewRole = Role#role{m_lanterm_adventure1 =
				  MLanterm#m_lanterm_adventure1{quest_list =
								    NewQuests}},
	  holiday:push_bid_can_reward(NewRole, 93031),
	  NewRole;
      _ ->
	  NewQuest = Q#quest{progress = NewP},
	  NewQuests = lists:keyreplace(QuestId, #quest.id, Quests,
				       NewQuest),
	  holiday_lanterm_adventure1:push_quest_info(NewQuest),
	  Role#role{m_lanterm_adventure1 =
			MLanterm#m_lanterm_adventure1{quest_list = NewQuests}}
    end;
update(Role = #role{m_lanterm_adventure2 =
			MLanterm = #m_lanterm_adventure2{quest_list = Quests}},
       holiday_lanterm_adventure2,
       Q = #quest{id = QuestId, progress = Progress},
       ProgressId, P) ->
    NewP = lists:keyreplace(ProgressId, #quest_progress.id,
			    Progress, P),
    case [false || #quest_progress{finish = 0} <- NewP] of
      [] ->
	  NewQuest = Q#quest{progress = NewP, finish = 1},
	  NewQuests = lists:keyreplace(QuestId, #quest.id, Quests,
				       NewQuest),
	  holiday_lanterm_adventure2:push_quest_info(NewQuest),
	  NewRole = Role#role{m_lanterm_adventure2 =
				  MLanterm#m_lanterm_adventure2{quest_list =
								    NewQuests}},
	  holiday:push_bid_can_reward(NewRole, 93032),
	  NewRole;
      _ ->
	  NewQuest = Q#quest{progress = NewP},
	  NewQuests = lists:keyreplace(QuestId, #quest.id, Quests,
				       NewQuest),
	  holiday_lanterm_adventure2:push_quest_info(NewQuest),
	  Role#role{m_lanterm_adventure2 =
			MLanterm#m_lanterm_adventure2{quest_list = NewQuests}}
    end;
update(Role = #role{m_lanterm_adventure3 =
			MLanterm = #m_lanterm_adventure3{quest_list = Quests}},
       holiday_lanterm_adventure3,
       Q = #quest{id = QuestId, progress = Progress},
       ProgressId, P) ->
    NewP = lists:keyreplace(ProgressId, #quest_progress.id,
			    Progress, P),
    case [false || #quest_progress{finish = 0} <- NewP] of
      [] ->
	  NewQuest = Q#quest{progress = NewP, finish = 1},
	  NewQuests = lists:keyreplace(QuestId, #quest.id, Quests,
				       NewQuest),
	  holiday_lanterm_adventure3:push_quest_info(NewQuest),
	  NewRole = Role#role{m_lanterm_adventure3 =
				  MLanterm#m_lanterm_adventure3{quest_list =
								    NewQuests}},
	  holiday:push_bid_can_reward(NewRole, 93033),
	  holiday:push_bid_can_reward(NewRole, 9993033),
	  NewRole;
      _ ->
	  NewQuest = Q#quest{progress = NewP},
	  NewQuests = lists:keyreplace(QuestId, #quest.id, Quests,
				       NewQuest),
	  holiday_lanterm_adventure3:push_quest_info(NewQuest),
	  Role#role{m_lanterm_adventure3 =
			MLanterm#m_lanterm_adventure3{quest_list = NewQuests}}
    end;
update(Role = #role{m_holiday_return_feat =
			MLanterm = #m_holiday_return_feat{quest_list = Quests}},
       holiday_return_feat,
       Q = #quest{id = QuestId, progress = Progress},
       ProgressId, P) ->
    NewP = lists:keyreplace(ProgressId, #quest_progress.id,
			    Progress, P),
    case [false || #quest_progress{finish = 0} <- NewP] of
      [] ->
	  NewQuest = Q#quest{progress = NewP, finish = 1},
	  NewQuests = lists:keyreplace(QuestId, #quest.id, Quests,
				       NewQuest),
	  holiday_return_feat:push_quest_info(NewQuest),
	  NewRole = Role#role{m_holiday_return_feat =
				  MLanterm#m_holiday_return_feat{quest_list =
								     NewQuests}},
	  NewRole;
      _ ->
	  NewQuest = Q#quest{progress = NewP},
	  NewQuests = lists:keyreplace(QuestId, #quest.id, Quests,
				       NewQuest),
	  holiday_return_feat:push_quest_info(NewQuest),
	  Role#role{m_holiday_return_feat =
			MLanterm#m_holiday_return_feat{quest_list = NewQuests}}
    end;
update(Role = #role{m_holiday_return_new =
			MLanterm = #m_holiday_return_new{quest_list = Quests}},
       holiday_return_new_feat,
       Q = #quest{id = QuestId, progress = Progress},
       ProgressId, P) ->
    NewP = lists:keyreplace(ProgressId, #quest_progress.id,
			    Progress, P),
    case [false || #quest_progress{finish = 0} <- NewP] of
      [] ->
	  NewQuest = Q#quest{progress = NewP, finish = 1},
	  NewQuests = lists:keyreplace(QuestId, #quest.id, Quests,
				       NewQuest),
	  holiday_return_new_feat:push_quest_info(NewQuest),
	  NewRole = Role#role{m_holiday_return_new =
				  MLanterm#m_holiday_return_new{quest_list =
								    NewQuests}},
	  NewRole;
      _ ->
	  NewQuest = Q#quest{progress = NewP},
	  NewQuests = lists:keyreplace(QuestId, #quest.id, Quests,
				       NewQuest),
	  holiday_return_new_feat:push_quest_info(NewQuest),
	  Role#role{m_holiday_return_new =
			MLanterm#m_holiday_return_new{quest_list = NewQuests}}
    end;
update(Role, day_goals_new, Q, _ProgressId, P) ->
    day_goals_new:update_quest(Role, Q, P);
update(Role, holiday_war_order, Q, _ProgressId, P) ->
    holiday_war_order:update_quest(Role, Q, P);
update(Role, holiday_new_war_order, Q, _ProgressId,
       P) ->
    holiday_new_war_order:update_quest(Role, Q, P);
update(Role, room_grow, Q, _ProgressId, P) ->
    room_grow:update(Role, Q, P);
update(Role, ios_mark, Q, _ProgressId, P) ->
    ios_mark:update_quest(Role, Q, P);
update(Role = #role{name = Name}, _Label, _Quest,
       _ProgressId, _P) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidquest_progress624, _,
       {__Levelquest_progress624, __Tracesquest_progress624}}
	  when __Levelquest_progress624 band 8 /= 0 orelse
		 __Tracesquest_progress624 /= [] ->
	  lager:do_log(error,
		       [{module, quest_progress}, {function, update},
			{line, 624}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts]更新任务进度出错:_Label:~w Quest:~w ProgressId:~w",
				     [Name, _Label, _Quest, _ProgressId]),
		       none, 4096, 8, __Levelquest_progress624,
		       __Tracesquest_progress624, lager_event,
		       __Pidquest_progress624);
      _ -> ok
    end,
    Role.

-spec event(Evt :: tuple(), #role{}, Label :: quest,
	    QuestId :: pos_integer(), ProgressId :: pos_integer(),
	    Target :: non_neg_integer(), Param :: list()) -> ok |
							     remove |
							     {remove, #role{}} |
							     {ok, #role{}}.

event(#evt_levup{}, Role = #role{lev = Lev}, Label,
      QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Lev >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Lev > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Lev},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_levup{}, Role = #role{lev = Lev}, Label,
      QuestId, ProgressId, _Target, [{open_day, Day}]) ->
    case game_lib:server_open_time(day) =:= Day of
      true ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 param = Param}}
		when Lev >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = OldVal}}
		when Lev > OldVal ->
		NewP = P#quest_progress{finish = 0, value = Lev},
		{ok, update(Role, Label, Quest, ProgressId, NewP)};
	    _ -> ok
	  end;
      _ -> ok
    end;
event(#evt_guild_quest_lev{lev = Lev}, Role = #role{},
      Label, QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Lev >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Lev > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Lev},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_cli_loaded{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_cli_loaded{},
      Role = #role{m_var = #m_var{acc_days = AccDays}}, Label,
      QuestId, ProgressId, _Target, [acc]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when AccDays >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when AccDays > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = AccDays},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_cli_loaded{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_kill_npc{host_base_id = BaseId, num = Num},
      Role, Label, QuestId, ProgressId, Target, [])
    when BaseId =:= Target orelse Target =:= 0 ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_kill_npc{host_base_id = BaseId, num = Num},
      Role, Label, QuestId, ProgressId, Target, _Param)
    when BaseId =:= Target orelse Target =:= 0 ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_kill_npc{host_base_id = BaseId, num = Num},
      Role, Label, QuestId, ProgressId, _Target,
      [{unit_minor_type, Type}]) ->
    case unit_data:get(BaseId) of
      #unit_data{minor_type = Type} ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + Num >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0,
					value = Value + Num},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_kill_npc{host_base_id = BaseId, num = Num},
      Role, Label, QuestId, ProgressId, _Target,
      Param = [_ | _]) ->
    case lists:member(BaseId, Param) of
      true ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + Num >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0,
					value = Value + Num},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(_Evt = #evt_kill_npc{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_kill_npc_lose{base_id = BaseId, num = Num},
      Role, Label, QuestId, ProgressId, Target, _Param)
    when BaseId =:= Target orelse Target =:= 0 ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_kill_npc_lose{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_fight_unit{base_id = BaseId, num = Num},
      Role, Label, QuestId, ProgressId, Target, _Param)
    when BaseId =:= Target orelse Target =:= 0 ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_fight_unit{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_combat_start{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_combat_start{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_unit_click{base_id = BaseId}, Role, Label,
      QuestId, ProgressId, Target, [])
    when BaseId =:= Target orelse Target =:= 0 ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_unit_click{base_id = BaseId}, Role, Label,
      QuestId, ProgressId, Target, _Param)
    when BaseId =:= Target orelse Target =:= 0 ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_unit_click{base_id = BaseId}, Role, Label,
      QuestId, ProgressId, _Target, Param = [_ | _]) ->
    case lists:member(BaseId, Param) of
      true ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_unit_click{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_get_item{base_id = Target, num = Num}, Role,
      Label, QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_get_item{base_id = BaseId, num = Num}, Role,
      Label, QuestId, ProgressId, _Target,
      [{star_divination_quality, Quality}]) ->
    case item_data:get(BaseId) of
      #item_base{quality = Quality, type = Type} ->
	  case lists:member(Type, [11, 12, 13, 14]) of
	    true ->
		case fetch(Role, Label, QuestId, ProgressId) of
		  {error, role} -> {ok, Role};
		  {error, _} -> remove;
		  {ok, _Quest, #quest_progress{finish = Finish}}
		      when Finish =/= 0 ->
		      remove;
		  {ok, Quest,
		   P = #quest_progress{target_val = TargetVal,
				       value = Value, param = Param}}
		      when Value + Num >= TargetVal ->
		      RemoveRole = drama_quest:remove_task_unit(Role, Param),
		      Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		      NewP = P#quest_progress{finish = 1, value = TargetVal,
					      trigger = undefined},
		      {remove, update(Role1, Label, Quest, ProgressId, NewP)};
		  {ok, Quest, P = #quest_progress{value = Value}} ->
		      NewP = P#quest_progress{finish = 0,
					      value = Value + Num},
		      {ok, update(Role, Label, Quest, ProgressId, NewP)}
		end;
	    _ -> ok
	  end;
      _ -> ok
    end;
event(#evt_get_item{base_id = BaseId, num = Num}, Role,
      Label, QuestId, ProgressId, _Target,
      [{eqm_quality, Quality}]) ->
    case item_data:get(BaseId) of
      #item_base{quality = Quality, type = Type} ->
	  case lists:member(Type, [3, 4, 1, 2]) of
	    true ->
		case fetch(Role, Label, QuestId, ProgressId) of
		  {error, role} -> {ok, Role};
		  {error, _} -> remove;
		  {ok, _Quest, #quest_progress{finish = Finish}}
		      when Finish =/= 0 ->
		      remove;
		  {ok, Quest,
		   P = #quest_progress{target_val = TargetVal,
				       value = Value, param = Param}}
		      when Value + Num >= TargetVal ->
		      RemoveRole = drama_quest:remove_task_unit(Role, Param),
		      Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		      NewP = P#quest_progress{finish = 1, value = TargetVal,
					      trigger = undefined},
		      {remove, update(Role1, Label, Quest, ProgressId, NewP)};
		  {ok, Quest, P = #quest_progress{value = Value}} ->
		      NewP = P#quest_progress{finish = 0,
					      value = Value + Num},
		      {ok, update(Role, Label, Quest, ProgressId, NewP)}
		end;
	    _ -> ok
	  end;
      _ -> ok
    end;
event(#evt_get_item{base_id = BaseId, num = Num}, Role,
      Label, QuestId, ProgressId, _Target,
      [{sprite_quality, Quality}]) ->
    case item_data:get(BaseId) of
      #item_base{quality = QualityT, type = 36}
	  when QualityT >= Quality ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + Num >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0,
					value = Value + Num},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_get_item{base_id = BaseId, num = Num}, Role,
      Label, QuestId, ProgressId, _Target,
      [{sprite_egg_quality, Quality}]) ->
    case item_data:get(BaseId) of
      #item_base{quality = QualityT, type = 37}
	  when QualityT >= Quality ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + Num >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0,
					value = Value + Num},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_get_item{base_id = BaseId, num = Num}, Role,
      Label, QuestId, ProgressId, _Target,
      [{home_pet_item, ItemType}]) ->
    case item_data:get(BaseId) of
      #item_base{type = Type} ->
	  case lists:member(Type, [33, 34, 35]) of
	    true ->
		if ItemType == 0 ->
		       case fetch(Role, Label, QuestId, ProgressId) of
			 {error, role} -> {ok, Role};
			 {error, _} -> remove;
			 {ok, _Quest, #quest_progress{finish = Finish}}
			     when Finish =/= 0 ->
			     remove;
			 {ok, Quest,
			  P = #quest_progress{target_val = TargetVal,
					      value = Value, param = Param}}
			     when Value + Num >= TargetVal ->
			     RemoveRole = drama_quest:remove_task_unit(Role,
								       Param),
			     Role1 = monitor_quest_prog(Label, P, Quest,
							RemoveRole),
			     NewP = P#quest_progress{finish = 1,
						     value = TargetVal,
						     trigger = undefined},
			     {remove,
			      update(Role1, Label, Quest, ProgressId, NewP)};
			 {ok, Quest, P = #quest_progress{value = Value}} ->
			     NewP = P#quest_progress{finish = 0,
						     value = Value + Num},
			     {ok, update(Role, Label, Quest, ProgressId, NewP)}
		       end;
		   ItemType == Type ->
		       case fetch(Role, Label, QuestId, ProgressId) of
			 {error, role} -> {ok, Role};
			 {error, _} -> remove;
			 {ok, _Quest, #quest_progress{finish = Finish}}
			     when Finish =/= 0 ->
			     remove;
			 {ok, Quest,
			  P = #quest_progress{target_val = TargetVal,
					      value = Value, param = Param}}
			     when Value + Num >= TargetVal ->
			     RemoveRole = drama_quest:remove_task_unit(Role,
								       Param),
			     Role1 = monitor_quest_prog(Label, P, Quest,
							RemoveRole),
			     NewP = P#quest_progress{finish = 1,
						     value = TargetVal,
						     trigger = undefined},
			     {remove,
			      update(Role1, Label, Quest, ProgressId, NewP)};
			 {ok, Quest, P = #quest_progress{value = Value}} ->
			     NewP = P#quest_progress{finish = 0,
						     value = Value + Num},
			     {ok, update(Role, Label, Quest, ProgressId, NewP)}
		       end;
		   true -> ok
		end;
	    _ -> ok
	  end;
      _ -> ok
    end;
event(#evt_get_item{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_use_item{base_id = Target, num = Num}, Role,
      Label, QuestId, ProgressId, Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_use_item{base_id = BaseId, num = Num}, Role,
      Label, QuestId, ProgressId, _Target, Param) ->
    case is_list(Param) andalso lists:member(BaseId, Param)
	of
      true ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + Num >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0,
					value = Value + Num},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_use_item_type{type = Type}, Role, Label,
      QuestId, ProgressId, Type, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_use_item_type{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_del_item{base_id = Target, num = Num}, Role,
      Label, QuestId, ProgressId, Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_del_item{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_gain_gold{val = Num}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_loss_gold{val = Num}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_gain_red_gold{val = Num}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_loss_red_gold{val = Num}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_loss_red_gold_or_gold{val = Num}, Role,
      Label, QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_gain_coin{val = Num}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_loss_coin{val = Num}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_loss_hero_exp{val = Num}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_gain_silver_coin{val = Num}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_loss_silver_coin{val = Num}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_gain_energy{val = Num}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_loss_energy{val = Num}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_loss_hero_soul{val = Num}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_gain_activity{val = Num}, Role, Label,
      QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_gain_guild{val = Num}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_loss_guild{val = Num}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_pay{gold = Target}, Role, Label, QuestId,
      ProgressId, 0, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Target >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Target},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_pay{gold = Target}, Role, Label, QuestId,
      ProgressId, Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_pay{info = Opt}, Role, Label, QuestId,
      ProgressId, _Target, [rmb]) ->
    VipExp = maps:get(vip_exp, Opt, 0),
    Rmb = util:round(VipExp / 10),
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Rmb >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Rmb},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_pay{}, _Role, _Label, _QuestId, _ProgressId,
      _Target, _Param) ->
    ok;
event(#evt_charge_acc{gold = Gold}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Gold >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Gold},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_accept_quest{id = QuestId}, Role, Label,
      QuestId, ProgressId, QuestId, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_accept_quest{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_commit_quest{id = Target}, Role, Label,
      QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_commit_quest{id = Id}, Role, Label, QuestId,
      ProgressId, _Target, [{type, Type}]) ->
    case quest_data:get(Id) of
      #quest_data{type = Type} ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_commit_quest{id = Id}, Role, Label, QuestId,
      ProgressId, _Target, [quest_daily]) ->
    case quest_data:get(Id) of
      #quest_data{type = 3} ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_commit_quest{id = Id}, Role, Label, QuestId,
      ProgressId, _Target, [{group, GroupId, Layer}]) ->
    case quest_data:get(Id) of
      #quest_data{group = GroupId, layer = Layer} ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_commit_quest{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_broadcast_drama{base_id = DramaBid}, Role,
      Label, QuestId, ProgressId, Target, _Param)
    when DramaBid =:= Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when 1 > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_broadcast_drama{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_power{}, Role = #role{power = Power}, Label,
      QuestId, ProgressId, LimitPower, [no_show])
    when Power >= LimitPower ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_power{}, _Role, _Label, _QuestId,
      _ProgressId, _LimitPower, [no_show]) ->
    ok;
event(#evt_power{}, Role = #role{power = Power}, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Power >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Power > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Power},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_arena_fight{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_fight_result{result = Target}, Role,
      Label, QuestId, ProgressId, Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_fight_result{result = Result,
			      use_sprite = 1},
      Role, Label, QuestId, ProgressId, Target,
      [{Result, with_sprite}]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_fight_result{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_arena_rank{rank = Rank}, Role, Label,
      QuestId, ProgressId, Target, _Param)
    when Rank > 0 andalso Rank =< Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when 1 > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_arena_rank{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_arena_score_lev{score_lev = ScoreLev}, Role,
      Label, QuestId, ProgressId, Target, _Param)
    when ScoreLev >= Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when 1 > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_arena_score_lev{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_arena_score{score = Score}, Role, Label,
      QuestId, ProgressId, Target, _Param)
    when Score >= Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when 1 > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_arena_score{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#holy_eqm_frist_open{}, Role, Label, QuestId,
      ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when 1 > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_arena_score2{score = Score}, Role, Label,
      QuestId, ProgressId, Target, _Param)
    when Score >= Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when 1 > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_arena_score2{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_arena_use_partner{bids = PBids, result = 1},
      Role, Label, QuestId, ProgressId, 0, [{use, PBid}]) ->
    case lists:member(PBid, PBids) of
      true ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_arena_use_partner{bids = PBids}, Role, Label,
      QuestId, ProgressId, 1, [{use, PBid}]) ->
    case lists:member(PBid, PBids) of
      true ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_arena_use_partner{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_dungeon_enter{count = Count}, Role, Label,
      QuestId, ProgressId, _Target, [chapter]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_dungeon_enter{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_dungeon_pass{dungeon_id = DungeonId}, Role,
      Label, QuestId, ProgressId, DungeonId, [chapter]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_dungeon_pass{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_star_tower_floor_pass{},
      Role = #role{m_star_tower =
		       #m_star_tower{max_tower = MaxPower}},
      Label, QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when MaxPower >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when MaxPower > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = MaxPower},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_dungeon_auto{count = Num}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_dungeon_fast_combat{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_exchange{type = Type}, Role, Label, QuestId,
      ProgressId, _Target, Param) ->
    case Param =:= [] orelse lists:member(Type, Param) of
      true ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_recruit{group = Target,
		   partner_infos = PartnerInfo},
      Role, Label, QuestId, ProgressId, Target,
      [{bind_star, NeedStar}]) ->
    case [Star
	  || {_, Star} <- PartnerInfo, Star >= NeedStar]
	of
      L = [_ | _] ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + length(L) >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0,
					value = Value + length(L)},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_recruit{group = Target,
		   partner_infos = PartnerInfo},
      Role, Label, QuestId, ProgressId, Target,
      [{one_bind_star, NeedStar}]) ->
    case [Star
	  || {_, Star} <- PartnerInfo, Star >= NeedStar]
	of
      L = [_ | _] ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 param = Param}}
		when length(L) >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = OldVal}}
		when length(L) > OldVal ->
		NewP = P#quest_progress{finish = 0, value = length(L)},
		{ok, update(Role, Label, Quest, ProgressId, NewP)};
	    _ -> ok
	  end;
      _ -> ok
    end;
event(#evt_recruit{group = Target, count = Count}, Role,
      Label, QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_recruit{count = Count}, Role, Label, QuestId,
      ProgressId, 0, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_recruit{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_elite_recruit_info{partner_infos =
				  PartnerInfo},
      Role, Label, QuestId, ProgressId, Target,
      [{one_bind_star, NeedStar}]) ->
    case [Star
	  || {_, Star} <- PartnerInfo, Star >= NeedStar]
	of
      L = [_ | _] ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 param = Param}}
		when length(L) >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = OldVal}}
		when length(L) > OldVal ->
		NewP = P#quest_progress{finish = 0, value = length(L)},
		{ok, update(Role, Label, Quest, ProgressId, NewP)};
	    _ -> ok
	  end;
      _ -> ok
    end;
event(#evt_recruit_high{count = Count}, Role, Label,
      QuestId, ProgressId, 0, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_recruit_high{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_friend{}, Role, Label, QuestId, ProgressId,
      _Target, [num]) ->
    Num = friend:friend_num(Role),
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Num > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_friend{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_friend_cluster{}, Role, Label, QuestId,
      ProgressId, _Target, [num]) ->
    Num = length(friend_lib:cross_friends(Role)),
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Num > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_friend_cluster{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_eqm_compound{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_friend_present{}, Role, Label, QuestId,
      ProgressId, 0, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_friend_present{base_id = BaseId}, Role,
      Label, QuestId, ProgressId, BaseId, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_friend_present{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_friend_sns{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_partner{},
      Role = #role{partner_bag =
		       #partner_bag{partner_list = Partners,
				    partner_decomposes = DecomPoses}},
      Label, QuestId, ProgressId, _Target, []) ->
    PartnerBids = [Bid || #partner{bid = Bid} <- Partners],
    AllP = list_util:filter_replicat(PartnerBids ++
				       DecomPoses),
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when length(AllP) >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when length(AllP) > OldVal ->
	  NewP = P#quest_progress{finish = 0,
				  value = length(AllP)},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_partner{},
      Role = #role{partner_bag =
		       #partner_bag{partner_list = Partners}},
      Label, QuestId, ProgressId, _Target, [{lev, Lev}]) ->
    List = [P
	    || P = #partner{lev = PLev} <- Partners, PLev >= Lev],
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when length(List) >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when length(List) > OldVal ->
	  NewP = P#quest_progress{finish = 0,
				  value = length(List)},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_partner{},
      Role = #role{partner_bag =
		       #partner_bag{partner_list = Partners}},
      Label, QuestId, ProgressId, _Target,
      [{break_lev, BreakLev}]) ->
    List = [P
	    || P = #partner{break_lev = PBreakLev} <- Partners,
	       PBreakLev >= BreakLev],
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when length(List) >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when length(List) > OldVal ->
	  NewP = P#quest_progress{finish = 0,
				  value = length(List)},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_partner{},
      Role = #role{partner_bag =
		       #partner_bag{partner_list = Partners}},
      Label, QuestId, ProgressId, 0, [{star, Star}]) ->
    List = [P
	    || P = #partner{star = PStar} <- Partners,
	       PStar >= Star],
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when length(List) >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when length(List) > OldVal ->
	  NewP = P#quest_progress{finish = 0,
				  value = length(List)},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_partner{ext = #{star := Star}}, Role, Label,
      QuestId, ProgressId, 0, [{bind_star, Star}]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_partner{ext =
		       #{star := Star, camp_type := CampType}},
      Role, Label, QuestId, ProgressId, 0,
      [{bind_star, Star, CampType}]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_partner{ext = #{star := Star}}, Role, Label,
      QuestId, ProgressId, 0, [{bind_star2, Star}]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_partner{ext =
		       #{star := Star, camp_type := CampType}},
      Role, Label, QuestId, ProgressId, 0,
      [{bind_star2, Star, CampType}]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_partner{},
      Role = #role{partner_bag =
		       #partner_bag{partner_list = Partners,
				    partner_decomposes = DecomPoses}},
      Label, QuestId, ProgressId, _Target,
      [{rare_type, RareType}]) ->
    PartnerBids = [Bid || #partner{bid = Bid} <- Partners],
    AllP = list_util:filter_replicat(PartnerBids ++
				       DecomPoses),
    List = [1
	    || #partner_base_data{rare_type = PRareType}
		   <- [partner_data:get_base(Bid) || Bid <- AllP],
	       PRareType =:= RareType],
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when length(List) >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when length(List) > OldVal ->
	  NewP = P#quest_progress{finish = 0,
				  value = length(List)},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_partner{},
      Role = #role{partner_bag =
		       #partner_bag{partner_list = Partners}},
      Label, QuestId, ProgressId, _Target,
      [{pokedex_group, GroupId}]) ->
    GroupL = partner_data:pokedex_group(GroupId),
    List = [Bid
	    || #partner{bid = Bid} <- Partners,
	       lists:member(Bid, GroupL)],
    case GroupL -- List of
      [] ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 param = Param}}
		when 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = OldVal}}
		when 1 > OldVal ->
		NewP = P#quest_progress{finish = 0, value = 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)};
	    _ -> ok
	  end;
      _ -> ok
    end;
event(#evt_partner{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_partner_eqm{},
      Role = #role{partner_bag =
		       #partner_bag{partner_list = Partners}},
      Label, QuestId, ProgressId, _Target,
      [{quality, Quality, Num}]) ->
    EqmNum = case Num =:= 0 of
	       true -> length([3, 4, 1, 2]);
	       _ -> Num
	     end,
    Fun = fun (#partner{eqm = Eqms}, Acc) ->
		  Len = length([1
				|| #item{quality = EqmQuality} <- Eqms,
				   EqmQuality >= Quality]),
		  case Len >= EqmNum of
		    true -> Acc + 1;
		    false -> Acc
		  end
	  end,
    Sum = lists:foldl(Fun, 0, Partners),
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Sum >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Sum > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Sum},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_partner_eqm{},
      Role = #role{partner_bag =
		       #partner_bag{partner_list = Partners}},
      Label, QuestId, ProgressId, _Target,
      [{artifact, Quality}]) ->
    EqmNum = length([3, 4, 1, 2]),
    Fun = fun (#partner{eqm = Eqms, artifacts = Artifacts},
	       Acc) ->
		  case lists:keyfind(1, 1, Artifacts) of
		    Art1 when Art1 =/= false ->
			case lists:keyfind(2, 1, Artifacts) of
			  Art2 when Art2 =/= false ->
			      Len = length([1
					    || #item{quality = EqmQuality}
						   <- Eqms,
					       EqmQuality >= Quality]),
			      case Len >= EqmNum of
				true -> Acc + 1;
				false -> Acc
			      end;
			  _ -> Acc
			end;
		    _ -> Acc
		  end
	  end,
    Sum = lists:foldl(Fun, 0, Partners),
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Sum >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Sum > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Sum},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_partner_eqm{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_partner_enchant_eqm{count = Count}, Role,
      Label, QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_partner_enchant_eqm{},
      Role = #role{partner_bag =
		       #partner_bag{partner_list = Partners}},
      Label, QuestId, ProgressId, _Target, [{lev, Lev}]) ->
    EqmNum = length([3, 4, 1, 2]),
    Fun = fun (#partner{eqm = Eqms}, Acc) ->
		  Len = length([1
				|| #item{enchant = Enchant} <- Eqms,
				   Enchant >= Lev]),
		  case Len >= EqmNum of
		    true -> Acc + 1;
		    false -> Acc
		  end
	  end,
    Sum = lists:foldl(Fun, 0, Partners),
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Sum >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Sum > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Sum},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_partner_enchant_eqm{},
      Role = #role{partner_bag =
		       #partner_bag{partner_list = Partners}},
      Label, QuestId, ProgressId, _Target,
      [{enchant, Lev}]) ->
    Fun = fun (#partner{eqm = Eqms}, Acc) ->
		  Len = length([1
				|| #item{enchant = Enchant} <- Eqms,
				   Enchant >= Lev]),
		  Acc + Len
	  end,
    Sum = lists:foldl(Fun, 0, Partners),
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Sum >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Sum > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Sum},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_partner_enchant_eqm{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_partner_artifact{},
      Role = #role{partner_bag =
		       #partner_bag{partner_list = Partners}},
      Label, QuestId, ProgressId, _Target, [num]) ->
    Sum = lists:sum([length(Arts)
		     || #partner{artifacts = Arts} <- Partners]),
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Sum >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Sum > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Sum},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_partner_artifact{},
      Role = #role{p_bag = #package{items = Items},
		   partner_bag = #partner_bag{partner_list = Partners}},
      Label, QuestId, ProgressId, _Target, [{star, Star}]) ->
    Sum1 = lists:length(lists:flatten([[1
					|| {_, #item{enchant = Enchant}}
					       <- Arts,
					   Enchant >= Star]
				       || #partner{artifacts = Arts}
					      <- Partners])),
    Sum2 = lists:length([1
			 || #item{type = 10, enchant = Enchant} <- Items,
			    Enchant >= Star]),
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Sum1 + Sum2 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Sum1 + Sum2 > OldVal ->
	  NewP = P#quest_progress{finish = 0,
				  value = Sum1 + Sum2},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_partner_artifact{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_artifact_compose{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_partner_levelup{}, Role, Label, QuestId,
      ProgressId, _Target, [num]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_partner_levelup{bid = PBid, lev = Lev}, Role,
      Label, QuestId, ProgressId, PBid, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Lev >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Lev > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Lev},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_partner_levelup{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_partner_decompose{count = Count}, Role,
      Label, QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_partner_decompose{star = StarL}, Role, Label,
      QuestId, ProgressId, _Target, [{star, Star}]) ->
    Count = lists:sum([S || S <- StarL, S >= Star]),
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_partner_decompose{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_eqm_sell{}, Role, Label, QuestId, ProgressId,
      _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_say{channel = Channel}, Role, Label, QuestId,
      ProgressId, Channel, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_say{}, _Role, _Label, _QuestId, _ProgressId,
      _Channel, _Param) ->
    ok;
event(#evt_adventure_explore{num = Num}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_adventure_plunder{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_adventure_plunder_result{result = Target},
      Role, Label, QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_adventure_plunder_result{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_adventure_goto_floor{id = Target}, Role,
      Label, QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when 1 > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_adventure_goto_floor{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_adventure_finger_guessing{result = Target},
      Role, Label, QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_adventure_finger_guessing{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_adventure_box{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_adventure_box{items = Items}, Role, Label,
      QuestId, ProgressId, _Target, [{artifact, Id}]) ->
    case [1 || {ItemId, _} <- Items, ItemId =:= Id] of
      [_ | _] ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_adventure_box{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_adventure_answer_all_right{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_adventure_kill_mon{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_boss_fight{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_boss_fight_result{boss_id = Target,
			     result = Result},
      Role, Label, QuestId, ProgressId, Target,
      [{combat_result, Result}]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_boss_fight_result{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_world_boss_fight{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_valentine_boss{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_world_boss_fight_ko{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_star_divination{count = Count}, Role, Label,
      QuestId, ProgressId, 0, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_star_divination{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_star_tower_pass{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_star_tower_pass{}, Role, Label, QuestId,
      ProgressId, _Target, [all]) ->
    case star_tower:tower(Role) =:=
	   star_tower_data:max_tower()
	of
      true ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 param = Param}}
		when 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = OldVal}}
		when 1 > OldVal ->
		NewP = P#quest_progress{finish = 0, value = 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)};
	    _ -> ok
	  end;
      _ -> ok
    end;
event(#evt_star_tower_pass{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_star_natal{},
      Role = #role{m_star = #m_star{star_list = StarList}},
      Label, QuestId, ProgressId, _Target, [set_num]) ->
    Num = length([11, 12, 13, 14]),
    Sum = length([1
		  || #star{natals = Natals} <- StarList,
		     length(Natals) >= Num]),
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Sum >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Sum > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Sum},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_star_natal{},
      Role = #role{m_star = #m_star{star_list = StarList}},
      Label, QuestId, ProgressId, _Target,
      [{set_quality_num, Quality}]) ->
    NatalNum = length([11, 12, 13, 14]),
    Fun = fun (#star{natals = Natals}, Acc) ->
		  Len = length([1
				|| #item{quality = ItemQ} <- Natals,
				   ItemQ >= Quality]),
		  case Len >= NatalNum of
		    true -> Acc + 1;
		    false -> Acc
		  end
	  end,
    Sum = lists:foldl(Fun, 0, StarList),
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Sum >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Sum > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Sum},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_star_natal{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_star_natal_level_up{natal =
				   #item{quality = ItemQ, enchant = Enchant}},
      Role, Label, QuestId, ProgressId, _Target,
      [{natal, Quality, Star}])
    when ItemQ =:= Quality andalso Enchant >= Star ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_star_natal_level_up{},
      Role = #role{m_star = #m_star{star_list = StarList}},
      Label, QuestId, ProgressId, _Target,
      [{lev, StarLev}]) ->
    Fun = fun (#star{natals = Natals}, Acc) ->
		  Len = length([1
				|| #item{enchant = Enchant} <- Natals,
				   Enchant >= StarLev]),
		  Acc + Len
	  end,
    Sum = lists:foldl(Fun, 0, StarList),
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Sum >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Sum > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Sum},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_star_natal_level_up{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_star_level_up{},
      Role = #role{m_star = #m_star{star_list = StarList}},
      Label, QuestId, ProgressId, _Target, [{lev, Lev}]) ->
    Sum = length([1
		  || #star{lev = StarLev} <- StarList, StarLev >= Lev]),
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Sum >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Sum > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Sum},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_star_level_up{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_guild_dun_fight{count = Count}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guild_dun_fight_ko{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guild_dun_damage{dps = Dps}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Dps >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Dps > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Dps},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_guild_donate{}, Role, Label, QuestId,
      ProgressId, 0, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guild_donate{type = Target}, Role, Label,
      QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guild_donate{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_guild_donate_expend{loss = Loss}, Role,
      Label, QuestId, ProgressId, Target,
      [{item, AssetsId}]) ->
    case list_util:keyfind(AssetsId, Loss, 0) of
      Num when Num > 0 ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + Num >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0,
					value = Value + Num},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_guild_skill{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guild_join{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when 1 > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_market_gold_buy{}, Role, Label, QuestId,
      ProgressId, 0, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_market_gold_buy{price = Price}, Role, Label,
      QuestId, ProgressId, _Target, [price]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Price >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Price},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_market_gold_buy{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_market_coin_sold{num = Num}, Role, Label,
      QuestId, ProgressId, _Target, [num]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_market_coin_sold{price = Price}, Role, Label,
      QuestId, ProgressId, _Target, [price]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Price >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Price},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_market_coin_sold{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_market_silver_sold{assets = AssetsList},
      Role, Label, QuestId, ProgressId, _Target,
      [{assets, ALabel}]) ->
    Sum = lists:sum([Val
		     || {AssetsLabel, Val} <- AssetsList,
			ALabel =:= AssetsLabel]),
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Sum >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Sum},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_market_silver_sold{sold_items = Items}, Role,
      Label, QuestId, ProgressId, _Target, [num]) ->
    Sum = lists:sum([Num
		     || #market_silver_draw_item{num = Num} <- Items]),
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Sum >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Sum},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_market_silver_sold{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_market_silver_buy{price = Price}, Role,
      Label, QuestId, ProgressId, _Target, [price]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Price >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Price},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_market_silver_buy{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_formation_open{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_formation_level_up{lev = FLev},
      Role = #role{m_formation = #m_formation{list = List}},
      Label, QuestId, ProgressId, _Target, [{lev, Lev}])
    when FLev >= Lev ->
    Len = length([1
		  || {_Type, CurLev, _Exp} <- List, CurLev >= Lev]),
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Len >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Len > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Len},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_formation_level_up{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_guild_mem_red_packet_send{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guild_red_packet_reward{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guild_redpacket_best{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guild_mem_red_packet_price{max_val = Val,
				      assets = Assets},
      Role, Label, QuestId, ProgressId, _Target,
      [{item, Id}]) ->
    case item_data:assets_atom2code(Assets) of
      Id ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + Val >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0,
					value = Value + Val},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_guild_mem_red_packet_price{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_guild_dun_buff{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_endless_fight{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_endless_pass{round = Round}, Role, Label,
      QuestId, ProgressId, 0, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Round >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Round > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Round},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_endless_pass{round = Round}, Role, Label,
      QuestId, ProgressId, Target, _Param)
    when Round >= Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when 1 > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_endless_pass{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_endless_appoint{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_dungeon_stone_fight{}, Role, Label, QuestId,
      ProgressId, 0, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_dungeon_stone_fight{type = Target}, Role,
      Label, QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_dungeon_stone_fight{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_shipping{}, Role, Label, QuestId, ProgressId,
      _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_shipping{quality = Quality}, Role, Label,
      QuestId, ProgressId, _Target, [NeedQuality]) ->
    case Quality >= NeedQuality of
      true ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_shipping_refresh{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guild_war_top{rank = Rank}, Role, Label,
      QuestId, ProgressId, _Target, [NeedQuality]) ->
    case Rank > 0 andalso Rank =< NeedQuality of
      true ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_guild_war_join{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guild_war_join_and_win{}, Role, Label,
      QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_escort_enter{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_escort_fight{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_mystery_buy{type = Target}, Role, Label,
      QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_mystery_buy{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_hallows_all_step{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    AllStep = hallows_lib:get_all_step(Role),
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when AllStep >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when AllStep > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = AllStep},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_hallows_activate{},
      Role = #role{m_hallows =
		       #m_hallows{hallows_list = List}},
      Label, QuestId, ProgressId, _Target, [num]) ->
    Count = length(List),
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Count > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_hallows_activate{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_hallows_step{},
      Role = #role{m_hallows =
		       #m_hallows{hallows_list = List}},
      Label, QuestId, ProgressId, _Target, _Param) ->
    MaxSteps = [Step || #hallows{step = Step} <- List],
    MaxStep = case MaxSteps =:= [] of
		true -> 0;
		_ -> lists:max(MaxSteps)
	      end,
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when MaxStep >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when MaxStep > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = MaxStep},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_dial{},
      Role = #role{m_dial = #m_dial{info = Info}}, Label,
      QuestId, ProgressId, _Target, [all]) ->
    Count = lists:sum([N || #dial_info{count = N} <- Info]),
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Count > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_dial{count = Count}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_dial{}, _Role, _Label, _QuestId, _ProgressId,
      _Target, _Param) ->
    ok;
event(#evt_loss_hallows_essence{count = Count}, Role,
      Label, QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guild_war{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_partner_star{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_partner_star_up{star = Star}, Role, Label,
      QuestId, ProgressId, Target, _Param)
    when Star >= Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_partner_star_up{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_add_new_partner_bi_bid{bid = Bid,
				  star = Star},
      Role, Label, QuestId, ProgressId, Bid,
      [{star, Star}]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_add_new_partner_bi_bid{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_expedition_fight{count = Count}, Role, Label,
      QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_expedition_fight{round = Round}, Role, Label,
      QuestId, ProgressId, Target, [pass])
    when Round >= Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_expedition_fight{round = Round,
			    difficulty = Diff},
      Role, Label, QuestId, ProgressId, Target,
      [{expedition_difficulty, Diff2, Round}])
    when Diff >= Diff2 ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_expedition_fight{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_expedition_open_box{}, Role, Label, QuestId,
      ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_element_temple_pass{}, Role, Label, QuestId,
      ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_element_temple_pass{round = Round}, Role,
      Label, QuestId, ProgressId, Target, [pass])
    when Round >= Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_element_temple_pass{round = Round}, Role,
      Label, QuestId, ProgressId, Target, [{five_dept_pass}])
    when Round >= Target ->
    ElementTemplePassInfo = var:get_var(Role, other, 3051,
					[{1, 0}, {2, 0}, {3, 0}, {4, 0},
					 {5, 0}]),
    case [PassInfo
	  || {_, PassInfo} <- ElementTemplePassInfo,
	     PassInfo < Target]
	of
      [] ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_element_temple_pass{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    ok;
event(#evt_element_temple_end_rank{rank = Rank}, Role,
      Label, QuestId, ProgressId, Target, _Param)
    when Rank > 0 andalso Rank =< Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_element_temple_end_rank{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_primus_fight{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_adventure_boss_fight_count{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_partner_advance{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_adventure_treasure_open{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_adventure_trade_count{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_equipment_compound{count = Count}, Role,
      Label, QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_partner_add_new{star = Star},
      Role = #role{partner_bag =
		       #partner_bag{partner_list = Partners}},
      Label, QuestId, ProgressId, 0, [{bind_star, Star}]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_partner_add_new{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_adventure_item_expend_count{}, Role, Label,
      QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_adventure_item_expend_count{id = Skill},
      Role, Label, QuestId, ProgressId, _Target, [Skill]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_adventure_item_expend_count{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_adventure_use_partner{bids = PBids}, Role,
      Label, QuestId, ProgressId, _Target, [{use, PBid}]) ->
    case lists:member(PBid, PBids) of
      true ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_adventure_use_partner{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_hallows_step_intensify{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_artifact_recast_skills{skills = Skills1},
      Role, Label, QuestId, ProgressId, _Target,
      [{skill, Skills}]) ->
    case [Id || Id <- Skills, not lists:member(Id, Skills1)]
	   == []
	of
      true ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_artifact_recast{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_artifact_compose_quality{}, Role, Label,
      QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_artifact_compose_quality{id = ItemId}, Role,
      Label, QuestId, ProgressId, _Target, [ItemId]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_artifact_compose_quality{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_expedition_fight_count{count = Count}, Role,
      Label, QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_holiday_make_dumplings{count = Count}, Role,
      Label, QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_adventure_floor_count{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_cross_server_ladder{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_championships_bet{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_championships_bet_win{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_championships_bet_cont_win{count = Count},
      Role, Label, QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Count > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_championships_bet_cont_win_day{count =
					      Count},
      Role, Label, QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{}} ->
	  NewP = P#quest_progress{finish = 0, value = Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_championships_32{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when 1 > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_championships_end_rank{rank = Rank}, Role,
      Label, QuestId, ProgressId, Target, _Param)
    when Rank > 0 andalso Rank =< Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_championships_end_rank{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_arena_elite_rank{rank = Rank}, Role, Label,
      QuestId, ProgressId, Target, _Param)
    when Rank >= Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when 1 > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_arena_elite_rank{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_arena_elite_cont_win{count = Count}, Role,
      Label, QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Count > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_arena_elite_win_count{}, Role, Label,
      QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_elite_champion{combat_type =
				    CombatType},
      Role, Label, QuestId, ProgressId, Target,
      [{combat_type, CombatType}]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_elite_champion{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_arena_elite_end_lev{lev = Lev}, Role, Label,
      QuestId, ProgressId, Target, [{lev, NeedLev}])
    when Lev >= NeedLev ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_elite_end_lev{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_arena_elite_end_rank{rank = Rank}, Role,
      Label, QuestId, ProgressId, Target, _Param)
    when Rank > 0 andalso Rank =< Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_elite_end_rank{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_sky_ladder_rank{rank = Rank}, Role, Label,
      QuestId, ProgressId, Target, _Param)
    when Rank > 0 andalso Rank =< Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when 1 > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_sky_ladder_rank{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_sky_ladder_end_rank{rank = Rank}, Role,
      Label, QuestId, ProgressId, Target, _Param)
    when Rank > 0 andalso Rank =< Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_sky_ladder_end_rank{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_sky_ladder_win{}, Role, Label, QuestId,
      ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_fight_holiday_boss{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_pass_holiday_boss{id = Target}, Role, Label,
      QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when 1 > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_pass_holiday_boss{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_holiday_boss_get_score{},
      Role = #role{m_holiday_boss =
		       #m_holiday_boss{score = Score}},
      Label, QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Score >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Score > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Score},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_fight_holiday_boss_new{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_pass_holiday_boss_new{id = Target,
				 difficulty = Difficulty},
      Role, Label, QuestId, ProgressId, Target,
      [{difficulty, TarDifficulty}])
    when Difficulty >= TarDifficulty ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when 1 > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_pass_holiday_boss_new{id = Target}, Role,
      Label, QuestId, ProgressId, Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when 1 > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_pass_holiday_boss_new{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_recruit_trial_partner{bid = Bid}, Role,
      Label, QuestId, ProgressId, _Target, [Bid]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_recruit_trial_partner{}, Role, Label,
      QuestId, ProgressId, _Target, []) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_recruit_trial_partner{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_replay_hall_like{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_replay_share{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_grow_share{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_honor_share{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_replay_hall_watch{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_enter_home{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_visit_home{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_worship{type = Target}, Role, Label, QuestId,
      ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_worship{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_gain_home_coin{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_rename_home{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_home_soft{soft = Soft}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Soft >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Soft > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Soft},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_home_pet_set_items{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_enter_adventure_mine{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_mine_save_defense{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_mine_buy_miner{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_mine_combat{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_mine_owned{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_hallows_refine{lev = Lev}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Lev >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Lev > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Lev},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_term_beigns_order{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_term_beigns_win_order{difficulty = Diff},
      Role, Label, QuestId, ProgressId, _Target,
      [{difficulty, Diff2}])
    when Diff >= Diff2 ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_term_beigns_win_order{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_term_beigns_paper{count = Count}, Role,
      Label, QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Count > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_term_beigns_boss{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_add_friend{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_mystery_mall_buy{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_holy_eqm_lottery{count = Count}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_holy_eqm_ref{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_elite_combat_count{}, Role, Label,
      QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_dun_heaven_win{}, Role, Label, QuestId,
      ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_element_temple_win{}, Role, Label, QuestId,
      ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_partner_dungeon_stone_win{}, Role, Label,
      QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_recruit_convert{}, Role, Label, QuestId,
      ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_get_hook_count{}, Role, Label, QuestId,
      ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_cluster_champion_bet{}, Role, Label,
      QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_get_friend_point{count = Count}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_get_gold{count = Count}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_petard_meteor{count = Count}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_petard_firework{count = Count}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_petard_send_red_packet{count = Count}, Role,
      Label, QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_petard_red_packet{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_petard_score{count = Count}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_use_petard{count = Count}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_donate_sweet_score{count = Count}, Role,
      Label, QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_normal_recruit{count = Count}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_elite_recruit{count = Count}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_sprite_lottery{count = Count}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_recruit_lottery{count = Count}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_appoint_sprite{bids = PBids}, Role, Label,
      QuestId, ProgressId, _Target, [PBid]) ->
    case lists:keymember(PBid, 1, PBids) of
      true ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_appoint_sprite{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_appoint_sprite_compound{bids = PBids}, Role,
      Label, QuestId, ProgressId, _Target, [PBid]) ->
    case lists:member(PBid, PBids) of
      true ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_appoint_sprite_compound{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_arena_use_sprite{bids = PBids, result = 1},
      Role, Label, QuestId, ProgressId, 0,
      [{sprite_bid, PBidList}]) ->
    Fun = fun (Bid) -> lists:member(Bid, PBids) end,
    case lists:any(Fun, PBidList) of
      true ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_arena_use_sprite{bids = PBids}, Role, Label,
      QuestId, ProgressId, 1, [{sprite_bid, PBidList}]) ->
    Fun = fun (Bid) -> lists:member(Bid, PBids) end,
    case lists:any(Fun, PBidList) of
      true ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_arena_use_sprite{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_arena_team_win{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_team_leader_join{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_team_two_win{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_team_season_five{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_team_season_one{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_team_double_kill{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_team_first{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_team_last{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_team_season_found_team{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_team_join{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_team_defense_success{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_guild_secret_area_combat{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_combat_pvp_over{atk_power = APower,
			   def_power = DPower, result = Result},
      Role, Label, QuestId, ProgressId, _Target,
      [{power_less, DiffPower}]) ->
    case DPower > APower + DiffPower andalso Result == 1 of
      true ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_combat_pvp_over{atk_power = APower,
			   def_power = DPower, result = Result,
			   hp_info = HpList},
      Role, Label, QuestId, ProgressId, _Target,
      [{power_hpmax_less, DiffPower}]) ->
    case APower + DiffPower =< DPower andalso Result == 1 of
      true ->
	  case [Pos || {Pos, Hp, HpMax} <- HpList, Hp < HpMax] of
	    [] ->
		case fetch(Role, Label, QuestId, ProgressId) of
		  {error, role} -> {ok, Role};
		  {error, _} -> remove;
		  {ok, _Quest, #quest_progress{finish = Finish}}
		      when Finish =/= 0 ->
		      remove;
		  {ok, Quest,
		   P = #quest_progress{target_val = TargetVal,
				       value = Value, param = Param}}
		      when Value + 1 >= TargetVal ->
		      RemoveRole = drama_quest:remove_task_unit(Role, Param),
		      Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		      NewP = P#quest_progress{finish = 1, value = TargetVal,
					      trigger = undefined},
		      {remove, update(Role1, Label, Quest, ProgressId, NewP)};
		  {ok, Quest, P = #quest_progress{value = Value}} ->
		      NewP = P#quest_progress{finish = 0, value = Value + 1},
		      {ok, update(Role, Label, Quest, ProgressId, NewP)}
		end;
	    _ -> ok
	  end;
      _ -> ok
    end;
event(#evt_combat_pvp_over{kill_info = KillInfo}, Role,
      Label, QuestId, ProgressId, _Target,
      [{overkill_less, Num}]) ->
    case [NumT || NumT <- KillInfo, NumT >= Num] of
      L = [_ | _] ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + length(L) >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0,
					value = Value + length(L)},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_combat_pvp_over{atk_power = APower,
			   result = Result, def_power = DPower, round = Round},
      Role, Label, QuestId, ProgressId, _Target,
      [{win_round_less, Limit}]) ->
    case DPower > APower andalso Round =< Limit of
      true when Result == 1 ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_combat_pvp_over{dizzy_info = Nums}, Role,
      Label, QuestId, ProgressId, _Target,
      [{control_num, Limit}]) ->
    case [NumT || NumT <- Nums, NumT >= Limit] of
      L = [_ | _] ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + length(L) >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0,
					value = Value + length(L)},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_combat_pvp_over{max_num_diff = Num}, Role,
      Label, QuestId, ProgressId, _Target,
      [{hero_num_less, Limit}]) ->
    case Num >= Limit of
      true ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_combat_pvp_over{halo_dizzy_num = Num}, Role,
      Label, QuestId, ProgressId, _Target,
      [{hallows_hammer, _Limit}]) ->
    case Num > 0 of
      true ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + Num >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0,
					value = Value + Num},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_combat_over{continue_hurt = ContinueHurt,
		       combat_type = CombatType},
      Role, Label, QuestId, ProgressId, _Target,
      [{continue_hurt, NoTypes, DotType, Limit}]) ->
    Num = list_util:keyfind(DotType, ContinueHurt, 0),
    case Num >= Limit andalso
	   not lists:member(CombatType, NoTypes)
	of
      true ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_combat_over{revive_info = ReviveInfo,
		       combat_type = CombatType},
      Role, Label, QuestId, ProgressId, _Target,
      [{revive_count, NoTypes, Type, Limit}]) ->
    Num = list_util:keyfind(Type, ReviveInfo, 0),
    case Num >= Limit andalso
	   not lists:member(CombatType, NoTypes)
	of
      true ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_combat_over{hurt_statistics_a = HurtInfo,
		       combat_type = CombatType},
      Role, Label, QuestId, ProgressId, _Target,
      [{hurt, NoTypes, Limit}]) ->
    case [Hurt || {_, Hurt} <- HurtInfo, Hurt >= Limit] ==
	   []
	   orelse lists:member(CombatType, NoTypes)
	of
      false ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_combat_over{curt_statistics_a = CurtInfo,
		       combat_type = CombatType},
      Role, Label, QuestId, ProgressId, _Target,
      [{curt, NoTypes, Limit}]) ->
    case [Curt || {_, Curt} <- CurtInfo, Curt >= Limit] ==
	   []
	   orelse lists:member(CombatType, NoTypes)
	of
      false ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_combat_over{dodge_count = DodCount,
		       combat_type = CombatType},
      Role, Label, QuestId, ProgressId, _Target,
      [{dodge_count, NoTypes, Limit}]) ->
    case DodCount < Limit orelse
	   lists:member(CombatType, NoTypes)
	of
      false ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_combat_over{max_fire_num = FireNum,
		       combat_type = CombatType},
      Role, Label, QuestId, ProgressId, _Target,
      [{fire_buff_num, NoTypes, Limit}]) ->
    case FireNum < Limit orelse
	   lists:member(CombatType, NoTypes)
	of
      false ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_combat_over{halo_kill_num = KillNum,
		       combat_type = CombatType},
      Role, Label, QuestId, ProgressId, _Target,
      [{halo_kill_num, NoTypes}]) ->
    case lists:member(CombatType, NoTypes) of
      false ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + KillNum >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0,
					value = Value + KillNum},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_combat_over{sprite_kill_num = KillNum,
		       combat_type = CombatType},
      Role, Label, QuestId, ProgressId, _Target,
      [{sprite_kill_num, NoTypes}]) ->
    case lists:member(CombatType, NoTypes) of
      false ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + KillNum >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0,
					value = Value + KillNum},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_combat_over{anti_kill_num = KillNum,
		       combat_type = CombatType},
      Role, Label, QuestId, ProgressId, _Target,
      [{anti_kill_num, NoTypes}]) ->
    case lists:member(CombatType, NoTypes) of
      false ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + KillNum >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0,
					value = Value + KillNum},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_dun_heaven_perfectpass{chapter_id =
				      ChatperId},
      Role, Label, QuestId, ProgressId, Target, [])
    when Target >= ChatperId ->
    case dungeon_heaven_lib:is_perfect_over(Role, Target) of
      true ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_dun_heaven_perfectpass{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_arena_cluster_win{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_combat_balance{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_cluster_champion_sub_count{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_cluster_champion_join{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_cluster_end_rank{rank = Rank}, Role,
      Label, QuestId, ProgressId, Target, _Param)
    when Rank > 0 andalso Rank =< Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_arena_cluster_end_rank{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_partnerskill_learn{lev = Lev}, Role, Label,
      QuestId, ProgressId, Target, [{skill_lev, Lev}]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_partnerskill_learn{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_cluster_championships_takepartin{}, Role,
      Label, QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_peak_championships_takepartin{}, Role, Label,
      QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_cluster_championships_end_rank{rank = Rank},
      Role, Label, QuestId, ProgressId, Target, _Param)
    when Rank > 0 andalso Rank =< Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_cluster_championships_end_rank{}, _Role,
      _Label, _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_peak_championships_end_rank{rank = Rank},
      Role, Label, QuestId, ProgressId, Target, _Param)
    when Rank > 0 andalso Rank =< Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_peak_championships_end_rank{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#evt_cluster_championships_bet_cont_win_day{count
						      = Count},
      Role, Label, QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{}} ->
	  NewP = P#quest_progress{finish = 0, value = Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_peak_championships_bet_cont_win_season{count
						      = Count},
      Role, Label, QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{}} ->
	  NewP = P#quest_progress{finish = 0, value = Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_get_speciality{},
      Role = #role{m_home_pet =
		       #m_home_pet{acc_items = AccItems}},
      Label, QuestId, ProgressId, _Target, _Param) ->
    Num = length(AccItems),
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Num > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_travel_time{},
      Role = #role{m_home_pet =
		       #m_home_pet{acc_out_time = AccOutTime}},
      Label, QuestId, ProgressId, _Target, _Param) ->
    Time = util:floor(AccOutTime / 60 / 60),
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Time >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Time > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Time},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_get_furniture{num = Num}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_extract_start{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_extract_award{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_resonate_levup{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_sprite_compound{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_sprite_hatch{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_sprite_hatch_expedite{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_sprite_set_pos{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_sprite_tree{},
      Role = #role{m_sprite_tree = #m_sprite_tree{lev = Lev}},
      Label, QuestId, ProgressId, _Target, [lev]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Lev >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Lev > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Lev},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_sprite_tree{},
      Role = #role{m_sprite_tree = #m_sprite_tree{lev = Lev}},
      Label, QuestId, ProgressId, _Target, [lev_up]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_enter_monopoly{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when 1 > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_monopoly_develop{stage_id = MapId,
			    develop = Develop},
      Role, Label, QuestId, ProgressId, MapId, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Develop >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Develop > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Develop},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_monopoly_develop{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_monopoly_dice{type = Type}, Role, Label,
      QuestId, ProgressId, Type, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_monopoly_dice{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#evt_monopoly_dungeon{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_monopoly_kill_boss{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_enter_secret_dun{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_enter_secret_kill_monster{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_enter_secret_kill_monster2{count = Count},
      Role, Label, QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + Count >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0,
				  value = Value + Count},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_enter_secret_reply{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_enter_secret_loan{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_enter_secret_treasure{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_enter_secret_pass{dun_id = DunId}, Role,
      Label, QuestId, ProgressId, _Target,
      [{dun_id, DataDunId}]) ->
    case DunId =:= DataDunId of
      true ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_planes_pass{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_planes_kill_guard{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_enter_nian{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_nian_fight_monster{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_nian_fight_big_monster{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_nian_red_packet{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_nian_firework{}, Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_nian_fight_gold_monster{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_skin{},
      Role = #role{partner_bag =
		       #partner_bag{partner_skins = PartnerSkins}},
      Label, QuestId, ProgressId, _Target, _Param) ->
    Num = length([1
		  || #partner_skin{end_time = 0} <- PartnerSkins]),
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Num > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Num},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#evt_login_days_reward{day = Day}, Role, Label,
      QuestId, ProgressId, Target, _Param) ->
    case Day =:= Target of
      true ->
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0, value = Value + 1},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#evt_enter_holiday_arena_team{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_holiday_arena_team_lev_up{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_holiday_arena_team_join_team{}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_holiday_arena_team_combat_count{}, Role,
      Label, QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#evt_holiday_arena_team_combat_win_count{}, Role,
      Label, QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#r_evt_power{power = Power, cache = Cache}, Role,
      Label, QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Power >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Power > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Power,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#r_evt_role_lev{cache = OldCache},
      Role = #role{lev = Lev}, Label, QuestId, ProgressId,
      _Target, _Param) ->
    Cache = OldCache#{role_lev => integer_to_binary(Lev)},
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Lev >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Lev > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Lev,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#r_evt_hero_compose{cache =
			      OldCache = #{bid := Bid, star := NeedStar}},
      Role, Label, QuestId, ProgressId, _Target,
      [{bind_star, NeedStar}]) ->
    #partner_base_data{name = HeroName} =
	partner_data:get_base(Bid),
    Cache = OldCache#{hero_name => HeroName},
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#r_evt_hero_compose{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#r_evt_endless_pass{round = Round,
			  cache = OldCache},
      Role, Label, QuestId, ProgressId, Target, _Param)
    when Round >= Target ->
    Cache = OldCache#{end_less_dun_number =>
			  integer_to_binary(Round)},
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#r_evt_endless_pass{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#r_evt_room_liked{cache =
			    Cache = #{room_like_role_number := NFanseNum}},
      Role = #role{id = RoleId}, Label, QuestId, ProgressId,
      Target, _Param)
    when NFanseNum >= Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#r_evt_room_liked{}, _Role, Label, QuestId,
      ProgressId, _Target, _Param) ->
    ok;
event(#r_evt_partner_get{cache =
			     OldCache = #{bid := Bid, star := Star}},
      Role, Label, QuestId, ProgressId, _Target,
      [{bind_star, Star}]) ->
    #partner_base_data{name = HeroName} =
	partner_data:get_base(Bid),
    Cache = OldCache#{hero_name => HeroName},
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#r_evt_partner_get{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#r_evt_primus_first_fight_pass{rank = Rank,
				     cache = OldCache},
      Role, Label, QuestId, ProgressId, _Target, _Param) ->
    #{name := PName} = primus_data:get(Rank),
    Cache = OldCache#{primus_name => PName},
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#r_evt_primus_first_fight_rank{rank = Target,
				     cache = Cache},
      Role, Label, QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#r_evt_primus_first_fight_rank{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#r_evt_partner_eqpt_item{cache =
				   OldCache = #{partner_bid := PBid,
						item_bid := Target}},
      Role, Label, QuestId, ProgressId, Target, _Param) ->
    #partner_base_data{name = HeroName} =
	partner_data:get_base(PBid),
    Cache = OldCache#{hero_name => HeroName},
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#r_evt_partner_eqpt_item{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#r_evt_first_partnerskill_learn{cache =
					  OldCache = #{lev := Lev,
						       partner_bid := PBid,
						       skill_id := SBid}},
      Role, Label, QuestId, ProgressId, _Target,
      [{skill_lev, Lev}]) ->
    #partner_base_data{name = HeroName} =
	partner_data:get_base(PBid),
    #skill_data{name = SkillName} =
	skill_data:get_skill(SBid),
    Cache = OldCache#{hero_name => HeroName,
		      skill_name => SkillName},
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#r_evt_first_partnerskill_learn{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#r_evt_join_guild{cache = Cache}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when 1 > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = 1,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#r_evt_build_guild{cache = Cache}, Role, Label,
      QuestId, ProgressId, _Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when 1 > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = 1,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#r_evt_hallows_rank{cache =
			      Cache = #{lev := Lev}},
      Role, Label, QuestId, ProgressId, _Target,
      [{lev, Lev}]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when 1 > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = 1,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#r_evt_hallows_rank{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#r_evt_first_recruit{cache =
			       OldCache = #{partner_infos := PartnerInfo,
					    group_id := Target}},
      Role, Label, QuestId, ProgressId, Target,
      [{bind_star, NeedStar}]) ->
    case [PBidT
	  || {PBidT, Star} <- PartnerInfo, Star >= NeedStar]
	of
      L = [PBid | _] ->
	  #partner_base_data{name = HeroName} =
	      partner_data:get_base(PBid),
	  Cache = OldCache#{hero_name => HeroName},
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 value = Value, param = Param}}
		when Value + length(L) >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined,
					ext_data = [{cache, Cache}]},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = Value}} ->
		NewP = P#quest_progress{finish = 0,
					value = Value + length(L),
					ext_data = [{cache, Cache}]},
		{ok, update(Role, Label, Quest, ProgressId, NewP)}
	  end;
      _ -> ok
    end;
event(#r_evt_first_recruit{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#r_evt_star_tower_floor{cache = OldCache},
      Role = #role{m_star_tower =
		       #m_star_tower{max_tower = MaxTower}},
      Label, QuestId, ProgressId, _Target, []) ->
    Cache = OldCache#{tower_dun_number =>
			  integer_to_binary(MaxTower)},
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when MaxTower >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when MaxTower > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = MaxTower,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#r_evt_expedition_pass{cache =
				 Cache = #{difficulty := Difficulty,
					   floor := Floor}},
      Role, Label, QuestId, ProgressId, _Target,
      [{expedition_difficulty, Difficulty, Floor}]) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when 1 > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = 1,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#r_evt_expedition_pass{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#r_evt_friend_add{cache = Cache}, Role, Label,
      QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#r_evt_friend_add{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#r_evt_friend_cluster_add{cache = Cache}, Role,
      Label, QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#r_evt_friend_cluster_add{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#r_evt_arena_cluster_rankget{cache = Cache}, Role,
      Label, QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#r_evt_arena_cluster_rankget{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#r_evt_arena_cluster_rank{cache =
				    Cache = #{arena_cluster_rank := Rank}},
      Role, Label, QuestId, ProgressId, Target, _Param)
    when Rank > 0 andalso Rank =< Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#r_evt_arena_cluster_rank{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#r_evt_championships_end_rank{cache =
					Cache = #{arena_champion_rank := Rank}},
      Role, Label, QuestId, ProgressId, Target, _Param)
    when Rank > 0 andalso Rank =< Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#r_evt_championships_end_rank{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#r_evt_sky_ladder_end_rank{cache =
				     Cache = #{sky_ladder_rank := Rank}},
      Role, Label, QuestId, ProgressId, Target, _Param)
    when Rank > 0 andalso Rank =< Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#r_evt_sky_ladder_end_rank{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#r_evt_arena_elite_end_levget{cache =
					OldCache = #{arena_elite_lev := ELev}},
      Role, Label, QuestId, ProgressId, Target, _Param) ->
    ELevName = arena_elite_data:get_lev_name(ELev),
    Cache = OldCache#{arena_elite_lev_name => ELevName},
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#r_evt_arena_elite_end_levget{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#r_evt_arena_elite_end_lev{cache =
				     Cache = #{arena_elite_lev := ELev}},
      Role, Label, QuestId, ProgressId, _Target,
      [{lev, NeedLev}])
    when ELev >= NeedLev ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#r_evt_arena_elite_end_lev{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#r_evt_arena_elite_end_rankget{cache =
					 Cache = #{arena_elite_rank := Rank}},
      Role, Label, QuestId, ProgressId, Target, _Param)
    when Rank > 0 andalso Rank =< Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#r_evt_arena_elite_end_rankget{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#r_evt_arena_firstrank_end{cache =
				     Cache = #{arena_rank := Rank}},
      Role, Label, QuestId, ProgressId, Target, _Param)
    when Rank > 0 andalso Rank =< Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#r_evt_arena_firstrank_end{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#r_evt_arena_like_number{cache =
				   Cache = #{arena_like_number := Num}},
      Role, Label, QuestId, ProgressId, Target, _Param) ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   param = Param}}
	  when Num >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = OldVal}}
	  when Num > OldVal ->
	  NewP = P#quest_progress{finish = 0, value = Num,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
event(#r_evt_arena_like_number{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#r_evt_guild_dun_rank{cache =
				Cache = #{guild_dun_rank := Rank}},
      Role, Label, QuestId, ProgressId, Target, _Param)
    when Rank > 0 andalso Rank =< Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#r_evt_guild_dun_rank{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#r_evt_guild_war_rank{cache =
				Cache = #{guild_war_rank := Rank}},
      Role, Label, QuestId, ProgressId, Target, _Param)
    when Rank > 0 andalso Rank =< Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#r_evt_guild_war_rank{}, _Role, _Label, _QuestId,
      _ProgressId, _Target, _Param) ->
    ok;
event(#r_evt_partner_holy_eqpt{cache =
				   Cache = #{holy_eqpt_jie := Jie}},
      Role, Label, QuestId, ProgressId, Target, _Param)
    when Jie >= Target ->
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = Finish}}
	  when Finish =/= 0 ->
	  remove;
      {ok, Quest,
       P = #quest_progress{target_val = TargetVal,
			   value = Value, param = Param}}
	  when Value + 1 >= TargetVal ->
	  RemoveRole = drama_quest:remove_task_unit(Role, Param),
	  Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
	  NewP = P#quest_progress{finish = 1, value = TargetVal,
				  trigger = undefined,
				  ext_data = [{cache, Cache}]},
	  {remove, update(Role1, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}} ->
	  NewP = P#quest_progress{finish = 0, value = Value + 1,
				  ext_data = [{cache, Cache}]},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)}
    end;
event(#r_evt_partner_holy_eqpt{}, _Role, _Label,
      _QuestId, _ProgressId, _Target, _Param) ->
    ok;
event(#r_evt_role_register_days{cache = OldCache},
      Role = #role{reg_time = RegTime, max_power = MaxPower},
      Label, QuestId, ProgressId, Target, _Param) ->
    RegDay = date:day_diff(date:unixtime(), RegTime) + 1,
    case RegDay >= Target of
      true ->
	  Str = var:get_var(Role, other, 3054,
			    lang:get(<<"虚位以待"/utf8>>)),
	  Cache = OldCache#{max_power =>
				integer_to_binary(MaxPower),
			    max_power_partne_rteam => Str,
			    time => RegTime + 86400 * (Target - 1)},
	  case fetch(Role, Label, QuestId, ProgressId) of
	    {error, role} -> {ok, Role};
	    {error, _} -> remove;
	    {ok, _Quest, #quest_progress{finish = Finish}}
		when Finish =/= 0 ->
		remove;
	    {ok, Quest,
	     P = #quest_progress{target_val = TargetVal,
				 param = Param}}
		when 1 >= TargetVal ->
		RemoveRole = drama_quest:remove_task_unit(Role, Param),
		Role1 = monitor_quest_prog(Label, P, Quest, RemoveRole),
		NewP = P#quest_progress{finish = 1, value = TargetVal,
					trigger = undefined,
					ext_data = [{cache, Cache}]},
		{remove, update(Role1, Label, Quest, ProgressId, NewP)};
	    {ok, Quest, P = #quest_progress{value = OldVal}}
		when 1 > OldVal ->
		NewP = P#quest_progress{finish = 0, value = 1,
					ext_data = [{cache, Cache}]},
		{ok, update(Role, Label, Quest, ProgressId, NewP)};
	    _ -> ok
	  end;
      _ -> ok
    end;
event(Evt, Role, Label, QuestId, _ProgressId, Target,
      Param) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidquest_progress2630, _,
       {__Levelquest_progress2630, __Tracesquest_progress2630}}
	  when __Levelquest_progress2630 band 8 /= 0 orelse
		 __Tracesquest_progress2630 /= [] ->
	  lager:do_log(error,
		       [{module, quest_progress}, {function, event},
			{line, 2630}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[Name:~ts][Label:~w][Id:~w]收到无法处理的进度事件[Evt:~w"
				     "][Target:~w][Param:~w]",
				     [Role#role.name, Label, QuestId, Evt,
				      Target, Param]),
		       none, 4096, 8, __Levelquest_progress2630,
		       __Tracesquest_progress2630, lager_event,
		       __Pidquest_progress2630);
      _ -> ok
    end,
    remove.

monitor_event(#evt_del_item{base_id = Target,
			    num = DelNum},
	      Role = #role{p_bag = Bag}, Label, QuestId, ProgressId,
	      Target, _Param, TriRef) ->
    {_, BagNum} = package:count(by_base_id, Target, Bag),
    NewNum = erlang:max(BagNum + 1 - DelNum, 0),
    case fetch(Role, Label, QuestId, ProgressId) of
      {error, role} -> {ok, Role};
      {error, _} -> remove;
      {ok, _Quest, #quest_progress{finish = 0}} ->
	  NewRole = role_trigger:del(TriRef, Role),
	  {remove, NewRole};
      {ok, Quest, P = #quest_progress{target_val = TargetVal}}
	  when NewNum < TargetVal ->
	  FalseP = P#quest_progress{finish = 0, value = NewNum},
	  RemoveRole = role_trigger:del(TriRef, Role),
	  {[NewP], NewRole} = quest:load_progress([FalseP], Label,
						  QuestId, [], RemoveRole),
	  {remove,
	   update(NewRole, Label, Quest, ProgressId, NewP)};
      {ok, Quest, P = #quest_progress{value = Value}}
	  when NewNum >= Value ->
	  NewP = P#quest_progress{value = NewNum},
	  {ok, update(Role, Label, Quest, ProgressId, NewP)};
      _ -> ok
    end;
monitor_event(#evt_del_item{}, _Role, _Label, _QuestId,
	      _ProgressId, _Target, _Param, _TriRef) ->
    ok;
monitor_event(Evt, Role, Label, QuestId, _ProgressId,
	      Target, Param, TriRef) ->
    NewRole = role_trigger:del(TriRef, Role),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidquest_progress2651, _,
       {__Levelquest_progress2651, __Tracesquest_progress2651}}
	  when __Levelquest_progress2651 band 8 /= 0 orelse
		 __Tracesquest_progress2651 /= [] ->
	  lager:do_log(error,
		       [{module, quest_progress}, {function, monitor_event},
			{line, 2651}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("任务[~w ~w]收到无法处理的进度监听事件 [Evt]: ~w [Target]:~w "
				     "[Param]: ~w",
				     [Label, QuestId, Evt, Target, Param]),
		       none, 4096, 8, __Levelquest_progress2651,
		       __Tracesquest_progress2651, lager_event,
		       __Pidquest_progress2651);
      _ -> ok
    end,
    {remove, NewRole}.

remove_monitor(#evt_commit_quest{id = QId}, Role, QId,
	       TriRefs) ->
    NewRole = role_trigger:del(TriRefs, Role),
    {remove, NewRole};
remove_monitor(_Evt, _Role, _QId, _TriRef) -> ok.

monitor_quest_prog(QuestType,
		   P = #quest_progress{label = EvtLabel, param = Param},
		   #quest{id = QId}, Role = #role{}) ->
    case lists:keyfind(monitor, 1, Param) of
      Data when is_tuple(Data) ->
	  do_monitor_quest_prog(QuestType, EvtLabel, P, QId,
				Role);
      false -> Role
    end;
monitor_quest_prog(QuestType,
		   P = #quest_progress{label = EvtLabel, param = Param},
		   QId, Role = #role{}) ->
    case lists:keyfind(monitor, 1, Param) of
      Data when is_tuple(Data) ->
	  do_monitor_quest_prog(QuestType, EvtLabel, P, QId,
				Role);
      false -> Role
    end.

do_monitor_quest_prog(TypeLabel, evt_get_item,
		      #quest_progress{id = ProgId, target = Target,
				      param = Param},
		      QId, Role = #role{trigger = {NextId, _Triggers}}) ->
    TriRef1 = {evt_commit_quest, NextId},
    TriRef2 = {evt_del_item, NextId + 1},
    {TriRef1, Role1} = role_trigger:add(#trigger{label =
						     evt_commit_quest,
						 m = quest_progress,
						 f = remove_monitor,
						 a = [QId, TriRef2]},
					Role),
    {TriRef2, Role2} = role_trigger:add(#trigger{label =
						     evt_del_item,
						 m = quest_progress,
						 f = monitor_event,
						 a =
						     [TypeLabel, QId, ProgId,
						      Target, Param, TriRef1]},
					Role1),
    Role2;
do_monitor_quest_prog(_QuestType, _EvtLabel, _P, _Q,
		      Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidquest_progress2694, _,
       {__Levelquest_progress2694, __Tracesquest_progress2694}}
	  when __Levelquest_progress2694 band 8 /= 0 orelse
		 __Tracesquest_progress2694 /= [] ->
	  lager:do_log(error,
		       [{module, quest_progress},
			{function, do_monitor_quest_prog}, {line, 2694},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未知任务进度监控事件[~w][~w]",
				     [{_QuestType, _EvtLabel}, _Q]),
		       none, 4096, 8, __Levelquest_progress2694,
		       __Tracesquest_progress2694, lager_event,
		       __Pidquest_progress2694);
      _ -> ok
    end,
    Role.


