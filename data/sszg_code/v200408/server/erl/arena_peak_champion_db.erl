-file("src/mod/arena_peak_champion/arena_peak_champi"
      "on_db.erl",
      1).

-module(arena_peak_champion_db).

-lager_records([{champion_result,
		 [id, rank, cnum, win]},
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

-export([get_ext/2, get_role/1, get_pk/1, get_bet/1,
	 get_log/1, rank_role/1, list_rank/1, list_rank/2,
	 list_rank2/1, list_rank3/2, cluster_list_rank/2,
	 cluster_list_rank/3, role_rank/1,
	 cluster_role_rank_info/2, get_role_rank_info/1,
	 cluster_get_bet/2]).

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

-file("src/mod/arena_peak_champion/arena_peak_champi"
      "on_db.erl",
      26).

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

-file("src/mod/arena_peak_champion/arena_peak_champi"
      "on_db.erl",
      27).

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

-file("src/mod/arena_peak_champion/arena_peak_champi"
      "on_db.erl",
      28).

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

-file("src/mod/arena_peak_champion/arena_peak_champi"
      "on_db.erl",
      29).

-spec get_ext(Key :: any(), DefVal :: any()) -> Val ::
						    any().

get_ext(Key, DefVal) ->
    case ets:lookup(arena_peak_champion_ext, Key) of
      [{Key, Val}] -> Val;
      _ -> DefVal
    end.

-spec get_role(role_id()) -> {ok,
			      #arena_peak_champion_role{}} |
			     false.

get_role(RoleId) ->
    case ets:lookup(arena_peak_champion_role, RoleId) of
      [R] -> {ok, R};
      _ -> false
    end.

-spec get_pk(pos_integer() | tuple()) -> {ok,
					  #peak_champion_pk{}} |
					 false.

get_pk([]) -> false;
get_pk([Id | T]) ->
    case get_pk(Id) of
      false -> get_pk(T);
      Ret -> Ret
    end;
get_pk(Id) ->
    case ets:lookup(arena_peak_champion_pk, Id) of
      [O] -> {ok, O};
      _ -> false
    end.

-spec get_bet(role_id()) -> #champion_bet{}.

get_bet(RoleId) ->
    case ets:lookup(arena_peak_champion_bet, RoleId) of
      [Bet] -> Bet;
      _ ->
	  DefVal = case get_ext(arena_champion_state, #{}) of
		     #{step := 256} ->
			 arena_peak_champion_data:get_constant(guess_number2);
		     #{step := 64} ->
			 arena_peak_champion_data:get_constant(guess_number2);
		     #{step := 8} ->
			 arena_peak_champion_data:get_constant(guess_number2);
		     _ ->
			 arena_peak_champion_data:get_constant(guess_number1)
		   end,
	  Bet = #champion_bet{id = RoleId, bet = DefVal},
	  d_ets_lib:save_ets(arena_peak_champion_bet, Bet),
	  Bet
    end.

cluster_get_bet(Sid, RoleId) ->
    case catch cluster_lib:call(Sid, arena_peak_champion_db,
				get_bet, [RoleId])
	of
      Bet = #champion_bet{} -> Bet;
      _ ->
	  #champion_bet{id = RoleId,
			bet =
			    arena_peak_champion_data:get_constant(guess_number1)}
    end.

-spec get_log(role_id()) -> #champion_role_log{}.

get_log(RoleId) ->
    case ets:lookup(arena_peak_champion_role_log, RoleId) of
      [O] -> O;
      _ -> #champion_role_log{id = RoleId}
    end.

-spec role_rank(role_id()) -> Rank :: non_neg_integer().

role_rank(RoleId) ->
    try case ets:lookup_element(arena_peak_champion_role,
				RoleId, #arena_peak_champion_role.rank)
	    of
	  Rank when is_integer(Rank) -> Rank;
	  _ -> 0
	end
    catch
      _:_ -> 0
    end.

cluster_role_rank_info(Sid, RoleId) ->
    case catch cluster_lib:call(Sid, arena_peak_champion_db,
				get_role_rank_info, [RoleId])
	of
      {Rank, Score, Power, Group256, Group64} ->
	  {Rank, Score, Power, Group256, Group64};
      _ -> {0, 0, 0, 0, 0}
    end.

get_role_rank_info(RoleId) ->
    try case ets:lookup(arena_peak_champion_role, RoleId) of
	  [#arena_peak_champion_role{rank = Rank,
				     group256 = Group256, group64 = Group64,
				     score = Score, power = Power}
	   | _] ->
	      {Rank, Score, Power, Group256, Group64};
	  _ -> {0, 0, 0, 0, 0}
	end
    catch
      _:_ -> {0, 0, 0, 0, 0}
    end.

-spec rank_role(pos_integer()) -> {ok,
				   #arena_peak_champion_role{}} |
				  false.

rank_role(Rank) ->
    case rank_roleid(Rank) of
      null -> false;
      RoleId -> get_role(RoleId)
    end.

-spec rank_roleid(pos_integer()) -> role_id() | null.

rank_roleid(Rank) ->
    case ets:lookup(arena_peak_champion_rank, Rank) of
      [#arena_champion_rank{id = RoleId}] -> RoleId;
      _ -> null
    end.

-spec list_rank(Num ::
		    pos_integer()) -> [#arena_peak_champion_role{}].

list_rank(Num) when Num > 0 -> list_rank(1, Num);
list_rank(_Num) -> list_rank(1, 100).

list_rank2(Num) when Num > 0 ->
    L = list_rank(1, Num),
    [#arena_peak_rank{rank = Rank, id = Id, name = Name,
		      lev = Lev, face_id = FaceId,
		      face_update_time = FaceUpdateTime, face_file = FaceFile,
		      avatar_bid = AvatarBid, score = Score, power = Power,
		      sex = Sex}
     || #arena_peak_champion_role{rank = Rank, id = Id,
				  name = Name, lev = Lev, face_id = FaceId,
				  face_update_time = FaceUpdateTime,
				  face_file = FaceFile, avatar_bid = AvatarBid,
				  score = Score, power = Power, sex = Sex}
	    <- L];
list_rank2(_Num) ->
    L = list_rank(1, 100),
    [#arena_peak_rank{rank = Rank, id = Id, name = Name,
		      lev = Lev, face_id = FaceId,
		      face_update_time = FaceUpdateTime, face_file = FaceFile,
		      avatar_bid = AvatarBid, score = Score, power = Power,
		      sex = Sex}
     || #arena_peak_champion_role{rank = Rank, id = Id,
				  name = Name, lev = Lev, face_id = FaceId,
				  face_update_time = FaceUpdateTime,
				  face_file = FaceFile, avatar_bid = AvatarBid,
				  score = Score, power = Power, sex = Sex}
	    <- L].

list_rank3(Start, Num) ->
    L = list_rank(Start, Num),
    [#arena_peak_rank{rank = Rank, id = Id, name = Name,
		      lev = Lev, face_id = FaceId,
		      face_update_time = FaceUpdateTime, face_file = FaceFile,
		      avatar_bid = AvatarBid, score = Score, power = Power,
		      sex = Sex}
     || #arena_peak_champion_role{rank = Rank, id = Id,
				  name = Name, lev = Lev, face_id = FaceId,
				  face_update_time = FaceUpdateTime,
				  face_file = FaceFile, avatar_bid = AvatarBid,
				  score = Score, power = Power, sex = Sex}
	    <- L].

cluster_list_rank(Sid, Num) when Num > 0 ->
    case catch cluster_lib:call(Sid, arena_peak_champion_db,
				list_rank2, [Num])
	of
      L when is_list(L) -> L;
      _ -> []
    end;
cluster_list_rank(_Sid, _) -> [].

cluster_list_rank(Sid, Start, End) ->
    case catch cluster_lib:call(Sid, arena_peak_champion_db,
				list_rank3, [Start, End])
	of
      L when is_list(L) -> L;
      _ -> []
    end.

-spec list_rank(StartRank :: pos_integer(),
		EndRank ::
		    pos_integer()) -> [#arena_peak_champion_role{}].

list_rank(StartRank, EndRank) ->
    do_list_rank(StartRank, EndRank, []).

do_list_rank(StartRank, EndRank, L)
    when StartRank > EndRank ->
    lists:reverse(L);
do_list_rank(StartRank, EndRank, L) ->
    case rank_role(StartRank) of
      {ok, R} ->
	  do_list_rank(StartRank + 1, EndRank, [R | L]);
      _ -> lists:reverse(L)
    end.


