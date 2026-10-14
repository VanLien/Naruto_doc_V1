-file("src/merge/merge_data.erl", 1).

-module(merge_data).

-lager_records([{holiday_lucky_dog_info,
		 [ver, camp_id, period, status, lucky_dog, ext]},
		{holiday_lucky_dog_quest,
		 [quest_id, val, num, lucky_type, finish, ext]},
		{m_holiday_lucky_dog, [ver, camp_id, info, ext]},
		{self_add_info,
		 [id, time, score, status, total_time, interval]},
		{get_red_packet_info,
		 [r_id, red_id, name, lev, face_id, avatar_bid, time,
		  item]},
		{petard_red_packet,
		 [id, rid, name, face_id, avatar_bid, num, max_num,
		  is_max, mems, must_not, start_time, end_time, msg_id]},
		{m_holiday_petard,
		 [ver, camp_id, end_time, get_red_count, send_red_count,
		  send_notice, must_not_small, must_not_big,
		  petard_reward, red_packet_info, get_red_info]},
		{role_weekly_report,
		 [ver, rid, end_time, account, name, lev, face_id, power,
		  channel, have_partners, used_partners, get_partner,
		  get_gold, get_high_recruit, get_crystal, get_sprite,
		  send_point, login_day, acc_time, arena_elite_lev,
		  arena_cluster_rank, star_tower_rank, arena_score,
		  endless_rank, sky_ladder_rank, cluster_champion_rank,
		  arena_team_rank, element_rank, drama_rate, tag_list,
		  ext]},
		{m_weekly,
		 [ver, used_partners, get_partner, get_gold,
		  get_high_recruit, get_crystal, get_sprite, send_point]},
		{monopoly_dungeons_guild_rank,
		 [ver, id, stage_guild_rank]},
		{guild_stage_rank,
		 [ver, id, name, dps, unixtime, is_reward, leader_name,
		  member, members_max, lev]},
		{monopoly_dungeons,
		 [ver, id, camp_id, stage_list, buffs]},
		{dungeons_stage, [ver, id, develop, boss_list, rank]},
		{dungeons_boss, [ver, id, base_id, hp, max_hp]},
		{stage_rank,
		 [ver, id, name, dps, unixtime, lev, face_id, avatar_bid,
		  power]},
		{holiday_term_begins_boss_rank, [rank, id, all_dps]},
		{holiday_term_begins_boss_rank_role,
		 [var, rank, r_id, name, boss_id, all_dps, avatar_bid,
		  lev, family_name, face_id, power, time]},
		{holiday_term_begins_boss,
		 [var, id, unit_id, boss_endtime, boss_hp, dps, buff_lev,
		  paper_num, reward, kill_reward, is_kill, boss_id]},
		{m_holiday_term_begins,
		 [ver, camp_id, round, round_endtime, difficulty,
		  order_id, order_endtime, fight_count, buy_count,
		  order_hp, submit_paper, paper_reward, boss_endtime,
		  boss_dps, boss_dps_list, all_boss_dps, best_partner_id,
		  hurt_statistics]},
		{expedition_replay_partner, [pos, bid, lev, star, ext]},
		{expedition_replay,
		 [id, round, ret, time, difficulty, guard_id, a_id,
		  a_name, a_lev, a_power, a_formation_type, a_end_hp,
		  b_id, b_name, b_lev, b_power, b_formation_type,
		  b_end_hp, a_plist, b_plist, ext]},
		{expedition_log, [id, list]},
		{expedition_employ_p,
		 [id, bid, lev, star, quality, break_lev, power, num,
		  ext]},
		{expedition_employ, [rid, rname, num, list]},
		{expedition_f_pos,
		 [pos, id, bid, lev, quality, star, break_lev, power,
		  speed, atk, def, hp, attr_ratio, ext]},
		{expedition_f,
		 [id, type, robot_id, role_id, name, lev, face, power,
		  hallows_id, formation_type, items, guards, partner_hp,
		  status]},
		{m_expedition,
		 [ver, guard_id, partner_hp, list, employ, appoint,
		  difficulty, max_difficulty, last_join_time,
		  last_difficulty, max_power]},
		{arena_cluster_fight_lock,
		 [id, is_fight, fight_rid, fight_pid]},
		{arena_cluster_replay_partner,
		 [pos, bid, lev, star, ext]},
		{arena_cluster_replay,
		 [id, round, ret, time, a_id, a_power, a_formation_type,
		  a_order, a_end_hp, b_id, b_power, b_formation_type,
		  b_order, b_end_hp, a_plist, b_plist, ext]},
		{arena_cluster_log,
		 [id, atk_id, atk_name, atk_face, atk_lev, atk_rank,
		  atk_score, def_id, def_name, def_face, def_lev,
		  def_rank, def_score, ret, win_count, lose_count,
		  combat_type, replay_list, time, atk_face_update_time,
		  atk_face_file, def_face_update_time, def_face_file]},
		{role_arena_cluster_log, [id, list]},
		{arena_cluster_role,
		 [id, name, vip, lev, sex, gid, gname, face, power,
		  max_power, lookid, score, rank, time, avatar_id,
		  cont_win, ext]},
		{arena_cluster_rank, [rank, id, score]},
		{arena_cluster_f_pos,
		 [pos, id, bid, lev, star, break_lev, power, use_skin,
		  dower_skill, set_skill, attr, extra]},
		{arena_cluster_f_order,
		 [order, formation_type, hallows_id, hallows_lev,
		  hallows_skill_lev, pos_info, hallows_look_id,
		  hallows_lucky, hallows_seal, hallows_all_look_ids,
		  power, is_hidden, extra]},
		{arena_cluster_f,
		 [id, name, gname, idx, lev, vip_lev, sex, face, power,
		  rank, order_info, robot_id, avatar_id, look, ext]},
		{m_arena_cluster,
		 [ver, ref_time, formations, ref_list, season_ref_time,
		  season_combat_num, best_rank, day_combat_num,
		  acc_combat_num, day_reward, turn_card_reward,
		  turn_card_num, turn_card_history, worship,
		  worship_list]},
		{guild_marketplace,
		 [ver, id, next_booth_id, item_list, board_list]},
		{market_board,
		 [ver, type, name, operation, reward_list, unixtime]},
		{market_item,
		 [ver, id, base_id, num, attr, extra, holy_eqm_attr,
		  end_time, score]},
		{guild_secret_area_rank, [ver, id, rank_detail]},
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
		{primus_log,
		 [role_id, name, lev, face_id, power, num, replay_id,
		  formation_type, formation_lev, partner_list, time, ret,
		  face_update_time, face_file]},
		{primus,
		 [pos, num, status, look_id, role_id, name, lev, face_id,
		  power, face_update_time, face_file]},
		{home_unit_data,
		 [bid, name, type, dir, set_id, soft, tile_list_1,
		  tile_list_2, effect_count]},
		{home_role_rank, [id, rank]},
		{home_rank_rc,
		 [id, name, lev, face, avatar_bid, time, cache_time,
		  worship_num, visit_num, soft, score, rank,
		  face_update_time, face_file]},
		{home_unit_set, [set_id, reward, collect]},
		{home_rand_visit,
		 [id, name, lev, sex, face, power, last_login, soft,
		  face_update_time, face_file]},
		{home_log,
		 [id, name, face, lev, is_friend, type, time, int_args,
		  str_args, face_update_time, face_file]},
		{home_visitor, [id, name, look_id, time, is_leave]},
		{home_unit, [ver, bid, index, dir]},
		{home_ext, [id, visitors, log]},
		{home_floor,
		 [floor, wall_bid, land_bid, soft, home_unit]},
		{home,
		 [ver, id, name, look_id, bid, wall_bid, land_bid, soft,
		  home_unit, floor_list, log, open_floor, main_floor]},
		{m_home,
		 [ver, num, buy_num, list, day_visitors, soft, max_soft,
		  look_id, look_list, last_visitors, worship,
		  worship_list, rand_list, last_rand_time, set_list,
		  last_hook_time, acc_hook_time, acc_hook_items,
		  open_floor, floor_list, main_floor, max_sum_soft]},
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
		{drop_role,
		 [id, career, lev, name, num_best, num_common,
		  is_person_limit, drop_total, limit_flag, drop_limit,
		  common_list, best_list, item_list, notice_list]},
		{drop_group,
		 [group, item_bid, item_name, item_num, bind, rand,
		  career, lev]},
		{drop_son,
		 [drop_id, name, item_bid, item_name, item_num, bind,
		  rand, is_notice, career, lev, self_time, srv_time,
		  self_count, srv_count, self_down, self_up, world_lev]},
		{drop_total,
		 [drop_id, name, allot, super_r, first_r, second_r,
		  third_r, notice_msg]},
		{drop_bag, [ver, id, mon, mon_cache, common]},
		{drop_limit,
		 [ver, time_val, count_val, down_val, up_val]},
		{invite_code_bind,
		 [role_id, bind_id, account, name, sex, lev, vip, power,
		  face, avatar_bid, online, login_time, code, time,
		  reg_idfa, reg_ip, is_return, return_charge,
		  return_power, face_update_time, face_file]},
		{invite_code_role,
		 [role_id, code, time, num, list, return_num,
		  return_list]},
		{m_invite_code,
		 [ver, bind_code, bind_roleid, reward_list]},
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
		{guild_war_role_log,
		 [id, name, lev, face, power, formation_type,
		  formation_lev, time, repaly_id, result, hp, defense,
		  face_update_time, face_file]},
		{guild_war_log,
		 [flag1, flag2, time, id1, name1, id2, name2, gid, gname,
		  int_args, str_args]},
		{guild_war_partner,
		 [id, bid, lev, star, break_lev, base_attr, all_attr,
		  skills, break_skills, set_skills, ext_data]},
		{guild_war_role,
		 [pos, id, name, lev, face, power, formation_type,
		  formation_lev, war_score, star, defense, hp, hp_max,
		  status, def_count, def_log, count, repaly_info,
		  relic_def_count, hallows_id, hallows_lev,
		  hallows_skill_lev, hallows_look_id, hallows_lucky,
		  hallows_seal, hallows_all_look_ids, extra, look_id,
		  face_update_time, face_file, break_groups]},
		{guild_war_sign,
		 [gid, group_id, srv_name, gname, def_num, defense,
		  last_matchs, avg_power, star_time, buff_lev, rank, hp,
		  hp_max, war_log, lev]},
		{m_guild_dun,
		 [var, formation_list, dps_list, first_list]},
		{guild_dun_rank_role,
		 [var, rank, r_id, name, boss_id, all_dps, avatar_bid,
		  lev, family_name, face_id, power, time, look_id,
		  face_update_time, face_file]},
		{guild_dun_rank_boss, [var, boss_id, list]},
		{guild_dun_rank_guild,
		 [var, rank, gid, name, r_name, max_id, time, day_dps,
		  leader_id]},
		{guild_dun_box, [var, boss_id, award_list]},
		{guild_dun,
		 [var, id, f_id, max_id, boss_list, box_award, rank_list,
		  unit_hp, buff_lev, buff_end_time, day_dps,
		  assemble_time]},
		{escort_pos_info,
		 [pos, id, bid, lev, quality, star, break_lev, power,
		  speed, atk, def, hp]},
		{escort_plunder_log,
		 [id, quality, rid, name, guild_name, face, lev, sex,
		  power, avatar_id, ret, atk_ret, items, time, atk_count,
		  help_count, help_time, formation_type, formation_lev,
		  pos_info, combat_role, replay_id, ext]},
		{escort_plunder_role, [id, atk_logs, def_logs]},
		{escort,
		 [id, name, gid, quality, end_time, plunder_lists,
		  combat_lists, gname, power]},
		{m_escort, [ver, status, quality, end_time, five_data]},
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
		{shipping_order,
		 [ver, order_id, order_bid, status, end_time,
		  assign_ids]},
		{m_shipping,
		 [ver, free_times, coin_times, day_times, all_times,
		  next_order_id, free_list, do_list, apear_list,
		  rand_counts]},
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
		{market_gold_limit_data,
		 [id, min, max, num, is_show, type]},
		{market_gold_price,
		 [base_id, margin_type, init_price, buy_price, margin]},
		{market_gold_change_item, [base_id, got_list, catalg]},
		{market_gold_item,
		 [id, base_id, stock, init_stock, init_price, def_price,
		  cur_price, margin, margin_acc]},
		{market_gold_item_data,
		 [id, base_id, catalg, init_price, init_stock, open_lev,
		  max_price, min_price, limit_type, limit_num]},
		{m_market_gold, [ver, limit_data]},
		{recruit_limit, [key, info]},
		{holiday_info, [camp_id, stats, ext]},
		{recruit_info, [group_id, stats, ext]},
		{m_recruit_award, [ver, list]},
		{m_recruit,
		 [ver, free_cd_end, list, convert_list, convert_state,
		  holiday_list, holy_eqm_lottery, logs,
		  holiday_sprite_lottery_list, lucky_sprites,
		  lucky_holy_eqm, all_score]},
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
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{adventure_data, [id, room, name, lose]},
		{a_room,
		 [id, idx, evt_id, res_id, status, cond_status, lock,
		  init_evt_id, ext]},
		{m_adventure,
		 [ver, pass_id, pass_num, explore_num, id, room,
		  first_room, boss_room, room_list, buff_list, shop_list,
		  start_time, end_time, plist, is_kill_boss, init_time,
		  skill_list, bag_list, map_id, partner_id, skill_used,
		  round_reward, round_evt_group, kill_mon,
		  mine_combat_num, mine_round_combat, mine_round_reward,
		  current_id, mine_buy_count, init_id, laste_num]},
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
		{profile_add, [key, id, mod, ext]},
		{profile_reward, [ver, role_id, add_list]},
		{friend_req,
		 [id, name, sex, career, face_id, lev, power, time,
		  avatar_bid, face_update_time, face_file]},
		{role_friend,
		 [id, name, gname, gid, sex, career, face_id, lev, power,
		  login_time, login_out_time, is_online, main_partner_id,
		  partner_bid, partner_lev, partner_star, is_home,
		  avatar_bid, vip_lev, dun_id, soft, face_update_time,
		  face_file]},
		{friend, [myid, fid, intimacy, is_draw, ctime]},
		{friend_tmp,
		 [fid, intimacy, ctime, name, gname, gid, sex, career,
		  face_id, avatar_bid, lev, vip_lev, power, login_time,
		  login_out_time, is_online, is_cross, main_partner_id,
		  partner_bid, partner_lev, partner_star, is_awake,
		  is_used, is_present, is_draw, dun_id, is_fanse, is_home,
		  soft, face_update_time, face_file]},
		{m_friend, [ver, is_open, list]},
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
		{merge_role_name,
		 [key, role_id, name, lev, exp, power, data_source]},
		{merge_server,
		 [platform, zone_id, data_source, schema, target_schema,
		  realm, index, size]},
		{merge_table,
		 [name, table, dao, server, next_key, process, state,
		  new_srv_id, old_srv_id, columns, delete_expire]}]).

-export([tables/0, tables/1]).

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

-file("src/merge/merge_data.erl", 16).

-file("inc/merge.hrl", 1).

-record(merge_table,
	{name = <<>>, table = <<>>, dao, server, next_key = 0,
	 process = merge_main_proc, state, new_srv_id,
	 old_srv_id, columns = undefined,
	 delete_expire = undefined}).

-record(merge_server,
	{platform = "", zone_id = 1, data_source, schema,
	 target_schema, realm = 0, index = 0, size = 0}).

-record(merge_role_name,
	{key = "", role_id = {0, <<>>}, name = <<>>, lev = 0,
	 exp = 0, power = 0, data_source}).

-file("src/merge/merge_data.erl", 17).

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

-file("src/merge/merge_data.erl", 18).

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

-file("src/merge/merge_data.erl", 19).

-file("inc/friend.hrl", 1).

-record(m_friend, {ver = 1, is_open = 0, list = []}).

-record(friend_tmp,
	{fid = {0, <<>>}, intimacy = 0, ctime = 0, name = <<>>,
	 gname = <<>>, gid = {0, <<>>}, sex = 0, career = 0,
	 face_id = 0, avatar_bid = 0, lev = 0, vip_lev = 0,
	 power = 0, login_time = 0, login_out_time = 0,
	 is_online = 0, is_cross = 0, main_partner_id = 0,
	 partner_bid = 0, partner_lev = 0, partner_star = 0,
	 is_awake = 0, is_used = 0, is_present = 0, is_draw = 0,
	 dun_id = 1, is_fanse = 0, is_home = 0, soft = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(friend,
	{myid = 0, fid = {0, <<>>}, intimacy = 0, is_draw = 0,
	 ctime = 0}).

-record(role_friend,
	{id = {0, <<>>}, name = <<>>, gname = <<>>,
	 gid = {0, <<>>}, sex = 0, career = 0, face_id = 0,
	 lev = 0, power = 0, login_time = 0, login_out_time = 0,
	 is_online = 0, main_partner_id = 0, partner_bid = 0,
	 partner_lev = 0, partner_star = 0, is_home = 0,
	 avatar_bid = 0, vip_lev = 0, dun_id = 1, soft = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(friend_req,
	{id = {0, <<>>}, name = <<>>, sex = 0, career = 0,
	 face_id = 0, lev = 0, power = 0, time = 0,
	 avatar_bid = 0, face_update_time = 0,
	 face_file = <<>>}).

-file("src/merge/merge_data.erl", 20).

-file("inc/profile.hrl", 1).

-record(profile_reward,
	{ver = 1, role_id, add_list = []}).

-record(profile_add, {key, id, mod, ext = #{}}).

-file("src/merge/merge_data.erl", 21).

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

-file("src/merge/merge_data.erl", 22).

-file("inc/adventure.hrl", 1).

-record(m_adventure,
	{ver = 10, pass_id = 0, pass_num = 0, explore_num = 0,
	 id = 0, room = 0, first_room = 0, boss_room = 0,
	 room_list = [], buff_list = [], shop_list = [],
	 start_time = 0, end_time = 0, plist = [],
	 is_kill_boss = 0, init_time = 0, skill_list = [],
	 bag_list = [], map_id = 0, partner_id = 0,
	 skill_used = [], round_reward = [],
	 round_evt_group = [], kill_mon = 0, mine_combat_num = 0,
	 mine_round_combat = 0, mine_round_reward = [],
	 current_id = 0, mine_buy_count = 0, init_id = 0,
	 laste_num = 999}).

-record(a_room,
	{id = 1, idx = 0, evt_id = 0, res_id = 0, status = 0,
	 cond_status = 0, lock = 0, init_evt_id = 0, ext = []}).

-record(adventure_data,
	{id = 0, room = 0, name = <<>>, lose = []}).

-file("src/merge/merge_data.erl", 23).

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

-file("src/merge/merge_data.erl", 24).

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

-file("src/merge/merge_data.erl", 25).

-file("inc/recruit.hrl", 1).

-record(m_recruit,
	{ver = 7, free_cd_end = 0, list = [], convert_list = [],
	 convert_state = [], holiday_list = [],
	 holy_eqm_lottery = [], logs = [],
	 holiday_sprite_lottery_list = [], lucky_sprites = [],
	 lucky_holy_eqm = [], all_score = 0}).

-record(m_recruit_award, {ver = 1, list = []}).

-record(recruit_info,
	{group_id = 0, stats = #{}, ext = #{}}).

-record(holiday_info,
	{camp_id = 0, stats = #{}, ext = #{}}).

-record(recruit_limit, {key, info = #{}}).

-file("src/merge/merge_data.erl", 26).

-file("inc/market_gold.hrl", 1).

-record(m_market_gold, {ver = 1, limit_data = []}).

-record(market_gold_item_data,
	{id  :: pos_integer(), base_id  :: pos_integer(),
	 catalg  :: pos_integer(),
	 init_price  :: non_neg_integer(),
	 init_stock  :: non_neg_integer(),
	 open_lev  :: non_neg_integer(),
	 max_price  :: non_neg_integer(),
	 min_price  :: non_neg_integer(),
	 limit_type  :: pos_integer(),
	 limit_num  :: non_neg_integer()}).

-record(market_gold_item,
	{id  :: pos_integer(), base_id = 0  :: pos_integer(),
	 stock = 0  :: non_neg_integer(),
	 init_stock = 0  :: non_neg_integer(),
	 init_price = 0  :: non_neg_integer(),
	 def_price = 0  :: non_neg_integer(),
	 cur_price = 0  :: non_neg_integer(),
	 margin = 1000  :: non_neg_integer(),
	 margin_acc = 1000  :: non_neg_integer()}).

-record(market_gold_change_item,
	{base_id = 0  :: pos_integer(),
	 got_list = []  :: list(),
	 catalg = 0  :: pos_integer()}).

-record(market_gold_price,
	{base_id = 0, margin_type = 0, init_price = 0,
	 buy_price = 0, margin = 0}).

-record(market_gold_limit_data,
	{id = 0, min = 0, max = 0, num = 0, is_show = 0,
	 type = 0}).

-file("src/merge/merge_data.erl", 27).

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

-file("src/merge/merge_data.erl", 28).

-file("inc/shipping.hrl", 1).

-record(m_shipping,
	{ver = 3, free_times = 0, coin_times = 0, day_times = 0,
	 all_times = 0, next_order_id = 1, free_list = [],
	 do_list = [], apear_list = [], rand_counts = []}).

-record(shipping_order,
	{ver = 1, order_id, order_bid = 0, status = 1,
	 end_time = 0, assign_ids = []}).

-file("src/merge/merge_data.erl", 29).

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

-file("src/merge/merge_data.erl", 30).

-file("inc/escort.hrl", 1).

-record(m_escort,
	{ver = 1  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 quality = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 five_data = []  :: list()}).

-record(escort,
	{id = {0, <<>>}  :: tuple(),
	 name = <<>>  :: non_neg_integer(),
	 gid = {0, <<>>}  :: tuple(),
	 quality = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 plunder_lists = []  :: non_neg_integer(),
	 combat_lists = []  :: non_neg_integer(),
	 gname = <<>>  :: non_neg_integer(),
	 power = 0  :: non_neg_integer()}).

-record(escort_plunder_role,
	{id = {0, <<>>}, atk_logs = [], def_logs = []}).

-record(escort_plunder_log,
	{id = 0, quality = 0, rid = {0, <<>>}, name = <<>>,
	 guild_name = <<>>, face = 0, lev = 0, sex = 0,
	 power = 0, avatar_id = 0, ret = 0, atk_ret = 0,
	 items = [], time = 0, atk_count = 0, help_count = 0,
	 help_time = 0, formation_type = 0, formation_lev = 0,
	 pos_info = [], combat_role = [], replay_id = 0,
	 ext = []}).

-record(escort_pos_info,
	{pos = 0, id = 0, bid = 0, lev = 0, quality = 0,
	 star = 0, break_lev = 0, power = 0, speed = 0, atk = 0,
	 def = 0, hp = 0}).

-file("src/merge/merge_data.erl", 31).

-file("inc/guild_dun.hrl", 1).

-record(guild_dun,
	{var = 2, id = {0, <<>>}, f_id = 0, max_id = 0,
	 boss_list = [], box_award = [], rank_list = [],
	 unit_hp = [], buff_lev = 0, buff_end_time = 0,
	 day_dps = 0, assemble_time = 0}).

-record(guild_dun_box,
	{var = 1, boss_id = 0, award_list = []}).

-record(guild_dun_rank_guild,
	{var = 1, rank = 0, gid = {0, <<>>}, name = <<>>,
	 r_name = <<>>, max_id = 0, time = 0, day_dps = 0,
	 leader_id = {0, <<>>}}).

-record(guild_dun_rank_boss, {var = 1, boss_id, list}).

-record(guild_dun_rank_role,
	{var = 3, rank = 0, r_id = {0, <<>>}, name = <<>>,
	 boss_id = 0, all_dps = 0, avatar_bid = 0,
	 lev = 0  :: non_neg_integer(),
	 family_name = <<>>  :: bitstring(),
	 face_id = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(), time = 0,
	 look_id = 0  :: pos_integer(), face_update_time = 0,
	 face_file = <<>>}).

-record(m_guild_dun,
	{var = 2, formation_list = [], dps_list = [],
	 first_list = []}).

-file("src/merge/merge_data.erl", 32).

-file("inc/guild_war.hrl", 1).

-record(guild_war_sign,
	{gid = {0, <<>>}, group_id = 0, srv_name = <<>>,
	 gname = <<>>, def_num = 0, defense = [],
	 last_matchs = {0, <<>>}, avg_power = 0, star_time = 0,
	 buff_lev = 0, rank = 0, hp = 0, hp_max = 0,
	 war_log = [], lev = 0}).

-record(guild_war_role,
	{pos = 0, id = {0, <<>>}, name = <<>>, lev = 0,
	 face = 0, power = 0, formation_type = 0,
	 formation_lev = 0, war_score = 0, star = 0,
	 defense = [], hp = 3, hp_max = 3, status = 0,
	 def_count = 0, def_log = [], count = 0,
	 repaly_info = [], relic_def_count = 0, hallows_id = 0,
	 hallows_lev = 0, hallows_skill_lev = 0, hallows_look_id,
	 hallows_lucky, hallows_seal, hallows_all_look_ids = [],
	 extra = [], look_id = 0, face_update_time = 0,
	 face_file = <<>>, break_groups = []}).

-record(guild_war_partner,
	{id = 0, bid = 0, lev = 0, star = 0, break_lev = 0,
	 base_attr = [], all_attr = [], skills = [],
	 break_skills = [], set_skills = [], ext_data = []}).

-record(guild_war_log,
	{flag1 = 0, flag2 = 0, time = 0, id1 = {0, <<>>},
	 name1 = <<>>, id2 = {0, <<>>}, name2 = <<>>,
	 gid = {0, <<>>}, gname = <<>>, int_args = [],
	 str_args = []}).

-record(guild_war_role_log,
	{id = {0, <<>>}, name = <<>>, lev = 0, face = 0,
	 power = 0, formation_type = 0, formation_lev = 0,
	 time = 0, repaly_id = 0, result = 0, hp = 0,
	 defense = [], face_update_time = 0, face_file = <<>>}).

-file("src/merge/merge_data.erl", 33).

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

-file("src/merge/merge_data.erl", 34).

-file("inc/invite_code.hrl", 1).

-record(m_invite_code,
	{ver = 1, bind_code = 0, bind_roleid = {0, <<>>},
	 reward_list = []}).

-record(invite_code_role,
	{role_id = {0, <<>>}, code = 0, time = 0, num = 0,
	 list = [], return_num = 0, return_list = []}).

-record(invite_code_bind,
	{role_id = {0, <<>>}, bind_id = {0, <<>>},
	 account = <<>>, name = <<>>, sex = 0, lev = 0, vip = 0,
	 power = 0, face = 0, avatar_bid = 0, online = 1,
	 login_time = 0, code = 0, time = 0, reg_idfa = <<>>,
	 reg_ip = <<>>, is_return = 0, return_charge = 0,
	 return_power = 0, face_update_time = 0,
	 face_file = <<>>}).

-file("src/merge/merge_data.erl", 35).

-file("inc/drop.hrl", 1).

-record(drop_limit,
	{ver = 1, time_val = [], count_val = [], down_val = [],
	 up_val = []}).

-record(drop_bag,
	{ver = 1, id = {0, <<>>}, mon = #drop_limit{},
	 mon_cache = #drop_limit{}, common = #drop_limit{}}).

-record(drop_total,
	{drop_id = 0, name = <<>>, allot = 0, super_r = 0,
	 first_r = 0, second_r = 0, third_r = 0,
	 notice_msg = <<>>}).

-record(drop_son,
	{drop_id = 0, name = <<>>, item_bid = 0,
	 item_name = <<>>, item_num = 0, bind = 1, rand = 0,
	 is_notice = 0, career = 0, lev = 0, self_time = 0,
	 srv_time = 0, self_count = 0, srv_count = 0,
	 self_down = 0, self_up = 0, world_lev = 0}).

-record(drop_group,
	{group = 0, item_bid = 0, item_name = <<>>,
	 item_num = 0, bind = 1, rand = 0, career = 0, lev = 0}).

-record(drop_role,
	{id = {0, <<>>}, career = 0, lev = 0, name = <<>>,
	 num_best = 0, num_common = 0, is_person_limit = 1,
	 drop_total = undefined, limit_flag = 1,
	 drop_limit = #drop_limit{}, common_list = [],
	 best_list = [], item_list = [], notice_list = []}).

-file("src/merge/merge_data.erl", 36).

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

-file("src/merge/merge_data.erl", 37).

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

-file("src/merge/merge_data.erl", 38).

-file("inc/home.hrl", 1).

-record(m_home,
	{ver = 3, num = 0, buy_num = 0, list = [],
	 day_visitors = [], soft = 0, max_soft = 0, look_id = 0,
	 look_list = [], last_visitors = {0, <<>>}, worship = 0,
	 worship_list = [], rand_list = [], last_rand_time = 0,
	 set_list = [], last_hook_time = 0, acc_hook_time = 0,
	 acc_hook_items = [], open_floor = [], floor_list = [],
	 main_floor = 0, max_sum_soft = 0}).

-record(home,
	{ver = 2, id = {0, <<>>}, name = <<>>, look_id = 0,
	 bid = 0, wall_bid = 0, land_bid = 0, soft = 0,
	 home_unit = [], floor_list = [], log = [],
	 open_floor = [1], main_floor = 1}).

-record(home_floor,
	{floor = 0, wall_bid = 0, land_bid = 0, soft = 0,
	 home_unit = []}).

-record(home_ext,
	{id = {0, <<>>}, visitors = [], log = []}).

-record(home_unit,
	{ver = 1, bid = 0  :: non_neg_integer(),
	 index = 0  :: non_neg_integer(), dir = 1  :: 1..2}).

-record(home_visitor,
	{id = {0, <<>>}, name = <<>>, look_id = 0, time = 0,
	 is_leave = 0}).

-record(home_log,
	{id = {0, <<>>}, name = <<>>, face = 0, lev = 0,
	 is_friend = 0, type = 0, time = 0, int_args = [],
	 str_args = [], face_update_time = 0, face_file = <<>>}).

-record(home_rand_visit,
	{id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 face = 0, power = 0, last_login = 0, soft = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(home_unit_set,
	{set_id = 0, reward = [], collect = []}).

-record(home_rank_rc,
	{id = {0, <<>>}, name = <<>>, lev = 0, face = 0,
	 avatar_bid = 0, time = 0, cache_time = 0,
	 worship_num = 0, visit_num = 0, soft = 0, score = 0,
	 rank = 0, face_update_time = 0, face_file = <<>>}).

-record(home_role_rank, {id = {0, <<>>}, rank = 0}).

-record(home_unit_data,
	{bid = 0, name = <<>>, type = 0, dir = 1, set_id = 0,
	 soft = 0, tile_list_1 = [], tile_list_2 = [],
	 effect_count = 1}).

-file("src/merge/merge_data.erl", 39).

-file("inc/primus.hrl", 1).

-record(primus,
	{pos = 1  :: non_neg_integer(),
	 num = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 look_id = 0  :: non_neg_integer(),
	 role_id = {0, <<>>}  :: tuple(),
	 name = <<>>  :: binary(), lev = 0  :: non_neg_integer(),
	 face_id = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(), face_update_time = 0,
	 face_file = <<>>}).

-record(primus_log,
	{role_id = {0, <<>>}  :: tuple(),
	 name = <<>>  :: binary(), lev = 0  :: non_neg_integer(),
	 face_id  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 num = 0  :: non_neg_integer(),
	 replay_id = 0  :: non_neg_integer(),
	 formation_type = 0  :: non_neg_integer(),
	 formation_lev = 0  :: non_neg_integer(),
	 partner_list = []  :: list(),
	 time = 0  :: non_neg_integer(),
	 ret = 1  :: non_neg_integer(), face_update_time = 0,
	 face_file = <<>>}).

-file("src/merge/merge_data.erl", 40).

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

-file("src/merge/merge_data.erl", 41).

-file("inc/guild_marketplace.hrl", 1).

-record(market_item,
	{ver = 1  :: pos_integer(), id = 0  :: pos_integer(),
	 base_id = 0  :: pos_integer(),
	 num = 0  :: pos_integer(), attr = []  :: list(),
	 extra = []  :: list(), holy_eqm_attr = []  :: list(),
	 end_time = []  :: list(), score = 0  :: pos_integer()}).

-record(market_board,
	{ver = 1  :: pos_integer(), type = 1  :: pos_integer(),
	 name = <<>>  :: bitstring(),
	 operation = 1  :: pos_integer(),
	 reward_list = []  :: list(),
	 unixtime = 0  :: pos_integer()}).

-record(guild_marketplace,
	{ver = 1  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 next_booth_id = 1  :: pos_integer(),
	 item_list = []  :: list(), board_list = []  :: list()}).

-file("src/merge/merge_data.erl", 42).

-file("inc/arena_cluster.hrl", 1).

-record(m_arena_cluster,
	{ver = 1, ref_time = 0, formations = [], ref_list = [],
	 season_ref_time = 0, season_combat_num = 0,
	 best_rank = 0, day_combat_num = 0, acc_combat_num = 0,
	 day_reward = [], turn_card_reward = [],
	 turn_card_num = 0, turn_card_history = [], worship = 0,
	 worship_list = []}).

-record(arena_cluster_f,
	{id = {0, <<>>}, name = <<>>, gname = <<>>, idx = 0,
	 lev = 0, vip_lev = 0, sex = 0, face = 0, power = 0,
	 rank = 0, order_info = [], robot_id = 0, avatar_id = 0,
	 look = 0, ext = []}).

-record(arena_cluster_f_order,
	{order, formation_type = 1, hallows_id = 0,
	 hallows_lev = 0, hallows_skill_lev = 0, pos_info = [],
	 hallows_look_id = 0, hallows_lucky = 0,
	 hallows_seal = 0, hallows_all_look_ids = [], power = 0,
	 is_hidden = 0, extra = []}).

-record(arena_cluster_f_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, use_skin = 0,
	 dower_skill = [], set_skill = [], attr, extra = []}).

-record(arena_cluster_rank,
	{rank = 0, id = {0, <<>>}, score = 0}).

-record(arena_cluster_role,
	{id = {0, <<>>}, name = <<>>, vip = 0, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 max_power = 0, lookid = 0, score = 0, rank = 0,
	 time = 0, avatar_id = 0, cont_win = 0, ext = []}).

-record(role_arena_cluster_log,
	{id = {0, <<>>}, list = []}).

-record(arena_cluster_log,
	{id = 0, atk_id = {0, <<>>}, atk_name = <<>>,
	 atk_face = 0, atk_lev = 0, atk_rank = 0, atk_score = 0,
	 def_id = {0, <<>>}, def_name = <<>>, def_face = 0,
	 def_lev = 0, def_rank = 0, def_score = 0, ret = 1,
	 win_count = 0, lose_count = 0, combat_type = 0,
	 replay_list = [], time = 0, atk_face_update_time = 0,
	 atk_face_file = <<>>, def_face_update_time = 0,
	 def_face_file = <<>>}).

-record(arena_cluster_replay,
	{id = 0, round = 0, ret = 0, time = 0, a_id = {0, <<>>},
	 a_power = 0, a_formation_type = 0, a_order = 0,
	 a_end_hp = 0, b_id = {0, <<>>}, b_power = 0,
	 b_formation_type = 0, b_order = 0, b_end_hp = 0,
	 a_plist = [], b_plist = [], ext = []}).

-record(arena_cluster_replay_partner,
	{pos = 0, bid = 0, lev = 0, star = 0, ext = []}).

-record(arena_cluster_fight_lock,
	{id = {0, <<>>}, is_fight = 0, fight_rid = {0, <<>>},
	 fight_pid = 0}).

-file("src/merge/merge_data.erl", 43).

-file("inc/expedition.hrl", 1).

-record(m_expedition,
	{ver = 2, guard_id = 0, partner_hp = [], list = [],
	 employ = [], appoint = [], difficulty = 0,
	 max_difficulty = 0, last_join_time = 0,
	 last_difficulty = {0, 0}, max_power = 0}).

-record(expedition_f,
	{id = 1  :: 1..100, type = 1, robot_id = 0,
	 role_id = {0, <<>>}  :: tuple(),
	 name = <<>>  :: bitstring(),
	 lev = 0  :: non_neg_integer(),
	 face = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 hallows_id = 0  :: non_neg_integer(),
	 formation_type = 0  :: non_neg_integer(),
	 items = []  :: list(), guards = []  :: list(),
	 partner_hp = []  :: list(), status = 0  :: 0..2}).

-record(expedition_f_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, quality = 0,
	 star = 0, break_lev = 0, power = 0, speed = 0, atk = 0,
	 def = 0, hp = 0, attr_ratio = 1000, ext = []}).

-record(expedition_employ,
	{rid = {0, <<>>}, rname = <<>>, num = 0, list = []}).

-record(expedition_employ_p,
	{id = 0, bid = 0, lev = 0, star = 0, quality = 0,
	 break_lev = 0, power = 0, num = 0, ext = []}).

-record(expedition_log,
	{id = {{0, <<>>}, 0}, list = []}).

-record(expedition_replay,
	{id = 0, round = 0, ret = 0, time = 0, difficulty = 0,
	 guard_id = 0, a_id = {0, <<>>}, a_name = <<>>,
	 a_lev = 0, a_power = 0, a_formation_type = 0,
	 a_end_hp = 0, b_id = {0, <<>>}, b_name = <<>>,
	 b_lev = 0, b_power = 0, b_formation_type = 0,
	 b_end_hp = 0, a_plist = [], b_plist = [], ext = []}).

-record(expedition_replay_partner,
	{pos = 0, bid = 0, lev = 0, star = 0, ext = []}).

-file("src/merge/merge_data.erl", 44).

-file("inc/holiday_term_begins.hrl", 1).

-record(m_holiday_term_begins,
	{ver = 1, camp_id = 0, round = 0, round_endtime = 0,
	 difficulty = 0, order_id = 1, order_endtime = 0,
	 fight_count = 0, buy_count = 0, order_hp = [],
	 submit_paper = 0, paper_reward = [], boss_endtime = 0,
	 boss_dps = 0, boss_dps_list = [], all_boss_dps = 0,
	 best_partner_id = 0, hurt_statistics = []}).

-record(holiday_term_begins_boss,
	{var = 1, id = 0, unit_id = 0, boss_endtime = 0,
	 boss_hp = [], dps = 0, buff_lev = 0, paper_num = 0,
	 reward = [], kill_reward = [], is_kill = 0,
	 boss_id = 0}).

-record(holiday_term_begins_boss_rank_role,
	{var = 1, rank = 0, r_id = {0, <<>>}, name = <<>>,
	 boss_id = 0, all_dps = 0, avatar_bid = 0,
	 lev = 0  :: non_neg_integer(),
	 family_name = <<>>  :: bitstring(),
	 face_id = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(), time = 0}).

-record(holiday_term_begins_boss_rank,
	{rank = 0, id = {0, <<>>}, all_dps = 0}).

-file("src/merge/merge_data.erl", 45).

-file("inc/monopoly_dungeons.hrl", 1).

-record(stage_rank,
	{ver = 1  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 name = <<>>  :: string(), dps = 0  :: pos_integer(),
	 unixtime = 0  :: pos_integer(),
	 lev = 0  :: pos_integer(),
	 face_id = 0  :: pos_integer(),
	 avatar_bid = 0  :: pos_integer(),
	 power = 0  :: pos_integer()}).

-record(dungeons_boss,
	{ver = 1  :: pos_integer(), id = 0  :: pos_integer(),
	 base_id = 0  :: pos_integer(), hp = 0  :: pos_integer(),
	 max_hp = 0  :: pos_integer()}).

-record(dungeons_stage,
	{ver = 1  :: pos_integer(), id = 0  :: pos_integer(),
	 develop = 0  :: pos_integer(),
	 boss_list = []  :: list(), rank = []  :: list()}).

-record(monopoly_dungeons,
	{ver = 1  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 camp_id = 0  :: pos_integer(),
	 stage_list = []  :: list(), buffs = []  :: list()}).

-record(guild_stage_rank,
	{ver = 1  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 name = <<>>  :: string(), dps = 0  :: pos_integer(),
	 unixtime = 0  :: pos_integer(),
	 is_reward = 0  :: boolean(),
	 leader_name = <<>>  :: string(),
	 member = 0  :: pos_integer(),
	 members_max = 0  :: pos_integer(),
	 lev = 0  :: pos_integer()}).

-record(monopoly_dungeons_guild_rank,
	{ver = 1  :: pos_integer(), id = 0  :: pos_integer(),
	 stage_guild_rank = []  :: list()}).

-file("src/merge/merge_data.erl", 46).

-file("inc/weekly.hrl", 1).

-record(m_weekly,
	{ver = 1, used_partners = [], get_partner = [],
	 get_gold = 0, get_high_recruit = 0, get_crystal = 0,
	 get_sprite = [], send_point = 0}).

-record(role_weekly_report,
	{ver = 1, rid = {{0, <<>>}, 0}, end_time = 0,
	 account = <<>>, name = <<>>, lev = 1, face_id = 0,
	 power = 0, channel = 0, have_partners = [],
	 used_partners = [], get_partner = [], get_gold = 0,
	 get_high_recruit = 0, get_crystal = 0, get_sprite = [],
	 send_point = 0, login_day = 0, acc_time = 0,
	 arena_elite_lev = 0, arena_cluster_rank = 0,
	 star_tower_rank = 0, arena_score = 0, endless_rank = 0,
	 sky_ladder_rank = 0, cluster_champion_rank = 0,
	 arena_team_rank = 0, element_rank = 0, drama_rate = 0,
	 tag_list = [], ext = []}).

-file("src/merge/merge_data.erl", 47).

-file("inc/holiday_petard.hrl", 1).

-record(m_holiday_petard,
	{ver = 2, camp_id = 0, end_time = 0, get_red_count = 0,
	 send_red_count = 0, send_notice = 0,
	 must_not_small = [], must_not_big = [],
	 petard_reward = [], red_packet_info = [],
	 get_red_info = []}).

-record(petard_red_packet,
	{id = 0, rid = {0, <<>>}, name = <<>>, face_id = 0,
	 avatar_bid = 0, num = 0, max_num = 0, is_max = 0,
	 mems = [], must_not = [], start_time = 0, end_time = 0,
	 msg_id = 0}).

-record(get_red_packet_info,
	{r_id = {0, <<>>}, red_id = 0, name = <<>>, lev = 0,
	 face_id = 0, avatar_bid = 0, time = 0, item = []}).

-record(self_add_info,
	{id = 0, time = 0, score = 0, status = 0,
	 total_time = 0, interval = 0}).

-file("src/merge/merge_data.erl", 48).

-file("inc/holiday_lucky_dog.hrl", 1).

-record(m_holiday_lucky_dog,
	{ver = 1, camp_id = 0, info = [], ext = []}).

-record(holiday_lucky_dog_quest,
	{quest_id = 0, val = 0, num = 0, lucky_type = 0,
	 finish = 0, ext = []}).

-record(holiday_lucky_dog_info,
	{ver = 1, camp_id = 0, period = 0, status = 0,
	 lucky_dog = [], ext = []}).

-file("src/merge/merge_data.erl", 49).

tables() ->
    MergeType = merge_util:get_merge_type(),
    tables(MergeType).

tables(center) -> {ok, []};
tables(_MergeType) ->
    List = [#merge_table{table = <<"role">>,
			 name = <<"角色基础信息表">>, dao = merge_dao_role,
			 delete_expire = role},
	    #merge_table{table = <<"role_ext">>, name = <<"角色信息表">>,
			 dao = merge_dao_mergeall},
	    #merge_table{table = <<"role_assets">>,
			 name = <<"角色资产信息表">>, dao = merge_dao_mergeall,
			 delete_expire = role},
	    #merge_table{table = <<"mod_charge">>, name = <<"充值表">>,
			 dao = merge_dao_mergeall_outcols, columns = ["id"]},
	    #merge_table{table = <<"mod_old_name">>,
			 name = <<"曾用名">>, dao = merge_dao_mergeall},
	    #merge_table{table = <<"mod_notice">>,
			 name = <<"系统公告">>, dao = merge_dao_mergefirst},
	    #merge_table{table = <<"mod_holiday_son">>,
			 name = <<"后台子活动">>, dao = merge_dao_mergefirst},
	    #merge_table{table = <<"mod_holiday_total">>,
			 name = <<"后台总活动">>, dao = merge_dao_mergefirst},
	    #merge_table{table = <<"mod_self_charge">>,
			 name = <<"自充值账号">>, dao = merge_dao_mergefirst},
	    #merge_table{table = <<"mod_keywords">>,
			 name = <<"关键词">>, dao = merge_dao_mergefirst},
	    #merge_table{table = <<"mod_keyword_ad">>,
			 name = <<"关键词">>, dao = merge_dao_mergefirst},
	    #merge_table{table = <<"role_auth_adult">>,
			 name = <<"防沉迷设置">>, dao = merge_dao_mergefirst},
	    #merge_table{table = <<"mod_vip_exclusive">>,
			 name = <<"VIP专属礼包">>, dao = merge_dao_mergefirst},
	    #merge_table{table = <<"env">>, name = <<"环境变量">>,
			 dao = merge_dets_env},
	    #merge_table{table = <<"guild.dets">>,
			 name = <<"联盟数据">>, dao = merge_dets_guild},
	    #merge_table{table = <<"guild_merge.dets">>,
			 name = <<"联盟合并数据">>, dao = merge_dets,
			 columns =
			     [guild_merge, "guild_merge.dets", set,
			      #g_merge.gid, undefined]},
	    #merge_table{table = <<"guild_mem_red_packet.dets">>,
			 name = <<"联盟红包合并数据">>, dao = merge_dets,
			 columns =
			     [guild_mem_red_packet, "guild_mem_red_packet.dets",
			      set, #g_mem_red_packet.id, undefined]},
	    #merge_table{table = <<"role_misc_ext.dets">>,
			 name = <<"个人额外数据">>, dao = merge_dets,
			 columns =
			     [role_misc_ext, "role_misc_ext.dets", set, 1,
			      undefined]},
	    #merge_table{table = <<"role_other_var.dets">>,
			 name = <<"个人全局变量数据">>, dao = merge_dets,
			 columns =
			     [role_other_var, "role_other_var.dets", set,
			      #role_var.id, undefined]},
	    #merge_table{table = <<"role_day_var.dets">>,
			 name = <<"个人天变量数据">>, dao = merge_dets,
			 columns =
			     [role_day_var, "role_day_var.dets", set,
			      #role_var.id, undefined]},
	    #merge_table{table = <<"role_timeout_var.dets">>,
			 name = <<"个人自动超时变量数据">>, dao = merge_dets,
			 columns =
			     [role_timeout_var, "role_timeout_var.dets", set,
			      #role_var.id, undefined]},
	    #merge_table{table = <<"mailbox.dets">>,
			 name = <<"邮件数据">>, dao = merge_dets,
			 columns =
			     [mailbox, "mailbox.dets", duplicate_bag, #mail.to,
			      undefined]},
	    #merge_table{table = <<"role_friend.dets">>,
			 name = <<"好友角色信息数据">>, dao = merge_dets,
			 columns =
			     [role_friend, "role_friend.dets", set,
			      #role_friend.id, undefined]},
	    #merge_table{table = <<"role_friend_cross.dets">>,
			 name = <<"跨服好友角色信息数据">>, dao = merge_dets,
			 columns =
			     [role_friend_cross, "role_friend_cross.dets", set,
			      #role_friend.id, undefined]},
	    #merge_table{table = <<"friends.dets">>,
			 name = <<"好友关系数据">>, dao = merge_dets,
			 columns =
			     [friends, "friends.dets", duplicate_bag,
			      #friend.myid, undefined]},
	    #merge_table{table = <<"sns_black_list.dets">>,
			 name = <<"黑名单数据">>, dao = merge_dets,
			 columns =
			     [sns_black_list, "sns_black_list.dets",
			      duplicate_bag, 1, undefined]},
	    #merge_table{table = <<"invite_code_role.dets">>,
			 name = <<"邀请码角色信息数据">>, dao = merge_dets,
			 columns =
			     [invite_code_role, "invite_code_role.dets", set,
			      #invite_code_role.role_id, undefined]},
	    #merge_table{table = <<"invite_code_bind.dets">>,
			 name = <<"邀请码角色绑定信息数据">>, dao = merge_dets,
			 columns =
			     [invite_code_bind, "invite_code_bind.dets", set,
			      #invite_code_bind.role_id, undefined]},
	    #merge_table{table = <<"invite_code_return_bind.dets">>,
			 name = <<"邀请码角色绑定信息数据">>, dao = merge_dets,
			 columns =
			     [invite_code_return_bind,
			      "invite_code_return_bind.dets", set,
			      #invite_code_bind.role_id, undefined]},
	    #merge_table{table = <<"drop_bag.dets">>,
			 name = <<"掉落信息数据">>, dao = merge_dets,
			 columns =
			     [drop_bag, "drop_bag.dets", set, #drop_bag.id,
			      undefined]},
	    #merge_table{table = <<"sys_rank.dets">>,
			 name = <<"排行榜">>, dao = merge_dets_rank},
	    #merge_table{table = <<"endless_employ.dets">>,
			 name = <<"无尽雇佣数据">>, dao = merge_dets,
			 columns =
			     [endless_employ, "endless_employ.dets", set,
			      #endless_employ.rid, undefined]},
	    #merge_table{table = <<"endless_employ_point.dets">>,
			 name = <<"无尽雇佣数据">>, dao = merge_dets,
			 columns =
			     [endless_employ_point, "endless_employ_point.dets",
			      set, 1, undefined]},
	    #merge_table{table = <<"expedition_employ.dets">>,
			 name = <<"远征雇佣数据">>, dao = merge_dets,
			 columns =
			     [expedition_employ, "expedition_employ.dets", set,
			      #expedition_employ.rid, undefined]},
	    #merge_table{table = <<"guild_dun.dets">>,
			 name = <<"联盟副本数据">>, dao = merge_dets,
			 columns =
			     [guild_dun, "guild_dun.dets", set, #guild_dun.id,
			      undefined]},
	    #merge_table{table = <<"guild_dun_rank_role.dets">>,
			 name = <<"联盟副本boss伤害数据">>, dao = merge_dets,
			 columns =
			     [guild_dun_rank_boss, "guild_dun_rank_role.dets",
			      set, #guild_dun_rank_boss.boss_id, undefined]},
	    #merge_table{table = <<"guild_secret_area.dets">>,
			 name = <<"公会秘境数据">>, dao = merge_dets,
			 columns =
			     [guild_secret_area, "guild_secret_area.dets", set,
			      #guild_secret_area.id, undefined]},
	    #merge_table{table = <<"guild_secret_area_rank.dets">>,
			 name = <<"公会秘境数据">>, dao = merge_dets,
			 columns =
			     [guild_secret_area_rank,
			      "guild_secret_area_rank.dets", set,
			      #guild_secret_area_rank.id, undefined]},
	    #merge_table{table = <<"guild_marketplace.dets">>,
			 name = <<"公会宝库数据">>, dao = merge_dets,
			 columns =
			     [guild_marketplace, "guild_marketplace.dets", set,
			      #guild_marketplace.id, undefined]},
	    #merge_table{table = <<"room_fans_num.dets">>,
			 name = <<"粉丝数量数据">>, dao = merge_dets,
			 columns =
			     [room_fans_num, "room_fans_num.dets", set,
			      #room_fans_num.id, undefined]},
	    #merge_table{table = <<"role_room_1.dets">>,
			 name = <<"粉丝关系数据">>, dao = merge_dets,
			 columns =
			     [c_room_fans_1, "role_room_1.dets", duplicate_bag,
			      #room_fans.myid, undefined]},
	    #merge_table{table = <<"role_room_2.dets">>,
			 name = <<"粉丝关系数据">>, dao = merge_dets,
			 columns =
			     [c_room_fans_2, "role_room_2.dets", duplicate_bag,
			      #room_fans.myid, undefined]},
	    #merge_table{table = <<"role_room_3.dets">>,
			 name = <<"粉丝关系数据">>, dao = merge_dets,
			 columns =
			     [c_room_fans_3, "role_room_3.dets", duplicate_bag,
			      #room_fans.myid, undefined]},
	    #merge_table{table = <<"role_room_4.dets">>,
			 name = <<"粉丝关系数据">>, dao = merge_dets,
			 columns =
			     [c_room_fans_4, "role_room_4.dets", duplicate_bag,
			      #room_fans.myid, undefined]},
	    #merge_table{table = <<"role_room_5.dets">>,
			 name = <<"粉丝关系数据">>, dao = merge_dets,
			 columns =
			     [c_room_fans_5, "role_room_5.dets", duplicate_bag,
			      #room_fans.myid, undefined]},
	    #merge_table{table = <<"room_bbs_message.dets">>,
			 name = <<"留言板数据">>, dao = merge_dets,
			 columns =
			     [room_bbs_message, "room_bbs_message.dets",
			      duplicate_bag, #room_bbs_message.id, undefined]},
	    #merge_table{table = <<"room_bbs_message_below.dets">>,
			 name = <<"留言板灯泡数据">>, dao = merge_dets,
			 columns =
			     [room_bbs_message_below,
			      "room_bbs_message_below.dets", duplicate_bag,
			      #room_bbs_message_below.id, undefined]},
	    #merge_table{table = <<"room_feat_info.dets">>,
			 name = <<"离线成就数据">>, dao = merge_dets,
			 columns =
			     [room_feat_info, "room_feat_info.dets", set, 1,
			      undefined]},
	    #merge_table{table = <<"arena_elite_role.dets">>,
			 name = <<"精英赛角色数据">>, dao = merge_dets,
			 columns =
			     [arena_elite_role, "arena_elite_role.dets", set,
			      #c_e_role.id, undefined]},
	    #merge_table{table = <<"arena_elite_mirror.dets">>,
			 name = <<"精英赛镜像数据">>, dao = merge_dets,
			 columns =
			     [arena_elite_mirror, "arena_elite_mirror.dets",
			      set, #arena_elite_role.id, undefined]},
	    #merge_table{table = <<"arena_elite_reward_lev.dets">>,
			 name = <<"精英赛结算时玩家段位数据">>, dao = merge_dets,
			 columns =
			     [arena_elite_reward_lev,
			      "arena_elite_reward_lev.dets", set, 1,
			      undefined]},
	    #merge_table{table = <<"arena_elite_other.dets">>,
			 name = <<"精英赛额外数据">>, dao = merge_dets_arena_elite,
			 columns =
			     [arena_elite_other, "arena_elite_other.dets", set,
			      1, undefined]},
	    #merge_table{table =
			     <<"arena_elite_hallows_award.dets">>,
			 name = <<"精英赛排名头像框数据处理">>, dao = merge_dets,
			 columns =
			     [arena_elite_hallows_award,
			      "arena_elite_hallows_award.dets", set, 1,
			      undefined]},
	    #merge_table{table = <<"home_1.dets">>,
			 name = <<"家园数据">>, dao = merge_dets,
			 columns =
			     [home_1, "home_1.dets", set, #home.id, undefined]},
	    #merge_table{table = <<"home_2.dets">>,
			 name = <<"家园数据">>, dao = merge_dets,
			 columns =
			     [home_2, "home_2.dets", set, #home.id, undefined]},
	    #merge_table{table = <<"home_3.dets">>,
			 name = <<"家园数据">>, dao = merge_dets,
			 columns =
			     [home_3, "home_3.dets", set, #home.id, undefined]},
	    #merge_table{table = <<"home_4.dets">>,
			 name = <<"家园数据">>, dao = merge_dets,
			 columns =
			     [home_4, "home_4.dets", set, #home.id, undefined]},
	    #merge_table{table = <<"home_5.dets">>,
			 name = <<"家园数据">>, dao = merge_dets,
			 columns =
			     [home_5, "home_5.dets", set, #home.id, undefined]},
	    #merge_table{table = <<"home_rand_visit_bak.dets">>,
			 name = <<"家园数据访问角色">>, dao = merge_dets,
			 columns =
			     [home_rand_visit_bak, "home_rand_visit_bak.dets",
			      set, #home_rand_visit.id, undefined]},
	    #merge_table{table = <<"primus.dets">>,
			 name = <<"星河神殿">>, dao = merge_dets,
			 columns =
			     [primus, "primus.dets", set, #primus.pos,
			      fun primus_mgr:merge_convert/1]},
	    #merge_table{table = <<"dungeon_info.dets">>,
			 name = <<"剧情副本">>, dao = merge_dets,
			 columns =
			     [dungeon_info, "dungeon_info.dets", set, 1,
			      undefined]},
	    #merge_table{table = <<"holiday_merge_holiday.dets">>,
			 name = <<"活动">>, dao = merge_dets,
			 columns =
			     [holiday_merge_holiday,
			      "holiday_merge_holiday.dets", set, 1, undefined]},
	    #merge_table{table = <<"arena_cluster_role.dets">>,
			 name = <<"跨服竞技机器人">>, dao = merge_dets,
			 columns =
			     [arena_cluster_role, "arena_cluster_role.dets",
			      set, #arena_cluster_role.id, undefined]},
	    #merge_table{table = <<"arena_cluster_role_bak.dets">>,
			 name = <<"跨服竞技机器人">>, dao = merge_dets,
			 columns =
			     [arena_cluster_role_bak,
			      "arena_cluster_role_bak.dets", set,
			      #arena_cluster_role.id, undefined]},
	    #merge_table{table = <<"recruit_limit.dets">>,
			 name = <<"普通召唤">>, dao = merge_dets,
			 columns =
			     [recruit_limit, "recruit_limit.dets", set,
			      #recruit_limit.key, undefined]},
	    #merge_table{table = <<"recruit_limit_holiday.dets">>,
			 name = <<"活动召唤">>, dao = merge_dets,
			 columns =
			     [recruit_limit_holiday,
			      "recruit_limit_holiday.dets", set,
			      #recruit_limit.key, undefined]},
	    #merge_table{table = <<"holy_eqm_lottery_limit.dets">>,
			 name = <<"神装召唤">>, dao = merge_dets,
			 columns =
			     [holy_eqm_lottery_limit,
			      "holy_eqm_lottery_limit.dets", set,
			      #recruit_limit.key, undefined]},
	    #merge_table{table =
			     <<"holiday_sprite_limit_lottery.dets">>,
			 name = <<"精灵召唤">>, dao = merge_dets,
			 columns =
			     [holiday_sprite_limit_lottery,
			      "holiday_sprite_limit_lottery.dets", set,
			      #recruit_limit.key, undefined]},
	    #merge_table{table =
			     <<"holiday_term_begins_boss.dets">>,
			 name = <<"开学季BOSS">>, dao = merge_dets,
			 columns =
			     [holiday_term_begins_boss,
			      "holiday_term_begins_boss.dets", set,
			      #holiday_term_begins_boss.id, undefined]},
	    #merge_table{table = <<"term_begins_role.dets">>,
			 name = <<"开学季BOSS">>, dao = merge_dets,
			 columns =
			     [term_begins_role, "term_begins_role.dets", set,
			      #holiday_term_begins_boss_rank_role.r_id,
			      undefined]},
	    #merge_table{table = <<"term_begins_paper.dets">>,
			 name = <<"开学季BOSS">>, dao = merge_dets,
			 columns =
			     [term_begins_paper, "term_begins_paper.dets", set,
			      1, undefined]},
	    #merge_table{table = <<"monopoly_dungeons.dets">>,
			 name = <<"圣夜奇境boss">>, dao = merge_dets,
			 columns =
			     [monopoly_dungeons, "monopoly_dungeons.dets", set,
			      #monopoly_dungeons.id, undefined]},
	    #merge_table{table =
			     <<"monopoly_dungeons_guild_rank.dets">>,
			 name = <<"圣夜奇境boss公会排行榜">>, dao = merge_dets,
			 columns =
			     [monopoly_dungeons_guild_rank,
			      "monopoly_dungeons_guild_rank.dets", set,
			      #monopoly_dungeons_guild_rank.id,
			      fun monopoly_dungeons_guild_rank:merge_convert/1]},
	    #merge_table{table = <<"role_weekly_report.dets">>,
			 name = <<"周报数据">>, dao = merge_dets,
			 columns =
			     [role_weekly_report, "role_weekly_report.dets",
			      set, #role_weekly_report.rid, undefined]},
	    #merge_table{table =
			     <<"holiday_return_new_red_packet.dets">>,
			 name = <<"回归红包数据">>, dao = merge_dets_first,
			 columns =
			     [holiday_return_new_red_packet,
			      "holiday_return_new_red_packet.dets", set,
			      #petard_red_packet.id, undefined]},
	    #merge_table{table =
			     <<"holiday_return_new_exchage_item.dets">>,
			 name = <<"获得兑换道具数量">>, dao = merge_dets,
			 columns =
			     [holiday_return_new_exchage_item,
			      "holiday_return_new_exchage_item.dets", set, 1,
			      undefined]},
	    #merge_table{table = <<"role_carnival_share.dets">>,
			 name = <<"嘉年华数据">>, dao = merge_dets,
			 columns =
			     [role_carnival_share, "role_carnival_share.dets",
			      set, 1, undefined]},
	    #merge_table{table = <<"holiday_lucky_dog_info.dets">>,
			 name = <<"新春锦鲤数据">>, dao = merge_dets_first,
			 columns =
			     [holiday_lucky_dog_info,
			      "holiday_lucky_dog_info.dets", set,
			      #holiday_lucky_dog_info.camp_id, undefined]},
	    #merge_table{table = <<"feedback_log.dets">>,
			 name = <<"客服反馈数据">>, dao = merge_dets,
			 columns =
			     [feedback_log, "feedback_log.dets", duplicate_bag,
			      #role_feedback_info.role_id, undefined]},
	    #merge_table{table = <<"feedback_do_submit.dets">>,
			 name = <<"客服反馈待上传数据">>, dao = merge_dets,
			 columns =
			     [feedback_do_submit, "feedback_do_submit.dets",
			      set, 1, undefined]}],
    {ok, List}.


