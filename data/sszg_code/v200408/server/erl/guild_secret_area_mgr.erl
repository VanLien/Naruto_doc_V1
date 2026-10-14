-file("src/mod/guild_secret_area/guild_secret_area_m"
      "gr.erl",
      1).

-module(guild_secret_area_mgr).

-lager_records([{map_role,
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
		{guild_marketplace,
		 [ver, id, next_booth_id, item_list, board_list]},
		{market_board,
		 [ver, type, name, operation, reward_list, unixtime]},
		{market_item,
		 [ver, id, base_id, num, attr, extra, holy_eqm_attr,
		  end_time, score]},
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
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
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
		{state, [timer]}]).

-behaviour(gen_server).

-export([get_guild_secret_boss/1, get_guild_secret/1,
	 update_guild_secret/1, gm_reset_boss/1,
	 gm_change_boss_id/2, gm_count/1, gm_put_into/3,
	 lookup_all_secret/0, gm_put_into_item/3]).

-export([call_apply/1, apply/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state, {timer = []  :: list()}).

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

-file("src/mod/guild_secret_area/guild_secret_area_m"
      "gr.erl",
      27).

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

-file("src/mod/guild_secret_area/guild_secret_area_m"
      "gr.erl",
      28).

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

-file("src/mod/guild_secret_area/guild_secret_area_m"
      "gr.erl",
      29).

-file("inc/combat.hrl", 1).

-file("inc/common.hrl", 1).

-file("inc/combat.hrl", 13).

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

-file("src/mod/guild_secret_area/guild_secret_area_m"
      "gr.erl",
      30).

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

-file("src/mod/guild_secret_area/guild_secret_area_m"
      "gr.erl",
      31).

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

-file("src/mod/guild_secret_area/guild_secret_area_m"
      "gr.erl",
      32).

lookup_all_secret() ->
    AllSecretList = ets:tab2list(guild_secret_area),
    output_message(AllSecretList),
    ok.

output_message([]) -> ok;
output_message([#guild_secret_area{id = Gid,
				   boss_list = BossList}
		| Rest]) ->
    case guild_lib:info(by_id, Gid) of
      {ok,
       #guild{name = Name, vitality = Vitality, lev = Lev,
	      members_num = Num, members = Members}} ->
	  Now = date:unixtime(),
	  LastTime = Now - 3 * 86400,
	  OnlineMember = length([1
				 || #guild_member{login_time = LoginTime}
					<- Members,
				    LoginTime >= LastTime]),
	  P = sys_env:get(platform),
	  Z = sys_env:get(zone_id),
	  io:format("~ts",
		    [io_lib:format("平台:~ts   区号:~w     公会:~ts    公会等级:~w "
				   "   总人数:~w        活跃人数:~w          BossID列表：~w "
				   "        活跃度:~w~n",
				   [P, Z, Name, Lev, Num, OnlineMember,
				    BossList, Vitality])]),
	  output_message(Rest);
      _ -> output_message(Rest)
    end.

gm_put_into(_, Time, _) when Time =< 0 -> ok;
gm_put_into(BossId, Time,
	    Role = #role{name = Name,
			 guild_bag = #guild_bag{id = Gid}}) ->
    case guild_marketplace:get_guild_marketplace_pid(Gid) of
      {ok, Pid} ->
	  case
	    guild_secret_area_data:get_marketplace_reward(BossId)
	      of
	    {RewardList, RandRewardList}
		when is_list(RewardList), is_list(RandRewardList) ->
		RewardNum =
		    guild_secret_area_data:get_const(treasure_item_amount),
		NewRandRewardList = util:rand_list_n(RandRewardList, 3,
						     RewardNum),
		{RandItemList, _PutItemList} =
		    make_rand_item_list(NewRandRewardList, [], []),
		guild_marketplace:info(Pid,
				       {put_into_market, 1, Name,
					RandItemList}),
		gm_put_into(BossId, Time - 1, Role);
	    _ -> ok
	  end;
      _ -> ok
    end.

gm_put_into_item(BaseId, Num,
		 #role{name = Name, guild_bag = #guild_bag{id = Gid}}) ->
    case guild_marketplace:get_guild_marketplace_pid(Gid) of
      {ok, Pid} ->
	  {RandItemList, _PutItemList} =
	      make_rand_item_list([{BaseId, Num, 1}], [], []),
	  guild_marketplace:info(Pid,
				 {put_into_market, 1, Name, RandItemList}),
	  ok;
      _ -> ok
    end.

gm_count(#role{guild_bag = #guild_bag{id = Gid}}) ->
    info({gm_count, Gid}).

gm_change_boss_id(BossId,
		  Role = #role{guild_bag = #guild_bag{id = Gid}}) ->
    case get_guild_secret(Gid) of
      SA = #guild_secret_area{boss_list = BossList} ->
	  PassId = guild_secret_area_data:get_pass_id(BossId),
	  SameId = [Id
		    || Id <- BossList,
		       guild_secret_area_data:get_pass_id(Id) =:= PassId],
	  NewBossList = BossList -- SameId,
	  NewSA = SA#guild_secret_area{boss_list =
					   [BossId | NewBossList]},
	  update_guild_secret(NewSA),
	  guild_secret_area_lib:push(26800, Role);
      _ -> ok
    end.

gm_reset_boss(Role = #role{guild_bag =
			       #guild_bag{id = Gid}}) ->
    case get_guild_secret(Gid) of
      SA = #guild_secret_area{} ->
	  NewSA = SA#guild_secret_area{boss_detail =
					   #boss_detail{},
				       last_crusade = 0},
	  update_guild_secret(NewSA),
	  guild_secret_area_lib:push(26800, Role);
      _ -> ok
    end.

-spec
     get_guild_secret_boss(pos_integer()) -> #boss_detail{}.

get_guild_secret_boss(Id) ->
    case catch ets:lookup(guild_secret_area, Id) of
      [#guild_secret_area{boss_detail = Boss}] -> Boss;
      _ -> #boss_detail{}
    end.

-spec
     get_guild_secret(pos_integer()) -> #guild_secret_area{}.

get_guild_secret(Id) ->
    case catch ets:lookup(guild_secret_area, Id) of
      [SA = #guild_secret_area{}] -> SA;
      _ -> #guild_secret_area{}
    end.

-spec update_guild_secret(pos_integer()) -> ok.

update_guild_secret(Data) ->
    ets:insert(guild_secret_area, Data),
    dets:insert(guild_secret_area, Data).

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> guild_secret_area_mgr ! Info.

cast(Info) ->
    gen_server:cast(guild_secret_area_mgr, Info).

call(Info) ->
    case catch gen_server:call(guild_secret_area_mgr, Info,
			       10000)
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
	    {__Pidguild_secret_area_mgr163, _,
	     {__Levelguild_secret_area_mgr163,
	      __Tracesguild_secret_area_mgr163}}
		when __Levelguild_secret_area_mgr163 band 8 /= 0 orelse
		       __Tracesguild_secret_area_mgr163 /= [] ->
		lager:do_log(error,
			     [{module, guild_secret_area_mgr}, {function, call},
			      {line, 163}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [guild_secret_area_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelguild_secret_area_mgr163,
			     __Tracesguild_secret_area_mgr163, lager_event,
			     __Pidguild_secret_area_mgr163);
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

start_link() ->
    gen_server:start_link({local, guild_secret_area_mgr},
			  guild_secret_area_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_secret_area_mgr169, _,
       {__Levelguild_secret_area_mgr169,
	__Tracesguild_secret_area_mgr169}}
	  when __Levelguild_secret_area_mgr169 band 64 /= 0 orelse
		 __Tracesguild_secret_area_mgr169 /= [] ->
	  lager:do_log(info,
		       [{module, guild_secret_area_mgr}, {function, init},
			{line, 169}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [guild_secret_area_mgr]),
		       none, 4096, 64, __Levelguild_secret_area_mgr169,
		       __Tracesguild_secret_area_mgr169, lager_event,
		       __Pidguild_secret_area_mgr169);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(guild_secret_area,
		   [{file, "./dets/guild_secret_area.dets"},
		    {keypos, #guild_secret_area.id}]),
    ets:new(guild_secret_area,
	    [set, named_table, public,
	     {keypos, #guild_secret_area.id}]),
    load_data(),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_secret_area_mgr176, _,
       {__Levelguild_secret_area_mgr176,
	__Tracesguild_secret_area_mgr176}}
	  when __Levelguild_secret_area_mgr176 band 64 /= 0 orelse
		 __Tracesguild_secret_area_mgr176 /= [] ->
	  lager:do_log(info,
		       [{module, guild_secret_area_mgr}, {function, init},
			{line, 176}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [guild_secret_area_mgr]),
		       none, 4096, 64, __Levelguild_secret_area_mgr176,
		       __Tracesguild_secret_area_mgr176, lager_event,
		       __Pidguild_secret_area_mgr176);
      _ -> ok
    end,
    {ok, State}.

handle_call({update_guild_secret, Gid, BossId, LiveTime,
	     LossNum},
	    _From, State) ->
    GuildSecret = #guild_secret_area{boss_list = BossList,
				     boss_detail =
					 #boss_detail{hp = Hp,
						      count_time = CountTime},
				     number = Number,
				     last_crusade = LastCrusade} =
		      get_guild_secret(Gid),
    Now = date:unixtime(),
    IsSameDay = date:is_same_day(CountTime, Now),
    LastSecond = date:diff(second, Now, LastCrusade),
    NeedSecond =
	guild_secret_area_data:get_const(boss_reset_interval),
    {Reply, NewState} = case lists:member(BossId, BossList)
			    of
			  true when Hp > 0 andalso CountTime =:= 0 ->
			      {{false, lang:get(<<"讨伐其它Boss中"/utf8>>)}, State};
			  true when LastSecond < NeedSecond ->
			      LastHour = (NeedSecond - LastSecond) div 3600,
			      {{false,
				util:fbin(lang:get(<<"距离Boss重置还有~w小时"/utf8>>),
					  [LastHour])},
			       State};
			  true when IsSameDay =:= true ->
			      {{false, lang:get(<<"讨伐已经结束了~，请明天再来吧~"/utf8>>)},
			       State};
			  true ->
			      case guild:apply(sync, Gid,
					       {guild_secret_area_lib,
						loss_vitality, [LossNum]})
				  of
				ok ->
				    NewNumber = Number + 1,
				    NewHp =
					unit_monster:get_boss_hp_max(BossId),
				    EndTime = Now + LiveTime,
				    BossDetail = #boss_detail{bid = BossId,
							      end_time =
								  EndTime,
							      hp = NewHp,
							      max_hp = NewHp},
				    NewGuildSecret =
					GuildSecret#guild_secret_area{boss_detail
									  =
									  BossDetail,
								      number =
									  NewNumber,
								      last_crusade
									  =
									  Now},
				    update_guild_secret(NewGuildSecret),
				    State1 = set_timer(Gid, NewNumber, LiveTime,
						       State),
				    guild_secret_area_rank:info({crusade,
								 BossId, Gid,
								 NewNumber}),
				    {{ok, NewNumber, EndTime, Now}, State1};
				{false, Reason} -> {{false, Reason}, State};
				_ ->
				    {{false, lang:get(<<"公会活跃度扣除失败"/utf8>>)},
				     State}
			      end;
			  _ -> {{false, lang:get(<<"不能讨伐该Boss"/utf8>>)}, State}
			end,
    {reply, Reply, NewState};
handle_call({kill_boss, RoleGid, RoleNumber, Dps, RId,
	     Name, Lev, FaceId, AvatarBid, Power, FaceUpdateTime,
	     FaceFile},
	    _From, State) ->
    GuildSecret = #guild_secret_area{number = Number,
				     boss_detail =
					 BossDetail = #boss_detail{hp = Hp,
								   count_time =
								       CountTime}} =
		      get_guild_secret(RoleGid),
    Reply = case RoleNumber =:= Number of
	      true when CountTime > 0 ->
		  {false, lang:get(<<"该Boss已结算"/utf8>>)};
	      true when Hp =:= 0 ->
		  guild_secret_area_rank:info({in_rank, RoleGid,
					       RoleNumber, RId, Dps, Name, Lev,
					       FaceId, AvatarBid, Power,
					       FaceUpdateTime, FaceFile}),
		  ok;
	      true when Dps >= Hp ->
		  Now = date:unixtime(),
		  NewBossDetail = BossDetail#boss_detail{hp = 0,
							 kill_time = Now},
		  NewGuildSecret =
		      GuildSecret#guild_secret_area{boss_detail =
							NewBossDetail},
		  update_guild_secret(NewGuildSecret),
		  guild_secret_area_rank:info({in_rank, RoleGid,
					       RoleNumber, RId, Dps, Name, Lev,
					       FaceId, AvatarBid, Power,
					       FaceUpdateTime, FaceFile}),
		  ok;
	      true ->
		  NewBossDetail = BossDetail#boss_detail{hp = Hp - Dps},
		  NewGuildSecret =
		      GuildSecret#guild_secret_area{boss_detail =
							NewBossDetail},
		  update_guild_secret(NewGuildSecret),
		  guild_secret_area_rank:info({in_rank, RoleGid,
					       RoleNumber, RId, Dps, Name, Lev,
					       FaceId, AvatarBid, Power,
					       FaceUpdateTime, FaceFile}),
		  ok;
	      _ -> {false, lang:get(<<"该Boss已经消失"/utf8>>)}
	    end,
    {reply, Reply, State};
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
	    {__Pidguild_secret_area_mgr255, _,
	     {__Levelguild_secret_area_mgr255,
	      __Tracesguild_secret_area_mgr255}}
		when __Levelguild_secret_area_mgr255 band 8 /= 0 orelse
		       __Tracesguild_secret_area_mgr255 /= [] ->
		lager:do_log(error,
			     [{module, guild_secret_area_mgr},
			      {function, handle_call}, {line, 255},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelguild_secret_area_mgr255,
			     __Tracesguild_secret_area_mgr255, lager_event,
			     __Pidguild_secret_area_mgr255);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    guild_secret_area_mgr, 256, _Reason}),
	  {reply, {false, lang:get(<<"执行出错"/utf8>>)}, State}
    end.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({init, Gid}, State) ->
    NewState = do_init(Gid, State), {noreply, NewState};
handle_info({delete_boss, Gid, Number},
	    State = #state{timer = TimerList}) ->
    GuildSecret = get_guild_secret(Gid),
    NewState = case check_delete_boss(Gid, Number,
				      TimerList, GuildSecret)
		   of
		 {ok, Ref} ->
		     do_count_over(GuildSecret),
		     erlang:cancel_timer(Ref),
		     NewTimerList = TimerList -- [{Gid, Ref}],
		     State1 = State#state{timer = NewTimerList},
		     State1;
		 _ -> State
	       end,
    {noreply, NewState};
handle_info({gm_count, Gid}, State) ->
    GuildSecret = get_guild_secret(Gid),
    do_count_over(GuildSecret),
    {noreply, State};
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
	    {__Pidguild_secret_area_mgr292, _,
	     {__Levelguild_secret_area_mgr292,
	      __Tracesguild_secret_area_mgr292}}
		when __Levelguild_secret_area_mgr292 band 8 /= 0 orelse
		       __Tracesguild_secret_area_mgr292 /= [] ->
		lager:do_log(error,
			     [{module, guild_secret_area_mgr},
			      {function, handle_info}, {line, 292},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelguild_secret_area_mgr292,
			     __Tracesguild_secret_area_mgr292, lager_event,
			     __Pidguild_secret_area_mgr292);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    guild_secret_area_mgr, 293, _Reason}),
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
      {__Pidguild_secret_area_mgr299, _,
       {__Levelguild_secret_area_mgr299,
	__Tracesguild_secret_area_mgr299}}
	  when __Levelguild_secret_area_mgr299 band 64 /= 0 orelse
		 __Tracesguild_secret_area_mgr299 /= [] ->
	  lager:do_log(info,
		       [{module, guild_secret_area_mgr}, {function, terminate},
			{line, 299}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelguild_secret_area_mgr299,
		       __Tracesguild_secret_area_mgr299, lager_event,
		       __Pidguild_secret_area_mgr299);
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
	    {__Pidguild_secret_area_mgr311, _,
	     {__Levelguild_secret_area_mgr311,
	      __Tracesguild_secret_area_mgr311}}
		when __Levelguild_secret_area_mgr311 band 8 /= 0 orelse
		       __Tracesguild_secret_area_mgr311 /= [] ->
		lager:do_log(error,
			     [{module, guild_secret_area_mgr},
			      {function, do_handle_call}, {line, 311},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelguild_secret_area_mgr311,
			     __Tracesguild_secret_area_mgr311, lager_event,
			     __Pidguild_secret_area_mgr311);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    guild_secret_area_mgr, 312, _Reason}),
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
	    {__Pidguild_secret_area_mgr325, _,
	     {__Levelguild_secret_area_mgr325,
	      __Tracesguild_secret_area_mgr325}}
		when __Levelguild_secret_area_mgr325 band 8 /= 0 orelse
		       __Tracesguild_secret_area_mgr325 /= [] ->
		lager:do_log(error,
			     [{module, guild_secret_area_mgr},
			      {function, do_handle_info}, {line, 325},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelguild_secret_area_mgr325,
			     __Tracesguild_secret_area_mgr325, lager_event,
			     __Pidguild_secret_area_mgr325);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    guild_secret_area_mgr, 326, _Reason}),
	  {noreply, State}
    end;
do_handle_info(_Info, State) -> {noreply, State}.

do_init([], State) -> State;
do_init([#guild{id = Gid} | Rest], State) ->
    NewState = do_init(Gid, State), do_init(Rest, NewState);
do_init(Gid, State) when is_tuple(Gid) ->
    NewState = case catch ets:lookup(guild_secret_area, Gid)
		   of
		 [] ->
		     BossList =
			 guild_secret_area_data:get_const(guild_secret_init_boss),
		     Data = #guild_secret_area{id = Gid,
					       boss_list = BossList},
		     update_guild_secret(Data),
		     State;
		 _ -> init_timer(Gid, State)
	       end,
    NewState;
do_init(_, State) -> State.

set_timer(Gid, Number, LastTime,
	  State = #state{timer = TimerList}) ->
    Ref = erlang:send_after(LastTime * 1000, self(),
			    {delete_boss, Gid, Number}),
    NewTimerList = lists:keystore(Gid, 1, TimerList,
				  {Gid, Ref}),
    NewState = State#state{timer = NewTimerList},
    NewState.

do_count_over(#guild_secret_area{boss_detail =
				     #boss_detail{count_time = CountTime}})
    when CountTime > 0 ->
    ok;
do_count_over(GuildSecret = #guild_secret_area{id = Gid,
					       boss_list = BossList,
					       fail_boss_list = FailBossList,
					       boss_detail =
						   BossDetail = #boss_detail{hp
										 =
										 Hp,
									     bid
										 =
										 BossId,
									     end_time
										 =
										 EndTime,
									     kill_time
										 =
										 KillTime}})
    when Hp =< 0 ->
    PutItemList = put_into_market(Gid, BossId),
    guild_secret_area_rank:info({count_over, Gid, BossId,
				 KillTime, PutItemList, 1, EndTime}),
    NewBossList = adjust_difficulty(Gid, BossList, BossId),
    NewFailBossList = delete_fail_boss(FailBossList,
				       BossId),
    NewGuildSecret =
	GuildSecret#guild_secret_area{boss_detail =
					  BossDetail#boss_detail{count_time =
								     EndTime},
				      boss_list = NewBossList,
				      fail_boss_list = NewFailBossList},
    update_guild_secret(NewGuildSecret),
    ok;
do_count_over(GuildSecret = #guild_secret_area{id = Gid,
					       boss_list = BossList,
					       fail_boss_list = FailBossList,
					       boss_detail =
						   BossDetail = #boss_detail{bid
										 =
										 BossId,
									     end_time
										 =
										 EndTime}}) ->
    guild_secret_area_rank:info({count_over, Gid, BossId,
				 EndTime, [], 0, EndTime}),
    {NewFailBossList, NewBossList} =
	adjust_fail_difficulty(Gid, FailBossList, BossList,
			       BossId),
    NewGuildSecret =
	GuildSecret#guild_secret_area{boss_detail =
					  BossDetail#boss_detail{count_time =
								     EndTime},
				      boss_list = NewBossList,
				      fail_boss_list = NewFailBossList},
    update_guild_secret(NewGuildSecret),
    ok.

delete_fail_boss(FailBossList, BossId) ->
    case lists:member(BossId, FailBossList) of
      true ->
	  NewFailBossList = lists:delete(BossId, FailBossList),
	  NewFailBossList;
      _ -> FailBossList
    end.

adjust_fail_difficulty(Gid, FailBossList, BossList,
		       BossId) ->
    case lists:member(BossId, FailBossList) of
      true ->
	  case guild_secret_area_data:get_boss_difficulty(BossId -
							    1)
	      of
	    List when is_list(List) ->
		BossList1 = lists:delete(BossId, BossList),
		NewBossList = [BossId - 1 | BossList1],
		NewFailBossList = lists:delete(BossId, FailBossList),
		{NewFailBossList, NewBossList};
	    _ ->
		NewFailBossList = lists:delete(BossId, FailBossList),
		{NewFailBossList, BossList}
	  end;
      _ ->
	  NewBossList = adjust_difficulty(Gid, BossList, BossId),
	  case NewBossList =:= BossList of
	    true ->
		NewFailBossList = [BossId | FailBossList],
		{NewFailBossList, BossList};
	    _ -> {FailBossList, NewBossList}
	  end
    end.

adjust_difficulty(Gid, BossList, BossId) ->
    case
      guild_secret_area_rank:get_guild_secret_dps_list(Gid,
						       BossId)
	of
      DpsList when is_list(DpsList) ->
	  case guild_lib:elem(Gid, #guild.members) of
	    {ok, Members = [_ | _]} ->
		AllDps = filtrate_dps(BossId, DpsList, Members, 0),
		case guild_secret_area_data:get_boss_difficulty(BossId)
		    of
		  [{Min, Max}] ->
		      if AllDps =< Min ->
			     case
			       guild_secret_area_data:get_boss_difficulty(BossId
									    - 1)
				 of
			       List when is_list(List) ->
				   BossList1 = lists:delete(BossId, BossList),
				   NewBossList = [BossId - 1 | BossList1],
				   NewBossList;
			       _ -> BossList
			     end;
			 AllDps >= Max ->
			     case
			       guild_secret_area_data:get_boss_difficulty(BossId
									    + 1)
				 of
			       List when is_list(List) ->
				   BossList1 = lists:delete(BossId, BossList),
				   NewBossList = [BossId + 1 | BossList1],
				   NewBossList;
			       _ -> BossList
			     end;
			 true -> BossList
		      end;
		  _ -> BossList
		end;
	    _ -> BossList
	  end;
      _ -> BossList
    end.

filtrate_dps(_, _, [], OldAllDps) -> OldAllDps;
filtrate_dps(BossId, DpsList,
	     [#guild_member{id = Id, login_time = _LastTime,
			    power = _Power}
	      | Rest],
	     OldAllDps) ->
    case lists:keyfind(Id, #role_rank.r_id, DpsList) of
      #role_rank{dps = AllDps} ->
	  NewAllDps = AllDps + OldAllDps,
	  filtrate_dps(BossId, DpsList, Rest, NewAllDps);
      _ -> filtrate_dps(BossId, DpsList, Rest, OldAllDps)
    end;
filtrate_dps(_, _, _, OldAllDps) -> OldAllDps.

init_timer(Gid, State) ->
    GuildSecret = #guild_secret_area{boss_detail =
					 #boss_detail{bid = BossBid,
						      end_time = EndTime,
						      count_time = CountTime},
				     number = Number} =
		      get_guild_secret(Gid),
    Now = date:unixtime(),
    case BossBid > 0 of
      true when CountTime > 0 -> State;
      true when Now >= EndTime ->
	  do_count_over(GuildSecret), State;
      true ->
	  LastTime = max(0, EndTime - Now),
	  NewState = set_timer(Gid, Number, LastTime, State),
	  NewState;
      _ -> State
    end.

check_delete_boss(Gid, Number, TimerList,
		  #guild_secret_area{number = OldNumber,
				     boss_detail =
					 #boss_detail{end_time = EndTime,
						      count_time =
							  CountTime}}) ->
    Now = date:unixtime(),
    case lists:keyfind(Gid, 1, TimerList) of
      _ when CountTime > 0 -> false;
      _ when Number =/= OldNumber -> false;
      {Gid, Ref}
	  when is_reference(Ref) andalso Now >= EndTime ->
	  {ok, Ref};
      _ -> false
    end.

put_into_market(RoleGid, BossId) ->
    case
      guild_marketplace:get_guild_marketplace_pid(RoleGid)
	of
      {ok, Pid} ->
	  case
	    guild_secret_area_data:get_marketplace_reward(BossId)
	      of
	    {RewardList, RandRewardList}
		when is_list(RewardList), is_list(RandRewardList) ->
		RewardNum =
		    guild_secret_area_data:get_const(treasure_item_amount),
		NewRandRewardList = util:rand_list_n(RandRewardList, 3,
						     RewardNum),
		BossName = case
			     guild_secret_area_data:get_boss_name(BossId)
			       of
			     undefined -> lang:get(<<"冰霜巨龙"/utf8>>);
			     Name -> Name
			   end,
		{RandItemList, PutItemList} =
		    make_rand_item_list(NewRandRewardList, [], []),
		ItemList = make_item_list(RewardList, []),
		AllItemList = RandItemList ++ ItemList,
		guild_marketplace:info(Pid,
				       {put_into_market, 3, BossName,
					AllItemList}),
		AllPutItemList = RewardList ++ PutItemList,
		AllPutItemList;
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidguild_secret_area_mgr574, _,
		   {__Levelguild_secret_area_mgr574,
		    __Tracesguild_secret_area_mgr574}}
		      when __Levelguild_secret_area_mgr574 band 8 /= 0 orelse
			     __Tracesguild_secret_area_mgr574 /= [] ->
		      lager:do_log(error,
				   [{module, guild_secret_area_mgr},
				    {function, put_into_market}, {line, 574},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   "公会宝库物品配置错误", none, 4096, 8,
				   __Levelguild_secret_area_mgr574,
				   __Tracesguild_secret_area_mgr574,
				   lager_event, __Pidguild_secret_area_mgr574);
		  _ -> ok
		end,
		[]
	  end;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_secret_area_mgr578, _,
	     {__Levelguild_secret_area_mgr578,
	      __Tracesguild_secret_area_mgr578}}
		when __Levelguild_secret_area_mgr578 band 8 /= 0 orelse
		       __Tracesguild_secret_area_mgr578 /= [] ->
		lager:do_log(error,
			     [{module, guild_secret_area_mgr},
			      {function, put_into_market}, {line, 578},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "找不到公会宝库", none, 4096, 8,
			     __Levelguild_secret_area_mgr578,
			     __Tracesguild_secret_area_mgr578, lager_event,
			     __Pidguild_secret_area_mgr578);
	    _ -> ok
	  end,
	  []
    end.

make_rand_item_list([], OldItemList, OldPutItemList) ->
    {OldItemList, OldPutItemList};
make_rand_item_list([{BaseId, Num, _} | Rest],
		    OldItemList, OldPutItemList) ->
    case item:make(BaseId, 0, Num) of
      {ok, [Item]} ->
	  make_rand_item_list(Rest, [{Item, Num} | OldItemList],
			      [{BaseId, Num} | OldPutItemList]);
      _ ->
	  make_rand_item_list(Rest, OldItemList, OldPutItemList)
    end;
make_rand_item_list(_, OldItemList, OldPutItemList) ->
    {OldItemList, OldPutItemList}.

make_item_list([], OldItemList) -> OldItemList;
make_item_list([{BaseId, Num} | Rest], OldItemList) ->
    case item:make(BaseId, 0, Num) of
      {ok, [Item]} ->
	  make_item_list(Rest, [{Item, Num} | OldItemList]);
      _ -> make_item_list(Rest, OldItemList)
    end;
make_item_list(_, OldItemList) -> OldItemList.

load_data() ->
    case dets:first(guild_secret_area) of
      '$end_of_table' ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_secret_area_mgr613, _,
	     {__Levelguild_secret_area_mgr613,
	      __Tracesguild_secret_area_mgr613}}
		when __Levelguild_secret_area_mgr613 band 64 /= 0 orelse
		       __Tracesguild_secret_area_mgr613 /= [] ->
		lager:do_log(info,
			     [{module, guild_secret_area_mgr},
			      {function, load_data}, {line, 613},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "没有数据需要加载", none, 4096, 64,
			     __Levelguild_secret_area_mgr613,
			     __Tracesguild_secret_area_mgr613, lager_event,
			     __Pidguild_secret_area_mgr613);
	    _ -> ok
	  end,
	  [];
      _ ->
	  dets:traverse(guild_secret_area,
			fun (C) ->
				case guild_secret_area_ver:do(C) of
				  {false, Reason} ->
				      case {whereis(lager_event),
					    whereis(lager_event),
					    lager_config:get({lager_event,
							      loglevel},
							     {0, []})}
					  of
					{undefined, undefined, _} ->
					    fun () -> {error, lager_not_running}
					    end();
					{undefined, _, _} ->
					    fun () ->
						    {error,
						     {sink_not_configured,
						      lager_event}}
					    end();
					{__Pidguild_secret_area_mgr620, _,
					 {__Levelguild_secret_area_mgr620,
					  __Tracesguild_secret_area_mgr620}}
					    when __Levelguild_secret_area_mgr620
						   band 8
						   /= 0
						   orelse
						   __Tracesguild_secret_area_mgr620
						     /= [] ->
					    lager:do_log(error,
							 [{module,
							   guild_secret_area_mgr},
							  {function, load_data},
							  {line, 620},
							  {pid,
							   pid_to_list(self())},
							  {node, node()}
							  | lager:md()],
							 io_lib:format("公会秘境数据转换失败:~w",
								       [Reason]),
							 none, 4096, 8,
							 __Levelguild_secret_area_mgr620,
							 __Tracesguild_secret_area_mgr620,
							 lager_event,
							 __Pidguild_secret_area_mgr620);
					_ -> ok
				      end,
				      {done, false};
				  {ok, NewC} ->
				      update_guild_secret(NewC), continue
				end
			end)
    end.


