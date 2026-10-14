-file("src/mod/holiday_return_new/holiday_return_new"
      ".erl",
      1).

-module(holiday_return_new).

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
		{arena_team_arge,
		 [result, win_count, lose_count, a_team_id, a_score,
		  a_new_score, a_rank, a_new_rank, a_team_members,
		  a_team_name, b_team_id, b_score, b_new_score, b_rank,
		  b_new_rank, b_team_name, b_team_members,
		  all_hurt_statistics, extra]},
		{arena_team_replay_partner,
		 [pos, bid, lev, star, skin_id, ext]},
		{arena_team_replay_info,
		 [id, round, ret, time, a_id, a_power, a_formation_type,
		  a_order, a_end_hp, b_id, b_power, b_formation_type,
		  b_order, b_end_hp, a_plist, b_plist, ext]},
		{arena_team_log,
		 [id, atk_id, atk_name, a_score, a_new_score, a_rank,
		  a_new_rank, a_team_members, a_team_power, b_team_id,
		  b_score, b_new_score, b_rank, b_new_rank, b_team_name,
		  b_team_members, b_team_power, ret, win_count,
		  lose_count, replay_list, time]},
		{role_arena_team_log, [id, list]},
		{arena_term_partners_info,
		 [pos, id, bid, lev, star, break_lev, power, skin_id,
		  dower_skill, set_skill, attr, extra]},
		{arena_team_defense,
		 [order, role_id, role_lev, formation_type, hallows_id,
		  hallows_lev, hallows_skill_lev, partner_infos,
		  hallows_look_id, hallows_lucky, hallows_seal,
		  hallows_refine, hallows_all_look_ids, sprite_lev,
		  sprites, sprites_attr, extra, break_groups]},
		{arena_team_rival,
		 [id, leader_id, team_name, team_power, team_rank,
		  team_score, team_members, defense, ext]},
		{arena_team_partner,
		 [pos, id, bid, lev, star, break_lev, power, skin_id,
		  ext]},
		{arena_team_member,
		 [id, name, lev, face_id, avatar_bid, power, pos,
		  is_hide, team_partner, formation_type, hallows_id,
		  sprite_lev, sprites, ext, face_update_time, face_file,
		  break_groups]},
		{c_arena_team,
		 [ver, id, rank, score, team_match_power, score_time,
		  ext, members]},
		{arena_team,
		 [ver, id, creat_id, leader_id, leader_name, team_pid,
		  team_name, team_limit_power, team_limit_lev,
		  team_is_check, team_power, team_match_power,
		  team_members, join_list, is_sign, join_num, rival_info,
		  count, add_time, combat_count]},
		{m_arena_team,
		 [ver, period, team_id, combat_count, award_list,
		  old_data, point_info]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{activity, [id, status, name, data, ext_args]},
		{holiday_return_new_feat_data,
		 [period, id, f_id, s_id, ref_day, progress, award]},
		{m_holiday_return_new,
		 [ver, period, start_time, end_time, gift_status,
		  sign_list, quest_list, exchange_day_list,
		  exchange_buy_list, free_draw_count, draw_count,
		  draw_info, draw_type_info, must_not, get_red_count,
		  red_packet_info, get_red_info, ext]},
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

-export([login/1, ready/1, zero_flush/1,
	 return_first_charge_log/2, init/0, check_open/1, push/1,
	 push_gift_info/1, push_sign_info/1, take_return_gift/1,
	 take_sign_award/2, get_exchange_info/1, take_exchange/2,
	 is_return/1, do_is_return/1, send_return/3,
	 send_return_award/2, calc_period2/1]).

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

-file("src/mod/holiday_return_new/holiday_return_new"
      ".erl",
      27).

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

-file("src/mod/holiday_return_new/holiday_return_new"
      ".erl",
      28).

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

-file("src/mod/holiday_return_new/holiday_return_new"
      ".erl",
      29).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/holiday_return_new/holiday_return_new"
      ".erl",
      30).

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

-file("src/mod/holiday_return_new/holiday_return_new"
      ".erl",
      31).

-file("inc/gain.hrl", 1).

-record(gain,
	{label  :: atom(), val  :: term(),
	 msg = <<>>  :: bitstring(), flag  :: atom(),
	 reason  :: atom(), ext = 0  :: term(),
	 notice = 0  :: 0..1,
	 move_to = 0  :: non_neg_integer()}).

-record(loss,
	{label  :: atom(), val  :: term(),
	 own_val = 0  :: term(), msg = <<>>  :: bitstring(),
	 flag  :: atom(), reason  :: atom(),
	 ext = 0  :: term()}).

-record(gain_loss_opts,
	{title = <<>>, return_gl = [], is_continue = false,
	 order = loss  :: gain | loss,
	 gain_tag = <<>>  :: binary(),
	 loss_tag = <<>>  :: binary(),
	 split_str = <<"，"/utf8>>  :: binary(),
	 split_op_str = <<"，"/utf8>>  :: binary(),
	 type = 2  :: non_neg_integer(),
	 is_auto_buy = 0  :: 0..1,
	 need_notify_fail_item = false  :: true | false,
	 log_name = <<"市场"/utf8>>  :: true | false}).

-file("src/mod/holiday_return_new/holiday_return_new"
      ".erl",
      32).

-file("inc/arena_team.hrl", 1).

-record(m_arena_team,
	{ver = 4, period = 0, team_id = {0, <<>>},
	 combat_count = 0, award_list = [], old_data = [],
	 point_info = []}).

-record(arena_team,
	{ver = 1, id = {0, <<>>}, creat_id = {0, <<>>},
	 leader_id = {0, <<>>}, leader_name = <<>>, team_pid = 0,
	 team_name = <<>>, team_limit_power = 0,
	 team_limit_lev = 0, team_is_check = 0, team_power = 0,
	 team_match_power = 0, team_members = [], join_list = [],
	 is_sign = 0, join_num = 1, rival_info = [], count = 0,
	 add_time = 0, combat_count = 0}).

-record(c_arena_team,
	{ver = 1, id = {0, <<>>}, rank = 0, score = 1000,
	 team_match_power = 0, score_time = 0, ext = [],
	 members = []}).

-record(arena_team_member,
	{id = {0, <<>>}, name = <<>>, lev = 0, face_id = 0,
	 avatar_bid = 0, power = 0, pos = 0, is_hide = 0,
	 team_partner = [], formation_type = 1, hallows_id = 0,
	 sprite_lev = 0, sprites = [], ext = [],
	 face_update_time = 0, face_file = <<>>,
	 break_groups = []}).

-record(arena_team_partner,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, skin_id = 0, ext = []}).

-record(arena_team_rival,
	{id = {0, <<>>}, leader_id = {0, <<>>},
	 team_name = <<>>, team_power = 0, team_rank = 0,
	 team_score = 0, team_members = [], defense = [],
	 ext = []}).

-record(arena_team_defense,
	{order, role_id, role_lev, formation_type, hallows_id,
	 hallows_lev, hallows_skill_lev, partner_infos,
	 hallows_look_id, hallows_lucky, hallows_seal,
	 hallows_refine, hallows_all_look_ids = [],
	 sprite_lev = 0, sprites = [], sprites_attr, extra = [],
	 break_groups = []}).

-record(arena_term_partners_info,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, skin_id = 0, dower_skill = [],
	 set_skill = [], attr, extra = []}).

-record(role_arena_team_log,
	{id = {0, <<>>}, list = []}).

-record(arena_team_log,
	{id = 0, atk_id = {0, <<>>}, atk_name = <<>>,
	 a_score = 0, a_new_score = 0, a_rank = 0,
	 a_new_rank = 0, a_team_members = [], a_team_power = 0,
	 b_team_id = {0, <<>>}, b_score = 0, b_new_score = 0,
	 b_rank = 0, b_new_rank = 0, b_team_name = <<>>,
	 b_team_members = [], b_team_power = 0, ret = 1,
	 win_count = 0, lose_count = 0, replay_list = [],
	 time = 0}).

-record(arena_team_replay_info,
	{id = 0, round = 0, ret = 0, time = 0, a_id = {0, <<>>},
	 a_power = 0, a_formation_type = 0, a_order = 0,
	 a_end_hp = 0, b_id = {0, <<>>}, b_power = 0,
	 b_formation_type = 0, b_order = 0, b_end_hp = 0,
	 a_plist = [], b_plist = [], ext = []}).

-record(arena_team_replay_partner,
	{pos = 0, bid = 0, lev = 0, star = 0, skin_id = 0,
	 ext = []}).

-record(arena_team_arge,
	{result = 0, win_count = 0, lose_count = 0,
	 a_team_id = {0, <<>>}, a_score = 0, a_new_score = 0,
	 a_rank = 0, a_new_rank = 0, a_team_members = [],
	 a_team_name = 0, b_team_id = {0, <<>>}, b_score = 0,
	 b_new_score = 0, b_rank = 0, b_new_rank = 0,
	 b_team_name = 0, b_team_members = [],
	 all_hurt_statistics = [], extra = []}).

-file("src/mod/holiday_return_new/holiday_return_new"
      ".erl",
      33).

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

-file("src/mod/holiday_return_new/holiday_return_new"
      ".erl",
      34).

init() -> #m_holiday_return_new{}.

-spec login(#role{}) -> {ok, #role{}}.

login(Role = #role{m_holiday_return_new =
		       MHolidayReturnNew = #m_holiday_return_new{period =
								     OldPeriod}}) ->
    NewRole = case check_open(Role) of
		{ok, _} -> activity_self:set_activity(806, 1, []), Role;
		_ ->
		    {Period, StartTime, EndTime} = calc_period(Role),
		    if Period =:= 0 ->
			   activity_self:set_activity(806, 0, []), Role;
		       OldPeriod =/= Period ->
			   activity_self:set_activity(806, 1, []), Role;
		       true -> activity_self:set_activity(806, 1, []), Role
		    end
	      end,
    role_robot:sync_role(NewRole),
    holiday:push_bid_can_reward(NewRole, 93042),
    {ok, NewRole}.

-spec ready(#role{}) -> ok.

ready(Role = #role{}) ->
    holiday_return_new_red_packet:push_red_packet(Role),
    {ok, Role}.

-spec zero_flush(#role{}) -> #role{}.

zero_flush(Role = #role{id = RoleId, lev = Lev,
			m_holiday_return_new =
			    MHolidayReturnNew = #m_holiday_return_new{period =
									  OldPeriod}}) ->
    NewRole = #role{m_holiday_return_new =
			#m_holiday_return_new{get_red_count = GetRedCount}} =
		  case check_open(Role) of
		    {ok, _} ->
			activity_self:set_activity(806, 1, []),
			NRole = Role#role{m_holiday_return_new =
					      MHolidayReturnNew#m_holiday_return_new{get_red_count
											 =
											 0,
										     exchange_day_list
											 =
											 [],
										     red_packet_info
											 =
											 []}},
			NRole1 = add_login_day(NRole),
			push(NRole1),
			NRole1;
		    _ ->
			{Period, StartTime, EndTime} = calc_period(Role),
			if Period =:= 0 ->
			       activity_self:set_activity(806, 0, []),
			       OldList = sys_env:get(return_role_list, []),
			       sys_env:save(return_role_list,
					    OldList -- [RoleId]),
			       NRole = Role#role{m_holiday_return_new =
						     MHolidayReturnNew#m_holiday_return_new{get_red_count
												=
												0,
											    exchange_day_list
												=
												[],
											    red_packet_info
												=
												[]}},
			       NRole1 = item_reward_mail(NRole),
			       NRole2 = item_reward_mail2(NRole1),
			       NRole2;
			   OldPeriod =/= Period ->
			       activity_self:set_activity(806, 1, []),
			       NRole = Role#role{m_holiday_return_new =
						     MHolidayReturnNew#m_holiday_return_new{period
												=
												Period,
											    start_time
												=
												StartTime,
											    end_time
												=
												EndTime,
											    gift_status
												=
												0,
											    sign_list
												=
												[],
											    quest_list
												=
												[],
											    exchange_day_list
												=
												[],
											    exchange_buy_list
												=
												[],
											    free_draw_count
												=
												0,
											    draw_count
												=
												0,
											    draw_info
												=
												[],
											    draw_type_info
												=
												[],
											    must_not
												=
												[],
											    get_red_count
												=
												0,
											    red_packet_info
												=
												[],
											    get_red_info
												=
												[],
											    ext
												=
												[]}},
			       NRole1 = add_login_day(NRole),
			       NRole2 = var:set_var(NRole1, acc, 2060, 0),
			       NRole3 = item_reward_mail(NRole2),
			       NRole4 = item_reward_mail2(NRole3),
			       OldList = sys_env:get(return_role_list, []),
			       log:save(return_new_login,
					{NRole4,
					 util:fbin(lang:get(<<"等级:~w"/utf8>>),
						   [Lev])}),
			       sys_env:save(return_role_list,
					    [RoleId | OldList]),
			       NRole4;
			   true ->
			       activity_self:set_activity(806, 1, []),
			       NRole = Role#role{m_holiday_return_new =
						     MHolidayReturnNew#m_holiday_return_new{get_red_count
												=
												0,
											    exchange_day_list
												=
												[],
											    red_packet_info
												=
												[]}},
			       NRole1 = add_login_day(NRole),
			       NRole1
			end
		  end,
    LimitCount =
	holiday_return_new_data:get_const(max_day_get_num),
    sys_conn:pack_send(27912,
		       {0, lang:get(<<""/utf8>>), GetRedCount, LimitCount}),
    set_day_count(RoleId, 0),
    set_type_list(RoleId, pk, []),
    set_type_list(RoleId, endless, []),
    holiday:push_bid_can_reward(NewRole, 93042),
    push(NewRole),
    {ok, NewRole}.

item_reward_mail(Role = #role{}) ->
    [{DramItemId, _}] =
	holiday_return_new_data:get_const(draw_item_cost),
    {_, DrawItemNum} = package:count(by_base_id, DramItemId,
				     Role#role.p_bag),
    RedItemId =
	holiday_return_new_data:get_const(red_item_id),
    {_, RedItemNum} = package:count(by_base_id, RedItemId,
				    Role#role.p_bag),
    NRole1 = case DrawItemNum > 0 of
	       true ->
		   Expend1 = [{DramItemId, DrawItemNum}],
		   Loss1 = format:val_to_loss(Expend1,
					      holiday_return_new_item_reward),
		   case role_gain:do(Role, Loss1) of
		     {ok, NNRole1} ->
			 log:log_gain(Loss1, Role, NNRole1,
				      <<"新版回归活动-英雄祈愿道具返还"/utf8>>,
				      util:fbin(<<"[{道具id,数量}]:~w"/utf8>>,
						[Expend1])),
			 [{ValueId1, ValueNum1}] =
			     holiday_return_new_data:get_const(draw_item_reward_value),
			 RewardList1 = [{ValueId1, ValueNum1 * DrawItemNum}],
			 {Assets1, Items1} =
			     format:split_assets_items(RewardList1),
			 {ok, NNRole2} = mail:add(NNRole1,
						  {util:fbin(lang:get(<<"英雄祈愿道具返还"/utf8>>),
							     []),
						   color:msg(lang:get(<<"亲爱的冒险者大人：\n这是您在~ts活动尚未使用的活动道具，已兑换成相应比例补偿，请查收"/utf8>>),
							     [{green,
							       lang:get(<<"英雄祈愿"/utf8>>)}]),
						   Assets1, Items1,
						   <<"英雄祈愿道具返还"/utf8>>,
						   86400 + date:unixtime()}),
			 NNRole2;
		     _ -> Role
		   end;
	       _ -> Role
	     end,
    NRole2 = case RedItemNum > 0 of
	       true ->
		   Expend2 = [{RedItemId, RedItemNum}],
		   Loss2 = format:val_to_loss(Expend2,
					      holiday_return_new_item_reward),
		   case role_gain:do(NRole1, Loss2) of
		     {ok, NNRole3} ->
			 log:log_gain(Loss2, NRole1, NNRole3,
				      <<"新版回归活动-回归红包道具返还"/utf8>>,
				      util:fbin(<<"[{道具id,数量}]:~w"/utf8>>,
						[Expend2])),
			 [{ValueId2, ValueNum2}] =
			     holiday_return_new_data:get_const(red_item_value),
			 RewardList2 = [{ValueId2, ValueNum2 * RedItemNum}],
			 {Assets, Items} =
			     format:split_assets_items(RewardList2),
			 {ok, NNRole4} = mail:add(NNRole3,
						  {util:fbin(lang:get(<<"回归红包道具返还"/utf8>>),
							     []),
						   color:msg(lang:get(<<"亲爱的冒险者大人：\n这是您在~ts活动尚未使用的活动道具，已兑换成相应比例补偿，请查收"/utf8>>),
							     [{green,
							       lang:get(<<"回归红包"/utf8>>)}]),
						   Assets, Items,
						   <<"回归红包道具返还"/utf8>>,
						   86400 + date:unixtime()}),
			 NNRole4;
		     _ -> NRole1
		   end;
	       _ -> NRole1
	     end,
    NRole2.

item_reward_mail2(Role = #role{}) ->
    case holiday_lib:get_open_holiday(Role,
				      [3042, 93042, 993042])
	of
      #holiday{} -> Role;
      _ ->
	  ItemId =
	      holiday_return_new_data:get_const(exchange_item_id),
	  {_, ItemNum} = package:count(by_base_id, ItemId,
				       Role#role.p_bag),
	  case ItemNum > 0 of
	    true ->
		Expend = [{ItemId, ItemNum}],
		Loss1 = format:val_to_loss(Expend,
					   holiday_return_new_item_reward),
		case role_gain:do(Role, Loss1) of
		  {ok, NNRole1} ->
		      log:log_gain(Loss1, Role, NNRole1,
				   <<"新版回归活动-友谊商城道具返还"/utf8>>,
				   util:fbin(<<"[{道具id,数量}]:~w"/utf8>>,
					     [Expend])),
		      [{ValueId, ValueNum}] =
			  holiday_return_new_data:get_const(exchange_item_value),
		      RewardList = [{ValueId, ValueNum * ItemNum}],
		      {Assets1, Items1} =
			  format:split_assets_items(RewardList),
		      {ok, NNRole2} = mail:add(NNRole1,
					       {util:fbin(lang:get(<<"友谊商城道具返还"/utf8>>),
							  []),
						color:msg(lang:get(<<"亲爱的冒险者大人：\n这是您在~ts活动尚未使用的活动道具，已兑换成相应比例补偿，请查收"/utf8>>),
							  [{green,
							    lang:get(<<"友谊商城"/utf8>>)}]),
						Assets1, Items1,
						<<"友谊商城道具返还"/utf8>>,
						86400 + date:unixtime()}),
		      NNRole2;
		  _ -> Role
		end;
	    _ -> Role
	  end
    end.

return_first_charge_log(Role = #role{},
			#{money := Money, package_id := PackageId,
			  package_name := PackageName}) ->
    case check_open(Role) of
      {ok, _} ->
	  case var:get_var(Role, acc, 2060, 0) of
	    0 ->
		NRole = var:set_var(Role, acc, 2060, 1),
		log:save(return_new_charge,
			 {NRole,
			  util:fbin(lang:get(<<"金额：~w, 充值id：~w, 充值档位名称：~ts"/utf8>>),
				    [Money, PackageId, PackageName])}),
		NRole;
	    _ -> Role
	  end;
      _ -> Role
    end.

add_login_day(Role = #role{m_holiday_return_new =
			       MH = #m_holiday_return_new{period = Period,
							  sign_list =
							      SignList}}) ->
    MaxSign = case SignList of
		[_ | _] -> lists:max([Day || {Day, _} <- SignList]);
		_ -> 0
	      end,
    MaxDay =
	lists:max(holiday_return_new_data:max_day(Period)),
    NewRole = case var:get_var(Role, day, 113, 0) of
		0 when MaxSign < MaxDay ->
		    NewDay = MaxSign + 1,
		    NewSignList = lists:keystore(NewDay, 1, SignList,
						 {NewDay, 1}),
		    NRole = Role#role{m_holiday_return_new =
					  MH#m_holiday_return_new{sign_list =
								      NewSignList}},
		    NRole1 = var:set_var(NRole, day, 113, 1),
		    NRole1;
		_ -> Role
	      end,
    NewRole.

-spec push_sign_info(#role{}) -> ok.

push_sign_info(#role{m_holiday_return_new =
			 #m_holiday_return_new{end_time = EndTime,
					       sign_list = SignList}}) ->
    sys_conn:pack_send(27908, {EndTime, SignList}), ok.

-spec take_sign_award(#role{}, integer()) -> {ok,
					      #role{}} |
					     {false, binary()}.

take_sign_award(Role = #role{m_holiday_return_new =
				 #m_holiday_return_new{sign_list = SignList}},
		Day) ->
    case check_open(Role) of
      {ok, Period} ->
	  case lists:keyfind(Day, 1, SignList) of
	    {Day, 1} ->
		Award = holiday_return_new_data:get_sign_award({Period,
								Day}),
		Gain = format:val_to_gain(Award, retrun_new_sign),
		case role_gain:do_notice(Role, Gain) of
		  {ok,
		   NRole = #role{m_holiday_return_new =
				     MHolidayReturnNew}} ->
		      log:log_gain(Gain, Role, NRole, <<"新版回归活动_回归签到"/utf8>>,
				   util:fbin("天数：~w", [Day])),
		      NewSignList = lists:keystore(Day, 1, SignList,
						   {Day, 2}),
		      NewRole = NRole#role{m_holiday_return_new =
					       MHolidayReturnNew#m_holiday_return_new{sign_list
											  =
											  NewSignList}},
		      push_sign_info(NewRole),
		      {ok, NewRole};
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
			{__Pidholiday_return_new252, _,
			 {__Levelholiday_return_new252,
			  __Tracesholiday_return_new252}}
			    when __Levelholiday_return_new252 band 8 /= 0 orelse
				   __Tracesholiday_return_new252 /= [] ->
			    lager:do_log(error,
					 [{module, holiday_return_new},
					  {function, take_sign_award},
					  {line, 252},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("【~ts】玩家领取新版回归活动_回归签到时失败",
						       [Role#role.name]),
					 none, 4096, 8,
					 __Levelholiday_return_new252,
					 __Tracesholiday_return_new252,
					 lager_event,
					 __Pidholiday_return_new252);
			_ -> ok
		      end,
		      {ok, Role}
		end;
	    {Day, 2} -> {false, lang:get(<<"奖励已领取"/utf8>>)};
	    _ -> {false, lang:get(<<"奖励不可领取"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

-spec push(#role{}) -> ok.

push(Role = #role{m_holiday_return_new =
		      #m_holiday_return_new{start_time = StartTime}}) ->
    case check_open(Role) of
      {ok, Period} ->
	  OpenDay = date:day_diff(date:unixtime(), StartTime) + 1,
	  sys_conn:pack_send(27902, {Period, OpenDay, 1}),
	  ok;
      _ -> sys_conn:pack_send(27902, {0, 0, 0}), ok
    end.

-spec push_gift_info(#role{}) -> ok.

push_gift_info(Role = #role{m_holiday_return_new =
				#m_holiday_return_new{gift_status = Status,
						      end_time = EndTime}}) ->
    case check_open(Role) of
      {ok, _} ->
	  sys_conn:pack_send(27900, {Status, EndTime}), ok;
      _ -> ok
    end.

-spec take_return_gift(#role{}) -> {ok, #role{}} |
				   {false, binary()}.

take_return_gift(Role = #role{m_holiday_return_new =
				  #m_holiday_return_new{gift_status = Status,
							end_time = EndTime}}) ->
    case check_open(Role) of
      {ok, Period} ->
	  case Status =:= 0 of
	    true ->
		case holiday_return_new_data:get_return_gift(Period) of
		  Reward = [_ | _] ->
		      Gain = format:val_to_gain(Reward, retrun_new_gift),
		      case role_gain:do_notice(Role, Gain) of
			{ok,
			 NRole = #role{m_holiday_return_new =
					   MHolidayReturnNew}} ->
			    log:log_gain(Gain, Role, NRole,
					 <<"新版回归活动_回归礼包"/utf8>>,
					 util:fbin("", [])),
			    NewRole = NRole#role{m_holiday_return_new =
						     MHolidayReturnNew#m_holiday_return_new{gift_status
												=
												1}},
			    push_gift_info(NewRole),
			    {ok, NewRole};
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
			      {__Pidholiday_return_new305, _,
			       {__Levelholiday_return_new305,
				__Tracesholiday_return_new305}}
				  when __Levelholiday_return_new305 band 8 /= 0
					 orelse
					 __Tracesholiday_return_new305 /= [] ->
				  lager:do_log(error,
					       [{module, holiday_return_new},
						{function, take_return_gift},
						{line, 305},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("【~ts】玩家领取新版回归活动_回归礼包时失败",
							     [Role#role.name]),
					       none, 4096, 8,
					       __Levelholiday_return_new305,
					       __Tracesholiday_return_new305,
					       lager_event,
					       __Pidholiday_return_new305);
			      _ -> ok
			    end,
			    {ok, Role}
		      end;
		  _ -> {false, lang:get(<<"领取失败"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"奖励已领取"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

-spec get_exchange_info(#role{}) -> ok.

get_exchange_info(Role = #role{id = RoleId,
			       m_holiday_return_new =
				   #m_holiday_return_new{exchange_day_list =
							     DayList,
							 exchange_buy_list =
							     BuyList}}) ->
    Period = calc_period2(Role),
    case holiday_lib:get_open_holiday(Role,
				      [3042, 93042, 993042])
	of
      #holiday{end_time = EndTime} ->
	  Fun = fun (Id, Acc) ->
			Val1 = list_util:keyfind(Id, DayList, 0),
			Val2 = list_util:keyfind(Id, BuyList, 0),
			[{Id, Val1, Val2} | Acc]
		end,
	  GetCount = get_day_count(RoleId),
	  LimitCount =
	      holiday_return_new_data:get_const(exchange_item_day_limit_num),
	  PushList = lists:foldl(Fun, [],
				 holiday_return_new_data:list(Period)),
	  sys_conn:pack_send(27914,
			     {EndTime, GetCount, LimitCount, PushList}),
	  ok;
      _ -> ok
    end.

-spec take_exchange(#role{}, pos_integer()) -> {ok,
						#role{}} |
					       {false, binary()}.

take_exchange(Role = #role{m_holiday_return_new =
			       MHolidayReturn =
				   #m_holiday_return_new{exchange_day_list =
							     DayList,
							 exchange_buy_list =
							     BuyList}},
	      Id) ->
    Period = calc_period2(Role),
    case holiday_lib:get_open_holiday(Role,
				      [3042, 93042, 993042])
	of
      #holiday{} ->
	  case holiday_return_new_data:get_buy_info({Period, Id})
	      of
	    {Expend, Award} ->
		case holiday_return_new_data:get_limit_info({Period,
							     Id})
		    of
		  {Limit1, Limit2} ->
		      Val1 = list_util:keyfind(Id, DayList, 0),
		      Val2 = list_util:keyfind(Id, BuyList, 0),
		      if Limit1 > 0, Val1 >= Limit1 ->
			     {false, lang:get(<<"今日购买已达上限"/utf8>>)};
			 Limit2 > 0, Val2 >= Limit2 ->
			     {false, lang:get(<<"商品购买已达上限"/utf8>>)};
			 true ->
			     Loss = format:val_to_loss(Expend,
						       holiday_return_new_exchange_expend),
			     Gain = format:val_to_gain(Award,
						       holiday_return_new_exchange_gain),
			     case role_gain:do_notice(Role, Loss ++ Gain) of
			       {ok, NRole} ->
				   log:log_gain(Loss ++ Gain, Role, NRole,
						<<"新版回归活动_兑换商店"/utf8>>,
						util:fbin(lang:get(<<"兑换id:~w"/utf8>>),
							  [Id])),
				   NDayList = util:if_true(Limit1 == 0, DayList,
							   lists:keystore(Id, 1,
									  DayList,
									  {Id,
									   Val1
									     +
									     1})),
				   NBuyList = util:if_true(Limit2 == 0, BuyList,
							   lists:keystore(Id, 1,
									  BuyList,
									  {Id,
									   Val2
									     +
									     1})),
				   NewRole = NRole#role{m_holiday_return_new =
							    MHolidayReturn#m_holiday_return_new{exchange_day_list
												    =
												    NDayList,
												exchange_buy_list
												    =
												    NBuyList}},
				   get_exchange_info(NewRole),
				   holiday:push_bid_can_reward(NewRole, 93042),
				   {ok, NewRole};
			       {false, #loss{msg = Msg}} -> {false, Msg};
			       {false, #gain{msg = Msg}} -> {false, Msg}
			     end
		      end;
		  _ -> {false, lang:get(<<"参数错误"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"没有该奖励"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

is_return(RoleId = {_, SrvId}) ->
    case sys_lib:is_local(RoleId) of
      true -> do_is_return(RoleId);
      _ ->
	  case cluster_lib:call(SrvId, holiday_return_new,
				do_is_return, [RoleId])
	      of
	    Flag when is_integer(Flag) -> Flag;
	    _ -> 0
	  end
    end;
is_return(_) -> 0.

do_is_return(RoleId) ->
    OldList = sys_env:get(return_role_list, []),
    case lists:member(RoleId, OldList) of
      true -> 1;
      _ -> 0
    end.

get_day_count(RoleId) ->
    case ets:lookup(holiday_return_new_exchage_item, RoleId)
	of
      [{_, Val} | _] -> Val;
      _ -> 0
    end.

set_day_count(RoleId, Val) ->
    ets:insert(holiday_return_new_exchage_item,
	       {RoleId, Val}).

get_type_list(RoleId, Type) ->
    case ets:lookup(holiday_return_new_exchage_item,
		    {RoleId, Type})
	of
      [{_, List} | _] -> List;
      _ -> []
    end.

set_type_list(RoleId, Type, List) ->
    ets:insert(holiday_return_new_exchage_item,
	       {{RoleId, Type}, List}).

send_return(Role, Args, Type) ->
    case holiday_lib:get_open_holiday(Role,
				      [3042, 93042, 993042])
	of
      #holiday{} -> send_return_award(Args, Type);
      _ -> ok
    end.

send_return_award(TeamMembers, arena_team) ->
    MemList = [MemId
	       || #arena_team_member{id = MemId} <- TeamMembers,
		  is_return(MemId) =:= 1],
    case length(MemList) of
      0 -> ok;
      1 ->
	  Award =
	      holiday_return_new_data:get_const(arena_team_award),
	  Content =
	      lang:get(<<"亲爱的冒险者大人，这是您与回归好友共同完成组队竞技场挑战的奖励，请查收！"/utf8>>),
	  [send_mail(MemId, Award, Content)
	   || #arena_team_member{id = MemId} <- TeamMembers,
	      is_return(MemId) =:= 0],
	  ok;
      _ ->
	  Award =
	      holiday_return_new_data:get_const(arena_team_award),
	  Content =
	      lang:get(<<"亲爱的冒险者大人，这是您与回归好友共同完成组队竞技场挑战的奖励，请查收！"/utf8>>),
	  [send_mail(MemId, Award, Content)
	   || #arena_team_member{id = MemId} <- TeamMembers],
	  ok
    end;
send_return_award({RoleId, TarRoleId}, pk) ->
    case is_return(TarRoleId) of
      1 ->
	  List = get_type_list(RoleId, pk),
	  case lists:member(TarRoleId, List) of
	    false ->
		Award = holiday_return_new_data:get_const(pk_award),
		Content =
		    lang:get(<<"亲爱的冒险者大人，这是您与回归好友完成切磋的奖励，请查收！"/utf8>>),
		send_mail(RoleId, Award, Content),
		set_type_list(RoleId, pk, [TarRoleId | List]),
		ok;
	    _ -> ok
	  end;
      _ -> ok
    end;
send_return_award({RoleId, PosInfo}, endless) ->
    EList = [{Rid, SrvId}
	     || {_Pos, Rid, SrvId, _Id} <- PosInfo,
		{Rid, SrvId} =/= RoleId andalso
		  is_return({Rid, SrvId}) =:= 1],
    case EList of
      [TarRoleId | _] ->
	  List = get_type_list(RoleId, endless),
	  case lists:member(TarRoleId, List) of
	    false ->
		Award =
		    holiday_return_new_data:get_const(endless_award),
		Content =
		    lang:get(<<"亲爱的冒险者大人，这是您在无尽试炼中使用回归好友英雄助战的奖励，请查收！"/utf8>>),
		send_mail(RoleId, Award, Content),
		set_type_list(RoleId, endless, [TarRoleId | List]),
		ok;
	    _ -> ok
	  end;
      _ -> ok
    end;
send_return_award(_, _) -> ok.

send_mail(RoleId, Award, Content) ->
    Val = get_day_count(RoleId),
    LimitVal =
	holiday_return_new_data:get_const(exchange_item_day_limit_num),
    ItemId =
	holiday_return_new_data:get_const(exchange_item_id),
    EveVal = list_util:keyfind(ItemId, Award, 0),
    case Val < LimitVal of
      true ->
	  NewVal = Val + EveVal,
	  NewAward = case NewVal > LimitVal of
		       true ->
			   set_day_count(RoleId, LimitVal),
			   lists:keyreplace(ItemId, 1, Award,
					    {ItemId, LimitVal - Val});
		       _ -> set_day_count(RoleId, NewVal), Award
		     end,
	  {Assets, Items} = format:split_assets_items(NewAward),
	  Mail = {lang:get(<<"系统邮件"/utf8>>), Content, Assets,
		  Items, <<"系统邮件"/utf8>>},
	  mail:send(RoleId, Mail);
      _ -> ok
    end.

-spec check_open(#role{}) -> {ok, pos_integer()} |
			     false.

check_open(#role{m_holiday_return_new =
		     #m_holiday_return_new{period = Period,
					   end_time = EndTime}}) ->
    Now = date:unixtime(),
    case Period =/= 0 andalso EndTime > Now of
      true -> {ok, Period};
      _ -> false
    end.

calc_period2(Role) ->
    Now = date:unixtime(),
    OpenTime = holiday_return_new_data:period_list(),
    case is_open_time2(OpenTime, Now, Role) of
      {true, Period, _, _} -> Period;
      _ -> 0
    end.

is_open_time2([], _Now, _Role) -> false;
is_open_time2([{Period, StartTime, EndTime, _} | Other],
	      Now, Role) ->
    Time1 = holiday_role:parse_time(StartTime, Role),
    Time2 = holiday_role:parse_time(EndTime, Role),
    case Now >= Time1 andalso Now =< Time2 of
      true -> {true, Period, Time1, Time2};
      _ -> is_open_time2(Other, Now, Role)
    end.

calc_period(Role) ->
    Now = date:unixtime(),
    OpenTime = holiday_return_new_data:period_list(),
    case is_open_time(OpenTime, Now, Role) of
      {true, Period, StartTime, EndTime} ->
	  {Period, StartTime, EndTime};
      _ -> {0, 0, 0}
    end.

is_open_time([], _Now, _Role) -> false;
is_open_time([{Period, StartTime, EndTime, OpenCond}
	      | Other],
	     Now, Role) ->
    case role_misc:check_open_cond(OpenCond, Role) of
      true ->
	  Time1 = holiday_role:parse_time(StartTime, Role),
	  Time2 = holiday_role:parse_time(EndTime, Role),
	  case Now >= Time1 andalso Now =< Time2 of
	    true -> {true, Period, Time1, Time2};
	    _ -> is_open_time(Other, Now, Role)
	  end;
      _ -> is_open_time(Other, Now, Role)
    end.


