-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_mgr.erl",
      1).

-module(holiday_arena_team_mgr).

-lager_records([{activity,
		 [id, status, name, data, ext_args]},
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
		{cluster_dynamic_local_group, [type, main, list]},
		{cluster_dynamic_srv,
		 [id, name, main_srv, list, mode, group_lev,
		  init_world_lev, world_lev, open_time, time]},
		{cluster_dynamic_group,
		 [id, min_world_lev, group_lev, mode, list, srv_num,
		  time]},
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
		{state, [next_rank]}]).

-behaviour(gen_server).

-export([call_apply/1, apply/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state, {next_rank = 0}).

-export([sync_role/2, do_sync_role/1, update_ets/3,
	 do_apply_quit_team/1, do_apply_team_change_leader/1]).

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
      "_mgr.erl",
      20).

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
      "_mgr.erl",
      21).

-file("inc/cluster_dynamic_group.hrl", 1).

-record(cluster_dynamic_group,
	{id = {1, <<>>}, min_world_lev = 0, group_lev = 0,
	 mode = 1, list = [], srv_num = 0, time = 0}).

-record(cluster_dynamic_srv,
	{id = {1, <<>>}, name = <<>>, main_srv = <<>>,
	 list = [], mode = 1, group_lev = 0, init_world_lev = 0,
	 world_lev = 0, open_time = 0, time = 0}).

-record(cluster_dynamic_local_group,
	{type = 0, main, list = []}).

-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_mgr.erl",
      22).

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
      "_mgr.erl",
      23).

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
      "_mgr.erl",
      24).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_mgr.erl",
      25).

-spec do_apply_quit_team(#role{}) -> ok.

do_apply_quit_team(RoleId) ->
    update_ets(holiday_arena_role_team, RoleId, del_all),
    role_lib:cast(by_id, RoleId,
		  {holiday_arena_team_lib, push_base, []}),
    ok.

-spec do_apply_team_change_leader(#role{}) -> ok.

do_apply_team_change_leader(NData =
				#holiday_arena_team_team{id = RoleId}) ->
    update_ets(holiday_arena_role_team, NData, all),
    role_lib:cast(by_id, RoleId,
		  {holiday_arena_team_lib, push_base, []}),
    ok.

-spec sync_role(#role{}, atom()) -> ok.

sync_role(Role = #role{id = {_, Sid}}, Flag) ->
    case holiday_arena_team_lib:is_open(Role) of
      {true, Period, _} ->
	  HolidayRole =
	      holiday_arena_team_db:to_holiday_arena_team_role(Role),
	  IsOnline = util:if_true(Flag == off_line, 0, 1),
	  MainId = holiday_arena_team_db:get_main_id(Sid, Period),
	  cluster_lib:cast(MainId, holiday_arena_team_mgr, info,
			   [{do_sync_role,
			     HolidayRole#holiday_arena_team_role{is_online =
								     IsOnline}}]),
	  ok;
      _ -> skip
    end.

do_sync_role(HolidayRole = #holiday_arena_team_role{id =
							RoleId,
						    is_online = IsOnline,
						    power = Power,
						    team_power = TeamPower,
						    lev = Lev, name = Name,
						    avatar_bid = AvatarId,
						    face_id = FaceId,
						    face_update_time =
							FaceUpdateTime,
						    face_file = FaceFile}) ->
    case ets:lookup(holiday_arena_team_role, RoleId) of
      [Data = #holiday_arena_team_role{}] ->
	  NData = Data#holiday_arena_team_role{lev = Lev,
					       name = Name, power = Power,
					       face_id = FaceId,
					       avatar_bid = AvatarId,
					       team_power = TeamPower,
					       face_update_time =
						   FaceUpdateTime,
					       face_file = FaceFile,
					       is_online = IsOnline},
	  ets:insert(holiday_arena_team_role, NData),
	  ok;
      _ -> ets:insert(holiday_arena_team_role, HolidayRole)
    end.

-spec update_ets(atom(), any(), ets | dets | all) -> ok.

update_ets(Tab, Key, del_all) ->
    ets:delete(Tab, Key), dets:delete(Tab, Key);
update_ets(Tab, Data, ets) -> ets:insert(Tab, Data);
update_ets(Tab, Data, dets) -> dets:insert(Tab, Data);
update_ets(Tab, Data, all) ->
    ets:insert(Tab, Data), dets:insert(Tab, Data).

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> holiday_arena_team_mgr ! Info.

cast(Info) ->
    gen_server:cast(holiday_arena_team_mgr, Info).

call(Info) ->
    case catch gen_server:call(holiday_arena_team_mgr, Info,
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
	    {__Pidholiday_arena_team_mgr105, _,
	     {__Levelholiday_arena_team_mgr105,
	      __Tracesholiday_arena_team_mgr105}}
		when __Levelholiday_arena_team_mgr105 band 8 /= 0 orelse
		       __Tracesholiday_arena_team_mgr105 /= [] ->
		lager:do_log(error,
			     [{module, holiday_arena_team_mgr},
			      {function, call}, {line, 105},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [holiday_arena_team_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelholiday_arena_team_mgr105,
			     __Tracesholiday_arena_team_mgr105, lager_event,
			     __Pidholiday_arena_team_mgr105);
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
    gen_server:start_link({local, holiday_arena_team_mgr},
			  holiday_arena_team_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_arena_team_mgr111, _,
       {__Levelholiday_arena_team_mgr111,
	__Tracesholiday_arena_team_mgr111}}
	  when __Levelholiday_arena_team_mgr111 band 64 /= 0
		 orelse __Tracesholiday_arena_team_mgr111 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_arena_team_mgr}, {function, init},
			{line, 111}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [holiday_arena_team_mgr]),
		       none, 4096, 64, __Levelholiday_arena_team_mgr111,
		       __Tracesholiday_arena_team_mgr111, lager_event,
		       __Pidholiday_arena_team_mgr111);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    d_ets_lib:new_d_ets(holiday_arena_team_main_ids,
			"dets/holiday_arena_team_main_ids.dets", 1, set),
    d_ets_lib:load_dets_to_ets(holiday_arena_team_main_ids,
			       undefined),
    d_ets_lib:new_ets(holiday_arena_team_invite, 1, bag),
    d_ets_lib:new_ets(holiday_arena_team_rank,
		      #holiday_arena_team_rank.rank, set),
    d_ets_lib:new_d_ets(holiday_arena_role_team,
			"dets/holiday_arena_role_team.dets",
			#holiday_arena_team_team.id, set),
    d_ets_lib:load_dets_to_ets(holiday_arena_role_team,
			       undefined),
    d_ets_lib:new_d_ets(holiday_arena_team_role,
			"dets/holiday_arena_team_role.dets",
			#holiday_arena_team_role.id, set),
    d_ets_lib:load_dets_to_ets(holiday_arena_team_role,
			       undefined),
    d_ets_lib:new_d_ets(holiday_arena_team_invite_join,
			"dets/holiday_arena_team_invite_join.dets", 1, set),
    d_ets_lib:load_dets_to_ets(holiday_arena_team_invite_join,
			       undefined),
    d_ets_lib:new_d_ets(holiday_arena_team_log,
			"dets/holiday_arena_team_log.dets",
			#holiday_arena_team_log.id, set),
    d_ets_lib:new_d_ets(holiday_arena_team_other,
			"dets/holiday_arena_team_other.dets", 1, set),
    d_ets_lib:load_dets_to_ets(holiday_arena_team_other,
			       undefined),
    NextRank = do_init(),
    holiday_arena_team_match_mgr:do_open_match_pro(),
    State = #state{next_rank = NextRank},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_arena_team_mgr148, _,
       {__Levelholiday_arena_team_mgr148,
	__Tracesholiday_arena_team_mgr148}}
	  when __Levelholiday_arena_team_mgr148 band 64 /= 0
		 orelse __Tracesholiday_arena_team_mgr148 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_arena_team_mgr}, {function, init},
			{line, 148}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [holiday_arena_team_mgr]),
		       none, 4096, 64, __Levelholiday_arena_team_mgr148,
		       __Tracesholiday_arena_team_mgr148, lager_event,
		       __Pidholiday_arena_team_mgr148);
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
	    {__Pidholiday_arena_team_mgr156, _,
	     {__Levelholiday_arena_team_mgr156,
	      __Tracesholiday_arena_team_mgr156}}
		when __Levelholiday_arena_team_mgr156 band 8 /= 0 orelse
		       __Tracesholiday_arena_team_mgr156 /= [] ->
		lager:do_log(error,
			     [{module, holiday_arena_team_mgr},
			      {function, handle_call}, {line, 156},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelholiday_arena_team_mgr156,
			     __Tracesholiday_arena_team_mgr156, lager_event,
			     __Pidholiday_arena_team_mgr156);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    holiday_arena_team_mgr, 157, _Reason}),
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
	    {__Pidholiday_arena_team_mgr169, _,
	     {__Levelholiday_arena_team_mgr169,
	      __Tracesholiday_arena_team_mgr169}}
		when __Levelholiday_arena_team_mgr169 band 8 /= 0 orelse
		       __Tracesholiday_arena_team_mgr169 /= [] ->
		lager:do_log(error,
			     [{module, holiday_arena_team_mgr},
			      {function, handle_info}, {line, 169},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelholiday_arena_team_mgr169,
			     __Tracesholiday_arena_team_mgr169, lager_event,
			     __Pidholiday_arena_team_mgr169);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    holiday_arena_team_mgr, 170, _Reason}),
	  {noreply, State}
    end.

terminate(_Reason, _State) ->
    dets:insert(holiday_arena_team_main_ids,
		ets:tab2list(holiday_arena_team_main_ids)),
    dets:insert(holiday_arena_role_team,
		ets:tab2list(holiday_arena_role_team)),
    dets:insert(holiday_arena_team_role,
		ets:tab2list(holiday_arena_team_role)),
    dets:insert(holiday_arena_team_invite_join,
		ets:tab2list(holiday_arena_team_invite_join)),
    dets:insert(holiday_arena_team_log,
		ets:tab2list(holiday_arena_team_log)),
    dets:insert(holiday_arena_team_other,
		ets:tab2list(holiday_arena_team_other)),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_arena_team_mgr181, _,
       {__Levelholiday_arena_team_mgr181,
	__Tracesholiday_arena_team_mgr181}}
	  when __Levelholiday_arena_team_mgr181 band 64 /= 0
		 orelse __Tracesholiday_arena_team_mgr181 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_arena_team_mgr},
			{function, terminate}, {line, 181},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64,
		       __Levelholiday_arena_team_mgr181,
		       __Tracesholiday_arena_team_mgr181, lager_event,
		       __Pidholiday_arena_team_mgr181);
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
	    {__Pidholiday_arena_team_mgr193, _,
	     {__Levelholiday_arena_team_mgr193,
	      __Tracesholiday_arena_team_mgr193}}
		when __Levelholiday_arena_team_mgr193 band 8 /= 0 orelse
		       __Tracesholiday_arena_team_mgr193 /= [] ->
		lager:do_log(error,
			     [{module, holiday_arena_team_mgr},
			      {function, do_handle_call}, {line, 193},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelholiday_arena_team_mgr193,
			     __Tracesholiday_arena_team_mgr193, lager_event,
			     __Pidholiday_arena_team_mgr193);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    holiday_arena_team_mgr, 194, _Reason}),
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
	    {__Pidholiday_arena_team_mgr207, _,
	     {__Levelholiday_arena_team_mgr207,
	      __Tracesholiday_arena_team_mgr207}}
		when __Levelholiday_arena_team_mgr207 band 8 /= 0 orelse
		       __Tracesholiday_arena_team_mgr207 /= [] ->
		lager:do_log(error,
			     [{module, holiday_arena_team_mgr},
			      {function, do_handle_info}, {line, 207},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelholiday_arena_team_mgr207,
			     __Tracesholiday_arena_team_mgr207, lager_event,
			     __Pidholiday_arena_team_mgr207);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    holiday_arena_team_mgr, 208, _Reason}),
	  {noreply, State}
    end;
do_handle_info(gm_calc_rank, State) ->
    List = ets:tab2list(holiday_arena_team_role),
    L2 = util:keys_sort([#holiday_arena_team_role.power,
			 #holiday_arena_team_role.score],
			[Data
			 || Data = #holiday_arena_team_role{score_time =
								TimeTemp}
				<- List,
			    TimeTemp > 0]),
    L3 = do_calc_rank(L2, 1, []),
    ets:insert(holiday_arena_team_role, L3),
    dets:insert(holiday_arena_team_role, L3),
    ets:delete_all_objects(holiday_arena_team_rank),
    NextRank = do_init(),
    {noreply, State#state{next_rank = NextRank}};
do_handle_info({do_sync_role,
		HolidayRole = #holiday_arena_team_role{id = RoleId,
						       is_online = IsOnline,
						       power = Power,
						       team_power = TeamPower,
						       lev = Lev, name = Name,
						       avatar_bid = AvatarId,
						       face_id = FaceId,
						       face_update_time =
							   FaceUpdateTime,
						       face_file = FaceFile}},
	       State) ->
    case ets:lookup(holiday_arena_team_role, RoleId) of
      [Data = #holiday_arena_team_role{}] ->
	  NData = Data#holiday_arena_team_role{lev = Lev,
					       name = Name, power = Power,
					       face_id = FaceId,
					       avatar_bid = AvatarId,
					       team_power = TeamPower,
					       face_update_time =
						   FaceUpdateTime,
					       face_file = FaceFile,
					       is_online = IsOnline},
	  ets:insert(holiday_arena_team_role, NData),
	  ok;
      _ -> ets:insert(holiday_arena_team_role, HolidayRole)
    end,
    {noreply, State};
do_handle_info(cluster_ready, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_arena_team_mgr247, _,
       {__Levelholiday_arena_team_mgr247,
	__Tracesholiday_arena_team_mgr247}}
	  when __Levelholiday_arena_team_mgr247 band 64 /= 0
		 orelse __Tracesholiday_arena_team_mgr247 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_arena_team_mgr},
			{function, do_handle_info}, {line, 247},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "中央服连接成功, 同步赛季周期和状态", none, 4096, 64,
		       __Levelholiday_arena_team_mgr247,
		       __Tracesholiday_arena_team_mgr247, lager_event,
		       __Pidholiday_arena_team_mgr247);
      _ -> ok
    end,
    cluster_lib:cast(center, c_holiday_arena_team_mgr, info,
		     [{update_period_info, self()}]),
    {noreply, State};
do_handle_info({update_period_info, StateName, Period},
	       State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_arena_team_mgr253, _,
       {__Levelholiday_arena_team_mgr253,
	__Tracesholiday_arena_team_mgr253}}
	  when __Levelholiday_arena_team_mgr253 band 64 /= 0
		 orelse __Tracesholiday_arena_team_mgr253 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_arena_team_mgr},
			{function, do_handle_info}, {line, 253},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("中央服同步赛季周期和状态:~w", [{Period, StateName}]),
		       none, 4096, 64, __Levelholiday_arena_team_mgr253,
		       __Tracesholiday_arena_team_mgr253, lager_event,
		       __Pidholiday_arena_team_mgr253);
      _ -> ok
    end,
    LimitOpenDay =
	holiday_arena_team_data:get_const(team_open_day),
    SrvOpenDay = date:open_srv_day(),
    case SrvOpenDay >= LimitOpenDay of
      true when StateName == open ->
	  SrvOpenTime = sys_env:get(open_timestamp),
	  LimitOpenSrvTime =
	      date:parse_time(holiday_arena_team_data:get_const(team_service_time)),
	  case SrvOpenTime > LimitOpenSrvTime of
	    true ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_arena_team_mgr262, _,
		   {__Levelholiday_arena_team_mgr262,
		    __Tracesholiday_arena_team_mgr262}}
		      when __Levelholiday_arena_team_mgr262 band 64 /= 0
			     orelse __Tracesholiday_arena_team_mgr262 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_arena_team_mgr},
				    {function, do_handle_info}, {line, 262},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("不符合开启条件:~w",
						 [{SrvOpenTime,
						   LimitOpenSrvTime}]),
				   none, 4096, 64,
				   __Levelholiday_arena_team_mgr262,
				   __Tracesholiday_arena_team_mgr262,
				   lager_event, __Pidholiday_arena_team_mgr262);
		  _ -> ok
		end,
		activity_global:set_and_push(812, 0, []),
		sys_env:save(holiday_arena_team_info,
			     {Period, idle, 0}),
		{noreply, State};
	    _ ->
		EndTime = case StateName == open of
			    true -> get_end_time(Period);
			    _ -> 0
			  end,
		sys_env:save(holiday_arena_team_info,
			     {Period, StateName, EndTime}),
		case StateName of
		  open -> activity_global:set_and_push(812, 1, []);
		  _ -> activity_global:set_and_push(812, 0, [])
		end,
		{noreply, State}
	  end;
      _ ->
	  activity_global:set_and_push(812, 0, []),
	  SrvOpenTime = sys_env:get(open_timestamp),
	  LimitOpenSrvTime =
	      date:parse_time(holiday_arena_team_data:get_const(team_service_time)),
	  case SrvOpenTime =< LimitOpenSrvTime of
	    true ->
		case holiday_arena_team_data:get_period_info(Period) of
		  {StartTimeT, EndTimeT} ->
		      StartTime = date:parse_time(StartTimeT),
		      EndTime = date:parse_time(EndTimeT),
		      Now = date:unixtime(),
		      case Now >= StartTime andalso Now =< EndTime of
			true ->
			    NextTime = date:next_diff({23, 30, 0}),
			    case {whereis(lager_event), whereis(lager_event),
				  lager_config:get({lager_event, loglevel},
						   {0, []})}
				of
			      {undefined, undefined, _} ->
				  fun () -> {error, lager_not_running} end();
			      {undefined, _, _} ->
				  fun () ->
					  {error,
					   {sink_not_configured, lager_event}}
				  end();
			      {__Pidholiday_arena_team_mgr294, _,
			       {__Levelholiday_arena_team_mgr294,
				__Tracesholiday_arena_team_mgr294}}
				  when __Levelholiday_arena_team_mgr294 band 64
					 /= 0
					 orelse
					 __Tracesholiday_arena_team_mgr294 /=
					   [] ->
				  lager:do_log(info,
					       [{module,
						 holiday_arena_team_mgr},
						{function, do_handle_info},
						{line, 294},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("本赛季要开启 设置下一个23点30分0秒进行再次判断:~w",
							     [{SrvOpenDay,
							       LimitOpenDay}]),
					       none, 4096, 64,
					       __Levelholiday_arena_team_mgr294,
					       __Tracesholiday_arena_team_mgr294,
					       lager_event,
					       __Pidholiday_arena_team_mgr294);
			      _ -> ok
			    end,
			    util:set_ms_timer(day_check_open, NextTime * 1000,
					      {day_check_open, Period});
			_ ->
			    case {whereis(lager_event), whereis(lager_event),
				  lager_config:get({lager_event, loglevel},
						   {0, []})}
				of
			      {undefined, undefined, _} ->
				  fun () -> {error, lager_not_running} end();
			      {undefined, _, _} ->
				  fun () ->
					  {error,
					   {sink_not_configured, lager_event}}
				  end();
			      {__Pidholiday_arena_team_mgr297, _,
			       {__Levelholiday_arena_team_mgr297,
				__Tracesholiday_arena_team_mgr297}}
				  when __Levelholiday_arena_team_mgr297 band 64
					 /= 0
					 orelse
					 __Tracesholiday_arena_team_mgr297 /=
					   [] ->
				  lager:do_log(info,
					       [{module,
						 holiday_arena_team_mgr},
						{function, do_handle_info},
						{line, 297},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("不在活动时间内，不开启:~w",
							     [{Period,
							       SrvOpenDay,
							       LimitOpenDay,
							       StartTime,
							       EndTime}]),
					       none, 4096, 64,
					       __Levelholiday_arena_team_mgr297,
					       __Tracesholiday_arena_team_mgr297,
					       lager_event,
					       __Pidholiday_arena_team_mgr297);
			      _ -> ok
			    end,
			    skip
		      end;
		  _ ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidholiday_arena_team_mgr301, _,
			 {__Levelholiday_arena_team_mgr301,
			  __Tracesholiday_arena_team_mgr301}}
			    when __Levelholiday_arena_team_mgr301 band 64 /= 0
				   orelse
				   __Tracesholiday_arena_team_mgr301 /= [] ->
			    lager:do_log(info,
					 [{module, holiday_arena_team_mgr},
					  {function, do_handle_info},
					  {line, 301},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("找不到活动配置，不开启:~w",
						       [{Period, SrvOpenDay,
							 LimitOpenDay}]),
					 none, 4096, 64,
					 __Levelholiday_arena_team_mgr301,
					 __Tracesholiday_arena_team_mgr301,
					 lager_event,
					 __Pidholiday_arena_team_mgr301);
			_ -> ok
		      end,
		      skip
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
		  {__Pidholiday_arena_team_mgr305, _,
		   {__Levelholiday_arena_team_mgr305,
		    __Tracesholiday_arena_team_mgr305}}
		      when __Levelholiday_arena_team_mgr305 band 64 /= 0
			     orelse __Tracesholiday_arena_team_mgr305 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_arena_team_mgr},
				    {function, do_handle_info}, {line, 305},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("不符合活动开启条件，不开启:~w",
						 [{Period, SrvOpenDay,
						   LimitOpenDay}]),
				   none, 4096, 64,
				   __Levelholiday_arena_team_mgr305,
				   __Tracesholiday_arena_team_mgr305,
				   lager_event, __Pidholiday_arena_team_mgr305);
		  _ -> ok
		end,
		skip
	  end,
	  sys_env:save(holiday_arena_team_info,
		       {Period, StateName, 0}),
	  {noreply, State}
    end;
do_handle_info({apply_invite, RoleId, TarRoleId},
	       State) ->
    HasTeam1 = holiday_arena_team_db:has_team(RoleId),
    HasTeam2 = holiday_arena_team_db:has_team(TarRoleId),
    if HasTeam1 == true ->
	   role_lib:cast(by_id, RoleId,
			 {holiday_arena_team_lib, handle_apply_invite,
			  [{false, lang:get(<<"已有队伍"/utf8>>)}]});
       HasTeam2 == true ->
	   role_lib:cast(by_id, RoleId,
			 {holiday_arena_team_lib, handle_apply_invite,
			  [{false, lang:get(<<"对方已有队伍"/utf8>>)}]});
       true ->
	   Team1 = #holiday_arena_team_team{id = RoleId,
					    team_role_id = TarRoleId,
					    is_leader = 0, pos = 2},
	   update_ets(holiday_arena_role_team, Team1, all),
	   Team2 = #holiday_arena_team_team{id = TarRoleId,
					    team_role_id = RoleId,
					    is_leader = 1, pos = 1},
	   update_ets(holiday_arena_role_team, Team2, all),
	   cluster_lib:cast(element(2, RoleId),
			    holiday_arena_team_mgr, update_ets,
			    [holiday_arena_role_team, Team1, all]),
	   cluster_lib:cast(element(2, TarRoleId),
			    holiday_arena_team_mgr, update_ets,
			    [holiday_arena_role_team, Team2, all]),
	   cluster_lib:cast(element(2, TarRoleId),
			    holiday_arena_team_mgr, update_ets,
			    [holiday_arena_role_team, Team2, all]),
	   catch cluster_lib:cast(element(2, RoleId),
				  room_feat_mgr, info,
				  [{holiday_arena_team_join_team, RoleId}]),
	   catch cluster_lib:cast(element(2, TarRoleId),
				  room_feat_mgr, info,
				  [{holiday_arena_team_join_team, TarRoleId}]),
	   role_lib:cast(by_id, TarRoleId,
			 {holiday_arena_team_lib, handle_apply_invite,
			  [{tar_true, RoleId}]}),
	   role_lib:cast(by_id, RoleId,
			 {holiday_arena_team_lib, handle_apply_invite,
			  [{true, TarRoleId}]})
    end,
    {noreply, State};
do_handle_info({match_lock, RoleId, TimeOut}, State) ->
    case ets:lookup(holiday_arena_role_team, RoleId) of
      [Data = #holiday_arena_team_team{team_role_id =
					   TarRoleId}
       | _] ->
	  case ets:lookup(holiday_arena_role_team, TarRoleId) of
	    [TarData = #holiday_arena_team_team{} | _] ->
		Now = date:unixtime(),
		EndTime = Now + TimeOut,
		NData = Data#holiday_arena_team_team{is_lock = 1,
						     match_time = EndTime},
		update_ets(holiday_arena_role_team, NData, all),
		NTarData = TarData#holiday_arena_team_team{is_lock = 1,
							   match_time =
							       EndTime},
		update_ets(holiday_arena_role_team, NTarData, all),
		cluster_lib:cast(element(2, RoleId),
				 holiday_arena_team_mgr, update_ets,
				 [holiday_arena_role_team, NData, all]),
		cluster_lib:cast(element(2, TarRoleId),
				 holiday_arena_team_mgr, update_ets,
				 [holiday_arena_role_team, NTarData, all]),
		ok;
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_arena_team_mgr354, _,
		   {__Levelholiday_arena_team_mgr354,
		    __Tracesholiday_arena_team_mgr354}}
		      when __Levelholiday_arena_team_mgr354 band 8 /= 0 orelse
			     __Tracesholiday_arena_team_mgr354 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_arena_team_mgr},
				    {function, do_handle_info}, {line, 354},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("队伍数据异常,找不到队友的数据:~w",
						 [{RoleId, TarRoleId}]),
				   none, 4096, 8,
				   __Levelholiday_arena_team_mgr354,
				   __Tracesholiday_arena_team_mgr354,
				   lager_event, __Pidholiday_arena_team_mgr354);
		  _ -> ok
		end,
		ok
	  end;
      _ -> ok
    end,
    {noreply, State};
do_handle_info({match_unlock, RoleId}, State) ->
    case ets:lookup(holiday_arena_role_team, RoleId) of
      [Data = #holiday_arena_team_team{team_role_id =
					   TarRoleId}
       | _] ->
	  case ets:lookup(holiday_arena_role_team, TarRoleId) of
	    [TarData = #holiday_arena_team_team{} | _] ->
		NData = Data#holiday_arena_team_team{is_lock = 0,
						     match_time = 0},
		update_ets(holiday_arena_role_team, NData, all),
		NTarData = TarData#holiday_arena_team_team{is_lock = 0,
							   match_time = 0},
		update_ets(holiday_arena_role_team, NTarData, all),
		cluster_lib:cast(element(2, RoleId),
				 holiday_arena_team_mgr, update_ets,
				 [holiday_arena_role_team, NData, all]),
		cluster_lib:cast(element(2, TarRoleId),
				 holiday_arena_team_mgr, update_ets,
				 [holiday_arena_role_team, NTarData, all]),
		ok;
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_arena_team_mgr376, _,
		   {__Levelholiday_arena_team_mgr376,
		    __Tracesholiday_arena_team_mgr376}}
		      when __Levelholiday_arena_team_mgr376 band 8 /= 0 orelse
			     __Tracesholiday_arena_team_mgr376 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_arena_team_mgr},
				    {function, do_handle_info}, {line, 376},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("队伍数据异常,找不到队友的数据:~w",
						 [{RoleId, TarRoleId}]),
				   none, 4096, 8,
				   __Levelholiday_arena_team_mgr376,
				   __Tracesholiday_arena_team_mgr376,
				   lager_event, __Pidholiday_arena_team_mgr376);
		  _ -> ok
		end,
		ok
	  end;
      _ -> ok
    end,
    {noreply, State};
do_handle_info({quit_team, RoleId, ConnPid, RolePid},
	       State) ->
    Now = date:unixtime(),
    case ets:lookup(holiday_arena_role_team, RoleId) of
      [#holiday_arena_team_team{is_lock = 1,
				match_time = EndTime}
       | _]
	  when EndTime >= Now ->
	  sys_conn:pack_send(ConnPid, 29006,
			     {0,
			      lang:get(<<"队伍正在匹配中或战斗中，暂时无法退出队伍，请稍后再试！"/utf8>>)}),
	  ok;
      [#holiday_arena_team_team{team_role_id = TarRoleId}
       | _] ->
	  update_ets(holiday_arena_role_team, RoleId, del_all),
	  update_ets(holiday_arena_role_team, TarRoleId, del_all),
	  cluster_lib:cast(element(2, RoleId),
			   holiday_arena_team_mgr, do_apply_quit_team,
			   [RoleId]),
	  cluster_lib:cast(element(2, TarRoleId),
			   holiday_arena_team_mgr, do_apply_quit_team,
			   [TarRoleId]),
	  sys_conn:pack_send(ConnPid, 29006,
			     {0, lang:get(<<"已退出组队"/utf8>>)}),
	  ok;
      _ ->
	  sys_conn:pack_send(ConnPid, 29006,
			     {0, lang:get(<<"当前没有队伍"/utf8>>)}),
	  ok
    end,
    {noreply, State};
do_handle_info({team_change_leader, RoleId, TarRoleId,
		ConnPid, RolePid},
	       State) ->
    Now = date:unixtime(),
    case ets:lookup(holiday_arena_role_team, RoleId) of
      [#holiday_arena_team_team{is_lock = 1,
				match_time = EndTime}
       | _]
	  when EndTime >= Now ->
	  sys_conn:pack_send(ConnPid, 29007,
			     {0,
			      lang:get(<<"队伍正在匹配中或战斗中，暂时无法转让队长，请稍后再试！"/utf8>>)}),
	  ok;
      [#holiday_arena_team_team{is_leader = 0} | _] ->
	  sys_conn:pack_send(ConnPid, 29007,
			     {0, lang:get(<<"只有队长才能转让"/utf8>>)}),
	  ok;
      [Data = #holiday_arena_team_team{team_role_id =
					   TarRoleId}
       | _] ->
	  case ets:lookup(holiday_arena_role_team, TarRoleId) of
	    [TarData = #holiday_arena_team_team{} | _] ->
		NData = Data#holiday_arena_team_team{is_leader = 0,
						     is_lock = 0},
		update_ets(holiday_arena_role_team, NData, all),
		NTarData = TarData#holiday_arena_team_team{is_leader =
							       1,
							   is_lock = 0},
		update_ets(holiday_arena_role_team, NTarData, all),
		cluster_lib:cast(element(2, RoleId),
				 holiday_arena_team_mgr,
				 do_apply_team_change_leader, [NData]),
		cluster_lib:cast(element(2, TarRoleId),
				 holiday_arena_team_mgr,
				 do_apply_team_change_leader, [NTarData]),
		sys_conn:pack_send(ConnPid, 29007,
				   {0, lang:get(<<"已转让队长"/utf8>>)}),
		ok;
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_arena_team_mgr435, _,
		   {__Levelholiday_arena_team_mgr435,
		    __Tracesholiday_arena_team_mgr435}}
		      when __Levelholiday_arena_team_mgr435 band 8 /= 0 orelse
			     __Tracesholiday_arena_team_mgr435 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_arena_team_mgr},
				    {function, do_handle_info}, {line, 435},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("队伍信息异常, 找不到队友的队伍关系数据:~w",
						 [{RoleId, TarRoleId}]),
				   none, 4096, 8,
				   __Levelholiday_arena_team_mgr435,
				   __Tracesholiday_arena_team_mgr435,
				   lager_event, __Pidholiday_arena_team_mgr435);
		  _ -> ok
		end,
		sys_conn:pack_send(ConnPid, 29007,
				   {0, lang:get(<<"转让队长失败"/utf8>>)}),
		ok
	  end;
      [_ | _] ->
	  sys_conn:pack_send(ConnPid, 29007,
			     {0, lang:get(<<"参数错误"/utf8>>)}),
	  ok;
      _ ->
	  sys_conn:pack_send(ConnPid, 29007,
			     {0, lang:get(<<"当前没有队伍"/utf8>>)}),
	  ok
    end,
    {noreply, State};
do_handle_info({day_check_open, Period}, State) ->
    LimitOpenDay =
	holiday_arena_team_data:get_const(team_open_day),
    SrvOpenDay = date:open_srv_day(),
    case SrvOpenDay == LimitOpenDay - 1 of
      true ->
	  case holiday_arena_team_data:get_period_info(Period) of
	    {StartTimeT, EndTimeT} ->
		StartTime = date:parse_time(StartTimeT),
		EndTime = date:parse_time(EndTimeT),
		Now = date:unixtime(),
		case Now >= StartTime andalso Now =< EndTime of
		  true ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidholiday_arena_team_mgr461, _,
			 {__Levelholiday_arena_team_mgr461,
			  __Tracesholiday_arena_team_mgr461}}
			    when __Levelholiday_arena_team_mgr461 band 64 /= 0
				   orelse
				   __Tracesholiday_arena_team_mgr461 /= [] ->
			    lager:do_log(info,
					 [{module, holiday_arena_team_mgr},
					  {function, do_handle_info},
					  {line, 461},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("符合开服条件判断, 进行数据采集, 本服将在下一个0点开启活动:~w",
						       [{SrvOpenDay,
							 LimitOpenDay}]),
					 none, 4096, 64,
					 __Levelholiday_arena_team_mgr461,
					 __Tracesholiday_arena_team_mgr461,
					 lager_event,
					 __Pidholiday_arena_team_mgr461);
			_ -> ok
		      end,
		      NextTime = date:next_diff({0, 0, 1}),
		      do_calc_data(),
		      util:set_ms_timer(do_open, NextTime * 1000,
					{synv_period_info, open, Period});
		  _ ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidholiday_arena_team_mgr466, _,
			 {__Levelholiday_arena_team_mgr466,
			  __Tracesholiday_arena_team_mgr466}}
			    when __Levelholiday_arena_team_mgr466 band 64 /= 0
				   orelse
				   __Tracesholiday_arena_team_mgr466 /= [] ->
			    lager:do_log(info,
					 [{module, holiday_arena_team_mgr},
					  {function, do_handle_info},
					  {line, 466},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("错误的消息，活动不开启:~w",
						       [{Period, SrvOpenDay,
							 LimitOpenDay,
							 StartTime, EndTime}]),
					 none, 4096, 64,
					 __Levelholiday_arena_team_mgr466,
					 __Tracesholiday_arena_team_mgr466,
					 lager_event,
					 __Pidholiday_arena_team_mgr466);
			_ -> ok
		      end,
		      skip
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
		  {__Pidholiday_arena_team_mgr470, _,
		   {__Levelholiday_arena_team_mgr470,
		    __Tracesholiday_arena_team_mgr470}}
		      when __Levelholiday_arena_team_mgr470 band 64 /= 0
			     orelse __Tracesholiday_arena_team_mgr470 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_arena_team_mgr},
				    {function, do_handle_info}, {line, 470},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("错误的消息，活动不开启:~w",
						 [{Period, SrvOpenDay,
						   LimitOpenDay}]),
				   none, 4096, 64,
				   __Levelholiday_arena_team_mgr470,
				   __Tracesholiday_arena_team_mgr470,
				   lager_event, __Pidholiday_arena_team_mgr470);
		  _ -> ok
		end,
		skip
	  end;
      _ ->
	  NextTime = date:next_diff({23, 30, 0}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_arena_team_mgr475, _,
	     {__Levelholiday_arena_team_mgr475,
	      __Tracesholiday_arena_team_mgr475}}
		when __Levelholiday_arena_team_mgr475 band 64 /= 0
		       orelse __Tracesholiday_arena_team_mgr475 /= [] ->
		lager:do_log(info,
			     [{module, holiday_arena_team_mgr},
			      {function, do_handle_info}, {line, 475},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("不符合开服条件判断, 设置下一个23点30分0秒进行再次判断:~w",
					   [{SrvOpenDay, LimitOpenDay}]),
			     none, 4096, 64, __Levelholiday_arena_team_mgr475,
			     __Tracesholiday_arena_team_mgr475, lager_event,
			     __Pidholiday_arena_team_mgr475);
	    _ -> ok
	  end,
	  util:set_ms_timer(day_check_open, NextTime * 1000,
			    {day_check_open, Period})
    end,
    {noreply, State};
do_handle_info({synv_period_info, idle, Period},
	       State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_arena_team_mgr482, _,
       {__Levelholiday_arena_team_mgr482,
	__Tracesholiday_arena_team_mgr482}}
	  when __Levelholiday_arena_team_mgr482 band 64 /= 0
		 orelse __Tracesholiday_arena_team_mgr482 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_arena_team_mgr},
			{function, do_handle_info}, {line, 482},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("活动组队竞技场已结束:~w", [Period]), none, 4096,
		       64, __Levelholiday_arena_team_mgr482,
		       __Tracesholiday_arena_team_mgr482, lager_event,
		       __Pidholiday_arena_team_mgr482);
      _ -> ok
    end,
    Sid = sys_lib:srv_id(),
    case sys_env:get({holiday_arena_team_is_award, Period})
	of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_arena_team_mgr487, _,
	     {__Levelholiday_arena_team_mgr487,
	      __Tracesholiday_arena_team_mgr487}}
		when __Levelholiday_arena_team_mgr487 band 64 /= 0
		       orelse __Tracesholiday_arena_team_mgr487 /= [] ->
		lager:do_log(info,
			     [{module, holiday_arena_team_mgr},
			      {function, do_handle_info}, {line, 487},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "活动组队竞技场已结算过奖励", none, 4096, 64,
			     __Levelholiday_arena_team_mgr487,
			     __Tracesholiday_arena_team_mgr487, lager_event,
			     __Pidholiday_arena_team_mgr487);
	    _ -> ok
	  end,
	  skip;
      _ ->
	  sys_env:save({holiday_arena_team_is_award, Period},
		       true)
    end,
    activity_global:set_and_push(812, 0, []),
    sys_env:save(holiday_arena_team_info,
		 {Period, idle, 0}),
    role_group:apply(world,
		     {holiday_arena_team_lib, do_close_fire, []}),
    {noreply, State};
do_handle_info({synv_period_info, check, Period},
	       State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_arena_team_mgr500, _,
       {__Levelholiday_arena_team_mgr500,
	__Tracesholiday_arena_team_mgr500}}
	  when __Levelholiday_arena_team_mgr500 band 64 /= 0
		 orelse __Tracesholiday_arena_team_mgr500 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_arena_team_mgr},
			{function, do_handle_info}, {line, 500},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("活动组队竞技场进入数据采集期:~w", [Period]), none,
		       4096, 64, __Levelholiday_arena_team_mgr500,
		       __Tracesholiday_arena_team_mgr500, lager_event,
		       __Pidholiday_arena_team_mgr500);
      _ -> ok
    end,
    do_init_data(),
    SrvOpenTime = sys_env:get(open_timestamp),
    LimitOpenSrvTime =
	date:parse_time(holiday_arena_team_data:get_const(team_service_time)),
    case SrvOpenTime > LimitOpenSrvTime of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_arena_team_mgr506, _,
	     {__Levelholiday_arena_team_mgr506,
	      __Tracesholiday_arena_team_mgr506}}
		when __Levelholiday_arena_team_mgr506 band 64 /= 0
		       orelse __Tracesholiday_arena_team_mgr506 /= [] ->
		lager:do_log(info,
			     [{module, holiday_arena_team_mgr},
			      {function, do_handle_info}, {line, 506},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("不符合开启条件:~w",
					   [{SrvOpenTime, LimitOpenSrvTime}]),
			     none, 4096, 64, __Levelholiday_arena_team_mgr506,
			     __Tracesholiday_arena_team_mgr506, lager_event,
			     __Pidholiday_arena_team_mgr506);
	    _ -> ok
	  end,
	  skip;
      _ ->
	  LimitOpenDay =
	      holiday_arena_team_data:get_const(team_open_day),
	  SrvOpenDay = date:open_srv_day(),
	  Sid = sys_lib:srv_id(),
	  FullIds = sys_lib:srv_full_id(),
	  AllSids = [Sid | lists:delete(Sid, FullIds)],
	  {MainId, MainList} = case SrvOpenDay >= LimitOpenDay of
				 true ->
				     case cluster_dynamic_group:get_group(1) of
				       {true,
					#cluster_dynamic_local_group{main =
									 MainSrvId,
								     list =
									 MainListT}}
					   when MainSrvId =/= undefined ->
					   {MainSrvId, MainListT};
				       _ -> {Sid, [Sid]}
				     end;
				 _ -> {Sid, [Sid]}
			       end,
	  sys_env:save(holiday_arena_team_info,
		       {Period, check, 0}),
	  MainInfo = [{{SidT, Period}, MainId}
		      || SidT <- AllSids],
	  ets:insert(holiday_arena_team_main_ids, MainInfo),
	  dets:insert(holiday_arena_team_main_ids, MainInfo),
	  cluster_lib:cast(center, c_holiday_arena_team_mgr,
			   update_ets,
			   [c_holiday_arena_team_main_ids, MainInfo, all]),
	  ets:insert(holiday_arena_team_other,
		     {main_list, MainList}),
	  dets:insert(holiday_arena_team_other,
		      {main_list, MainList}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_arena_team_mgr534, _,
	     {__Levelholiday_arena_team_mgr534,
	      __Tracesholiday_arena_team_mgr534}}
		when __Levelholiday_arena_team_mgr534 band 64 /= 0
		       orelse __Tracesholiday_arena_team_mgr534 /= [] ->
		lager:do_log(info,
			     [{module, holiday_arena_team_mgr},
			      {function, do_handle_info}, {line, 534},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("主服为:~w", [MainId]), none, 4096, 64,
			     __Levelholiday_arena_team_mgr534,
			     __Tracesholiday_arena_team_mgr534, lager_event,
			     __Pidholiday_arena_team_mgr534);
	    _ -> ok
	  end,
	  case SrvOpenDay >= LimitOpenDay of
	    true ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_arena_team_mgr538, _,
		   {__Levelholiday_arena_team_mgr538,
		    __Tracesholiday_arena_team_mgr538}}
		      when __Levelholiday_arena_team_mgr538 band 64 /= 0
			     orelse __Tracesholiday_arena_team_mgr538 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_arena_team_mgr},
				    {function, do_handle_info}, {line, 538},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("符合开服条件判断, 进行数据采集:~w",
						 [{SrvOpenDay, LimitOpenDay}]),
				   none, 4096, 64,
				   __Levelholiday_arena_team_mgr538,
				   __Tracesholiday_arena_team_mgr538,
				   lager_event, __Pidholiday_arena_team_mgr538);
		  _ -> ok
		end,
		do_calc_data();
	    _ ->
		NextTime = date:next_diff({23, 30, 0}),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_arena_team_mgr542, _,
		   {__Levelholiday_arena_team_mgr542,
		    __Tracesholiday_arena_team_mgr542}}
		      when __Levelholiday_arena_team_mgr542 band 64 /= 0
			     orelse __Tracesholiday_arena_team_mgr542 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_arena_team_mgr},
				    {function, do_handle_info}, {line, 542},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("不符合开服条件判断, 设置下一个23点30分0秒进行再次判断:~w",
						 [{SrvOpenDay, LimitOpenDay}]),
				   none, 4096, 64,
				   __Levelholiday_arena_team_mgr542,
				   __Tracesholiday_arena_team_mgr542,
				   lager_event, __Pidholiday_arena_team_mgr542);
		  _ -> ok
		end,
		util:set_ms_timer(day_check_open, NextTime * 1000,
				  {day_check_open, Period})
	  end
    end,
    {noreply, State};
do_handle_info({synv_period_info, open, Period},
	       State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_arena_team_mgr549, _,
       {__Levelholiday_arena_team_mgr549,
	__Tracesholiday_arena_team_mgr549}}
	  when __Levelholiday_arena_team_mgr549 band 64 /= 0
		 orelse __Tracesholiday_arena_team_mgr549 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_arena_team_mgr},
			{function, do_handle_info}, {line, 549},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("活动组队竞技场开启赛季新周期:~w", [Period]), none,
		       4096, 64, __Levelholiday_arena_team_mgr549,
		       __Tracesholiday_arena_team_mgr549, lager_event,
		       __Pidholiday_arena_team_mgr549);
      _ -> ok
    end,
    SrvOpenTime = sys_env:get(open_timestamp),
    LimitOpenSrvTime =
	date:parse_time(holiday_arena_team_data:get_const(team_service_time)),
    case SrvOpenTime > LimitOpenSrvTime of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_arena_team_mgr554, _,
	     {__Levelholiday_arena_team_mgr554,
	      __Tracesholiday_arena_team_mgr554}}
		when __Levelholiday_arena_team_mgr554 band 64 /= 0
		       orelse __Tracesholiday_arena_team_mgr554 /= [] ->
		lager:do_log(info,
			     [{module, holiday_arena_team_mgr},
			      {function, do_handle_info}, {line, 554},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("不符合开启条件:~w",
					   [{SrvOpenTime, LimitOpenSrvTime}]),
			     none, 4096, 64, __Levelholiday_arena_team_mgr554,
			     __Tracesholiday_arena_team_mgr554, lager_event,
			     __Pidholiday_arena_team_mgr554);
	    _ -> ok
	  end,
	  {noreply, State};
      _ ->
	  LimitOpenDay =
	      holiday_arena_team_data:get_const(team_open_day),
	  SrvOpenDay = date:open_srv_day(),
	  case SrvOpenDay >= LimitOpenDay of
	    true ->
		List = ets:tab2list(holiday_arena_team_role),
		ets:insert(holiday_arena_team_role, List),
		dets:insert(holiday_arena_team_role, List),
		BasePower = calc_base_power(List),
		ets:insert(holiday_arena_team_other,
			   {base_power, BasePower}),
		dets:insert(holiday_arena_team_other,
			    {base_power, BasePower}),
		NextRank = 1,
		EndTime = get_end_time(Period),
		sys_env:save(holiday_arena_team_info,
			     {Period, open, EndTime}),
		role_group:apply(world,
				 {holiday_arena_team_lib, do_open_fire, []}),
		activity_global:set_and_push(812, 1, []),
		{noreply, State#state{next_rank = NextRank}};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_arena_team_mgr577, _,
		   {__Levelholiday_arena_team_mgr577,
		    __Tracesholiday_arena_team_mgr577}}
		      when __Levelholiday_arena_team_mgr577 band 64 /= 0
			     orelse __Tracesholiday_arena_team_mgr577 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_arena_team_mgr},
				    {function, do_handle_info}, {line, 577},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("不符合开服条件判断, 忽略本次开启信息:~w",
						 [{SrvOpenDay, LimitOpenDay}]),
				   none, 4096, 64,
				   __Levelholiday_arena_team_mgr577,
				   __Tracesholiday_arena_team_mgr577,
				   lager_event, __Pidholiday_arena_team_mgr577);
		  _ -> ok
		end,
		{noreply, State}
	  end
    end;
do_handle_info({update_role, HolidayArenaTeamRole,
		InitScore, InitScoreLev},
	       State) ->
    ets:insert(holiday_arena_team_role,
	       HolidayArenaTeamRole#holiday_arena_team_role{score =
								InitScore,
							    score_lev =
								InitScoreLev}),
    {noreply, State};
do_handle_info(do_init_role_data, State) ->
    case get(do_init_role_data) of
      [R = #arena_role{id = RoleId, rank = Rank} | Other] ->
	  HolidayArenaTeamRole =
	      holiday_arena_team_db:to_holiday_arena_team_role(R),
	  Sid = sys_lib:srv_id(),
	  {Period, _, _} = sys_env:get(holiday_arena_team_info),
	  MainId = holiday_arena_team_db:get_main_id(Sid, Period),
	  {InitScore, InitScoreLev} =
	      holiday_arena_team_data:get_init_score(Rank),
	  cluster_lib:cast(MainId, holiday_arena_team_mgr, info,
			   [{update_role, HolidayArenaTeamRole, InitScore,
			     InitScoreLev}]),
	  put(do_init_role_data, Other),
	  put(do_init_role_score_data,
	      [{RoleId, {InitScore, InitScoreLev}}
	       | util:get(do_init_role_score_data, [])]),
	  util:set_ms_timer(do_init_role_data,
			    util:rand(200, 800), do_init_role_data);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_arena_team_mgr601, _,
	     {__Levelholiday_arena_team_mgr601,
	      __Tracesholiday_arena_team_mgr601}}
		when __Levelholiday_arena_team_mgr601 band 64 /= 0
		       orelse __Tracesholiday_arena_team_mgr601 /= [] ->
		lager:do_log(info,
			     [{module, holiday_arena_team_mgr},
			      {function, do_handle_info}, {line, 601},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "活动组队竞技场初始化数据完成", none, 4096, 64,
			     __Levelholiday_arena_team_mgr601,
			     __Tracesholiday_arena_team_mgr601, lager_event,
			     __Pidholiday_arena_team_mgr601);
	    _ -> ok
	  end,
	  erase(do_init_role_data),
	  L = util:get(do_init_role_score_data, []),
	  erase(do_init_role_score_data),
	  ets:insert(holiday_arena_team_other,
		     {init_role_score_data, L}),
	  dets:insert(holiday_arena_team_other,
		      {init_role_score_data, L}),
	  skip
    end,
    {noreply, State};
do_handle_info({combat_over,
		ArgMaps = #{is_win := Result,
			    team_role_id := TeamRoleId, all_power := AllPower,
			    role_pid := RolePid, id := RoleId,
			    tar_role_id := TarRoleId,
			    tar_score_info :=
				{TarRank, TarScore, TarScoreLev}}},
	       State) ->
    HolidayRole = #holiday_arena_team_role{rank = ARank,
					   score = Score,
					   score_lev = ScoreLev} =
		      holiday_arena_team_db:get_team_role(RoleId),
    #holiday_arena_team_role{rank = BRank, score = BScore} =
	case TarRoleId of
	  {_, <<"robot">>} -> #holiday_arena_team_role{};
	  _ -> holiday_arena_team_db:get_team_role(TarRoleId)
	end,
    {_, NewState} = calc_score_change(HolidayRole, State,
				      TarScore, Result, AllPower),
    {NewState2, TeamRank, TeamRankScore} = case
					     holiday_arena_team_db:get_team_role(TeamRoleId)
					       of
					     HolidayRole2 =
						 #holiday_arena_team_role{id =
									      TeamRoleId,
									  rank =
									      TeamRankT,
									  score
									      =
									      TeamRankScoreT} ->
						 catch
						   cluster_lib:cast(element(2,
									    TeamRoleId),
								    room_feat_mgr,
								    info,
								    [{holiday_arena_team_combat_over,
								      TeamRoleId,
								      Result}]),
						 {_, NewStateT} =
						     calc_score_change(HolidayRole2,
								       NewState,
								       TarScore,
								       Result,
								       AllPower),
						 {NewStateT, TeamRankT,
						  TeamRankScoreT};
					     _ -> {NewState, 0, 1000}
					   end,
    {NewTeamRank, NewTeamRankScore} = case
					holiday_arena_team_db:get_team_role(TeamRoleId)
					  of
					#holiday_arena_team_role{rank =
								     TeamRankT2,
								 score =
								     TeamRankScoreT2} ->
					    {TeamRankT2, TeamRankScoreT2};
					_ -> {0, 1000}
				      end,
    do_save_update(),
    #holiday_arena_team_role{rank = NewRank,
			     score = NewScore, score_lev = NewScoreLev} =
	holiday_arena_team_db:get_team_role(RoleId),
    #holiday_arena_team_role{rank = NewBRank,
			     score = NewBScore} =
	case TarRoleId of
	  {_, <<"robot">>} -> #holiday_arena_team_role{};
	  _ -> holiday_arena_team_db:get_team_role(TarRoleId)
	end,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_arena_team_mgr642, _,
       {__Levelholiday_arena_team_mgr642,
	__Tracesholiday_arena_team_mgr642}}
	  when __Levelholiday_arena_team_mgr642 band 128 /= 0
		 orelse __Tracesholiday_arena_team_mgr642 /= [] ->
	  lager:do_log(debug,
		       [{module, holiday_arena_team_mgr},
			{function, do_handle_info}, {line, 642},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("组队竞技场积分计算:~w",
				     [{Result, ARank, Score, ScoreLev, TarScore,
				       NewRank, NewScore, NewScoreLev}]),
		       none, 4096, 128, __Levelholiday_arena_team_mgr642,
		       __Tracesholiday_arena_team_mgr642, lager_event,
		       __Pidholiday_arena_team_mgr642);
      _ -> ok
    end,
    role:apply(async, RolePid,
	       {holiday_arena_team_lib, apply_do_combat_over,
		[ArgMaps#{my_score_info => {ARank, Score, ScoreLev},
			  my_new_score_info => {NewRank, NewScore, NewScoreLev},
			  tar_new_score_info =>
			      {BRank, NewBRank, BScore, NewBScore},
			  team_role_score_info =>
			      {TeamRank, NewTeamRank, TeamRankScore,
			       NewTeamRankScore}}]}),
    catch cluster_lib:cast(element(2, RoleId),
			   room_feat_mgr, info,
			   [{holiday_arena_team_combat_over, RoleId, Result}]),
    {noreply, NewState2};
do_handle_info({add_log, RoleId,
		LogData = #holiday_arena_team_log{atk_id =
						      Id = {_, Sid},
						  replay_list = ReplayList}},
	       State) ->
    #role_holiday_arena_team_log{list = Logs} =
	holiday_arena_team_db:get_role_log(RoleId),
    LogId = case Logs of
	      [#holiday_arena_team_log{id = LogId1} | _]
		  when LogId1 < 100 ->
		  LogId1 + 1;
	      _ -> 1
	    end,
    NewLogData = LogData#holiday_arena_team_log{id = LogId},
    case RoleId == Id of
      true -> skip;
      _ ->
	  [cluster_lib:cast(Sid, combat_replay_mgr,
			    acc_replay_reference, [Temp])
	   || {_, #holiday_arena_team_log_info{id = Temp}}
		  <- ReplayList]
    end,
    {NewLogs, DelLogs} = list_util:split(100,
					 [NewLogData | Logs]),
    [[big_world_lib:cast({big_world, Sid2},
			 combat_replay_mgr, dec_replay_reference, [Temp])
      || {_, #holiday_arena_team_log_info{id = Temp}}
	     <- ReplayListT]
     || #holiday_arena_team_log{atk_id = {_, Sid2},
				replay_list = ReplayListT}
	    <- DelLogs],
    ets:insert(holiday_arena_team_log,
	       #role_holiday_arena_team_log{id = RoleId,
					    list = NewLogs}),
    {noreply, State};
do_handle_info(_Info, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_arena_team_mgr670, _,
       {__Levelholiday_arena_team_mgr670,
	__Tracesholiday_arena_team_mgr670}}
	  when __Levelholiday_arena_team_mgr670 band 128 /= 0
		 orelse __Tracesholiday_arena_team_mgr670 /= [] ->
	  lager:do_log(debug,
		       [{module, holiday_arena_team_mgr},
			{function, do_handle_info}, {line, 670},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("被忽略的消息:~w", [_Info]), none, 4096, 128,
		       __Levelholiday_arena_team_mgr670,
		       __Tracesholiday_arena_team_mgr670, lager_event,
		       __Pidholiday_arena_team_mgr670);
      _ -> ok
    end,
    {noreply, State}.

do_init_data() ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_arena_team_mgr675, _,
       {__Levelholiday_arena_team_mgr675,
	__Tracesholiday_arena_team_mgr675}}
	  when __Levelholiday_arena_team_mgr675 band 64 /= 0
		 orelse __Tracesholiday_arena_team_mgr675 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_arena_team_mgr},
			{function, do_init_data}, {line, 675},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "活动组队竞技场清除旧数据", none, 4096, 64,
		       __Levelholiday_arena_team_mgr675,
		       __Tracesholiday_arena_team_mgr675, lager_event,
		       __Pidholiday_arena_team_mgr675);
      _ -> ok
    end,
    ets:delete_all_objects(holiday_arena_team_invite),
    ets:delete_all_objects(holiday_arena_team_rank),
    ets:delete_all_objects(holiday_arena_role_team),
    dets:delete_all_objects(holiday_arena_role_team),
    ets:delete_all_objects(holiday_arena_team_role),
    dets:delete_all_objects(holiday_arena_team_role),
    ets:delete_all_objects(holiday_arena_team_invite_join),
    dets:delete_all_objects(holiday_arena_team_invite_join),
    ets:delete_all_objects(holiday_arena_team_log),
    dets:delete_all_objects(holiday_arena_team_log),
    ok.

do_calc_data() ->
    RankList =
	arena_lib:list_rank(holiday_arena_team_data:get_const(team_people_number)),
    ets:insert(holiday_arena_team_other,
	       {init_role_data, RankList}),
    dets:insert(holiday_arena_team_other,
		{init_role_data, RankList}),
    put(do_init_role_data, RankList),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_arena_team_mgr694, _,
       {__Levelholiday_arena_team_mgr694,
	__Tracesholiday_arena_team_mgr694}}
	  when __Levelholiday_arena_team_mgr694 band 64 /= 0
		 orelse __Tracesholiday_arena_team_mgr694 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_arena_team_mgr},
			{function, do_calc_data}, {line, 694},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("活动组队竞技场开始初始化数据:~w", [length(RankList)]),
		       none, 4096, 64, __Levelholiday_arena_team_mgr694,
		       __Tracesholiday_arena_team_mgr694, lager_event,
		       __Pidholiday_arena_team_mgr694);
      _ -> ok
    end,
    util:set_ms_timer(do_init_role_data, util:rand(1, 200),
		      do_init_role_data).

get_end_time(Period) ->
    {_, EndTime} =
	holiday_arena_team_data:get_period_info(Period),
    date:parse_time(EndTime).

do_init() ->
    Fun = fun (#holiday_arena_team_role{id = RoleId,
					rank = Rank, score = Score,
					score_lev = ScoreLev,
					score_time = ScoreTime, power = Power},
	       Rank1) ->
		  case Rank > 0 of
		    true ->
			ets:insert(holiday_arena_team_rank,
				   #holiday_arena_team_rank{rank = Rank,
							    score = Score,
							    score_lev =
								ScoreLev,
							    id = RoleId,
							    power = Power,
							    score_time =
								ScoreTime});
		    _ -> skip
		  end,
		  max(Rank, Rank1)
	  end,
    ets:foldl(Fun, 0, holiday_arena_team_role) + 1.

update_rank(ArenaRole = #holiday_arena_team_role{rank =
						     0},
	    ChangeScore, State = #state{next_rank = NextRank}) ->
    {ok, #holiday_arena_team_role{rank = NewRank}} =
	do_update_rank(ArenaRole#holiday_arena_team_role{rank =
							     NextRank},
		       0),
    {noreply, State#state{next_rank = NextRank + 1}};
update_rank(ArenaRole = #holiday_arena_team_role{id =
						     RoleId,
						 name = Name, rank = OldRank},
	    ChangeScore, State = #state{next_rank = NextRank}) ->
    {ok, #holiday_arena_team_role{rank = NewRank}} =
	do_update_rank(ArenaRole, ChangeScore),
    NewNextRank = util:if_true(NewRank =:= 0, NextRank - 1,
			       NextRank),
    {noreply, State#state{next_rank = NewNextRank}}.

do_update_rank(ArenaRole = #holiday_arena_team_role{rank
							= 1,
						    id = RoleId2, power = Power,
						    score = Score2,
						    score_time = ScoreTime,
						    score_lev = ScoreLev},
	       ChangeScore)
    when ChangeScore >= 0 ->
    ets:insert(holiday_arena_team_role, ArenaRole),
    ets:insert(holiday_arena_team_rank,
	       #holiday_arena_team_rank{rank = 1, id = RoleId2,
					score = Score2, score_time = ScoreTime,
					score_lev = ScoreLev, power = Power}),
    put(holiday_arena_team_update_role,
	[RoleId2 | util:get(holiday_arena_team_update_role,
			    [])]),
    {ok, ArenaRole};
do_update_rank(ArenaRole = #holiday_arena_team_role{rank
							= Rank,
						    id = RoleId, score = Score,
						    score_lev = ScoreLev,
						    power = Power1,
						    score_time = ScoreTime1},
	       ChangeScore)
    when ChangeScore >= 0 ->
    case ets:lookup(holiday_arena_team_rank, Rank - 1) of
      [#holiday_arena_team_rank{id = RoleId2, score = Score2,
				score_lev = ScoreLev2, power = Power2,
				score_time = ScoreTime2}]
	  when Score > Score2 orelse
		 Score == Score2 andalso Power1 > Power2 ->
	  ets:insert(holiday_arena_team_rank,
		     #holiday_arena_team_rank{rank = Rank, id = RoleId2,
					      score = Score2,
					      score_lev = ScoreLev2,
					      power = Power2,
					      score_time = ScoreTime2}),
	  ets:update_element(holiday_arena_team_role, RoleId2,
			     {#holiday_arena_team_role.rank, Rank}),
	  put(holiday_arena_team_update_role,
	      [RoleId2 | util:get(holiday_arena_team_update_role,
				  [])]),
	  do_update_rank(ArenaRole#holiday_arena_team_role{rank =
							       Rank - 1},
			 ChangeScore);
      _ ->
	  ets:insert(holiday_arena_team_role, ArenaRole),
	  ets:insert(holiday_arena_team_rank,
		     #holiday_arena_team_rank{rank = Rank, id = RoleId,
					      score = Score,
					      score_lev = ScoreLev,
					      power = Power1,
					      score_time = ScoreTime1}),
	  put(holiday_arena_team_update_role,
	      [RoleId | util:get(holiday_arena_team_update_role,
				 [])]),
	  {ok, ArenaRole}
    end;
do_update_rank(ArenaRole = #holiday_arena_team_role{rank
							= Rank,
						    id = RoleId, score = Score,
						    score_lev = ScoreLev,
						    power = Power1,
						    score_time = ScoreTime1},
	       ChangeScore) ->
    case ets:lookup(holiday_arena_team_rank, Rank + 1) of
      [#holiday_arena_team_rank{id = RoleId2, score = Score2,
				score_lev = ScoreLev2, power = Power2,
				score_time = ScoreTime2}]
	  when Score < Score2 orelse
		 Score == Score2 andalso Power1 < Power2 ->
	  ets:insert(holiday_arena_team_rank,
		     #holiday_arena_team_rank{rank = Rank, id = RoleId2,
					      score = Score2,
					      score_lev = ScoreLev2,
					      power = Power2,
					      score_time = ScoreTime2}),
	  ets:update_element(holiday_arena_team_role, RoleId2,
			     {#holiday_arena_team_role.rank, Rank}),
	  put(holiday_arena_team_update_role,
	      [RoleId2 | util:get(holiday_arena_team_update_role,
				  [])]),
	  do_update_rank(ArenaRole#holiday_arena_team_role{rank =
							       Rank + 1},
			 ChangeScore);
      _ ->
	  ets:insert(holiday_arena_team_role, ArenaRole),
	  ets:insert(holiday_arena_team_rank,
		     #holiday_arena_team_rank{rank = Rank, id = RoleId,
					      score = Score,
					      score_lev = ScoreLev,
					      power = Power1,
					      score_time = ScoreTime1}),
	  put(holiday_arena_team_update_role,
	      [RoleId | util:get(holiday_arena_team_update_role,
				 [])]),
	  {ok, ArenaRole}
    end.

do_award() ->
    AwardRankList = lists:keysort(1,
				  holiday_arena_team_data:get_ward_ranks()),
    do_award(AwardRankList).

do_award([]) -> [];
do_award([{StartRank, EndRank, Award}
	  | AwardRankList]) ->
    case do_award(StartRank, EndRank, Award) of
      finish -> ok;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_arena_team_mgr764, _,
	     {__Levelholiday_arena_team_mgr764,
	      __Tracesholiday_arena_team_mgr764}}
		when __Levelholiday_arena_team_mgr764 band 64 /= 0
		       orelse __Tracesholiday_arena_team_mgr764 /= [] ->
		lager:do_log(info,
			     [{module, holiday_arena_team_mgr},
			      {function, do_award}, {line, 764},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("开始处理排行奖励发放~w",
					   [{StartRank, EndRank}]),
			     none, 4096, 64, __Levelholiday_arena_team_mgr764,
			     __Tracesholiday_arena_team_mgr764, lager_event,
			     __Pidholiday_arena_team_mgr764);
	    _ -> ok
	  end,
	  do_award(AwardRankList)
    end.

do_award(StartRank, EndRank, _Award)
    when StartRank > EndRank ->
    ok;
do_award(StartRank, EndRank, Award) ->
    case holiday_arena_team_db:rank_id(StartRank) of
      {ok, Id} ->
	  Title = lang:get(<<"协力段位赛排行奖励发放"/utf8>>),
	  {MailAssets, MailItems} =
	      format:split_assets_items(Award),
	  Content =
	      color:msg(lang:get(<<"亲爱的冒险者大人，您在本次的协力段位赛中取得了第~ts名的好成绩，以下是您的排名奖励，期待"
				   "您在下次的活动中取得更好的成绩！"/utf8>>),
			[{green, StartRank}]),
	  Mail = {Title, Content, MailAssets, MailItems,
		  util:fbin(<<"协力段位赛排行奖励发放"/utf8>>, [])},
	  mail:send(Id, Mail),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_arena_team_mgr776, _,
	     {__Levelholiday_arena_team_mgr776,
	      __Tracesholiday_arena_team_mgr776}}
		when __Levelholiday_arena_team_mgr776 band 64 /= 0
		       orelse __Tracesholiday_arena_team_mgr776 /= [] ->
		lager:do_log(info,
			     [{module, holiday_arena_team_mgr},
			      {function, do_award}, {line, 776},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("组队竞技场发放奖励:~w", [{StartRank, Id}]),
			     none, 4096, 64, __Levelholiday_arena_team_mgr776,
			     __Tracesholiday_arena_team_mgr776, lager_event,
			     __Pidholiday_arena_team_mgr776);
	    _ -> ok
	  end,
	  do_award(StartRank + 1, EndRank, Award);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_arena_team_mgr780, _,
	     {__Levelholiday_arena_team_mgr780,
	      __Tracesholiday_arena_team_mgr780}}
		when __Levelholiday_arena_team_mgr780 band 64 /= 0
		       orelse __Tracesholiday_arena_team_mgr780 /= [] ->
		lager:do_log(info,
			     [{module, holiday_arena_team_mgr},
			      {function, do_award}, {line, 780},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("开始处理排行奖励发放结束~w", [StartRank]), none,
			     4096, 64, __Levelholiday_arena_team_mgr780,
			     __Tracesholiday_arena_team_mgr780, lager_event,
			     __Pidholiday_arena_team_mgr780);
	    _ -> ok
	  end,
	  finish
    end.

do_init_rank(L2, Rank, MaxRank, L)
    when Rank > MaxRank ->
    L ++ L2;
do_init_rank([], _Rank, _MaxRank, L) -> L;
do_init_rank([Data | L2], Rank, MaxRank, L) ->
    NewData = Data#holiday_arena_team_role{rank = Rank},
    do_init_rank(L2, Rank, MaxRank, [NewData | L]).

calc_base_power([]) -> 0;
calc_base_power(L) ->
    L1 =
	lists:reverse(lists:keysort(#holiday_arena_team_role.power,
				    L)),
    {L2, _} = list_util:split(50, L1),
    {_, L3} = list_util:split(20, L2),
    AllPower = lists:sum([Power
			  || #holiday_arena_team_role{power = Power} <- L3]),
    AllNum = length(L3),
    case AllNum == 0 of
      true -> 0;
      _ ->
	  util:floor(AllPower / AllNum * 3 *
		       holiday_arena_team_data:get_const(team_effectiveness_coefficient))
    end.

get_base_power(Power) ->
    case ets:lookup(holiday_arena_team_other, base_power) of
      [{_, BasePower} | _] when BasePower > 0 -> BasePower;
      _ -> Power
    end.

calc_score(1, AScore, TarScore, ScoreLev, Power) ->
    BaseScore = max(1, get_base_power(Power)),
    PowerScore =
	holiday_arena_team_data:get_power_score(util:floor(util:abs(Power
								      -
								      BaseScore)
							     / BaseScore)),
    Arge1 =
	holiday_arena_team_data:get_const(team_score_constant1),
    Arge2 =
	holiday_arena_team_data:get_const(team_score_constant2),
    LevBaseScore =
	holiday_arena_team_data:get_score_lev_base_score(ScoreLev),
    Score1 = util:floor(max(TarScore - AScore + Arge1, 0) /
			  Arge2),
    Score = min(Score1 + LevBaseScore + PowerScore, 40),
    Score;
calc_score(_Result, AScore, TarScore, ScoreLev,
	   Power) ->
    Arge1 =
	holiday_arena_team_data:get_const(team_deduction_constant1),
    Arge2 =
	holiday_arena_team_data:get_const(team_deduction_constant2),
    Score1 = util:floor(max(AScore - TarScore + Arge1, 0) /
			  Arge2),
    BaseScore =
	holiday_arena_team_data:get_const(team_deduction_basics),
    Score = min(Score1 + BaseScore, 15),
    -Score.

calc_score_change(HolidayRole =
		      #holiday_arena_team_role{id = RoleId = {_, Sid},
					       score = Score,
					       score_lev = ScoreLev},
		  State, TarScore, Result, AllPower) ->
    AddScore = calc_score(Result, Score, TarScore, ScoreLev,
			  AllPower),
    NewScore = max(1000, Score + AddScore),
    NewScoreLev = holiday_arena_team_data:get_lev(NewScore),
    case NewScoreLev > ScoreLev of
      true ->
	  catch cluster_lib:cast(Sid, room_feat_mgr, info,
				 [{holiday_arena_team_lev_up, RoleId}]),
	  ok;
      _ -> skip
    end,
    cluster_lib:cast(Sid, holiday_arena_team_lib,
		     set_max_score, [RoleId, NewScore, NewScoreLev]),
    update_rank(HolidayRole#holiday_arena_team_role{score =
							NewScore,
						    score_lev = NewScoreLev,
						    score_time =
							date:unixtime()},
		AddScore, State).

do_calc_rank([], _Rank, L) -> L;
do_calc_rank([Data | L2], Rank, L) ->
    NewData = Data#holiday_arena_team_role{rank = Rank},
    do_calc_rank(L2, Rank + 1, [NewData | L]).

do_save_update() ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_arena_team_mgr854, _,
       {__Levelholiday_arena_team_mgr854,
	__Tracesholiday_arena_team_mgr854}}
	  when __Levelholiday_arena_team_mgr854 band 128 /= 0
		 orelse __Tracesholiday_arena_team_mgr854 /= [] ->
	  lager:do_log(debug,
		       [{module, holiday_arena_team_mgr},
			{function, do_save_update}, {line, 854},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("竞技场数据保存:~w",
				     [util:get(holiday_arena_team_update_role,
					       [])]),
		       none, 4096, 128, __Levelholiday_arena_team_mgr854,
		       __Tracesholiday_arena_team_mgr854, lager_event,
		       __Pidholiday_arena_team_mgr854);
      _ -> ok
    end,
    catch
      do_save_update(util:get(holiday_arena_team_update_role,
			      [])),
    erase(holiday_arena_team_update_role).

do_save_update([]) -> skip;
do_save_update([RoleId | T]) ->
    case ets:lookup(holiday_arena_team_role, RoleId) of
      [ArenaRole = #holiday_arena_team_role{} | _] ->
	  dets:insert(holiday_arena_team_role, ArenaRole);
      _ -> skip
    end,
    do_save_update(T).


