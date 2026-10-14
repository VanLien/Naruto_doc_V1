-file("data/c_arena_peak_champion_mgr.erl", 1).

-file("src/mod/arena_peak_champion/c_arena_peak_cham"
      "pion_mgr.erl",
      1).

-module(c_arena_peak_champion_mgr).

-lager_records([{state, [ts, timeout, switch, period]},
		{champion_result, [id, rank, cnum, win]},
		{champion_pk,
		 [id, step, round, group, score, is_guess, a_pos, a_id,
		  a_name, a_lev, a_gid, a_gname, a_face, a_avatar_id,
		  a_sex, a_plist, a_bet, a_power, a_max_power, a_robot_id,
		  a_formation_type, a_formation_lev, a_time, b_pos, b_id,
		  b_name, b_lev, b_gid, b_gname, b_face, b_avatar_id,
		  b_sex, b_plist, b_bet, b_power, b_max_power,
		  b_formation_type, b_formation_lev, b_robot_id, b_time,
		  ret, replay_id, diff_power, pk_rlist, a_sprite_lev,
		  a_sprites, b_sprite_lev, b_sprites, a_face_update_time,
		  a_face_file, b_face_update_time, b_face_file]},
		{champion_role_log, [id, logs]},
		{champion_bet_log, [id, rid, target, bet, get_bet]},
		{champion_bet, [id, bet, logs]},
		{champion_32_pk,
		 [pos, id, name, lev, face, sex, max_power, ret,
		  replay_id, face_update_time, face_file]},
		{arena_champion_rank,
		 [rank, id, old_rank, score, score_32]},
		{arena_champion_role,
		 [id, name, lev, sex, gid, gname, face, max_power, power,
		  lookid, old_rank, old_score, score, score_32, rank,
		  avatar_id, robot_id, group, group32, combat_num, win,
		  lose, time, face_update_time, face_file, match_id]},
		{champion_state,
		 [round, round_status, step, step_status,
		  step_status_time, state_start_time, state_end_time,
		  season_start_time, season_end_time]},
		{peak_champion_pk,
		 [id, step, round, group, score, is_guess, a_pos, a_id,
		  a_name, a_lev, a_face, a_avatar_id, a_sex, a_defense,
		  a_bet, a_power, a_robot_id, b_pos, b_id, b_name, b_lev,
		  b_face, b_avatar_id, b_sex, b_defense, b_bet, b_power,
		  b_robot_id, ret, result_info, diff_power, pk_rlist,
		  a_sprite_lev, a_sprites, a_sprite_attr, b_sprite_lev,
		  b_sprites, b_sprite_attr, a_face_update_time,
		  a_face_file, b_face_update_time, b_face_file,
		  a_sprites_list, b_sprites_list, a_break_groups,
		  b_break_groups]},
		{peak_champion_32_pk,
		 [pos, id, name, lev, face_id, avatar_bid, sex,
		  max_power, ret, ext]},
		{arena_peak_result_info,
		 [order, ret, time, round, a_end_hp, b_end_hp,
		  replay_info]},
		{arena_peak_role_partner,
		 [pos, id, bid, lev, star, break_lev, power, skin_id,
		  dower_skill, set_skill, attr, hurt, behurt, curt, ext]},
		{arena_peak_role_defense,
		 [order, formation_type, hallows_id, hallows_lev,
		  hallows_look_id, hallows_skill_lev, hallows_lucky,
		  hallows_seal, hallows_refine, hallows_all_look_ids,
		  power, plist]},
		{arena_peak_champion_role,
		 [id, name, lev, face_id, avatar_bid, sex, power,
		  defense, sprite_lev, sprites, sprites_attr, old_rank,
		  old_score, score, score_32, rank, robot_id, group,
		  group256, group64, combat_num, win, lose,
		  face_update_time, face_file, sprites_list,
		  break_groups]},
		{arena_peak_rank,
		 [rank, id, name, lev, face_id, avatar_bid, score, power,
		  sex, face_update_time, face_file]},
		{arena_peak_rank_info, [zone_id, list]},
		{c_arena_zone_info,
		 [zone_id, main_id, main_list, srv_lists, do_merge_lists,
		  num]},
		{m_arena_peak_champion,
		 [var, period, zone_id, old_periods, defense]},
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

-behaviour(gen_fsm).

-export([m/0, info/1, cast/1, call/1, start_link/0]).

-export([call_apply/1, apply/1]).

-export([continue/2, continue/3]).

-export([init/1, handle_event/3, handle_sync_event/4,
	 handle_info/3, terminate/3, code_change/4]).

-export([idle/2, check/2, check_close/2, ready/2,
	 open/2, close/2]).

-export([get_main_id/2]).

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

-file("src/mod/arena_peak_champion/c_arena_peak_cham"
      "pion_mgr.erl",
      25).

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

-file("src/mod/arena_peak_champion/c_arena_peak_cham"
      "pion_mgr.erl",
      26).

-file("inc/arena_peak_champion.hrl", 1).

-record(m_arena_peak_champion,
	{var = 2, period = 0, zone_id = 0, old_periods = [],
	 defense = []}).

-record(c_arena_zone_info,
	{zone_id = 0, main_id = <<>>, main_list = [],
	 srv_lists = [], do_merge_lists = [], num = 0}).

-record(arena_peak_rank_info,
	{zone_id = {0, 0}, list = 0}).

-record(arena_peak_rank,
	{rank = 0, id = {0, <<>>}, name = 0, lev = 0,
	 face_id = 0, avatar_bid = 0, score = 0, power = 0,
	 sex = 0, face_update_time = 0, face_file = <<>>}).

-record(arena_peak_champion_role,
	{id = {0, <<>>}, name = <<>>, lev = 0, face_id = 0,
	 avatar_bid = 0, sex = 0, power = 0, defense = [],
	 sprite_lev = 0, sprites = [], sprites_attr,
	 old_rank = 0, old_score = 0, score = 0, score_32 = 0,
	 rank = 0, robot_id = 0, group = 0, group256 = 0,
	 group64 = 0, combat_num = 0, win = 0, lose = 0,
	 face_update_time = 0, face_file = <<>>,
	 sprites_list = [], break_groups = []}).

-record(arena_peak_role_defense,
	{order = 0, formation_type = 1, hallows_id = 1,
	 hallows_lev = 0, hallows_look_id = 0,
	 hallows_skill_lev = 0, hallows_lucky = 0,
	 hallows_seal = 0, hallows_refine = 0,
	 hallows_all_look_ids = [], power = 0, plist = []}).

-record(arena_peak_role_partner,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, skin_id = 0, dower_skill = [],
	 set_skill = [], attr, hurt = 0, behurt = 0, curt = 0,
	 ext = #{}}).

-record(arena_peak_result_info,
	{order = 0, ret = 0, time = 0, round = 0, a_end_hp = 0,
	 b_end_hp = 0, replay_info = {0, <<>>}}).

-record(peak_champion_32_pk,
	{pos = 0, id = {0, <<>>}, name = <<>>, lev = 0,
	 face_id = 0, avatar_bid = 0, sex = 0, max_power = 0,
	 ret = 0, ext = []}).

-record(peak_champion_pk,
	{id = 0, step = 0, round = 0, group = 0, score = 0,
	 is_guess = 1, a_pos = 0, a_id = {0, <<>>},
	 a_name = <<>>, a_lev = 0, a_face = 0, a_avatar_id = 0,
	 a_sex = 0, a_defense = [], a_bet = 0, a_power = 0,
	 a_robot_id = 0, b_pos = 0, b_id = {0, <<>>},
	 b_name = <<>>, b_lev = 0, b_face = 0, b_avatar_id = 0,
	 b_sex = 0, b_defense = [], b_bet = 0, b_power = 0,
	 b_robot_id = 0, ret = 0, result_info = [],
	 diff_power = 0, pk_rlist = [], a_sprite_lev = 0,
	 a_sprites = [], a_sprite_attr, b_sprite_lev = 0,
	 b_sprites = [], b_sprite_attr, a_face_update_time = 0,
	 a_face_file = <<>>, b_face_update_time = 0,
	 b_face_file = <<>>, a_sprites_list = [],
	 b_sprites_list = [], a_break_groups = [],
	 b_break_groups = []}).

-file("src/mod/arena_peak_champion/c_arena_peak_cham"
      "pion_mgr.erl",
      27).

-file("inc/arena_champion.hrl", 1).

-record(champion_state,
	{round = 0, round_status = 0, step = 0, step_status = 0,
	 step_status_time = 0, state_start_time = 0,
	 state_end_time = 0, season_start_time = 0,
	 season_end_time = 0}).

-record(arena_champion_role,
	{id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, max_power = 0,
	 power = 0, lookid = 0, old_rank = 0, old_score = 0,
	 score = 0, score_32 = 0, rank = 0, avatar_id = 0,
	 robot_id = 0, group = 0, group32 = 0, combat_num = 0,
	 win = 0, lose = 0, time = 0, face_update_time = 0,
	 face_file = <<>>, match_id = {0, <<>>}}).

-record(arena_champion_rank,
	{rank = 0, id = {0, <<>>}, old_rank = 0, score = 0,
	 score_32 = 0}).

-record(champion_32_pk,
	{pos = 0, id = {0, <<>>}, name = <<>>, lev = 0,
	 face = 0, sex = 0, max_power = 0, ret = 0,
	 replay_id = 0, face_update_time = 0, face_file = <<>>}).

-record(champion_bet,
	{id = {0, <<>>}, bet = 0, logs = []}).

-record(champion_bet_log,
	{id = 0, rid = {0, <<>>}, target = 1, bet = 0,
	 get_bet = 0}).

-record(champion_role_log, {id = {0, <<>>}, logs = []}).

-record(champion_pk,
	{id = 0, step = 0, round = 0, group = 0, score = 0,
	 is_guess = 1, a_pos = 0, a_id = {0, <<>>},
	 a_name = <<>>, a_lev = 0, a_gid = {0, <<>>},
	 a_gname = <<>>, a_face = 0, a_avatar_id = 0, a_sex = 0,
	 a_plist = [], a_bet = 0, a_power = 0, a_max_power = 0,
	 a_robot_id = 0, a_formation_type = 1,
	 a_formation_lev = 1, a_time = 0, b_pos = 0,
	 b_id = {0, <<>>}, b_name = <<>>, b_lev = 0,
	 b_gid = {0, <<>>}, b_gname = <<>>, b_face = 0,
	 b_avatar_id = 0, b_sex = 0, b_plist = [], b_bet = 0,
	 b_power = 0, b_max_power = 0, b_formation_type = 1,
	 b_formation_lev = 1, b_robot_id = 0, b_time = 0,
	 ret = 0, replay_id = 0, diff_power = 0, pk_rlist = [],
	 a_sprite_lev = 0, a_sprites = [], b_sprite_lev = 0,
	 b_sprites = [], a_face_update_time = 0,
	 a_face_file = <<>>, b_face_update_time = 0,
	 b_face_file = <<>>}).

-record(champion_result,
	{id = {0, <<>>}, rank = 0, cnum = 0, win = 0}).

-file("src/mod/arena_peak_champion/c_arena_peak_cham"
      "pion_mgr.erl",
      28).

-record(state,
	{ts = 0, timeout = 0, switch = open, period = 1}).

get_main_id(Sids, Period) when is_list(Sids) ->
    [get_main_id(Sid, Period) || Sid <- Sids];
get_main_id(Sid, Period) ->
    ZoneId = get_zone_id(Sid, Period),
    case ets:lookup(c_arena_peak_champion_zone, ZoneId) of
      [#c_arena_zone_info{main_id = MainId} | _] ->
	  {Sid, ZoneId, MainId};
      _ -> {Sid, ZoneId, Sid}
    end.

get_zone_id(Sid, Period) ->
    case ets:lookup(c_arena_peak_champion_srv_zone,
		    {Sid, Period})
	of
      [{_, ZoneId} | _] -> ZoneId;
      _ ->
	  case ets:info(c_arena_peak_champion_zone, size) of
	    Num when is_integer(Num) ->
		info({srv_join, Sid, Num, Period}), Num;
	    _ -> 0
	  end
    end.

-spec m() -> ok.

m() ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_peak_champion_mgr59, _,
       {__Levelc_arena_peak_champion_mgr59,
	__Tracesc_arena_peak_champion_mgr59}}
	  when __Levelc_arena_peak_champion_mgr59 band 64 /= 0
		 orelse __Tracesc_arena_peak_champion_mgr59 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_peak_champion_mgr}, {function, m},
			{line, 59}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "Có người bước vào giai đoạn tiếp theo", none, 4096, 64,
		       __Levelc_arena_peak_champion_mgr59,
		       __Tracesc_arena_peak_champion_mgr59, lager_event,
		       __Pidc_arena_peak_champion_mgr59);
      _ -> ok
    end,
    gen_fsm:send_event(c_arena_peak_champion_mgr, timeout).

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> c_arena_peak_champion_mgr ! Info.

cast(Event) ->
    gen_fsm:send_all_state_event(c_arena_peak_champion_mgr,
				 Event).

call(Event) ->
    case catch
	   gen_fsm:sync_send_all_state_event(c_arena_peak_champion_mgr,
					     Event, 10000)
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
	    {__Pidc_arena_peak_champion_mgr80, _,
	     {__Levelc_arena_peak_champion_mgr80,
	      __Tracesc_arena_peak_champion_mgr80}}
		when __Levelc_arena_peak_champion_mgr80 band 8 /= 0
		       orelse __Tracesc_arena_peak_champion_mgr80 /= [] ->
		lager:do_log(error,
			     [{module, c_arena_peak_champion_mgr},
			      {function, call}, {line, 80},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [c_arena_peak_champion_mgr, Event,
					    10000, erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelc_arena_peak_champion_mgr80,
			     __Tracesc_arena_peak_champion_mgr80, lager_event,
			     __Pidc_arena_peak_champion_mgr80);
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
    gen_fsm:start_link({local, c_arena_peak_champion_mgr},
		       c_arena_peak_champion_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_peak_champion_mgr86, _,
       {__Levelc_arena_peak_champion_mgr86,
	__Tracesc_arena_peak_champion_mgr86}}
	  when __Levelc_arena_peak_champion_mgr86 band 64 /= 0
		 orelse __Tracesc_arena_peak_champion_mgr86 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_peak_champion_mgr}, {function, init},
			{line, 86}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "Bắt đầu khởi động", none, 4096, 64,
		       __Levelc_arena_peak_champion_mgr86,
		       __Tracesc_arena_peak_champion_mgr86, lager_event,
		       __Pidc_arena_peak_champion_mgr86);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    d_ets_lib:new_d_ets(c_arena_peak_champion_zone,
			"dets/c_arena_peak_champion_zone.dets",
			#c_arena_zone_info.zone_id, set),
    d_ets_lib:load_dets_to_ets(c_arena_peak_champion_zone,
			       undefined),
    Fun = fun (#c_arena_zone_info{zone_id = ZoneId,
				  main_id = MainId},
	       Acc) ->
		  [{ZoneId, MainId} | Acc]
	  end,
    MainInfo = ets:foldl(Fun, [],
			 c_arena_peak_champion_zone),
    put(c_arena_peak_champion_zone_main_id, MainInfo),
    d_ets_lib:new_d_ets(c_arena_peak_champion_srv_zone,
			"dets/c_arena_peak_champion_srv_zone.dets", 1, set),
    d_ets_lib:load_dets_to_ets(c_arena_peak_champion_srv_zone,
			       undefined),
    d_ets_lib:new_d_ets(c_arena_peak_champion_srv_info,
			"dets/c_arena_peak_champion_srv_info.dets", 1, set),
    d_ets_lib:load_dets_to_ets(c_arena_peak_champion_srv_info,
			       undefined),
    d_ets_lib:new_d_ets(c_arena_peak_champion_group_info,
			"dets/c_arena_peak_champion_group_info.dets", 1, set),
    d_ets_lib:load_dets_to_ets(c_arena_peak_champion_group_info,
			       undefined),
    d_ets_lib:new_d_ets(c_arena_peak_champion_period_info,
			"dets/c_arena_peak_champion_period_info.dets", 1, set),
    d_ets_lib:load_dets_to_ets(c_arena_peak_champion_period_info,
			       undefined),
    put(c_arena_peak_champion_period_info,
	ets:tab2list(c_arena_peak_champion_period_info)),
    d_ets_lib:new_d_ets(c_arena_peak_champion_old_rank,
			"dets/c_arena_peak_champion_old_rank.dets", 1, set),
    d_ets_lib:load_dets_to_ets(c_arena_peak_champion_old_rank,
			       undefined),
    Ms = date:unixtime(ms),
    {Ts, TimeOut, NewPeriod, Switch} = case
					 sys_env:get(c_arena_peak_champion_state)
					   of
					 {TsT, TimeOutT, NewPeriodT, StateT} ->
					     {TsT, TimeOutT, NewPeriodT,
					      StateT};
					 _ ->
					     {Week, H, M} =
						 arena_peak_champion_data:get_constant(season_start),
					     TimeOutT =
						 date:week_next_diff([Week],
								     {H, M, 0})
						   - 10 * 60
						   - 10 * 60,
					     {Ms, TimeOutT * 1000, 0, idle}
				       end,
    sys_env:save(c_arena_peak_champion_state,
		 {Ts, TimeOut, NewPeriod, Switch}),
    State = #state{ts = Ts, timeout = TimeOut,
		   switch = Switch, period = NewPeriod},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_peak_champion_mgr131, _,
       {__Levelc_arena_peak_champion_mgr131,
	__Tracesc_arena_peak_champion_mgr131}}
	  when __Levelc_arena_peak_champion_mgr131 band 64 /= 0
		 orelse __Tracesc_arena_peak_champion_mgr131 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_peak_champion_mgr}, {function, init},
			{line, 131}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "Khởi động hoàn tất", none, 4096, 64,
		       __Levelc_arena_peak_champion_mgr131,
		       __Tracesc_arena_peak_champion_mgr131, lager_event,
		       __Pidc_arena_peak_champion_mgr131);
      _ -> ok
    end,
    {ok, Switch, State, max(1, Ts + TimeOut - Ms)}.

handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(Request, From, StateName, State) ->
    case catch do_handle_sync_event(Request, From,
				    StateName, State)
	of
      {reply, Reply, NewStateName, NewState} ->
	  continue(NewStateName, Reply, NewState);
      _Reason ->
	  server_monitor:error_log({2,
				    <<"Ngoại lệ xử lý hệ thống"/utf8>>,
				    util:fbin(<<"Có một ngoại lệ trong quá trình xử lý "
						"hệ thống [~w] bạn cần lên mạng ngay "
						"để kiểm tra và xử lý."/utf8>>,
					      [Request]),
				    c_arena_peak_champion_mgr, 143, _Reason}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_arena_peak_champion_mgr144, _,
	     {__Levelc_arena_peak_champion_mgr144,
	      __Tracesc_arena_peak_champion_mgr144}}
		when __Levelc_arena_peak_champion_mgr144 band 8 /= 0
		       orelse __Tracesc_arena_peak_champion_mgr144 /= [] ->
		lager:do_log(error,
			     [{module, c_arena_peak_champion_mgr},
			      {function, handle_sync_event}, {line, 144},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("Lỗi xử lý tin nhắn máy trạng thái, thông "
					   "tin:~w, tình trạng:~w, ~w",
					   [Request, StateName, _Reason]),
			     none, 4096, 8, __Levelc_arena_peak_champion_mgr144,
			     __Tracesc_arena_peak_champion_mgr144, lager_event,
			     __Pidc_arena_peak_champion_mgr144);
	    _ -> ok
	  end,
	  continue(StateName,
		   {false, lang:get(<<"Lỗi thực thi"/utf8>>)}, State)
    end.

handle_info(Info, StateName, State) ->
    case catch do_handle_info(Info, StateName, State) of
      {noreply, NewStateName, NewState} ->
	  continue(NewStateName, NewState);
      _Reason ->
	  server_monitor:error_log({2,
				    <<"Ngoại lệ xử lý hệ thống"/utf8>>,
				    util:fbin(<<"Có một ngoại lệ trong quá trình xử lý "
						"hệ thống [~w] bạn cần lên mạng ngay "
						"để kiểm tra và xử lý."/utf8>>,
					      [Info]),
				    c_arena_peak_champion_mgr, 153, _Reason}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_arena_peak_champion_mgr154, _,
	     {__Levelc_arena_peak_champion_mgr154,
	      __Tracesc_arena_peak_champion_mgr154}}
		when __Levelc_arena_peak_champion_mgr154 band 8 /= 0
		       orelse __Tracesc_arena_peak_champion_mgr154 /= [] ->
		lager:do_log(error,
			     [{module, c_arena_peak_champion_mgr},
			      {function, handle_info}, {line, 154},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("Lỗi xử lý tin nhắn máy trạng thái, 消息:~w, "
					   "状态:~w, ~w",
					   [Info, StateName, _Reason]),
			     none, 4096, 8, __Levelc_arena_peak_champion_mgr154,
			     __Tracesc_arena_peak_champion_mgr154, lager_event,
			     __Pidc_arena_peak_champion_mgr154);
	    _ -> ok
	  end,
	  continue(StateName, State)
    end.

terminate(_Reason, _StateName, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_peak_champion_mgr159, _,
       {__Levelc_arena_peak_champion_mgr159,
	__Tracesc_arena_peak_champion_mgr159}}
	  when __Levelc_arena_peak_champion_mgr159 band 64 /= 0
		 orelse __Tracesc_arena_peak_champion_mgr159 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_peak_champion_mgr},
			{function, terminate}, {line, 159},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "Bắt đầu đóng", none, 4096, 64,
		       __Levelc_arena_peak_champion_mgr159,
		       __Tracesc_arena_peak_champion_mgr159, lager_event,
		       __Pidc_arena_peak_champion_mgr159);
      _ -> ok
    end,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_peak_champion_mgr160, _,
       {__Levelc_arena_peak_champion_mgr160,
	__Tracesc_arena_peak_champion_mgr160}}
	  when __Levelc_arena_peak_champion_mgr160 band 64 /= 0
		 orelse __Tracesc_arena_peak_champion_mgr160 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_peak_champion_mgr},
			{function, terminate}, {line, 160},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "Đóng hoàn thành", none, 4096, 64,
		       __Levelc_arena_peak_champion_mgr160,
		       __Tracesc_arena_peak_champion_mgr160, lager_event,
		       __Pidc_arena_peak_champion_mgr160);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

do_handle_sync_event(_Request, _From, StateName,
		     State) ->
    {reply, ok, StateName, State}.

do_handle_info({sys_rank_data, Sid, Ranks}, StateName,
	       State = #state{period = Period}) ->
    ZoneId = get_zone_id(Sid, Period),
    ets:insert(c_arena_peak_champion_old_rank,
	       {{Period, ZoneId}, Ranks}),
    dets:insert(c_arena_peak_champion_old_rank,
		{{Period, ZoneId}, Ranks}),
    {noreply, StateName, State};
do_handle_info(update_process_data, StateName, State) ->
    Fun = fun (#c_arena_zone_info{zone_id = ZoneId,
				  main_id = MainId},
	       Acc) ->
		  [{ZoneId, MainId} | Acc]
	  end,
    MainInfo = ets:foldl(Fun, [],
			 c_arena_peak_champion_zone),
    put(c_arena_peak_champion_zone_main_id, MainInfo),
    {noreply, StateName, State};
do_handle_info(gm_close, StateName, _State) ->
    ets:delete_all_objects(c_arena_peak_champion_group_info),
    dets:delete_all_objects(c_arena_peak_champion_group_info),
    ets:delete_all_objects(c_arena_peak_champion_srv_info),
    dets:delete_all_objects(c_arena_peak_champion_srv_info),
    ets:delete_all_objects(c_arena_peak_champion_srv_zone),
    dets:delete_all_objects(c_arena_peak_champion_srv_zone),
    ets:delete_all_objects(c_arena_peak_champion_zone),
    dets:delete_all_objects(c_arena_peak_champion_zone),
    ets:delete_all_objects(c_arena_peak_champion_period_info),
    dets:delete_all_objects(c_arena_peak_champion_period_info),
    erase(c_arena_peak_champion_period_info),
    erase(c_arena_peak_champion_zone_main_id),
    Ts = date:unixtime(ms),
    {Week, H, M} =
	arena_peak_champion_data:get_constant(season_start),
    TimeOut = date:week_next_diff([Week], {H, M, 0}) -
		10 * 60
		- 10 * 60,
    NState = #state{ts = Ts, timeout = TimeOut * 1000,
		    switch = idle, period = 0},
    sys_env:save(c_arena_peak_champion_state,
		 {Ts, TimeOut, 0, idle}),
    {noreply, idle, NState};
do_handle_info({update_all_period_info, SrvId, Sids,
		Pid},
	       StateName, State = #state{period = Period}) ->
    L = util:get(c_arena_peak_champion_period_info, []),
    ZoneInfo = [{Sid, get_zone_id(Sid, Period)}
		|| Sid <- Sids],
    MainInfo = util:get(c_arena_peak_champion_zone_main_id,
			[]),
    MainSrvList = case lists:keyfind(SrvId, 2, MainInfo) of
		    {ZoneId, _} ->
			case ets:lookup(c_arena_peak_champion_zone, ZoneId) of
			  [#c_arena_zone_info{srv_lists = Temp} | _] -> Temp;
			  _ -> Sids
			end;
		    _ -> Sids
		  end,
    del_merge_srv(SrvId, Period),
    Pid !
      {update_all_period_info, L, ZoneInfo, MainInfo,
       MainSrvList},
    {noreply, StateName, State};
do_handle_info({check_merge_srvs, Sids}, StateName,
	       State = #state{period = Period}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_peak_champion_mgr227, _,
       {__Levelc_arena_peak_champion_mgr227,
	__Tracesc_arena_peak_champion_mgr227}}
	  when __Levelc_arena_peak_champion_mgr227 band 64 /= 0
		 orelse __Tracesc_arena_peak_champion_mgr227 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_peak_champion_mgr},
			{function, do_handle_info}, {line, 227},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("Thử nghiệm hợp nhất máy chủ trận đấu "
				     "đỉnh cao, tổng số máy chủ trong lần "
				     "hợp nhất này:~w",
				     [length(Sids)]),
		       none, 4096, 64, __Levelc_arena_peak_champion_mgr227,
		       __Tracesc_arena_peak_champion_mgr227, lager_event,
		       __Pidc_arena_peak_champion_mgr227);
      _ -> ok
    end,
    MainInfo = util:get(c_arena_peak_champion_zone_main_id,
			[]),
    MergeZoneId = [Sid
		   || Sid <- Sids, lists:keymember(Sid, 2, MainInfo)],
    Fun = fun (Sid, Acc) ->
		  case lists:keyfind(Sid, 2, MainInfo) of
		    {ZoneId, Sid} ->
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
			  {__Pidc_arena_peak_champion_mgr233, _,
			   {__Levelc_arena_peak_champion_mgr233,
			    __Tracesc_arena_peak_champion_mgr233}}
			      when __Levelc_arena_peak_champion_mgr233 band 64
				     /= 0
				     orelse
				     __Tracesc_arena_peak_champion_mgr233 /=
				       [] ->
			      lager:do_log(info,
					   [{module, c_arena_peak_champion_mgr},
					    {function, do_handle_info},
					    {line, 233},
					    {pid, pid_to_list(self())},
					    {node, node()}
					    | lager:md()],
					   io_lib:format("Quá trình gộp server đỉnh cao, server "
							 "chính của khu vực thi đấu sẽ được gộp "
							 "lại, các bạn chú ý nhé:~w, ~s",
							 [ZoneId, Sid]),
					   none, 4096, 64,
					   __Levelc_arena_peak_champion_mgr233,
					   __Tracesc_arena_peak_champion_mgr233,
					   lager_event,
					   __Pidc_arena_peak_champion_mgr233);
			  _ -> ok
			end,
			case ets:lookup(c_arena_peak_champion_zone, ZoneId) of
			  [Zone = #c_arena_zone_info{srv_lists = SrvList,
						     main_id = Sid,
						     do_merge_lists = L}
			   | _] ->
			      case [SrvId1
				    || SrvId1 <- SrvList,
				       not lists:member(SrvId1, Sids ++ L)
					 andalso not is_main(SrvId1)]
				  of
				[NewMainSrvId | _] ->
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
				      {__Pidc_arena_peak_champion_mgr238, _,
				       {__Levelc_arena_peak_champion_mgr238,
					__Tracesc_arena_peak_champion_mgr238}}
					  when
					    __Levelc_arena_peak_champion_mgr238
					      band 64
					      /= 0
					      orelse
					      __Tracesc_arena_peak_champion_mgr238
						/= [] ->
					  lager:do_log(info,
						       [{module,
							 c_arena_peak_champion_mgr},
							{function,
							 do_handle_info},
							{line, 238},
							{pid,
							 pid_to_list(self())},
							{node, node()}
							| lager:md()],
						       io_lib:format("Máy chủ chính của Peak Division đã được "
								     "sáp nhập và máy chủ chính mới đã được:~w, "
								     "~s, ~s",
								     [ZoneId,
								      Sid,
								      NewMainSrvId]),
						       none, 4096, 64,
						       __Levelc_arena_peak_champion_mgr238,
						       __Tracesc_arena_peak_champion_mgr238,
						       lager_event,
						       __Pidc_arena_peak_champion_mgr238);
				      _ -> ok
				    end,
				    [{Sid, ZoneId, ok} | Acc];
				_ ->
				    case [SrvId1
					  || SrvId1 <- SrvList,
					     not lists:member(SrvId1, Sids)
					       andalso not is_main(SrvId1)]
					of
				      [NewMainSrvId | _] ->
					  case {whereis(lager_event),
						whereis(lager_event),
						lager_config:get({lager_event,
								  loglevel},
								 {0, []})}
					      of
					    {undefined, undefined, _} ->
						fun () ->
							{error,
							 lager_not_running}
						end();
					    {undefined, _, _} ->
						fun () ->
							{error,
							 {sink_not_configured,
							  lager_event}}
						end();
					    {__Pidc_arena_peak_champion_mgr243,
					     _,
					     {__Levelc_arena_peak_champion_mgr243,
					      __Tracesc_arena_peak_champion_mgr243}}
						when
						  __Levelc_arena_peak_champion_mgr243
						    band 64
						    /= 0
						    orelse
						    __Tracesc_arena_peak_champion_mgr243
						      /= [] ->
						lager:do_log(info,
							     [{module,
							       c_arena_peak_champion_mgr},
							      {function,
							       do_handle_info},
							      {line, 243},
							      {pid,
							       pid_to_list(self())},
							      {node, node()}
							      | lager:md()],
							     io_lib:format("Máy chủ chính của Peak Division đã được "
									   "sáp nhập và máy chủ chính mới đã được:~w, "
									   "~s, ~s",
									   [ZoneId,
									    Sid,
									    NewMainSrvId]),
							     none, 4096, 64,
							     __Levelc_arena_peak_champion_mgr243,
							     __Tracesc_arena_peak_champion_mgr243,
							     lager_event,
							     __Pidc_arena_peak_champion_mgr243);
					    _ -> ok
					  end,
					  [{Sid, ZoneId, ok} | Acc];
				      _ ->
					  case {whereis(lager_event),
						whereis(lager_event),
						lager_config:get({lager_event,
								  loglevel},
								 {0, []})}
					      of
					    {undefined, undefined, _} ->
						fun () ->
							{error,
							 lager_not_running}
						end();
					    {undefined, _, _} ->
						fun () ->
							{error,
							 {sink_not_configured,
							  lager_event}}
						end();
					    {__Pidc_arena_peak_champion_mgr246,
					     _,
					     {__Levelc_arena_peak_champion_mgr246,
					      __Tracesc_arena_peak_champion_mgr246}}
						when
						  __Levelc_arena_peak_champion_mgr246
						    band 64
						    /= 0
						    orelse
						    __Tracesc_arena_peak_champion_mgr246
						      /= [] ->
						lager:do_log(info,
							     [{module,
							       c_arena_peak_champion_mgr},
							      {function,
							       do_handle_info},
							      {line, 246},
							      {pid,
							       pid_to_list(self())},
							      {node, node()}
							      | lager:md()],
							     io_lib:format("Nếu máy chủ chính của Peak Division "
									   "được hợp nhất, việc hợp nhất các máy "
									   "chủ sẽ không được khuyến khích.:~w, "
									   "~s",
									   [ZoneId,
									    Sid]),
							     none, 4096, 64,
							     __Levelc_arena_peak_champion_mgr246,
							     __Tracesc_arena_peak_champion_mgr246,
							     lager_event,
							     __Pidc_arena_peak_champion_mgr246);
					    _ -> ok
					  end,
					  [{Sid, ZoneId, false} | Acc]
				    end
			      end
			end;
		    _ -> Acc
		  end
	  end,
    case [{Sid, ZoneId}
	  || {Sid, ZoneId, false} <- lists:foldl(Fun, [], Sids)]
	of
      [] ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_arena_peak_champion_mgr257, _,
	     {__Levelc_arena_peak_champion_mgr257,
	      __Tracesc_arena_peak_champion_mgr257}}
		when __Levelc_arena_peak_champion_mgr257 band 64 /= 0
		       orelse __Tracesc_arena_peak_champion_mgr257 /= [] ->
		lager:do_log(info,
			     [{module, c_arena_peak_champion_mgr},
			      {function, do_handle_info}, {line, 257},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("Việc sáp nhập máy chủ này có thể thực "
					   "hiện được:~w",
					   [MergeZoneId]),
			     none, 4096, 64,
			     __Levelc_arena_peak_champion_mgr257,
			     __Tracesc_arena_peak_champion_mgr257, lager_event,
			     __Pidc_arena_peak_champion_mgr257);
	    _ -> ok
	  end;
      L ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_arena_peak_champion_mgr259, _,
	     {__Levelc_arena_peak_champion_mgr259,
	      __Tracesc_arena_peak_champion_mgr259}}
		when __Levelc_arena_peak_champion_mgr259 band 64 /= 0
		       orelse __Tracesc_arena_peak_champion_mgr259 /= [] ->
		lager:do_log(info,
			     [{module, c_arena_peak_champion_mgr},
			      {function, do_handle_info}, {line, 259},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("Việc sáp nhập máy chủ này là không khả "
					   "thi. Sẽ không có máy chủ chính ở các "
					   "khu vực sau:~w",
					   [L]),
			     none, 4096, 64,
			     __Levelc_arena_peak_champion_mgr259,
			     __Tracesc_arena_peak_champion_mgr259, lager_event,
			     __Pidc_arena_peak_champion_mgr259);
	    _ -> ok
	  end
    end,
    {noreply, StateName, State};
do_handle_info({merge_srv_id, Sid}, StateName,
	       State = #state{period = Period}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_peak_champion_mgr264, _,
       {__Levelc_arena_peak_champion_mgr264,
	__Tracesc_arena_peak_champion_mgr264}}
	  when __Levelc_arena_peak_champion_mgr264 band 64 /= 0
		 orelse __Tracesc_arena_peak_champion_mgr264 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_peak_champion_mgr},
			{function, do_handle_info}, {line, 264},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("Xử lý sáp nhập máy chủ cạnh tranh đỉnh "
				     "cao:~w",
				     [Sid]),
		       none, 4096, 64, __Levelc_arena_peak_champion_mgr264,
		       __Tracesc_arena_peak_champion_mgr264, lager_event,
		       __Pidc_arena_peak_champion_mgr264);
      _ -> ok
    end,
    put(merge_list, [Sid | util:get(merge_list, [])]),
    MainInfo = util:get(c_arena_peak_champion_zone_main_id,
			[]),
    case lists:keyfind(Sid, 2, MainInfo) of
      {ZoneId, Sid} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_arena_peak_champion_mgr270, _,
	     {__Levelc_arena_peak_champion_mgr270,
	      __Tracesc_arena_peak_champion_mgr270}}
		when __Levelc_arena_peak_champion_mgr270 band 64 /= 0
		       orelse __Tracesc_arena_peak_champion_mgr270 /= [] ->
		lager:do_log(info,
			     [{module, c_arena_peak_champion_mgr},
			      {function, do_handle_info}, {line, 270},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("Quá trình gộp server đỉnh cao, server "
					   "chính đã được gộp:~w",
					   [{Sid, ZoneId}]),
			     none, 4096, 64,
			     __Levelc_arena_peak_champion_mgr270,
			     __Tracesc_arena_peak_champion_mgr270, lager_event,
			     __Pidc_arena_peak_champion_mgr270);
	    _ -> ok
	  end,
	  util:set_ms_timer({do_merge_zone_id, ZoneId}, 60000,
			    {do_merge_zone_id, ZoneId, Sid});
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_arena_peak_champion_mgr273, _,
	     {__Levelc_arena_peak_champion_mgr273,
	      __Tracesc_arena_peak_champion_mgr273}}
		when __Levelc_arena_peak_champion_mgr273 band 64 /= 0
		       orelse __Tracesc_arena_peak_champion_mgr273 /= [] ->
		lager:do_log(info,
			     [{module, c_arena_peak_champion_mgr},
			      {function, do_handle_info}, {line, 273},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("Cách gộp server thi đấu đỉnh cao: không "
					   "phải server chính~w",
					   [Sid]),
			     none, 4096, 64,
			     __Levelc_arena_peak_champion_mgr273,
			     __Tracesc_arena_peak_champion_mgr273, lager_event,
			     __Pidc_arena_peak_champion_mgr273);
	    _ -> ok
	  end,
	  skip
    end,
    add_merge_srv(Sid, Period),
    {noreply, StateName, State};
do_handle_info({do_merge_zone_id, ZoneId, Sid},
	       StateName, State = #state{period = Period}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_peak_champion_mgr279, _,
       {__Levelc_arena_peak_champion_mgr279,
	__Tracesc_arena_peak_champion_mgr279}}
	  when __Levelc_arena_peak_champion_mgr279 band 64 /= 0
		 orelse __Tracesc_arena_peak_champion_mgr279 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_peak_champion_mgr},
			{function, do_handle_info}, {line, 279},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("Máy chủ chính của Peak Division đã được "
				     "sáp nhập:~w",
				     [{Period, Sid, ZoneId}]),
		       none, 4096, 64, __Levelc_arena_peak_champion_mgr279,
		       __Tracesc_arena_peak_champion_mgr279, lager_event,
		       __Pidc_arena_peak_champion_mgr279);
      _ -> ok
    end,
    DayMergeList = util:get(merge_list, []),
    case ets:lookup(c_arena_peak_champion_zone, ZoneId) of
      [Zone = #c_arena_zone_info{srv_lists = SrvList,
				 main_id = Sid, do_merge_lists = L}
       | _] ->
	  NewSrvList = [SrvId1
			|| SrvId1 <- SrvList,
			   not lists:member(SrvId1, DayMergeList ++ L) andalso
			     not is_main(SrvId1)],
	  case NewSrvList of
	    [NewMainSrvId | _] ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidc_arena_peak_champion_mgr286, _,
		   {__Levelc_arena_peak_champion_mgr286,
		    __Tracesc_arena_peak_champion_mgr286}}
		      when __Levelc_arena_peak_champion_mgr286 band 64 /= 0
			     orelse
			     __Tracesc_arena_peak_champion_mgr286 /= [] ->
		      lager:do_log(info,
				   [{module, c_arena_peak_champion_mgr},
				    {function, do_handle_info}, {line, 286},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("Máy chủ chính của Peak Division đã được "
						 "sáp nhập và máy chủ chính mới đã được:~w",
						 [{Period, Sid, ZoneId,
						   NewMainSrvId}]),
				   none, 4096, 64,
				   __Levelc_arena_peak_champion_mgr286,
				   __Tracesc_arena_peak_champion_mgr286,
				   lager_event,
				   __Pidc_arena_peak_champion_mgr286);
		  _ -> ok
		end,
		NewZone = Zone#c_arena_zone_info{main_id =
						     NewMainSrvId},
		ets:insert(c_arena_peak_champion_zone, NewZone),
		dets:insert(c_arena_peak_champion_zone, NewZone),
		cluster_lib:cast(Sid, arena_peak_champion_mgr, info,
				 [{move_to_new_main, NewMainSrvId}]),
		info(update_process_data);
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidc_arena_peak_champion_mgr293, _,
		   {__Levelc_arena_peak_champion_mgr293,
		    __Tracesc_arena_peak_champion_mgr293}}
		      when __Levelc_arena_peak_champion_mgr293 band 64 /= 0
			     orelse
			     __Tracesc_arena_peak_champion_mgr293 /= [] ->
		      lager:do_log(info,
				   [{module, c_arena_peak_champion_mgr},
				    {function, do_handle_info}, {line, 293},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("Giải vô địch Đỉnh cao không thể tìm "
						 "thấy máy chủ chính mới khi xử lý việc "
						 "hợp nhất máy chủ. Tìm một vòng khác "
						 "từ máy chủ khu vực không phải là máy "
						 "chủ được hợp nhất ngày hôm nay:~w",
						 [{Period, ZoneId, Sid}]),
				   none, 4096, 64,
				   __Levelc_arena_peak_champion_mgr293,
				   __Tracesc_arena_peak_champion_mgr293,
				   lager_event,
				   __Pidc_arena_peak_champion_mgr293);
		  _ -> ok
		end,
		NewSrvList2 = [SrvId1
			       || SrvId1 <- SrvList,
				  not lists:member(SrvId1, DayMergeList) andalso
				    not is_main(SrvId1)],
		case NewSrvList2 of
		  [NewMainSrvId | _] ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidc_arena_peak_champion_mgr297, _,
			 {__Levelc_arena_peak_champion_mgr297,
			  __Tracesc_arena_peak_champion_mgr297}}
			    when __Levelc_arena_peak_champion_mgr297 band 64 /=
				   0
				   orelse
				   __Tracesc_arena_peak_champion_mgr297 /= [] ->
			    lager:do_log(info,
					 [{module, c_arena_peak_champion_mgr},
					  {function, do_handle_info},
					  {line, 297},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("Máy chủ chính của Peak Division đã được "
						       "sáp nhập và máy chủ chính mới đã được:~w",
						       [{Period, Sid, ZoneId,
							 NewMainSrvId}]),
					 none, 4096, 64,
					 __Levelc_arena_peak_champion_mgr297,
					 __Tracesc_arena_peak_champion_mgr297,
					 lager_event,
					 __Pidc_arena_peak_champion_mgr297);
			_ -> ok
		      end,
		      NewZone = Zone#c_arena_zone_info{main_id =
							   NewMainSrvId},
		      ets:insert(c_arena_peak_champion_zone, NewZone),
		      dets:insert(c_arena_peak_champion_zone, NewZone),
		      cluster_lib:cast(Sid, arena_peak_champion_mgr, info,
				       [{move_to_new_main, NewMainSrvId}]),
		      info(update_process_data);
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
			{__Pidc_arena_peak_champion_mgr304, _,
			 {__Levelc_arena_peak_champion_mgr304,
			  __Tracesc_arena_peak_champion_mgr304}}
			    when __Levelc_arena_peak_champion_mgr304 band 64 /=
				   0
				   orelse
				   __Tracesc_arena_peak_champion_mgr304 /= [] ->
			    lager:do_log(info,
					 [{module, c_arena_peak_champion_mgr},
					  {function, do_handle_info},
					  {line, 304},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("Máy chủ chính của Peak Division đã được "
						       "sáp nhập. Toàn bộ nhóm đã được sáp nhập "
						       "ngày hôm nay:~w",
						       [{Period, Sid, ZoneId}]),
					 none, 4096, 64,
					 __Levelc_arena_peak_champion_mgr304,
					 __Tracesc_arena_peak_champion_mgr304,
					 lager_event,
					 __Pidc_arena_peak_champion_mgr304);
			_ -> ok
		      end,
		      ok
		end
	  end;
      _ -> skip
    end,
    {noreply, StateName, State};
do_handle_info({srv_join, Sid, ZoneId, Period},
	       StateName, State = #state{period = Period}) ->
    case ets:lookup(c_arena_peak_champion_zone, ZoneId) of
      [Zone = #c_arena_zone_info{main_id = MainId,
				 srv_lists = SrvList}
       | _] ->
	  NewZone = Zone#c_arena_zone_info{srv_lists =
					       [Sid | lists:delete(Sid,
								   SrvList)]},
	  ets:insert(c_arena_peak_champion_zone, NewZone),
	  dets:insert(c_arena_peak_champion_zone, NewZone),
	  ets:insert(c_arena_peak_champion_srv_zone,
		     {{Sid, Period}, ZoneId}),
	  dets:insert(c_arena_peak_champion_srv_zone,
		      {{Sid, Period}, ZoneId}),
	  cluster_lib:cast(MainId, arena_peak_champion_mgr, info,
			   [{synv_srv_join, Sid}]);
      _ -> skip
    end,
    {noreply, StateName, State};
do_handle_info({srv_join, Sid, ZoneId, _}, StateName,
	       State = #state{period = Period}) ->
    ets:insert(c_arena_peak_champion_srv_zone,
	       {{Sid, Period}, ZoneId}),
    dets:insert(c_arena_peak_champion_srv_zone,
		{{Sid, Period}, ZoneId}),
    {noreply, StateName, State};
do_handle_info({synv_zone_info, Sid}, StateName,
	       State = #state{period = Period}) ->
    ZoneInfo = case
		 ets:lookup(c_arena_peak_champion_srv_zone,
			    {Sid, Period})
		   of
		 [{_, ZoneId} | _] ->
		     case ets:lookup(c_arena_peak_champion_zone, ZoneId) of
		       [Zone = #c_arena_zone_info{} | _] -> Zone;
		       _ -> #c_arena_zone_info{}
		     end;
		 _ -> #c_arena_zone_info{}
	       end,
    cluster_lib:cast(Sid, arena_peak_champion_mgr, info,
		     [{synv_zone_info, Period, ZoneInfo}]),
    {noreply, StateName, State};
do_handle_info({update_zone_info,
		{SrvId, WorldLev, OPenTime, MergeSrvs}},
	       StateName, State) ->
    ets:insert(c_arena_peak_champion_srv_info,
	       {SrvId, WorldLev, OPenTime, MergeSrvs}),
    dets:insert(c_arena_peak_champion_srv_info,
		{SrvId, WorldLev, OPenTime, MergeSrvs}),
    {noreply, StateName, State};
do_handle_info({update_zone_group_info,
		{SrvId, GroupSrvs, Num}},
	       StateName, State) ->
    ets:insert(c_arena_peak_champion_group_info,
	       {SrvId, GroupSrvs, Num}),
    dets:insert(c_arena_peak_champion_group_info,
		{SrvId, GroupSrvs, Num}),
    {noreply, StateName, State};
do_handle_info(_Info, StateName, State) ->
    {noreply, StateName, State}.

continue(StateName,
	 State = #state{ts = Ts, timeout = Timeout}) ->
    Ms = date:unixtime(ms),
    {next_state, StateName, State,
     max(1, Ts + Timeout - Ms)}.

continue(StateName, Reply,
	 State = #state{ts = Ts, timeout = Timeout}) ->
    Ms = date:unixtime(ms),
    {reply, Reply, StateName, State,
     max(1, Ts + Timeout - Ms)}.

idle(timeout, State) ->
    case catch do_state_handle(timeout, idle, State) of
      {noreply, NewStateName, NewState} ->
	  continue(NewStateName, NewState);
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_arena_peak_champion_mgr383, _,
	     {__Levelc_arena_peak_champion_mgr383,
	      __Tracesc_arena_peak_champion_mgr383}}
		when __Levelc_arena_peak_champion_mgr383 band 8 /= 0
		       orelse __Tracesc_arena_peak_champion_mgr383 /= [] ->
		lager:do_log(error,
			     [{module, c_arena_peak_champion_mgr},
			      {function, idle}, {line, 383},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("Lỗi xử lý tin nhắn máy trạng thái, 消息:~w, "
					   "状态:~w, ~w",
					   [timeout, State, _Reason]),
			     none, 4096, 8, __Levelc_arena_peak_champion_mgr383,
			     __Tracesc_arena_peak_champion_mgr383, lager_event,
			     __Pidc_arena_peak_champion_mgr383);
	    _ -> ok
	  end,
	  server_monitor:error_log({2,
				    <<"Ngoại lệ xử lý hệ thống"/utf8>>,
				    util:fbin(<<"Có một ngoại lệ trong quá trình xử lý "
						"hệ thống, bạn cần lên mạng ngay để kiểm "
						"tra và xử lý."/utf8>>,
					      []),
				    c_arena_peak_champion_mgr, 384, _Reason}),
	  continue(idle,
		   State#state{ts = date:unixtime(ms),
			       timeout = date:unixtime(ms) + 86400000})
    end;
idle(_Any, State) -> continue(idle, State).

check(timeout, State) ->
    case catch do_state_handle(timeout, check, State) of
      {noreply, NewStateName, NewState} ->
	  continue(NewStateName, NewState);
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_arena_peak_champion_mgr396, _,
	     {__Levelc_arena_peak_champion_mgr396,
	      __Tracesc_arena_peak_champion_mgr396}}
		when __Levelc_arena_peak_champion_mgr396 band 8 /= 0
		       orelse __Tracesc_arena_peak_champion_mgr396 /= [] ->
		lager:do_log(error,
			     [{module, c_arena_peak_champion_mgr},
			      {function, check}, {line, 396},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("状态机消息处理错误, 消息:~w, 状态:~w, ~w",
					   [timeout, State, _Reason]),
			     none, 4096, 8, __Levelc_arena_peak_champion_mgr396,
			     __Tracesc_arena_peak_champion_mgr396, lager_event,
			     __Pidc_arena_peak_champion_mgr396);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理出现异常，需马上上线查看处理"/utf8>>,
					      []),
				    c_arena_peak_champion_mgr, 397, _Reason}),
	  continue(check,
		   State#state{ts = date:unixtime(ms),
			       timeout = date:unixtime(ms) + 86400000})
    end;
check(_Any, State) -> continue(check, State).

ready(timeout, State) ->
    case catch do_state_handle(timeout, ready, State) of
      {noreply, NewStateName, NewState} ->
	  continue(NewStateName, NewState);
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_arena_peak_champion_mgr409, _,
	     {__Levelc_arena_peak_champion_mgr409,
	      __Tracesc_arena_peak_champion_mgr409}}
		when __Levelc_arena_peak_champion_mgr409 band 8 /= 0
		       orelse __Tracesc_arena_peak_champion_mgr409 /= [] ->
		lager:do_log(error,
			     [{module, c_arena_peak_champion_mgr},
			      {function, ready}, {line, 409},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("状态机消息处理错误, 消息:~w, 状态:~w, ~w",
					   [timeout, State, _Reason]),
			     none, 4096, 8, __Levelc_arena_peak_champion_mgr409,
			     __Tracesc_arena_peak_champion_mgr409, lager_event,
			     __Pidc_arena_peak_champion_mgr409);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理出现异常，需马上上线查看处理"/utf8>>,
					      []),
				    c_arena_peak_champion_mgr, 410, _Reason}),
	  continue(ready,
		   State#state{ts = date:unixtime(ms),
			       timeout = date:unixtime(ms) + 86400000})
    end;
ready(_Any, State) -> continue(ready, State).

open(timeout, State) ->
    case catch do_state_handle(timeout, open, State) of
      {noreply, NewStateName, NewState} ->
	  continue(NewStateName, NewState);
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_arena_peak_champion_mgr422, _,
	     {__Levelc_arena_peak_champion_mgr422,
	      __Tracesc_arena_peak_champion_mgr422}}
		when __Levelc_arena_peak_champion_mgr422 band 8 /= 0
		       orelse __Tracesc_arena_peak_champion_mgr422 /= [] ->
		lager:do_log(error,
			     [{module, c_arena_peak_champion_mgr},
			      {function, open}, {line, 422},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("状态机消息处理错误, 消息:~w, 状态:~w, ~w",
					   [timeout, State, _Reason]),
			     none, 4096, 8, __Levelc_arena_peak_champion_mgr422,
			     __Tracesc_arena_peak_champion_mgr422, lager_event,
			     __Pidc_arena_peak_champion_mgr422);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理出现异常，需马上上线查看处理"/utf8>>,
					      []),
				    c_arena_peak_champion_mgr, 423, _Reason}),
	  continue(open,
		   State#state{ts = date:unixtime(ms),
			       timeout = date:unixtime(ms) + 86400000})
    end;
open(_Any, State) -> continue(open, State).

close(timeout, State) ->
    case catch do_state_handle(timeout, close, State) of
      {noreply, NewStateName, NewState} ->
	  continue(NewStateName, NewState);
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_arena_peak_champion_mgr435, _,
	     {__Levelc_arena_peak_champion_mgr435,
	      __Tracesc_arena_peak_champion_mgr435}}
		when __Levelc_arena_peak_champion_mgr435 band 8 /= 0
		       orelse __Tracesc_arena_peak_champion_mgr435 /= [] ->
		lager:do_log(error,
			     [{module, c_arena_peak_champion_mgr},
			      {function, close}, {line, 435},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("状态机消息处理错误, 消息:~w, 状态:~w, ~w",
					   [timeout, State, _Reason]),
			     none, 4096, 8, __Levelc_arena_peak_champion_mgr435,
			     __Tracesc_arena_peak_champion_mgr435, lager_event,
			     __Pidc_arena_peak_champion_mgr435);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理出现异常，需马上上线查看处理"/utf8>>,
					      []),
				    c_arena_peak_champion_mgr, 436, _Reason}),
	  continue(close,
		   State#state{ts = date:unixtime(ms),
			       timeout = date:unixtime(ms) + 86400000})
    end;
close(_Any, State) -> continue(close, State).

check_close(timeout, State) ->
    case catch do_state_handle(timeout, check_close, State)
	of
      {noreply, NewStateName, NewState} ->
	  continue(NewStateName, NewState);
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_arena_peak_champion_mgr448, _,
	     {__Levelc_arena_peak_champion_mgr448,
	      __Tracesc_arena_peak_champion_mgr448}}
		when __Levelc_arena_peak_champion_mgr448 band 8 /= 0
		       orelse __Tracesc_arena_peak_champion_mgr448 /= [] ->
		lager:do_log(error,
			     [{module, c_arena_peak_champion_mgr},
			      {function, check_close}, {line, 448},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("状态机消息处理错误, 消息:~w, 状态:~w, ~w",
					   [timeout, State, _Reason]),
			     none, 4096, 8, __Levelc_arena_peak_champion_mgr448,
			     __Tracesc_arena_peak_champion_mgr448, lager_event,
			     __Pidc_arena_peak_champion_mgr448);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理出现异常，需马上上线查看处理"/utf8>>,
					      []),
				    c_arena_peak_champion_mgr, 449, _Reason}),
	  continue(check_close,
		   State#state{ts = date:unixtime(ms),
			       timeout = date:unixtime(ms) + 86400000})
    end;
check_close(_Any, State) ->
    continue(check_close, State).

do_state_handle(timeout, idle,
		State = #state{period = Period}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_peak_champion_mgr456, _,
       {__Levelc_arena_peak_champion_mgr456,
	__Tracesc_arena_peak_champion_mgr456}}
	  when __Levelc_arena_peak_champion_mgr456 band 64 /= 0
		 orelse __Tracesc_arena_peak_champion_mgr456 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_peak_champion_mgr},
			{function, do_state_handle}, {line, 456},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("巅峰冠军赛进入开启检查期，通知游戏服上传自身数据：~w", [Period]),
		       none, 4096, 64, __Levelc_arena_peak_champion_mgr456,
		       __Tracesc_arena_peak_champion_mgr456, lager_event,
		       __Pidc_arena_peak_champion_mgr456);
      _ -> ok
    end,
    Ts = date:unixtime(ms),
    TimeOut = 10 * 60 * 1000,
    ets:delete_all_objects(c_arena_peak_champion_group_info),
    dets:delete_all_objects(c_arena_peak_champion_group_info),
    ets:delete_all_objects(c_arena_peak_champion_srv_info),
    dets:delete_all_objects(c_arena_peak_champion_srv_info),
    ets:delete_all_objects(c_arena_peak_champion_srv_zone),
    dets:delete_all_objects(c_arena_peak_champion_srv_zone),
    ets:delete_all_objects(c_arena_peak_champion_zone),
    dets:delete_all_objects(c_arena_peak_champion_zone),
    cluster_lib:cast(all, arena_peak_champion_mgr, info,
		     [update_zone_info]),
    self() ! sync_status_to_zone,
    sys_env:save(c_arena_peak_champion_state,
		 {Ts, TimeOut, Period, check}),
    {noreply, check,
     State#state{ts = Ts, timeout = TimeOut,
		 switch = check}};
do_state_handle(timeout, check,
		State = #state{period = Period}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_peak_champion_mgr474, _,
       {__Levelc_arena_peak_champion_mgr474,
	__Tracesc_arena_peak_champion_mgr474}}
	  when __Levelc_arena_peak_champion_mgr474 band 64 /= 0
		 orelse __Tracesc_arena_peak_champion_mgr474 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_peak_champion_mgr},
			{function, do_state_handle}, {line, 474},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("巅峰冠军赛进入赛区计算阶段", []), none, 4096, 64,
		       __Levelc_arena_peak_champion_mgr474,
		       __Tracesc_arena_peak_champion_mgr474, lager_event,
		       __Pidc_arena_peak_champion_mgr474);
      _ -> ok
    end,
    Ts = date:unixtime(ms),
    NewPeriod = Period + 1,
    case c_arena_peak_champion_lib:calc_zone(NewPeriod) of
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_arena_peak_champion_mgr479, _,
	     {__Levelc_arena_peak_champion_mgr479,
	      __Tracesc_arena_peak_champion_mgr479}}
		when __Levelc_arena_peak_champion_mgr479 band 64 /= 0
		       orelse __Tracesc_arena_peak_champion_mgr479 /= [] ->
		lager:do_log(info,
			     [{module, c_arena_peak_champion_mgr},
			      {function, do_state_handle}, {line, 479},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("巅峰冠军赛赛季进入判断未开启阶段", []), none, 4096,
			     64, __Levelc_arena_peak_champion_mgr479,
			     __Tracesc_arena_peak_champion_mgr479, lager_event,
			     __Pidc_arena_peak_champion_mgr479);
	    _ -> ok
	  end,
	  {Week, H, M} =
	      arena_peak_champion_data:get_constant(season_start),
	  TimeOut = (date:week_next_diff([Week], {H, M, 0}) -
		       10 * 60
		       - 10 * 60)
		      * 1000,
	  sys_env:save(c_arena_peak_champion_state,
		       {Ts, TimeOut, Period, check_close}),
	  cluster_lib:cast(all, arena_peak_champion_mgr, info,
			   [{synv_period_info, check_close}]),
	  {noreply, check_close,
	   State#state{ts = Ts, timeout = TimeOut,
		       switch = check_close}};
      ZoneInfo ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_arena_peak_champion_mgr486, _,
	     {__Levelc_arena_peak_champion_mgr486,
	      __Tracesc_arena_peak_champion_mgr486}}
		when __Levelc_arena_peak_champion_mgr486 band 64 /= 0
		       orelse __Tracesc_arena_peak_champion_mgr486 /= [] ->
		lager:do_log(info,
			     [{module, c_arena_peak_champion_mgr},
			      {function, do_state_handle}, {line, 486},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("巅峰冠军赛赛季进入数据准备阶段", []), none, 4096,
			     64, __Levelc_arena_peak_champion_mgr486,
			     __Tracesc_arena_peak_champion_mgr486, lager_event,
			     __Pidc_arena_peak_champion_mgr486);
	    _ -> ok
	  end,
	  Timeout = 10 * 60 * 1000,
	  sys_env:save(c_arena_peak_champion_state,
		       {Ts, Timeout, NewPeriod, ready}),
	  MaxZoneId = case ets:info(c_arena_peak_champion_zone,
				    size)
			  of
			Num when is_integer(Num) -> Num;
			_ -> 0
		      end,
	  L = util:get(c_arena_peak_champion_period_info, []),
	  NewL = [{NewPeriod, MaxZoneId} | L],
	  ets:insert(c_arena_peak_champion_period_info, NewL),
	  dets:insert(c_arena_peak_champion_period_info, NewL),
	  put(c_arena_peak_champion_period_info, NewL),
	  Fun = fun (#c_arena_zone_info{zone_id = ZoneId,
					main_id = MainId},
		     Acc) ->
			[{ZoneId, MainId} | Acc]
		end,
	  MainInfo = ets:foldl(Fun, [],
			       c_arena_peak_champion_zone),
	  put(c_arena_peak_champion_zone_main_id, MainInfo),
	  cluster_lib:cast(all, arena_peak_champion_mgr, info,
			   [{synv_period_info, NewPeriod, MaxZoneId,
			     MainInfo}]),
	  {noreply, ready,
	   State#state{ts = Ts, timeout = Timeout,
		       period = Period + 1, switch = ready}}
    end;
do_state_handle(timeout, check_close,
		State = #state{period = Period}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_peak_champion_mgr510, _,
       {__Levelc_arena_peak_champion_mgr510,
	__Tracesc_arena_peak_champion_mgr510}}
	  when __Levelc_arena_peak_champion_mgr510 band 64 /= 0
		 orelse __Tracesc_arena_peak_champion_mgr510 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_peak_champion_mgr},
			{function, do_state_handle}, {line, 510},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("巅峰冠军赛进入开启检查期，通知游戏服上传自身数据：~w", [Period]),
		       none, 4096, 64, __Levelc_arena_peak_champion_mgr510,
		       __Tracesc_arena_peak_champion_mgr510, lager_event,
		       __Pidc_arena_peak_champion_mgr510);
      _ -> ok
    end,
    Ts = date:unixtime(ms),
    TimeOut = 10 * 60 * 1000,
    ets:delete_all_objects(c_arena_peak_champion_group_info),
    dets:delete_all_objects(c_arena_peak_champion_group_info),
    ets:delete_all_objects(c_arena_peak_champion_srv_info),
    dets:delete_all_objects(c_arena_peak_champion_srv_info),
    ets:delete_all_objects(c_arena_peak_champion_srv_zone),
    dets:delete_all_objects(c_arena_peak_champion_srv_zone),
    ets:delete_all_objects(c_arena_peak_champion_zone),
    dets:delete_all_objects(c_arena_peak_champion_zone),
    cluster_lib:cast(all, arena_peak_champion_mgr, info,
		     [update_zone_info]),
    self() ! sync_status_to_zone,
    sys_env:save(c_arena_peak_champion_state,
		 {Ts, TimeOut, Period, check}),
    {noreply, check,
     State#state{ts = Ts, timeout = TimeOut,
		 switch = check}};
do_state_handle(timeout, ready,
		State = #state{period = Period}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_peak_champion_mgr528, _,
       {__Levelc_arena_peak_champion_mgr528,
	__Tracesc_arena_peak_champion_mgr528}}
	  when __Levelc_arena_peak_champion_mgr528 band 64 /= 0
		 orelse __Tracesc_arena_peak_champion_mgr528 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_peak_champion_mgr},
			{function, do_state_handle}, {line, 528},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("巅峰冠军赛进入开启阶段", []), none, 4096, 64,
		       __Levelc_arena_peak_champion_mgr528,
		       __Tracesc_arena_peak_champion_mgr528, lager_event,
		       __Pidc_arena_peak_champion_mgr528);
      _ -> ok
    end,
    Ts = date:unixtime(ms),
    TimeOut = 86400 *
		arena_peak_champion_data:get_constant(open_time)
		* 1000,
    self() ! sync_status_to_zone,
    sys_env:save(c_arena_peak_champion_state,
		 {Ts, TimeOut, Period, open}),
    ZoneInfo = ets:tab2list(c_arena_peak_champion_zone),
    [cluster_lib:cast(MainId, arena_peak_champion_mgr, info,
		      [open])
     || Data = #c_arena_zone_info{main_id = MainId}
	    <- ZoneInfo],
    {noreply, open,
     State#state{ts = Ts, timeout = TimeOut, switch = open}};
do_state_handle(timeout, open,
		State = #state{period = Period}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_peak_champion_mgr537, _,
       {__Levelc_arena_peak_champion_mgr537,
	__Tracesc_arena_peak_champion_mgr537}}
	  when __Levelc_arena_peak_champion_mgr537 band 64 /= 0
		 orelse __Tracesc_arena_peak_champion_mgr537 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_peak_champion_mgr},
			{function, do_state_handle}, {line, 537},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("巅峰冠军赛进入关闭阶段", []), none, 4096, 64,
		       __Levelc_arena_peak_champion_mgr537,
		       __Tracesc_arena_peak_champion_mgr537, lager_event,
		       __Pidc_arena_peak_champion_mgr537);
      _ -> ok
    end,
    Ts = date:unixtime(ms),
    TimeOut = 1000 *
		(86400 *
		   arena_peak_champion_data:get_constant(close_time)
		   - 10 * 60
		   - 10 * 60),
    self() ! sync_status_to_zone,
    sys_env:save(c_arena_peak_champion_state,
		 {Ts, TimeOut, Period, close}),
    {noreply, close,
     State#state{ts = Ts, timeout = TimeOut,
		 switch = close}};
do_state_handle(timeout, close,
		State = #state{period = Period}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_peak_champion_mgr544, _,
       {__Levelc_arena_peak_champion_mgr544,
	__Tracesc_arena_peak_champion_mgr544}}
	  when __Levelc_arena_peak_champion_mgr544 band 64 /= 0
		 orelse __Tracesc_arena_peak_champion_mgr544 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_peak_champion_mgr},
			{function, do_state_handle}, {line, 544},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("巅峰冠军赛进入开启检查期，通知游戏服上传自身数据：~w", [Period]),
		       none, 4096, 64, __Levelc_arena_peak_champion_mgr544,
		       __Tracesc_arena_peak_champion_mgr544, lager_event,
		       __Pidc_arena_peak_champion_mgr544);
      _ -> ok
    end,
    Ts = date:unixtime(ms),
    TimeOut = 10 * 60 * 1000,
    ets:delete_all_objects(c_arena_peak_champion_group_info),
    dets:delete_all_objects(c_arena_peak_champion_group_info),
    ets:delete_all_objects(c_arena_peak_champion_srv_info),
    dets:delete_all_objects(c_arena_peak_champion_srv_info),
    ets:delete_all_objects(c_arena_peak_champion_srv_zone),
    dets:delete_all_objects(c_arena_peak_champion_srv_zone),
    ets:delete_all_objects(c_arena_peak_champion_zone),
    dets:delete_all_objects(c_arena_peak_champion_zone),
    cluster_lib:cast(all, arena_peak_champion_mgr, info,
		     [update_zone_info]),
    self() ! sync_status_to_zone,
    sys_env:save(c_arena_peak_champion_state,
		 {Ts, TimeOut, Period, check}),
    {noreply, check,
     State#state{ts = Ts, timeout = TimeOut,
		 switch = close}};
do_state_handle(_Info, StateName, State) ->
    {noreply, StateName, State}.

is_main(SidT) ->
    Sid = cluster_lib:call(SidT, sys_lib, srv_id, []),
    MainInfo = util:get(c_arena_peak_champion_zone_main_id,
			[]),
    case lists:keyfind(Sid, 2, MainInfo) of
      {_ZoneId, Sid} -> true;
      _ -> false
    end.

add_merge_srv(Sid, Period) ->
    ZoneId = get_zone_id(Sid, Period),
    case ets:lookup(c_arena_peak_champion_zone, ZoneId) of
      [Zone = #c_arena_zone_info{do_merge_lists = L} | _] ->
	  NewZone = Zone#c_arena_zone_info{do_merge_lists =
					       [Sid | lists:delete(Sid, L)]},
	  ets:insert(c_arena_peak_champion_zone, NewZone),
	  dets:insert(c_arena_peak_champion_zone, NewZone),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_arena_peak_champion_mgr579, _,
	     {__Levelc_arena_peak_champion_mgr579,
	      __Tracesc_arena_peak_champion_mgr579}}
		when __Levelc_arena_peak_champion_mgr579 band 128 /= 0
		       orelse __Tracesc_arena_peak_champion_mgr579 /= [] ->
		lager:do_log(debug,
			     [{module, c_arena_peak_champion_mgr},
			      {function, add_merge_srv}, {line, 579},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("巅峰赛合服处理, 已经合并了的服:~w",
					   [{ZoneId,
					     [Sid | lists:delete(Sid, L)]}]),
			     none, 4096, 128,
			     __Levelc_arena_peak_champion_mgr579,
			     __Tracesc_arena_peak_champion_mgr579, lager_event,
			     __Pidc_arena_peak_champion_mgr579);
	    _ -> ok
	  end,
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
	    {__Pidc_arena_peak_champion_mgr582, _,
	     {__Levelc_arena_peak_champion_mgr582,
	      __Tracesc_arena_peak_champion_mgr582}}
		when __Levelc_arena_peak_champion_mgr582 band 64 /= 0
		       orelse __Tracesc_arena_peak_champion_mgr582 /= [] ->
		lager:do_log(info,
			     [{module, c_arena_peak_champion_mgr},
			      {function, add_merge_srv}, {line, 582},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("巅峰赛合服处理:找不到赛区数据~w",
					   [{Sid, ZoneId}]),
			     none, 4096, 64,
			     __Levelc_arena_peak_champion_mgr582,
			     __Tracesc_arena_peak_champion_mgr582, lager_event,
			     __Pidc_arena_peak_champion_mgr582);
	    _ -> ok
	  end,
	  skip
    end.

del_merge_srv(Sid, Period) ->
    ZoneId = get_zone_id(Sid, Period),
    case ets:lookup(c_arena_peak_champion_zone, ZoneId) of
      [Zone = #c_arena_zone_info{do_merge_lists = L} | _] ->
	  NewZone = Zone#c_arena_zone_info{do_merge_lists =
					       lists:delete(Sid, L)},
	  ets:insert(c_arena_peak_champion_zone, NewZone),
	  dets:insert(c_arena_peak_champion_zone, NewZone),
	  ok;
      _ -> skip
    end.


