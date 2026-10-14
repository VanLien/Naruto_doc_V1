-file("data/c_arena_elite_mgr.erl", 1).

-file("src/mod/arena_elite/c_arena_elite_mgr.erl", 1).

-module(c_arena_elite_mgr).

-lager_records([{honor_info, [key, list, end_time]},
		{honor_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr, add_exp, dynamic]},
		{honor, [ver, base_id, expire_time]},
		{m_honor, [ver, used, list]},
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
		{state, [ts, timeout, switch, period]}]).

-behaviour(gen_fsm).

-export([m/0, info/1, cast/1, call/1, start_link/0,
	 tab/1, clean/0, add_robot/0, do_ver/1,
	 update_match_power/0, delete_zero_power/0,
	 update_zone_id/0]).

-export([gm_clean_data/0, gm_clean_data/1]).

-export([init/1, handle_event/3, handle_sync_event/4,
	 handle_info/3, terminate/3, code_change/4]).

-export([idle/2, first_routine/2, second_routine/2,
	 second_king/2]).

-record(state,
	{ts = 0, timeout = 0, switch = open, period = 1}).

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

-file("src/mod/arena_elite/c_arena_elite_mgr.erl", 35).

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

-file("src/mod/arena_elite/c_arena_elite_mgr.erl", 36).

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

-file("src/mod/arena_elite/c_arena_elite_mgr.erl", 37).

-file("inc/honor.hrl", 1).

-record(m_honor, {ver = 1, used = 0, list = []}).

-record(honor, {ver = 1, base_id = 0, expire_time = 0}).

-record(honor_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = [], add_exp = 0, dynamic = 0}).

-record(honor_info,
	{key  :: atom(), list = []  :: list(),
	 end_time = 0  :: non_neg_integer()}).

-file("src/mod/arena_elite/c_arena_elite_mgr.erl", 38).

gm_clean_data() -> gm_clean_data(20).

gm_clean_data(0) -> ok;
gm_clean_data(N) ->
    TabName = tab(N),
    LimitLev =
	arena_elite_data:get_constant(open_person_lev_limit),
    Fun = fun (Data = #c_e_role{lev = Lev, zid = Zid},
	       Acc) ->
		  case Lev >= LimitLev of
		    false -> Acc;
		    _ ->
			case is_integer(Zid) of
			  true -> [Data | Acc];
			  _ -> [Data#c_e_role{zid = 1} | Acc]
			end
		  end
	  end,
    List = ets:foldl(Fun, [], TabName),
    update_ets(TabName, List, reset_all),
    gm_clean_data(N - 1).

update_zone_id() -> do_update_zone_id(20).

clean() ->
    gen_fsm:send_event(c_arena_elite_mgr, do_clear).

update_match_power() -> info(update_match_power).

delete_zero_power() -> info(delete_zero_power).

add_robot() -> info(sync_status_to_zone_update_robot).

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
      {__Pidc_arena_elite_mgr85, _,
       {__Levelc_arena_elite_mgr85,
	__Tracesc_arena_elite_mgr85}}
	  when __Levelc_arena_elite_mgr85 band 64 /= 0 orelse
		 __Tracesc_arena_elite_mgr85 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_elite_mgr}, {function, m}, {line, 85},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "有人输入了下阶段", none, 4096, 64, __Levelc_arena_elite_mgr85,
		       __Tracesc_arena_elite_mgr85, lager_event,
		       __Pidc_arena_elite_mgr85);
      _ -> ok
    end,
    gen_fsm:send_event(c_arena_elite_mgr, timeout).

update_ets(Tab, Data, reset_all) ->
    ets:delete_all_objects(Tab),
    dets:delete_all_objects(Tab),
    update_ets(Tab, Data, ets),
    update_ets(Tab, Data, dets);
update_ets(Tab, Data, all) ->
    update_ets(Tab, Data, ets), update_ets(Tab, Data, dets);
update_ets(Tab, Data, ets) -> ets:insert(Tab, Data);
update_ets(Tab, Data, dets) -> dets:insert(Tab, Data).

info(Info) -> c_arena_elite_mgr ! Info.

cast(Event) ->
    gen_fsm:send_all_state_event(c_arena_elite_mgr, Event).

call(Event) ->
    case catch
	   gen_fsm:sync_send_all_state_event(c_arena_elite_mgr,
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
	    {__Pidc_arena_elite_mgr112, _,
	     {__Levelc_arena_elite_mgr112,
	      __Tracesc_arena_elite_mgr112}}
		when __Levelc_arena_elite_mgr112 band 8 /= 0 orelse
		       __Tracesc_arena_elite_mgr112 /= [] ->
		lager:do_log(error,
			     [{module, c_arena_elite_mgr}, {function, call},
			      {line, 112}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [c_arena_elite_mgr, Event, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelc_arena_elite_mgr112,
			     __Tracesc_arena_elite_mgr112, lager_event,
			     __Pidc_arena_elite_mgr112);
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
    gen_fsm:start_link({local, c_arena_elite_mgr},
		       c_arena_elite_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_elite_mgr118, _,
       {__Levelc_arena_elite_mgr118,
	__Tracesc_arena_elite_mgr118}}
	  when __Levelc_arena_elite_mgr118 band 64 /= 0 orelse
		 __Tracesc_arena_elite_mgr118 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_elite_mgr}, {function, init},
			{line, 118}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始启动", none, 4096, 64, __Levelc_arena_elite_mgr118,
		       __Tracesc_arena_elite_mgr118, lager_event,
		       __Pidc_arena_elite_mgr118);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    open_ets(20),
    dets:open_file(c_arena_elite_rank,
		   [{file, "./dets/c_arena_elite_rank.dets"},
		    {keypos, #arena_elite_rank.rank}, {type, set}]),
    ets:new(c_arena_elite_rank,
	    [set, named_table, public,
	     {keypos, #arena_elite_rank.rank}]),
    dets:open_file(c_arena_old_elite_rank,
		   [{file, "./dets/c_arena_old_elite_rank.dets"},
		    {keypos, 1}, {type, set}]),
    ets:new(c_arena_old_elite_rank,
	    [set, named_table, public, {keypos, 1}]),
    dets:open_file(c_arena_elite_log,
		   [{file, "./dets/c_arena_elite_log.dets"},
		    {keypos, #arena_elite_log.id}, {type, set}]),
    ets:new(c_arena_elite_log,
	    [set, named_table, public,
	     {keypos, #arena_elite_log.id}]),
    dets:open_file(c_arena_elite_log_hall,
		   [{file, "./dets/c_arena_elite_log_hall.dets"},
		    {keypos, #arena_elite_log.id}, {type, set}]),
    ets:new(c_arena_elite_log_hall,
	    [set, named_table, public,
	     {keypos, #arena_elite_log.id}]),
    dets:open_file(c_arena_elite_rank2,
		   [{file, "./dets/c_arena_elite_rank2.dets"}, {keypos, 1},
		    {type, set}]),
    ets:new(c_arena_elite_rank2,
	    [set, named_table, public, {keypos, 1}]),
    dets:open_file(c_arena_elite_log2,
		   [{file, "./dets/c_arena_elite_log2.dets"}, {keypos, 1},
		    {type, set}]),
    ets:new(c_arena_elite_log2,
	    [set, named_table, public, {keypos, 1}]),
    dets:open_file(c_arena_elite_log_hall2,
		   [{file, "./dets/c_arena_elite_log_hall2.dets"},
		    {keypos, 1}, {type, set}]),
    ets:new(c_arena_elite_log_hall2,
	    [set, named_table, public, {keypos, 1}]),
    dets:open_file(c_arena_elite_other,
		   [{file, "./dets/c_arena_elite_other.dets"}, {keypos, 1},
		    {type, set}]),
    ets:new(c_arena_elite_other,
	    [set, named_table, public, {keypos, 1}]),
    dets:open_file(c_arena_elite_zone_srv_info,
		   [{file, "./dets/c_arena_elite_zone_srv_info.dets"},
		    {keypos, #c_elite_srv_info.sid}, {type, set}]),
    ets:new(c_arena_elite_zone_srv_info,
	    [set, named_table, public,
	     {keypos, #c_elite_srv_info.sid}]),
    dets:open_file(c_arena_elite_zone_info,
		   [{file, "./dets/c_arena_elite_zone_info.dets"},
		    {keypos, 1}, {type, set}]),
    ets:new(c_arena_elite_zone_info,
	    [set, named_table, public, {keypos, 1}]),
    Fun = fun (Data) ->
		  NewData = arena_elite_ver:do_rank_ver(Data),
		  ets:insert(c_arena_elite_rank, NewData),
		  dets:insert(c_arena_elite_rank, NewData),
		  continue
	  end,
    dets:traverse(c_arena_elite_rank, Fun),
    ets:from_dets(c_arena_old_elite_rank,
		  c_arena_old_elite_rank),
    ets:from_dets(c_arena_elite_log, c_arena_elite_log),
    ets:from_dets(c_arena_elite_log_hall,
		  c_arena_elite_log_hall),
    Fun2 = fun (Data = {ZoneId, Lists}) ->
		   NewList = [arena_elite_ver:do_rank_ver(DataT)
			      || DataT <- Lists],
		   ets:insert(c_arena_elite_rank2, {ZoneId, NewList}),
		   dets:insert(c_arena_elite_rank2, {ZoneId, NewList}),
		   continue
	   end,
    dets:traverse(c_arena_elite_rank2, Fun2),
    d_ets_lib:load_dets_to_ets(c_arena_elite_log2,
			       c_arena_elite_log2,
			       fun (Data) ->
				       {ok, arena_elite_ver:do_log_ver(Data)}
			       end),
    d_ets_lib:load_dets_to_ets(c_arena_elite_log_hall2,
			       c_arena_elite_log_hall2,
			       fun (Data) ->
				       {ok, arena_elite_ver:do_log_ver(Data)}
			       end),
    ets:from_dets(c_arena_elite_other, c_arena_elite_other),
    ets:from_dets(c_arena_elite_zone_srv_info,
		  c_arena_elite_zone_srv_info),
    ets:from_dets(c_arena_elite_zone_info,
		  c_arena_elite_zone_info),
    RankL = ets:tab2list(c_arena_elite_rank),
    put(arena_elite_rank, RankL),
    LogList = ets:tab2list(c_arena_elite_log),
    put(c_arena_elite_log, LogList),
    LogList2 = ets:tab2list(c_arena_elite_log_hall),
    put(c_arena_elite_log_hall, LogList2),
    Ms = date:unixtime(ms),
    {Ts, TimeOut, NewPeriod, Switch} = case
					 sys_env:get(c_arena_elite_state)
					   of
					 {TsT, TimeOutT, NewPeriodT, StateT} ->
					     {TsT, TimeOutT, NewPeriodT,
					      StateT};
					 _ ->
					     TimeOutT = date:now_diff(21,
								      {1, 0,
								       0}),
					     {Ms, TimeOutT * 1000, 1, idle}
				       end,
    sys_env:save(c_arena_elite_state,
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
      {__Pidc_arena_elite_mgr226, _,
       {__Levelc_arena_elite_mgr226,
	__Tracesc_arena_elite_mgr226}}
	  when __Levelc_arena_elite_mgr226 band 64 /= 0 orelse
		 __Tracesc_arena_elite_mgr226 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_elite_mgr}, {function, init},
			{line, 226}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "启动完成", none, 4096, 64, __Levelc_arena_elite_mgr226,
		       __Tracesc_arena_elite_mgr226, lager_event,
		       __Pidc_arena_elite_mgr226);
      _ -> ok
    end,
    {ok, Switch, State, max(1, Ts + TimeOut - Ms)}.

handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok, continue(StateName, Reply, State).

handle_info({update_join_role,
	     {Sid, Num, WorldLev, OpenTime, MergeList}},
	    StateName, State = #state{period = Period}) ->
    Info = #c_elite_srv_info{sid = Sid, num = Num,
			     world_lev = WorldLev, open_time = OpenTime,
			     merge_srvs = MergeList},
    update_ets(c_arena_elite_zone_srv_info, Info, all),
    case c_arena_elite_lib:get_srv_zone_id(Sid) of
      ZoneId when is_integer(ZoneId) -> skip;
      _ ->
	  {NewZonId, Flag} =
	      c_arena_elite_lib:calc_new_srv_zone(Info),
	  case Flag of
	    true ->
		L = c_arena_elite_lib:get_period_zone_info(),
		c_arena_elite_lib:update_period_zone_info({Period,
							   NewZonId}),
		NewL = lists:keystore(Period, 1, L, {Period, NewZonId}),
		big_world_lib:cast({big_world, Sid}, arena_elite_mgr,
				   info, [{update_max_zone_info, NewL}]),
		big_world_lib:cast(all, arena_elite_mgr, info,
				   [{update_max_zone_id, Period, NewZonId}]);
	    _ -> skip
	  end,
	  big_world_lib:cast({big_world, Sid}, arena_elite_mgr,
			     info,
			     [{update_zone_id, Period, NewZonId, NewZonId}])
    end,
    continue(StateName, State);
handle_info({update_join_role, Sid, FromPid}, StateName,
	    State = #state{period = Period}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_elite_mgr273, _,
       {__Levelc_arena_elite_mgr273,
	__Tracesc_arena_elite_mgr273}}
	  when __Levelc_arena_elite_mgr273 band 128 /= 0 orelse
		 __Tracesc_arena_elite_mgr273 /= [] ->
	  lager:do_log(debug,
		       [{module, c_arena_elite_mgr}, {function, handle_info},
			{line, 273}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("===精英赛同步战区~w", [Sid]), none, 4096, 128,
		       __Levelc_arena_elite_mgr273,
		       __Tracesc_arena_elite_mgr273, lager_event,
		       __Pidc_arena_elite_mgr273);
      _ -> ok
    end,
    case c_arena_elite_lib:get_srv_zone_id(Sid) of
      ZoneId when is_integer(ZoneId) ->
	  List = c_arena_elite_lib:get_zone_info(),
	  MaxZoneId = lists:max([ZonIdT
				 || {ZonIdT, _Num, _SrvInfos} <- List]),
	  FromPid ! {update_zone_id, Period, ZoneId, MaxZoneId};
      _ -> ok
    end,
    continue(StateName, State);
handle_info({add_log,
	     LogData = #arena_elite_log{atk_id = {_, Sid}}},
	    StateName, State = #state{period = Period}) ->
    ZondId = c_arena_elite_lib:get_srv_zone_id(Sid),
    Logs = c_arena_elite_lib:get_zone_log(ZondId),
    LogId = case Logs of
	      [#arena_elite_log{id = LogId1} | _] when LogId1 < 100 ->
		  LogId1 + 1;
	      _ -> 1
	    end,
    NewLogData = LogData#arena_elite_log{id = LogId},
    {NewLogs, DelLogs} = list_util:split(100,
					 [NewLogData | Logs]),
    [[big_world_lib:cast({big_world, Sid2},
			 combat_replay_mgr, dec_replay_reference, [Temp])
      || {_, #arena_replay_info{id = Temp}} <- ReplayList]
     || #arena_elite_log{atk_id = {_, Sid2},
			 replay_list = ReplayList}
	    <- DelLogs],
    update_ets(c_arena_elite_log2, {ZondId, NewLogs}, ets),
    continue(StateName, State);
handle_info({add_log_hall,
	     LogData = #arena_elite_log{atk_id = {_, Sid}}},
	    StateName, State = #state{period = Period}) ->
    ZondId = c_arena_elite_lib:get_srv_zone_id(Sid),
    Logs = c_arena_elite_lib:get_zone_hall_log(ZondId),
    LogId = case Logs of
	      [#arena_elite_log{id = LogId1} | _]
		  when LogId1 < 2000 ->
		  LogId1 + 1;
	      _ -> 1
	    end,
    NewLogData = LogData#arena_elite_log{id = LogId},
    {NewLogs, DelLogs} = list_util:split(2000,
					 [NewLogData | Logs]),
    [[big_world_lib:cast({big_world, Sid2},
			 combat_replay_mgr, dec_replay_reference, [Temp])
      || {_, #arena_replay_info{id = Temp}} <- ReplayList]
     || #arena_elite_log{atk_id = {_, Sid2},
			 replay_list = ReplayList}
	    <- DelLogs],
    update_ets(c_arena_elite_log_hall2, {ZondId, NewLogs},
	       ets),
    continue(StateName, State);
handle_info({get_log, RolePid, Sid}, StateName,
	    State = #state{period = Period}) ->
    ZondId = c_arena_elite_lib:get_srv_zone_id(Sid),
    Logs = c_arena_elite_lib:get_zone_log(ZondId),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_elite_mgr348, _,
       {__Levelc_arena_elite_mgr348,
	__Tracesc_arena_elite_mgr348}}
	  when __Levelc_arena_elite_mgr348 band 128 /= 0 orelse
		 __Tracesc_arena_elite_mgr348 /= [] ->
	  lager:do_log(debug,
		       [{module, c_arena_elite_mgr}, {function, handle_info},
			{line, 348}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("推送数据:~w", [Logs]), none, 4096, 128,
		       __Levelc_arena_elite_mgr348,
		       __Tracesc_arena_elite_mgr348, lager_event,
		       __Pidc_arena_elite_mgr348);
      _ -> ok
    end,
    role:apply(async, RolePid,
	       {arena_elite_lib, push_c_log, [Logs, 2]}),
    continue(StateName, State);
handle_info({get_hall_log, RolePid, Lev, Sid},
	    StateName, State = #state{period = Period}) ->
    {Min, Max} =
	video_data:get_const(elite_lev_float_section),
    MinLev = Lev - Min,
    MaxLev = Lev + Max,
    ZondId = c_arena_elite_lib:get_srv_zone_id(Sid),
    Logs = c_arena_elite_lib:get_zone_hall_log(ZondId),
    PushLog = [Log
	       || Log = #arena_elite_log{atk_lev = Lev1,
					 def_lev = Lev2}
		      <- Logs,
		  Lev1 >= MinLev andalso Lev1 =< MaxLev orelse
		    Lev2 >= MinLev andalso Lev2 =< MaxLev],
    {PushLog2, _} = list_util:split(30, PushLog),
    role:apply(async, RolePid,
	       {arena_elite_lib, push_c_log, [PushLog2, 3]}),
    continue(StateName, State);
handle_info({update_arena_role_robot,
	     PushRole = #c_e_role{id = Id = {RId, Sid}}},
	    StateName, State) ->
    TabName = tab(RId),
    case ets:lookup(TabName, Id) of
      [_ | _] -> ok;
      _ ->
	  ZoneIdT = c_arena_elite_lib:get_srv_zone_id(Sid),
	  ZoneId = util:if_true(is_integer(ZoneIdT), ZoneIdT, 1),
	  update_ets(TabName, PushRole#c_e_role{zid = ZoneId},
		     all)
    end,
    continue(StateName, State);
handle_info({gm_calc_no_login_id, Ids}, StateName,
	    State) ->
    Fun = fun ({RId, Sid}, Acc) ->
		  Tab = tab(RId),
		  case catch ets:lookup(Tab, {RId, Sid}) of
		    [ArenaRole = #c_e_role{elite_lev = ELev, power = Power,
					   all_star = Star}
		     | _] ->
			NewLev = arena_elite_data:get_ref_lev(ELev),
			Rio = arena_elite_data:get_constant(initial_win_rate) *
				1.0e-3,
			Score = arena_elite_data:get_all_score(NewLev),
			MatchPower = Score *
				       arena_elite_data:get_constant(strength_var1)
				       +
				       Power * Rio *
					 arena_elite_data:get_constant(strength_var2)
					 *
					 min(Star,
					     arena_elite_data:get_constant(strength_var4))
					 /
					 arena_elite_data:get_constant(strength_var3),
			NewArenaRole = ArenaRole#c_e_role{match_power =
							      MatchPower,
							  elite_lev = NewLev,
							  win_rio = Rio,
							  score = Score},
			update_ets(Tab, NewArenaRole, all),
			[{RId, Sid} | Acc];
		    _ -> Acc
		  end
	  end,
    UpdateList = lists:foldl(Fun, [], Ids),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_elite_mgr404, _,
       {__Levelc_arena_elite_mgr404,
	__Tracesc_arena_elite_mgr404}}
	  when __Levelc_arena_elite_mgr404 band 64 /= 0 orelse
		 __Tracesc_arena_elite_mgr404 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_elite_mgr}, {function, handle_info},
			{line, 404}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("更新匹配池数据~w", [length(UpdateList)]), none,
		       4096, 64, __Levelc_arena_elite_mgr404,
		       __Tracesc_arena_elite_mgr404, lager_event,
		       __Pidc_arena_elite_mgr404);
      _ -> ok
    end,
    continue(StateName, State);
handle_info({update_arena_role2,
	     PushRole = #c_e_role{id = {RId, Sid}}},
	    StateName, State) ->
    ZoneIdT = c_arena_elite_lib:get_srv_zone_id(Sid),
    ZoneId = util:if_true(is_integer(ZoneIdT), ZoneIdT, 1),
    update_ets(tab(RId), PushRole#c_e_role{zid = ZoneId},
	       all),
    continue(StateName, State);
handle_info({update_arena_role,
	     PushRoleT = #c_e_role{id = {RId, Sid}}},
	    StateName, State = #state{period = Period}) ->
    ZoneIdT = c_arena_elite_lib:get_srv_zone_id(Sid),
    ZoneId = util:if_true(is_integer(ZoneIdT), ZoneIdT, 1),
    PushRole = PushRoleT#c_e_role{zid = ZoneId},
    update_ets(tab(RId), PushRole, all),
    RankList = c_arena_elite_lib:get_zone_rank(Sid),
    do_rank(PushRole, RankList, c_arena_elite_rank2,
	    Period),
    continue(StateName, State);
handle_info({update_arena_role_not_ver2,
	     {Id = {RId, Sid}, Lev, Score, IsKing}},
	    StateName, State = #state{period = Period}) ->
    TabName = tab(RId),
    case ets:lookup(TabName, Id) of
      [ArenaRole | _] ->
	  ZoneIdT = c_arena_elite_lib:get_srv_zone_id(Sid),
	  ZoneId = util:if_true(is_integer(ZoneIdT), ZoneIdT, 1),
	  PushRole = ArenaRole#c_e_role{elite_lev = Lev,
					score = Score, is_king = IsKing,
					zid = ZoneId},
	  update_ets(TabName, PushRole, all),
	  RankList = c_arena_elite_lib:get_zone_rank(Sid),
	  do_rank(PushRole, RankList, c_arena_elite_rank2,
		  Period);
      _ -> ok
    end,
    continue(StateName, State);
handle_info({update_arena_role_not_ver,
	     {Id = {RId, Sid}, Lev, Score, IsKing}},
	    StateName, State = #state{period = Period}) ->
    TabName = tab(RId),
    case ets:lookup(TabName, Id) of
      [ArenaRole | _] ->
	  ZoneIdT = c_arena_elite_lib:get_srv_zone_id(Sid),
	  ZoneId = util:if_true(is_integer(ZoneIdT), ZoneIdT, 1),
	  PushRole = ArenaRole#c_e_role{elite_lev = Lev,
					score = Score, is_king = IsKing,
					zid = ZoneId},
	  update_ets(TabName, PushRole, all),
	  RankList = c_arena_elite_lib:get_zone_rank(Sid),
	  do_rank(PushRole, RankList, c_arena_elite_rank2,
		  Period);
      _ -> ok
    end,
    continue(StateName, State);
handle_info(sync_status_to_zone_update_robot, StateName,
	    State) ->
    big_world_lib:cast(all, arena_elite_mgr, info,
		       [sync_status_to_zone_update_robot]),
    continue(StateName, State);
handle_info(update_match_power, StateName, State) ->
    update_match_power(20), continue(StateName, State);
handle_info(delete_zero_power, StateName, State) ->
    delete_zero_power(20), continue(StateName, State);
handle_info(sync_status_to_zone_clean, StateName,
	    State = #state{ts = Ts, timeout = TimeOut,
			   period = Period}) ->
    StartTime = sys_env:get(c_arena_elite_state_start_time,
			    0),
    cluster_lib:cast(all, arena_elite_mgr, info,
		     [{sync_status_to_zone_clean, StateName, Ts, TimeOut,
		       Period, StartTime}]),
    continue(StateName, State);
handle_info(sync_status_to_zone, StateName,
	    State = #state{ts = Ts, timeout = TimeOut,
			   period = Period}) ->
    StartTime = sys_env:get(c_arena_elite_state_start_time,
			    0),
    cluster_lib:cast(all, arena_elite_mgr, info,
		     [{sync_status_to_zone, StateName, Ts, TimeOut, Period,
		       StartTime}]),
    continue(StateName, State);
handle_info({sync_data, FromPid}, StateName,
	    State = #state{ts = Ts, timeout = TimeOut,
			   period = Period}) ->
    StartTime = sys_env:get(c_arena_elite_state_start_time,
			    0),
    FromPid !
      {sync_status_to_zone, StateName, Ts, TimeOut, Period,
       StartTime},
    continue(StateName, State);
handle_info({sync_old_rank_data, Period, FromPid},
	    StateName, State) ->
    case ets:lookup(c_arena_old_elite_rank, Period) of
      [{_, undefined} | _] ->
	  FromPid ! {sync_old_rank_data_to_zone, Period, []};
      [{_, L} | _] ->
	  PushL = [{ZoneId,
		    [RankInfo
		     || RankInfo = #arena_elite_rank{rank = Rank} <- L2,
			Rank =< 10 andalso Rank > 0]}
		   || {ZoneId, L2} <- L],
	  FromPid ! {sync_old_rank_data_to_zone, Period, PushL};
      _ -> skip
    end,
    continue(StateName, State);
handle_info(sync_rank_data, StateName, State) ->
    big_world_lib:cast(all, arena_elite_mgr, info,
		       [{sync_rank_data, util:get(arena_elite_rank, [])}]),
    continue(StateName, State);
handle_info({sync_rank_data, FromPid, Sid}, StateName,
	    State) ->
    L = c_arena_elite_lib:get_zone_rank(Sid),
    PushL = [RankInfo
	     || RankInfo = #arena_elite_rank{rank = Rank} <- L,
		Rank =< 100 andalso Rank > 0],
    FromPid ! {sync_rank_data, PushL},
    continue(StateName, State);
handle_info({sync_old_rank_data_to_zone, Period},
	    StateName, State) ->
    case ets:lookup(c_arena_old_elite_rank, Period) of
      [{_, L} | _] ->
	  PushL = [{ZoneId,
		    [RankInfo
		     || RankInfo = #arena_elite_rank{rank = Rank} <- L2,
			Rank =< 10 andalso Rank > 0]}
		   || {ZoneId, L2} <- L],
	  big_world_lib:cast(all, arena_elite_mgr, info,
			     [{sync_old_rank_data_to_zone, Period, PushL}]);
      _ -> skip
    end,
    continue(StateName, State);
handle_info({init_new_period, Period}, StateName,
	    State) ->
    Fun = fun ({ZondId, RankList}, Acc) ->
		  PushL = [RankInfo
			   || RankInfo = #arena_elite_rank{rank = Rank}
				  <- RankList,
			      Rank =< 10 andalso Rank > 0],
		  [{ZondId, PushL} | Acc]
	  end,
    Lists = ets:foldl(Fun, [], c_arena_elite_rank2),
    update_ets(c_arena_old_elite_rank, {Period, Lists},
	       all),
    ets:delete_all_objects(c_arena_elite_rank2),
    dets:delete_all_objects(c_arena_elite_rank2),
    self() ! {sync_old_rank_data_to_zone, Period},
    c_arena_elite_lib:calc_zone(Period + 1),
    do_update_zone_id(20),
    delete_log(),
    continue(StateName, State);
handle_info(init_9377_new_period, StateName,
	    State = #state{period = Period}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_elite_mgr604, _,
       {__Levelc_arena_elite_mgr604,
	__Tracesc_arena_elite_mgr604}}
	  when __Levelc_arena_elite_mgr604 band 64 /= 0 orelse
		 __Tracesc_arena_elite_mgr604 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_elite_mgr}, {function, handle_info},
			{line, 604}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "9377开始处理战区计算", none, 4096, 64,
		       __Levelc_arena_elite_mgr604,
		       __Tracesc_arena_elite_mgr604, lager_event,
		       __Pidc_arena_elite_mgr604);
      _ -> ok
    end,
    c_arena_elite_lib:calc_zone(Period),
    ets:delete_all_objects(c_arena_elite_rank2),
    dets:delete_all_objects(c_arena_elite_rank2),
    delete_log(),
    do_9377_update_zone_id(20),
    big_world_lib:cast(all, arena_elite_mgr, info,
		       [do_9377_update_zone_id]),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_elite_mgr617, _,
       {__Levelc_arena_elite_mgr617,
	__Tracesc_arena_elite_mgr617}}
	  when __Levelc_arena_elite_mgr617 band 64 /= 0 orelse
		 __Tracesc_arena_elite_mgr617 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_elite_mgr}, {function, handle_info},
			{line, 617}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "9377开始处理战区计算完成", none, 4096, 64,
		       __Levelc_arena_elite_mgr617,
		       __Tracesc_arena_elite_mgr617, lager_event,
		       __Pidc_arena_elite_mgr617);
      _ -> ok
    end,
    continue(StateName, State);
handle_info({switch, S}, StateName, State)
    when S =:= idle ->
    continue(StateName, State#state{switch = S});
handle_info(_Info, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_elite_mgr628, _,
       {__Levelc_arena_elite_mgr628,
	__Tracesc_arena_elite_mgr628}}
	  when __Levelc_arena_elite_mgr628 band 64 /= 0 orelse
		 __Tracesc_arena_elite_mgr628 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_elite_mgr}, {function, terminate},
			{line, 628}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始关闭", none, 4096, 64, __Levelc_arena_elite_mgr628,
		       __Tracesc_arena_elite_mgr628, lager_event,
		       __Pidc_arena_elite_mgr628);
      _ -> ok
    end,
    update_ets(c_arena_elite_rank,
	       util:get(arena_elite_rank, []), reset_all),
    do_update_dets(20),
    d_ets_lib:save(c_arena_elite_log2),
    d_ets_lib:save(c_arena_elite_log_hall2),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_elite_mgr633, _,
       {__Levelc_arena_elite_mgr633,
	__Tracesc_arena_elite_mgr633}}
	  when __Levelc_arena_elite_mgr633 band 64 /= 0 orelse
		 __Tracesc_arena_elite_mgr633 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_elite_mgr}, {function, terminate},
			{line, 633}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelc_arena_elite_mgr633,
		       __Tracesc_arena_elite_mgr633, lager_event,
		       __Pidc_arena_elite_mgr633);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

idle(timeout, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_elite_mgr644, _,
       {__Levelc_arena_elite_mgr644,
	__Tracesc_arena_elite_mgr644}}
	  when __Levelc_arena_elite_mgr644 band 64 /= 0 orelse
		 __Tracesc_arena_elite_mgr644 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_elite_mgr}, {function, idle},
			{line, 644}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("精英赛首次, 开始进入下半赛季常规赛", []), none, 4096, 64,
		       __Levelc_arena_elite_mgr644,
		       __Tracesc_arena_elite_mgr644, lager_event,
		       __Pidc_arena_elite_mgr644);
      _ -> ok
    end,
    Ts = date:unixtime(ms),
    EndDay = arena_elite_data:get_constant(first_routine),
    TimeOut = date:now_diff(EndDay, {0, 0, 0}) * 1000,
    NewPeriod = 1,
    sys_env:save(c_arena_elite_state,
		 {Ts, TimeOut, NewPeriod, first_routine}),
    sys_env:save(c_arena_elite_state_start_time,
		 date:unixtime()),
    self() ! sync_status_to_zone,
    c_arena_elite_lib:calc_zone(NewPeriod),
    do_update_zone_id(20),
    continue(first_routine,
	     State#state{ts = Ts, timeout = TimeOut,
			 period = NewPeriod});
idle(_Any, State) -> continue(first_routine, State).

first_routine(do_clear, State = #state{}) ->
    Ts = date:unixtime(ms),
    TimeOut = date:week_next_diff([1], {0, 0, 0}) * 1000,
    NewPeriod = 0,
    Switch = idle,
    sys_env:save(c_arena_elite_state,
		 {Ts, TimeOut, NewPeriod, Switch}),
    self() ! sync_status_to_zone_clean,
    ets:delete_all_objects(c_arena_elite_rank),
    dets:delete_all_objects(c_arena_elite_rank),
    ets:delete_all_objects(c_arena_old_elite_rank),
    dets:delete_all_objects(c_arena_old_elite_rank),
    ets:delete_all_objects(c_arena_elite_log),
    dets:delete_all_objects(c_arena_elite_log),
    put(c_arena_elite_log, []),
    put(arena_elite_rank, []),
    continue(idle,
	     State#state{ts = Ts, timeout = TimeOut,
			 period = NewPeriod});
first_routine(timeout,
	      State = #state{period = Period}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_elite_mgr683, _,
       {__Levelc_arena_elite_mgr683,
	__Tracesc_arena_elite_mgr683}}
	  when __Levelc_arena_elite_mgr683 band 64 /= 0 orelse
		 __Tracesc_arena_elite_mgr683 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_elite_mgr}, {function, first_routine},
			{line, 683}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("进入第~w期上半赛季常规赛", [Period]), none, 4096,
		       64, __Levelc_arena_elite_mgr683,
		       __Tracesc_arena_elite_mgr683, lager_event,
		       __Pidc_arena_elite_mgr683);
      _ -> ok
    end,
    Ts = date:unixtime(ms),
    EndDay = arena_elite_data:get_constant(second_routine),
    TimeOut = date:now_diff(EndDay, {0, 0, 0}) * 1000,
    sys_env:save(c_arena_elite_state,
		 {Ts, TimeOut, Period, second_routine}),
    self() ! sync_status_to_zone,
    continue(second_routine,
	     State#state{ts = Ts, timeout = TimeOut});
first_routine(_Any, State) ->
    continue(first_routine, State).

second_routine(timeout,
	       State = #state{period = Period}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_elite_mgr696, _,
       {__Levelc_arena_elite_mgr696,
	__Tracesc_arena_elite_mgr696}}
	  when __Levelc_arena_elite_mgr696 band 64 /= 0 orelse
		 __Tracesc_arena_elite_mgr696 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_elite_mgr},
			{function, second_routine}, {line, 696},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("下半赛季常规赛结束, 开始进入下半赛季王者赛", []), none, 4096,
		       64, __Levelc_arena_elite_mgr696,
		       __Tracesc_arena_elite_mgr696, lager_event,
		       __Pidc_arena_elite_mgr696);
      _ -> ok
    end,
    Ts = date:unixtime(ms),
    EndDay = arena_elite_data:get_constant(second_king),
    TimeOut = date:now_diff(EndDay, {0, 0, 0}) * 1000,
    sys_env:save(c_arena_elite_state,
		 {Ts, TimeOut, Period, second_king}),
    self() ! sync_status_to_zone,
    continue(second_king,
	     State#state{ts = Ts, timeout = TimeOut});
second_routine(_Any, State) ->
    continue(second_routine, State).

second_king(timeout, State = #state{period = Period}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_arena_elite_mgr708, _,
       {__Levelc_arena_elite_mgr708,
	__Tracesc_arena_elite_mgr708}}
	  when __Levelc_arena_elite_mgr708 band 64 /= 0 orelse
		 __Tracesc_arena_elite_mgr708 /= [] ->
	  lager:do_log(info,
		       [{module, c_arena_elite_mgr}, {function, second_king},
			{line, 708}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("下半赛季王者赛结束, 开始进入新赛季上半赛季常规赛", []), none,
		       4096, 64, __Levelc_arena_elite_mgr708,
		       __Tracesc_arena_elite_mgr708, lager_event,
		       __Pidc_arena_elite_mgr708);
      _ -> ok
    end,
    Ts = date:unixtime(ms),
    EndDay = arena_elite_data:get_constant(first_routine),
    TimeOut = date:now_diff(EndDay, {0, 0, 0}) * 1000,
    catch do_reward(Period),
    NewPeriod = Period + 1,
    sys_env:save(c_arena_elite_state,
		 {Ts, TimeOut, NewPeriod, first_routine}),
    sys_env:save(c_arena_elite_state_start_time,
		 date:unixtime()),
    self() ! sync_status_to_zone,
    self() ! {init_new_period, Period},
    continue(first_routine,
	     State#state{ts = Ts, timeout = TimeOut,
			 period = NewPeriod});
second_king(_Any, State) ->
    continue(second_king, State).

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

do_ver({c_e_role, Ver = 1, Id, Name, Power, Lev, Face,
	Look_id, Score, Elite_lev, Avatar_id, IsKing}) ->
    MatchPower = Score *
		   arena_elite_data:get_constant(strength_var1)
		   + Power * arena_elite_data:get_constant(strength_var2),
    do_ver({c_e_role, Ver + 1, Id, Name, Power, Lev, Face,
	    Look_id, Score, Elite_lev, Avatar_id, IsKing,
	    MatchPower});
do_ver({c_e_role, Ver = 2, Id, Name, Power, Lev, Face,
	Look_id, Score, Elite_lev, Avatar_id, IsKing,
	MatchPower}) ->
    Star = arena_elite_data:get_constant(strength_var3),
    Rio = 5.0e-1,
    Zid = get_zid(Id),
    do_ver({c_e_role, Ver + 1, Id, Name, Power, Lev, Face,
	    Look_id, Score, Elite_lev, Avatar_id, IsKing,
	    MatchPower, Star, Rio, Zid});
do_ver({c_e_role, Ver = 3, Id, Name, Power, Lev, Face,
	Look_id, Score, Elite_lev, Avatar_id, IsKing,
	MatchPower, Star, Rio, Zid}) ->
    FaceUpdateTime = 0,
    FaceFile = <<>>,
    do_ver({c_e_role, Ver + 1, Id, Name, Power, Lev, Face,
	    Look_id, Score, Elite_lev, Avatar_id, IsKing,
	    MatchPower, Star, Rio, Zid, FaceUpdateTime, FaceFile});
do_ver(Data = #c_e_role{ver = 4, score = Score,
			power = Power, all_star = Star, win_rio = Rio}) ->
    MatchPower = Score *
		   arena_elite_data:get_constant(strength_var1)
		   +
		   Power * Rio *
		     arena_elite_data:get_constant(strength_var2)
		     * Star
		     / arena_elite_data:get_constant(strength_var3),
    Data#c_e_role{match_power = MatchPower}.

get_zid(Id = {_, Sid}) ->
    case c_arena_elite_lib:get_srv_zone_id(Id) of
      ZoneId when is_integer(ZoneId) -> ZoneId;
      _ ->
	  [_, Zid] = string_util:explode(Sid, "_"),
	  (list_to_integer(Zid) - 1) div 200 + 1
    end.

update_match_power(0) -> ok;
update_match_power(N) ->
    TabName = tab(N),
    Fun = fun (Data = #c_e_role{id = Id = {_, Sid},
				power = Power, score = Score, win_rio = Rio,
				all_star = Star}) ->
		  MatchPower = Score *
				 arena_elite_data:get_constant(strength_var1)
				 +
				 Power * Rio *
				   arena_elite_data:get_constant(strength_var2)
				   *
				   min(Star,
				       arena_elite_data:get_constant(strength_var4))
				   /
				   arena_elite_data:get_constant(strength_var3),
		  NewData = Data#c_e_role{match_power = MatchPower,
					  all_star =
					      min(Star,
						  arena_elite_data:get_constant(strength_var4))},
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidc_arena_elite_mgr773, _,
		     {__Levelc_arena_elite_mgr773,
		      __Tracesc_arena_elite_mgr773}}
			when __Levelc_arena_elite_mgr773 band 128 /= 0 orelse
			       __Tracesc_arena_elite_mgr773 /= [] ->
			lager:do_log(debug,
				     [{module, c_arena_elite_mgr},
				      {function, update_match_power},
				      {line, 773}, {pid, pid_to_list(self())},
				      {node, node()}
				      | lager:md()],
				     io_lib:format("重新计算匹配战力:~w",
						   [{Score, Power,
						     MatchPower}]),
				     none, 4096, 128,
				     __Levelc_arena_elite_mgr773,
				     __Tracesc_arena_elite_mgr773, lager_event,
				     __Pidc_arena_elite_mgr773);
		    _ -> ok
		  end,
		  update_ets(TabName, NewData, all),
		  continue
	  end,
    dets:traverse(TabName, Fun),
    update_match_power(N - 1).

do_update_zone_id(0) -> ok;
do_update_zone_id(N) ->
    TabName = tab(N),
    Fun = fun (Data = #c_e_role{id = Id = {_, Sid},
				elite_lev = ELev, power = Power,
				all_star = Star},
	       Acc) ->
		  ZoneIdT = c_arena_elite_lib:get_srv_zone_id(Sid),
		  ZoneId = util:if_true(is_integer(ZoneIdT), ZoneIdT, 1),
		  NewLev = arena_elite_data:get_ref_lev(ELev),
		  Rio = arena_elite_data:get_constant(initial_win_rate) *
			  1.0e-3,
		  Score = arena_elite_data:get_all_score(NewLev),
		  MatchPower = Score *
				 arena_elite_data:get_constant(strength_var1)
				 +
				 Power * Rio *
				   arena_elite_data:get_constant(strength_var2)
				   *
				   min(Star,
				       arena_elite_data:get_constant(strength_var4))
				   /
				   arena_elite_data:get_constant(strength_var3),
		  NewData = Data#c_e_role{zid = ZoneId, is_king = 0,
					  match_power = MatchPower,
					  elite_lev = NewLev, win_rio = Rio,
					  score = Score},
		  [NewData | Acc]
	  end,
    List = ets:foldl(Fun, [], TabName),
    update_ets(TabName, List, ets),
    do_update_zone_id(N - 1).

do_9377_update_zone_id(0) -> ok;
do_9377_update_zone_id(N) ->
    TabName = tab(N),
    Fun = fun (Data = #c_e_role{id = {_, Sid}}, Acc) ->
		  ZoneIdT = c_arena_elite_lib:get_srv_zone_id(Sid),
		  ZoneId = util:if_true(is_integer(ZoneIdT), ZoneIdT, 1),
		  NewData = Data#c_e_role{zid = ZoneId},
		  [NewData | Acc]
	  end,
    List = ets:foldl(Fun, [], TabName),
    update_ets(TabName, List, ets),
    do_9377_update_zone_id(N - 1).

do_update_dets(0) -> ok;
do_update_dets(N) ->
    TabName = tab(N),
    dets:insert(TabName, ets:tab2list(TabName)),
    do_update_dets(N - 1).

delete_zero_power(0) -> ok;
delete_zero_power(N) ->
    TabName = tab(N),
    Fun = fun (#c_e_role{id = Id, power = Power}) ->
		  case Power == 0 of
		    true ->
			ets:delete(TabName, Id), dets:delete(TabName, Id);
		    _ -> ok
		  end,
		  continue
	  end,
    dets:traverse(TabName, Fun),
    delete_zero_power(N - 1).

open_ets(0) -> ok;
open_ets(N) ->
    TabName = tab(N),
    dets:open_file(TabName,
		   [{file,
		     lists:concat(["./dets/c_arena_elite_role_", N,
				   ".dets"])},
		    {keypos, #c_e_role.id}, {type, set}]),
    ets:new(TabName,
	    [set, named_table, public, {keypos, #c_e_role.id}]),
    Fun = fun (Data) ->
		  NewData = do_ver(Data),
		  update_ets(TabName, NewData, all),
		  continue
	  end,
    dets:traverse(TabName, Fun),
    open_ets(N - 1).

tab(1) -> c_arena_elite_role_1;
tab(2) -> c_arena_elite_role_2;
tab(3) -> c_arena_elite_role_3;
tab(4) -> c_arena_elite_role_4;
tab(5) -> c_arena_elite_role_5;
tab(6) -> c_arena_elite_role_6;
tab(7) -> c_arena_elite_role_7;
tab(8) -> c_arena_elite_role_8;
tab(9) -> c_arena_elite_role_9;
tab(10) -> c_arena_elite_role_10;
tab(11) -> c_arena_elite_role_11;
tab(12) -> c_arena_elite_role_12;
tab(13) -> c_arena_elite_role_13;
tab(14) -> c_arena_elite_role_14;
tab(15) -> c_arena_elite_role_15;
tab(16) -> c_arena_elite_role_16;
tab(17) -> c_arena_elite_role_17;
tab(18) -> c_arena_elite_role_18;
tab(19) -> c_arena_elite_role_19;
tab(20) -> c_arena_elite_role_20;
tab(N) when N > 20 -> tab(N rem 20 + 1).

do_rank(#c_e_role{elite_lev = EliteLev, score = Score},
	_RankList, _TabName, _Period)
    when EliteLev == 1 andalso Score == 0 ->
    ok;
do_rank(PushRole = #c_e_role{id = RoleId = {_, Sid},
			     elite_lev = EliteLev, score = Score},
	RankList, TabName, Period) ->
    {LastEliteLev, LastScore} = case lists:keyfind(500,
						   #arena_elite_rank.rank,
						   RankList)
				    of
				  #arena_elite_rank{score = ScoreT,
						    elite_lev = EliteLevT} ->
				      {EliteLevT, ScoreT};
				  _ -> {1, 0}
				end,
    case lists:keymember(RoleId, #arena_elite_rank.id,
			 RankList)
	   == false
	   andalso
	   not
	     (EliteLev > LastEliteLev orelse
		EliteLev == LastEliteLev andalso Score > LastScore)
	of
      true -> ok;
      _ ->
	  RankRole = to_arena_rank(PushRole),
	  RankList2 = list_util:add_sort(lists:reverse(RankList),
					 RankRole,
					 lists:reverse([{asc,
							 #arena_elite_rank.time},
							#arena_elite_rank.score,
							#arena_elite_rank.elite_lev]),
					 #arena_elite_rank.id),
	  NewRankList = set_idx(RankList2, #arena_elite_rank.rank,
				1, []),
	  update_ets(TabName,
		     {c_arena_elite_lib:get_srv_zone_id(Sid), NewRankList},
		     all)
    end.

set_idx([], _Pos, _Idx, L) -> L;
set_idx(_, _Pos, Idx, L) when Idx > 500 -> L;
set_idx([I | T], Pos, Idx, L) ->
    set_idx(T, Pos, Idx + 1, [setelement(Pos, I, Idx) | L]).

to_arena_rank(#c_e_role{id = RoleId, name = Name,
			lev = Lev, face = Face,
			face_update_time = FaceUpdateTime, face_file = FaceFile,
			power = Power, look_id = LookId, score = Score,
			elite_lev = EliteLev, avatar_id = AvatarId}) ->
    #arena_elite_rank{id = RoleId, name = Name, lev = Lev,
		      face = Face, power = Power, look_id = LookId,
		      score = Score, elite_lev = EliteLev,
		      avatar_id = AvatarId, face_update_time = FaceUpdateTime,
		      face_file = FaceFile}.

do_reward(Period) ->
    Fun = fun (#arena_elite_rank{rank = Rank,
				 elite_lev = ELev, id = Id = {_, SrvId}},
	       Acc) ->
		  HonorId = arena_elite_data:get_honor_id(Rank),
		  case HonorId > 0 of
		    true ->
			LimitLev = arena_elite_data:get_rank_limit_lev(Rank),
			case honor_data:get(HonorId) of
			  #honor_data{name = HonorName} when ELev >= LimitLev ->
			      Msg1 = {string,
				      {blue,
				       util:fbin(lang:get(<<"超凡段位赛(S~w)"/utf8>>),
						 [Period])}},
			      Msg2 = {string,
				      {blue,
				       util:fbin(lang:get(<<"第~w名"/utf8>>),
						 [Rank])}},
			      Msg3 = {string,
				      {orange,
				       util:fbin(lang:get(<<"【~ts】"/utf8>>),
						 [HonorName])}},
			      Content =
				  color:msg(lang:get(<<"尊敬的冒险者大人，恭喜您在~ts中获得~ts的骄人成绩！特此~ts称号，荣誉属于强者！干杯！"/utf8>>),
					    [Msg1, Msg2, Msg3]),
			      LogMsg =
				  util:fbin("Phần thưởng giải quyết xếp hạng trong "
					    "cuộc thi xếp hạng đặc biệt[rank:~w]",
					    [Rank]),
			      Mail =
				  {lang:get(<<"Phần thưởng vinh quang trong cuộc thi "
					      "xếp hạng đặc biệt"/utf8>>),
				   Content, [], [], LogMsg},
			      big_world_lib:cast({big_world, SrvId}, mail,
						 local_send, [Id, Mail]),
			      Acc;
			  _ -> Acc
			end;
		    _ -> Acc
		  end
	  end,
    Fun0 = fun ({ZondId, List}, Acc) ->
		   case is_integer(ZondId) of
		     true -> lists:foldl(Fun, [], List), Acc;
		     _ -> Acc
		   end
	   end,
    ets:foldl(Fun0, [], c_arena_elite_rank2).

delete_log() ->
    Fun = fun (#arena_elite_log{atk_id = {_, Sid},
				replay_list = ReplayList},
	       Acc) ->
		  Ids = [Temp
			 || {_, #arena_replay_info{id = Temp}} <- ReplayList],
		  NIds = case lists:keyfind(Sid, 1, Acc) of
			   {_, OIds} -> Ids ++ OIds;
			   _ -> Ids
			 end,
		  lists:keystore(Sid, 1, Acc, {Sid, NIds})
	  end,
    L = ets:foldl(Fun, [], c_arena_elite_log_hall),
    L2 = ets:foldl(Fun, [], c_arena_elite_log),
    Fun2 = fun ({_ZondId, Logs}, Acc) ->
		   LTemp = lists:foldl(Fun, [], Logs), LTemp ++ Acc
	   end,
    L3 = ets:foldl(Fun2, [], c_arena_elite_log_hall2),
    L4 = ets:foldl(Fun2, [], c_arena_elite_log2),
    [big_world_lib:cast({big_world, Sid}, combat_replay_mgr,
			dec_replay_reference, [Ids])
     || {Sid, Ids} <- L],
    [big_world_lib:cast({big_world, Sid}, combat_replay_mgr,
			dec_replay_reference, [Ids])
     || {Sid, Ids} <- L2],
    [big_world_lib:cast({big_world, Sid}, combat_replay_mgr,
			dec_replay_reference, [Ids])
     || {Sid, Ids} <- L3],
    [big_world_lib:cast({big_world, Sid}, combat_replay_mgr,
			dec_replay_reference, [Ids])
     || {Sid, Ids} <- L4],
    ets:delete_all_objects(c_arena_elite_log_hall),
    dets:delete_all_objects(c_arena_elite_log_hall),
    ets:delete_all_objects(c_arena_elite_log),
    dets:delete_all_objects(c_arena_elite_log),
    ets:delete_all_objects(c_arena_elite_log_hall2),
    dets:delete_all_objects(c_arena_elite_log_hall2),
    ets:delete_all_objects(c_arena_elite_log2),
    dets:delete_all_objects(c_arena_elite_log2).


