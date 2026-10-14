-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_db.erl",
      1).

-module(holiday_arena_team_db).

-lager_records([{formation_attr_data,
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
		{avatar_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{avatar_frame, [ver, base_id, expire_time]},
		{m_avatar, [ver, used, frames]},
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

-export([get_teammate_info/1, get_main_id/2,
	 get_team_role/1, get_role_list/1, has_team/1,
	 to_holiday_arena_team_role/1, rank_id/1,
	 get_main_srv_list/0, get_team_member_role/1,
	 update_join_list/2, get_join_list/1, get_role_log/1,
	 get_role_rank/1, get_rank_roles/0, get_rank_roles/1,
	 get_rank_roles/2]).

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

-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_db.erl",
      28).

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

-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_db.erl",
      29).

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

-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_db.erl",
      30).

-file("inc/avatar.hrl", 1).

-record(m_avatar, {ver = 1, used = 0, frames = []}).

-record(avatar_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(avatar_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_db.erl",
      31).

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

-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_db.erl",
      32).

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

-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_db.erl",
      33).

-spec get_teammate_info(role_id()) -> list().

get_teammate_info(RoleId) ->
    case ets:lookup(holiday_arena_role_team, RoleId) of
      [#holiday_arena_team_team{team_role_id = TeamRoleId,
				is_leader = IsLeader, pos = Pos}
       | _] ->
	  [{RoleId, IsLeader, Pos},
	   {TeamRoleId, util:if_true(IsLeader == 1, 0, 1),
	    util:if_true(Pos == 1, 2, 1)}];
      _ -> [{RoleId, 1, 1}]
    end.

-spec get_main_srv_list() -> list().

get_main_srv_list() ->
    case ets:lookup(holiday_arena_team_other, main_list) of
      [{_, L = [_ | _]} | _] -> L;
      _ -> [sys_lib:srv_id()]
    end.

-spec has_team(role_id()) -> false | role_id().

has_team(RoleId) ->
    case ets:lookup(holiday_arena_role_team, RoleId) of
      [#holiday_arena_team_team{team_role_id = TeamRoleId}
       | _] ->
	  TeamRoleId;
      _ -> false
    end.

-spec update_join_list(role_id(), term()) -> ok.

update_join_list(RoleId, {add, TarRoleId}) ->
    OldL = get_join_list(RoleId),
    NewL = [TarRoleId | lists:delete(TarRoleId, OldL)],
    ets:insert(holiday_arena_team_invite_join,
	       {RoleId, NewL});
update_join_list(RoleId, {del, TarRoleId}) ->
    OldL = get_join_list(RoleId),
    NewL = lists:delete(TarRoleId, OldL),
    ets:insert(holiday_arena_team_invite_join,
	       {RoleId, NewL}).

-spec get_join_list(role_id()) -> list().

get_join_list(RoleId) ->
    case ets:lookup(holiday_arena_team_invite_join, RoleId)
	of
      [{RoleId, L} | _] -> L;
      _ -> []
    end.

-spec
     get_role_log(role_id()) -> #role_holiday_arena_team_log{}.

get_role_log(RoleId) ->
    case ets:lookup(holiday_arena_team_log, RoleId) of
      [Data | _] -> Data;
      _ ->
	  case dets:lookup(holiday_arena_team_log, RoleId) of
	    [Data | _] ->
		ets:insert(holiday_arena_team_log, Data), Data;
	    _ ->
		Data = #role_holiday_arena_team_log{},
		ets:insert(holiday_arena_team_log, Data),
		Data
	  end
    end.

-spec
     get_cluster_team_role(role_id()) -> #holiday_arena_team_role{}.

get_cluster_team_role(RoleId = {_, Sid}) ->
    MainId = get_main_id(RoleId, 1),
    case catch cluster_lib:call(MainId, ets, lookup,
				[holiday_arena_team_role, RoleId])
	of
      [Data = #holiday_arena_team_role{}] -> Data;
      _ -> to_holiday_arena_team_role(RoleId)
    end.

-spec
     get_team_role(role_id()) -> #holiday_arena_team_role{}.

get_team_role(RoleId = {_, _}) ->
    case ets:lookup(holiday_arena_team_role, RoleId) of
      [Data = #holiday_arena_team_role{}] -> Data;
      _ -> get_cluster_team_role(RoleId)
    end;
get_team_role(_) -> false.

-spec get_team_member_role(role_id()) -> false |
					 #holiday_arena_team_role{}.

get_team_member_role(RoleId) ->
    case ets:lookup(holiday_arena_role_team, RoleId) of
      [#holiday_arena_team_team{team_role_id = TeamRoleId}
       | _] ->
	  get_team_role(TeamRoleId);
      _ -> false
    end.

-spec rank_id(pos_integer()) -> null | {ok, role_id()}.

rank_id(Rank) ->
    case ets:lookup(holiday_arena_team_rank, Rank) of
      [#holiday_arena_team_rank{id = Id}] -> {ok, Id};
      _ -> null
    end.

-spec get_role_rank(role_id()) -> pos_integer().

get_role_rank(RoleId) ->
    case get_team_role(RoleId) of
      #holiday_arena_team_role{rank = Rank} -> Rank;
      _ -> 0
    end.

-spec get_rank_roles(pos_integer()) -> list().

get_rank_roles(Num) -> get_rank_roles(1, Num).

get_rank_roles() -> get_rank_roles(1, 100).

get_rank_roles(StartNum, EndNum) when StartNum < 1 ->
    get_rank_roles(1, EndNum);
get_rank_roles(StartNum, EndNum) ->
    get_rank_roles(StartNum, EndNum, []).

get_rank_roles(StartNum, EndNum, L)
    when StartNum > EndNum ->
    L;
get_rank_roles(StartNum, EndNum, L) ->
    case ets:lookup(holiday_arena_team_rank, StartNum) of
      [#holiday_arena_team_rank{id = Id}] ->
	  case get_team_role(Id) of
	    Data = #holiday_arena_team_role{} ->
		get_rank_roles(StartNum + 1, EndNum,
			       [to_team_member(Data) | L]);
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_arena_team_db162, _,
		   {__Levelholiday_arena_team_db162,
		    __Tracesholiday_arena_team_db162}}
		      when __Levelholiday_arena_team_db162 band 8 /= 0 orelse
			     __Tracesholiday_arena_team_db162 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_arena_team_db},
				    {function, get_rank_roles}, {line, 162},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("组队竞技场找不到队友段位、积分信息:~w", [Id]),
				   none, 4096, 8,
				   __Levelholiday_arena_team_db162,
				   __Tracesholiday_arena_team_db162,
				   lager_event, __Pidholiday_arena_team_db162);
		  _ -> ok
		end,
		get_rank_roles(StartNum + 1, EndNum, L)
	  end;
      _ -> get_rank_roles(StartNum + 1, EndNum, L)
    end.

-spec get_role_list(list() | role_id()) -> list().

get_role_list(Ids) -> get_role_list(Ids, []).

get_role_list([], L) -> L;
get_role_list([Id | Ids], L) ->
    case get_team_role(Id) of
      Data = #holiday_arena_team_role{} ->
	  get_role_list(Ids, [to_team_member(Data) | L]);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_arena_team_db179, _,
	     {__Levelholiday_arena_team_db179,
	      __Tracesholiday_arena_team_db179}}
		when __Levelholiday_arena_team_db179 band 8 /= 0 orelse
		       __Tracesholiday_arena_team_db179 /= [] ->
		lager:do_log(error,
			     [{module, holiday_arena_team_db},
			      {function, get_role_list}, {line, 179},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("组队竞技场找不到队友段位、积分信息:~w", [Id]), none,
			     4096, 8, __Levelholiday_arena_team_db179,
			     __Tracesholiday_arena_team_db179, lager_event,
			     __Pidholiday_arena_team_db179);
	    _ -> ok
	  end,
	  get_role_list(Ids, L)
    end.

to_team_member(#holiday_arena_team_role{id = RoleId,
					name = Name, face_id = FaceId,
					team_power = TeamPower,
					avatar_bid = AvatarBid, lev = Lev,
					face_update_time = FaceUpdateTime,
					face_file = FaceFile,
					is_online = IsOnline, rank = Rank,
					score_lev = ScoreLev, score = Score}) ->
    {IsLeader, Pos} = case
			ets:lookup(holiday_arena_role_team, RoleId)
			  of
			[#holiday_arena_team_team{is_leader = IsLeaderT,
						  pos = PosT}
			 | _] ->
			    {IsLeaderT, PosT};
			_ -> {1, 1}
		      end,
    #holiday_arena_team_member{id = RoleId, name = Name,
			       face_id = FaceId, power = TeamPower,
			       avatar_bid = AvatarBid, lev = Lev, pos = Pos,
			       rank = Rank, score = Score, score_lev = ScoreLev,
			       face_update_time = FaceUpdateTime,
			       face_file = FaceFile, is_online = IsOnline,
			       is_leader = IsLeader}.

-spec get_main_id(role_id(), pos_integer()) -> binary().

get_main_id({_, Sid}, Period) ->
    get_main_id(Sid, Period);
get_main_id(Sid, Period) ->
    case ets:lookup(holiday_arena_team_main_ids,
		    {Sid, Period})
	of
      [{_, MainId} | _] -> MainId;
      _ ->
	  case catch cluster_lib:call(center, ets, lookup,
				      [c_holiday_arena_team_main_ids,
				       {Sid, Period}])
	      of
	    [{_, MainId}] ->
		ets:insert(holiday_arena_team_main_ids,
			   {{Sid, Period}, MainId}),
		MainId;
	    _ -> Sid
	  end
    end.

-spec to_holiday_arena_team_role(#role{} | role_id() |
				 #role_robot{}) -> #holiday_arena_team_role{}.

to_holiday_arena_team_role(Role = #role{m_avatar =
					    #m_avatar{used = AvatarId}}) ->
    TeamPower = formation:get_sys_formation_power(Role, 38),
    {_, FaceFile, FaceUpdateTime} =
	role_face:face_info(Role),
    #holiday_arena_team_role{id = Role#role.id,
			     name = Role#role.name, lev = Role#role.lev,
			     face_id = Role#role.face_id, avatar_bid = AvatarId,
			     power = Role#role.max_power,
			     team_power = TeamPower,
			     face_update_time = FaceUpdateTime,
			     face_file = FaceFile, is_online = 1};
to_holiday_arena_team_role(Role = #role_robot{avatar_bid
						  = AvatarId}) ->
    TeamPower = formation:get_sys_formation_power(Role, 38),
    {_, FaceFile, FaceUpdateTime} =
	role_face:face_info(Role),
    #holiday_arena_team_role{id = Role#role_robot.id,
			     name = Role#role_robot.name,
			     lev = Role#role_robot.lev,
			     face_id = Role#role_robot.face_id,
			     avatar_bid = AvatarId,
			     power = Role#role_robot.max_power,
			     team_power = TeamPower,
			     face_update_time = FaceUpdateTime,
			     face_file = FaceFile, is_online = 0};
to_holiday_arena_team_role(Role = #arena_role{}) ->
    #holiday_arena_team_role{id = Role#arena_role.id,
			     name = Role#arena_role.name,
			     lev = Role#arena_role.lev,
			     face_id = Role#arena_role.face,
			     avatar_bid = Role#arena_role.avatar_id,
			     power = Role#arena_role.max_power,
			     team_power = Role#arena_role.max_power,
			     face_update_time =
				 Role#arena_role.face_update_time,
			     face_file = Role#arena_role.face_file,
			     is_online = 0};
to_holiday_arena_team_role(RoleId) ->
    case role_robot:get_role(RoleId) of
      {ok, Robot} -> to_holiday_arena_team_role(Robot);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_arena_team_db274, _,
	     {__Levelholiday_arena_team_db274,
	      __Tracesholiday_arena_team_db274}}
		when __Levelholiday_arena_team_db274 band 8 /= 0 orelse
		       __Tracesholiday_arena_team_db274 /= [] ->
		lager:do_log(error,
			     [{module, holiday_arena_team_db},
			      {function, to_holiday_arena_team_role},
			      {line, 274}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("找不到机器人数据：~w", [RoleId]), none, 4096,
			     8, __Levelholiday_arena_team_db274,
			     __Tracesholiday_arena_team_db274, lager_event,
			     __Pidholiday_arena_team_db274);
	    _ -> ok
	  end,
	  #holiday_arena_team_role{id = RoleId}
    end.


