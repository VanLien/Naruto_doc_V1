-file("src/mod/data/role_weekly_mgr.erl", 1).

-module(role_weekly_mgr).

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
		{rank_cfg,
		 [type, num, keys, min_val, nologin, zone, exit_rank]},
		{rank_rc,
		 [ver, id, idx, val1, val2, val3, rid, srv_id, name,
		  look_id, sex, lev, face_id, vip_lev, guild_name, power,
		  all_power, desc, looks, ext, time, is_cross, avatar_bid,
		  face_update_time, face_file]},
		{rank, [type, list, last_val, len, is_cross, ctime]},
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
		{state, []}]).

-behaviour(gen_server).

-export([call_apply/1, apply/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([get_rank/2, has_last_week_data/1,
	 get_last_week_data/1, get_data/1,
	 get_type_alive_num/1]).

-record(state, {}).

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

-file("src/mod/data/role_weekly_mgr.erl", 20).

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

-file("src/mod/data/role_weekly_mgr.erl", 21).

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

-file("src/mod/data/role_weekly_mgr.erl", 22).

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

-file("src/mod/data/role_weekly_mgr.erl", 23).

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

-file("src/mod/data/role_weekly_mgr.erl", 24).

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

-file("src/mod/data/role_weekly_mgr.erl", 25).

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

-file("src/mod/data/role_weekly_mgr.erl", 26).

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> role_weekly_mgr ! Info.

cast(Info) -> gen_server:cast(role_weekly_mgr, Info).

call(Info) ->
    case catch gen_server:call(role_weekly_mgr, Info, 10000)
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
	    {__Pidrole_weekly_mgr43, _,
	     {__Levelrole_weekly_mgr43, __Tracesrole_weekly_mgr43}}
		when __Levelrole_weekly_mgr43 band 8 /= 0 orelse
		       __Tracesrole_weekly_mgr43 /= [] ->
		lager:do_log(error,
			     [{module, role_weekly_mgr}, {function, call},
			      {line, 43}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [role_weekly_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelrole_weekly_mgr43,
			     __Tracesrole_weekly_mgr43, lager_event,
			     __Pidrole_weekly_mgr43);
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
    gen_server:start_link({local, role_weekly_mgr},
			  role_weekly_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_weekly_mgr49, _,
       {__Levelrole_weekly_mgr49, __Tracesrole_weekly_mgr49}}
	  when __Levelrole_weekly_mgr49 band 64 /= 0 orelse
		 __Tracesrole_weekly_mgr49 /= [] ->
	  lager:do_log(info,
		       [{module, role_weekly_mgr}, {function, init},
			{line, 49}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [role_weekly_mgr]), none,
		       4096, 64, __Levelrole_weekly_mgr49,
		       __Tracesrole_weekly_mgr49, lager_event,
		       __Pidrole_weekly_mgr49);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    d_ets_lib:new_d_ets(role_weekly_report,
			"dets/role_weekly_report.dets", #role_weekly_report.rid,
			set),
    d_ets_lib:load_dets_to_ets(role_weekly_report,
			       undefined),
    d_ets_lib:new_d_ets(role_carnival_share,
			"dets/role_carnival_share.dets", 1, set),
    d_ets_lib:load_dets_to_ets(role_carnival_share,
			       undefined),
    Now = date:unixtime(),
    NextTime = case sys_env:get(clear_weekly_data_time, 0)
		   of
		 Time when is_integer(Time) andalso Time > 0 -> Time;
		 _ ->
		     Time1 = Now + date:week_next_diff([1], {4, 0, 0}) +
			       util:rand(0, 600),
		     sys_env:save(clear_weekly_data_time, Time1),
		     Time1
	       end,
    util:set_timer(clear_data_timer, max(NextTime - Now, 1),
		   clear_data),
    NextTime1 = case sys_env:get(sync_weekly_report_time, 0)
		    of
		  Time3 when is_integer(Time3) andalso Time3 > 0 -> Time3;
		  _ ->
		      Time2 = Now + date:week_next_diff([1], {8, 0, 0}) +
				util:rand(0, 600),
		      sys_env:save(sync_weekly_report_time, Time2),
		      Time2
		end,
    util:set_timer(sync_weekly_report_timer,
		   max(NextTime1 - Now, 1), sync_weekly_report),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_weekly_mgr85, _,
       {__Levelrole_weekly_mgr85, __Tracesrole_weekly_mgr85}}
	  when __Levelrole_weekly_mgr85 band 64 /= 0 orelse
		 __Tracesrole_weekly_mgr85 /= [] ->
	  lager:do_log(info,
		       [{module, role_weekly_mgr}, {function, init},
			{line, 85}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [role_weekly_mgr]), none,
		       4096, 64, __Levelrole_weekly_mgr85,
		       __Tracesrole_weekly_mgr85, lager_event,
		       __Pidrole_weekly_mgr85);
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
	    {__Pidrole_weekly_mgr93, _,
	     {__Levelrole_weekly_mgr93, __Tracesrole_weekly_mgr93}}
		when __Levelrole_weekly_mgr93 band 8 /= 0 orelse
		       __Tracesrole_weekly_mgr93 /= [] ->
		lager:do_log(error,
			     [{module, role_weekly_mgr},
			      {function, handle_call}, {line, 93},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelrole_weekly_mgr93,
			     __Tracesrole_weekly_mgr93, lager_event,
			     __Pidrole_weekly_mgr93);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    role_weekly_mgr, 94, _Reason}),
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
	    {__Pidrole_weekly_mgr106, _,
	     {__Levelrole_weekly_mgr106, __Tracesrole_weekly_mgr106}}
		when __Levelrole_weekly_mgr106 band 8 /= 0 orelse
		       __Tracesrole_weekly_mgr106 /= [] ->
		lager:do_log(error,
			     [{module, role_weekly_mgr},
			      {function, handle_info}, {line, 106},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelrole_weekly_mgr106,
			     __Tracesrole_weekly_mgr106, lager_event,
			     __Pidrole_weekly_mgr106);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    role_weekly_mgr, 107, _Reason}),
	  {noreply, State}
    end.

terminate(_Reason, _State) ->
    dets:insert(role_weekly_report,
		ets:tab2list(role_weekly_report)),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_weekly_mgr113, _,
       {__Levelrole_weekly_mgr113, __Tracesrole_weekly_mgr113}}
	  when __Levelrole_weekly_mgr113 band 64 /= 0 orelse
		 __Tracesrole_weekly_mgr113 /= [] ->
	  lager:do_log(info,
		       [{module, role_weekly_mgr}, {function, terminate},
			{line, 113}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelrole_weekly_mgr113,
		       __Tracesrole_weekly_mgr113, lager_event,
		       __Pidrole_weekly_mgr113);
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
	    {__Pidrole_weekly_mgr125, _,
	     {__Levelrole_weekly_mgr125, __Tracesrole_weekly_mgr125}}
		when __Levelrole_weekly_mgr125 band 8 /= 0 orelse
		       __Tracesrole_weekly_mgr125 /= [] ->
		lager:do_log(error,
			     [{module, role_weekly_mgr},
			      {function, do_handle_call}, {line, 125},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelrole_weekly_mgr125,
			     __Tracesrole_weekly_mgr125, lager_event,
			     __Pidrole_weekly_mgr125);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    role_weekly_mgr, 126, _Reason}),
	  {reply, {false, lang:get(<<"执行错误"/utf8>>)}, State}
    end;
do_handle_call({get_role_weekly, RoleId}, _From,
	       State) ->
    Reply = role_weekly_lib:get_weekly_data(RoleId),
    {reply, Reply, State};
do_handle_call({send_weekly_share_award, RoleId}, _From,
	       State) ->
    Reply = role_weekly_lib:send_weekly_share_award(RoleId),
    {reply, Reply, State};
do_handle_call({send_carnival_share_award, RoleId},
	       _From, State) ->
    case holiday_lib:get_open_holiday([3043, 93043, 993043])
	of
      #holiday{reward = [ShareAward, _]} ->
	  case ets:lookup(role_carnival_share, RoleId) of
	    [_ | _] -> {reply, {false, <<"奖励已领取"/utf8>>}, State};
	    _ ->
		{MailAssets, MailItems} =
		    format:split_assets_items(ShareAward),
		Mail = {lang:get(<<"【Thời gian phiêu lưu】分享好礼"/utf8>>),
			lang:get(<<"Nhẫn giả đại nhân, đây là ngài chia "
				   "sẻ 【 Thời gian phiêu lưu 】 Hoạt động "
				   "thu hoạch được ban thưởng, mời kiểm "
				   "tra và nhận！"/utf8>>),
			MailAssets, MailItems,
			<<"【 Thời gian phiêu lưu 】 Chia sẻ nhận "
			  "quà"/utf8>>},
		mail:send(RoleId, Mail),
		Now = date:unixtime(),
		ets:insert(role_carnival_share, {RoleId, Now}),
		dets:insert(role_carnival_share, {RoleId, Now}),
		{reply, ok, State}
	  end;
      _ -> {reply, {false, <<"活动未开启"/utf8>>}, State}
    end;
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_info(clear_data, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_weekly_mgr161, _,
       {__Levelrole_weekly_mgr161, __Tracesrole_weekly_mgr161}}
	  when __Levelrole_weekly_mgr161 band 64 /= 0 orelse
		 __Tracesrole_weekly_mgr161 /= [] ->
	  lager:do_log(info,
		       [{module, role_weekly_mgr}, {function, do_handle_info},
			{line, 161}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("上上周周报数据清理:~w",
				     [ets:info(role_weekly_report, size)]),
		       none, 4096, 64, __Levelrole_weekly_mgr161,
		       __Tracesrole_weekly_mgr161, lager_event,
		       __Pidrole_weekly_mgr161);
      _ -> ok
    end,
    Now = date:unixtime(),
    Fun = fun (Report = #role_weekly_report{end_time =
						EndTime},
	       Acc) ->
		  case Now - EndTime > 86400 * 7 of
		    true -> Acc;
		    _ -> [Report | Acc]
		  end
	  end,
    NewList = ets:foldl(Fun, [], role_weekly_report),
    d_ets_lib:clear_d_ets(role_weekly_report),
    d_ets_lib:save_d_ets(role_weekly_report, NewList),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_weekly_mgr174, _,
       {__Levelrole_weekly_mgr174, __Tracesrole_weekly_mgr174}}
	  when __Levelrole_weekly_mgr174 band 64 /= 0 orelse
		 __Tracesrole_weekly_mgr174 /= [] ->
	  lager:do_log(info,
		       [{module, role_weekly_mgr}, {function, do_handle_info},
			{line, 174}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("上上周周报数据清理后:~w",
				     [ets:info(role_weekly_report, size)]),
		       none, 4096, 64, __Levelrole_weekly_mgr174,
		       __Tracesrole_weekly_mgr174, lager_event,
		       __Pidrole_weekly_mgr174);
      _ -> ok
    end,
    NextTime = Now + date:week_next_diff([1], {4, 0, 0}) +
		 util:rand(0, 600),
    sys_env:save(clear_weekly_data_time, NextTime),
    util:set_timer(clear_data_timer, max(NextTime - Now, 1),
		   clear_data),
    {noreply, State};
do_handle_info(sync_weekly_report, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_weekly_mgr180, _,
       {__Levelrole_weekly_mgr180, __Tracesrole_weekly_mgr180}}
	  when __Levelrole_weekly_mgr180 band 64 /= 0 orelse
		 __Tracesrole_weekly_mgr180 /= [] ->
	  lager:do_log(info,
		       [{module, role_weekly_mgr}, {function, do_handle_info},
			{line, 180}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始计算周报标签，12:15:00推送周报邮件", none, 4096, 64,
		       __Levelrole_weekly_mgr180, __Tracesrole_weekly_mgr180,
		       lager_event, __Pidrole_weekly_mgr180);
      _ -> ok
    end,
    Now = date:unixtime(),
    Fun = fun (Report = #role_weekly_report{end_time =
						EndTime},
	       Acc)
		  when Now - EndTime < 86400 andalso Now - EndTime > 0 ->
		  Taglist = role_weekly_lib:get_tag_list(Report,
							 role_weekly_data:tag_list(),
							 []),
		  NReport = Report#role_weekly_report{tag_list = Taglist},
		  [NReport | Acc];
	      (_Report, Acc) -> Acc
	  end,
    NewList = ets:foldl(Fun, [], role_weekly_report),
    d_ets_lib:save_d_ets(role_weekly_report, NewList),
    sys_env:save(alive_num_list, []),
    MailTime = date:now_diff(today, {12, 15, 0}),
    util:set_timer(send_d250829fa522719fa0e5bb53d49d6865,
		   MailTime, {send_d250829fa522719fa0e5bb53d49d6865}),
    NextTime1 = Now + date:week_next_diff([1], {8, 0, 0}) +
		  util:rand(0, 600),
    sys_env:save(sync_weekly_report_time, NextTime1),
    util:set_timer(sync_weekly_report_timer,
		   max(NextTime1 - Now, 1), sync_weekly_report),
    {noreply, State};
do_handle_info({sync_role_data, RoleId, Partners,
		GetPartner, GetGold, GetRecruit, GetCrystal, SpriteList,
		SendPoint},
	       State) ->
    Data = #role_weekly_report{used_partners = OldPartners,
			       get_partner = OldGetPartner,
			       get_gold = OldGetGold,
			       get_high_recruit = OldGetRecruit,
			       get_crystal = OldGetCrystal,
			       get_sprite = OldSpriteList,
			       send_point = OldSendPoint} =
	       get_data(RoleId),
    NewData = Data#role_weekly_report{used_partners =
					  merge_partner_used(Partners,
							     OldPartners),
				      get_partner = OldGetPartner ++ GetPartner,
				      get_gold = OldGetGold + GetGold,
				      get_high_recruit =
					  OldGetRecruit + GetRecruit,
				      get_crystal = OldGetCrystal + GetCrystal,
				      get_sprite = OldSpriteList ++ SpriteList,
				      send_point = OldSendPoint + SendPoint},
    ets:insert(role_weekly_report, NewData),
    {noreply, State};
do_handle_info({time_sync_role_data, RoleId, Account,
		Name, Lev, FaceId, Power, RateRank, Channel,
		StarTowerRank, EndLessRank, PartnerInfos},
	       State) ->
    Data = get_data(RoleId),
    NewData = Data#role_weekly_report{account = Account,
				      name = Name, lev = Lev, face_id = FaceId,
				      power = Power,
				      star_tower_rank = StarTowerRank,
				      endless_rank = EndLessRank,
				      drama_rate = RateRank,
				      have_partners = PartnerInfos,
				      channel = Channel},
    ets:insert(role_weekly_report, NewData),
    {noreply, State};
do_handle_info({add_login_day, RoleId}, State) ->
    Data = #role_weekly_report{login_day = OldLoginDay} =
	       get_data(RoleId),
    NewData = Data#role_weekly_report{login_day =
					  OldLoginDay + 1},
    ets:insert(role_weekly_report, NewData),
    {noreply, State};
do_handle_info({add_acc_time, RoleId, Time}, State) ->
    Data = #role_weekly_report{acc_time = OldAccTime} =
	       get_data(RoleId),
    NewData = Data#role_weekly_report{acc_time =
					  OldAccTime + Time},
    ets:insert(role_weekly_report, NewData),
    {noreply, State};
do_handle_info({arena_elite_lev, RoleId, Lev}, State) ->
    Data = #role_weekly_report{arena_elite_lev = OldLev} =
	       get_data(RoleId),
    NewData = Data#role_weekly_report{arena_elite_lev =
					  max(OldLev, Lev)},
    ets:insert(role_weekly_report, NewData),
    {noreply, State};
do_handle_info({arena_cluster_rank, RoleId, Rank},
	       State) ->
    Data = #role_weekly_report{arena_cluster_rank =
				   OldRank} =
	       get_data(RoleId),
    NewData = Data#role_weekly_report{arena_cluster_rank =
					  util:if_true(OldRank =:= 0, Rank,
						       min(OldRank, Rank))},
    ets:insert(role_weekly_report, NewData),
    {noreply, State};
do_handle_info({arena_score, RoleId, Score}, State) ->
    Data = #role_weekly_report{arena_score = OldScore} =
	       get_data(RoleId),
    NewData = Data#role_weekly_report{arena_score =
					  max(OldScore, Score)},
    ets:insert(role_weekly_report, NewData),
    {noreply, State};
do_handle_info({sky_ladder_rank, RoleId, Rank},
	       State) ->
    Data = #role_weekly_report{sky_ladder_rank = OldRank} =
	       get_data(RoleId),
    NewData = Data#role_weekly_report{sky_ladder_rank =
					  util:if_true(OldRank =:= 0, Rank,
						       min(OldRank, Rank))},
    ets:insert(role_weekly_report, NewData),
    {noreply, State};
do_handle_info({cluster_champion_rank, RoleId, Rank},
	       State) ->
    Data = #role_weekly_report{cluster_champion_rank =
				   OldRank} =
	       get_data(RoleId),
    NewData = Data#role_weekly_report{cluster_champion_rank
					  =
					  util:if_true(OldRank =:= 0, Rank,
						       min(OldRank, Rank))},
    ets:insert(role_weekly_report, NewData),
    {noreply, State};
do_handle_info({arena_team_rank, RoleId, Rank},
	       State) ->
    Data = #role_weekly_report{arena_team_rank = OldRank} =
	       get_data(RoleId),
    NewData = Data#role_weekly_report{arena_team_rank =
					  util:if_true(OldRank =:= 0, Rank,
						       min(OldRank, Rank))},
    ets:insert(role_weekly_report, NewData),
    {noreply, State};
do_handle_info({element_rank, RoleId, Rank}, State) ->
    Data = #role_weekly_report{element_rank = OldRank} =
	       get_data(RoleId),
    NewData = Data#role_weekly_report{element_rank =
					  util:if_true(OldRank =:= 0, Rank,
						       min(OldRank, Rank))},
    ets:insert(role_weekly_report, NewData),
    {noreply, State};
do_handle_info({send_d250829fa522719fa0e5bb53d49d6865},
	       State) ->
    {noreply, State};
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
	    {__Pidrole_weekly_mgr283, _,
	     {__Levelrole_weekly_mgr283, __Tracesrole_weekly_mgr283}}
		when __Levelrole_weekly_mgr283 band 8 /= 0 orelse
		       __Tracesrole_weekly_mgr283 /= [] ->
		lager:do_log(error,
			     [{module, role_weekly_mgr},
			      {function, do_handle_info}, {line, 283},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelrole_weekly_mgr283,
			     __Tracesrole_weekly_mgr283, lager_event,
			     __Pidrole_weekly_mgr283);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    role_weekly_mgr, 284, _Reason}),
	  {noreply, State}
    end;
do_handle_info(_Info, State) -> {noreply, State}.

merge_partner_used([], Items) ->
    lists:reverse(lists:keysort(2, Items));
merge_partner_used([{Bid, Num} | T], Items) ->
    NewItems = case lists:keyfind(Bid, 1, Items) of
		 {_, Num1} ->
		     lists:keyreplace(Bid, 1, Items, {Bid, Num + Num1});
		 _ -> [{Bid, Num} | Items]
	       end,
    merge_partner_used(T, NewItems).

get_data(RoleId) ->
    Now = date:unixtime(),
    EndTime = case sys_env:get(weekly_this_week_time, 0) of
		Time when is_integer(Time) andalso Time >= Now -> Time;
		Time when is_integer(Time) ->
		    sys_env:save(weekly_last_week_time, Time),
		    NewEndTime = Now +
				   date:week_next_diff([7], {23, 59, 59}),
		    sys_env:save(weekly_this_week_time, NewEndTime),
		    NewEndTime;
		_ ->
		    NewEndTime = Now +
				   date:week_next_diff([7], {23, 59, 59}),
		    sys_env:save(weekly_this_week_time, NewEndTime),
		    NewEndTime
	      end,
    case ets:lookup(role_weekly_report, {RoleId, EndTime})
	of
      [Data = #role_weekly_report{}] -> Data;
      _ ->
	  #role_weekly_report{rid = {RoleId, EndTime},
			      end_time = EndTime}
    end.

has_last_week_data(RoleId) ->
    Now = date:unixtime(),
    EndTime = case sys_env:get(weekly_last_week_time, 0) of
		Time
		    when is_integer(Time) andalso
			   Time < Now andalso Time > 0 ->
		    Time;
		_ ->
		    NewEndTime = Now +
				   date:week_next_diff([7], {23, 59, 59})
				   - 86400 * 7,
		    sys_env:save(weekly_last_week_time, NewEndTime),
		    NewEndTime
	      end,
    ets:member(role_weekly_report, {RoleId, EndTime}).

get_last_week_data(RoleId) ->
    Now = date:unixtime(),
    EndTime = case sys_env:get(weekly_last_week_time, 0) of
		Time
		    when is_integer(Time) andalso
			   Time < Now andalso Time > 0 ->
		    Time;
		_ ->
		    NewEndTime = Now +
				   date:week_next_diff([7], {23, 59, 59})
				   - 86400 * 7,
		    sys_env:save(weekly_last_week_time, NewEndTime),
		    NewEndTime
	      end,
    case ets:lookup(role_weekly_report, {RoleId, EndTime})
	of
      [Data = #role_weekly_report{}] -> Data;
      _ -> {false, <<"找不到数据"/utf8>>}
    end.

get_rank(RoleId, Type) ->
    List = rank:list(Type),
    case lists:keyfind(RoleId, #rank_rc.id, List) of
      #rank_rc{idx = Idx} -> Idx;
      _ -> 0
    end.

get_type_alive_num(Type) ->
    List = sys_env:get(alive_num_list, []),
    case list_util:keyfind(Type, List, 0) of
      Val when is_integer(Val) andalso Val > 0 ->
	  max(role_weekly_data:get_const(limit_alive_num), Val);
      _ ->
	  MinLev = get_lev(Type),
	  AliveNum = max(get_alive_num(MinLev), 1),
	  NewList = lists:keystore(Type, 1, List,
				   {Type, AliveNum}),
	  sys_env:save(alive_num_list, NewList),
	  max(role_weekly_data:get_const(limit_alive_num),
	      AliveNum)
    end.

get_lev(arena_elite_lev) ->
    MinLev =
	arena_elite_data:get_constant(open_person_lev_limit),
    MinLev;
get_lev(arena_cluster_rank) ->
    MinLev = arena_cluster_data:get_const(lev_limt), MinLev;
get_lev(star_tower_rank) ->
    MinLev = list_util:keyfind(lev,
			       star_tower_data:get_constant(open_floor), 16),
    MinLev;
get_lev(arena_score) ->
    MinLev = arena_data:get_const(limit_lev), MinLev;
get_lev(endless_rank) ->
    MinLev = list_util:keyfind(lev,
			       endless_data:get_const(open_lev), 25),
    MinLev;
get_lev(sky_ladder_rank) ->
    MinLev = sky_ladder_data:get_const(join_min_lev),
    MinLev;
get_lev(cluster_champion_rank) ->
    MinLev = sky_ladder_data:get_const(join_min_lev),
    MinLev;
get_lev(arena_team_rank) ->
    MinLev = arena_team_data:get_const(open_lev), MinLev;
get_lev(element_rank) ->
    MinLev = element_temple_data:get_const(join_lev),
    MinLev;
get_lev(drama_rate) -> MinLev = 0, MinLev;
get_lev(_) -> 0.

get_alive_num(Lev) ->
    LimitDay =
	role_weekly_data:get_const(active_logout_day),
    LimitTime = date:unixtime() - 86400 * LimitDay,
    case db:get_one("select count(*) from role where lev "
		    ">= ? and (logout_time >= ? or login_time "
		    ">= ?)",
		    [Lev, LimitTime, LimitTime], 60000)
	of
      {ok, Num} -> Num;
      _ -> 0
    end.


