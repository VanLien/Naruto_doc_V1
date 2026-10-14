-file("src/mod/mail/mail.erl", 1).

-module(mail).

-lager_records([{state, []},
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
		{s_timer, [ref, timers]}, {rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
		{role_misc,
		 [reg_zero_time, self_charge, combat_watch_pid,
		  mail_posting, is_do_online, gm_attr, dun_auto_num,
		  dun_auto_lose, invite_code_list, return_code_list,
		  need_captcha]},
		{condition, [label, op, val, msg]},
		{login,
		 [login_time, logout_time, prev_logout_time,
		  prev_login_time, log_login_time]},
		{vip_effect_data, [name, val]},
		{vip_data,
		 [lev, gold, price, old_price, items, ext_reward]},
		{m_vip, [ver, lev, lev_reward, tired_charge]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{role_online,
		 [id, pid, conn_pid, name, account, status, lev, sex,
		  realm, platform, channel, career, power, face_id,
		  face_file, face_update_time, socket, max_dun_id,
		  province_name, city_name]},
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
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
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
		  read_time, send_time, time_out, can_del]}]).

-behaviour(gen_server).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([start_link/0, add/2, post/1, send/1, send/2,
	 local_send/1, feedback/1, local_send/2, group_send/2,
	 global_send/1, check_gmail/1, to_mail/2, login/1,
	 logout/1, clear/1, check_timeout/1, t/1, to_cli/1]).

-export([ref_gemstone_mail/0, del_mail_by_subject/0,
	 check_del_mail/1, check_send_mail/0,
	 gm_del_shipping_mail/1, gm_del_shipping_mail/0,
	 gm_del_global_mail/0, gm_del_global_mail/1,
	 gm_del_mail/2]).

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

-file("src/mod/mail/mail.erl", 43).

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

-file("src/mod/mail/mail.erl", 44).

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

-file("src/mod/mail/mail.erl", 45).

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

-file("src/mod/mail/mail.erl", 46).

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

-file("src/mod/mail/mail.erl", 47).

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

-file("src/mod/mail/mail.erl", 48).

-file("inc/log.hrl", 1).

-file("src/mod/mail/mail.erl", 49).

-file("inc/role_online.hrl", 1).

-record(role_online,
	{id = {0, 0}, pid, conn_pid, name, account, status, lev,
	 sex, realm, platform, channel, career, power, face_id,
	 face_file = <<>>, face_update_time = 0, socket,
	 max_dun_id, province_name, city_name}).

-file("src/mod/mail/mail.erl", 50).

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

-file("src/mod/mail/mail.erl", 51).

-file("inc/vip.hrl", 1).

-record(m_vip,
	{ver = 2, lev = 0, lev_reward = [], tired_charge = []}).

-record(vip_data,
	{lev = 0  :: non_neg_integer(),
	 gold = 0  :: non_neg_integer(), price = []  :: list(),
	 old_price = []  :: list(), items = []  :: list(),
	 ext_reward = []}).

-record(vip_effect_data,
	{name = <<>>  :: bitstring(),
	 val = 0  :: non_neg_integer()}).

-file("src/mod/mail/mail.erl", 52).

-file("inc/login.hrl", 1).

-record(login,
	{login_time = 0, logout_time = 0, prev_logout_time = 0,
	 prev_login_time = 0, log_login_time = 0}).

-file("src/mod/mail/mail.erl", 53).

-file("inc/condition.hrl", 1).

-record(condition,
	{label  :: atom(),
	 op = eq  ::
	     ue | eq | lt | gt | le | ge | range | include,
	 val  :: term(), msg = <<>>  :: bitstring()}).

-file("src/mod/mail/mail.erl", 54).

-file("inc/role_misc.hrl", 1).

-record(role_misc,
	{reg_zero_time = 0, self_charge = 0,
	 combat_watch_pid = 0, mail_posting = [],
	 is_do_online = 0, gm_attr = [], dun_auto_num = 0,
	 dun_auto_lose = 0, invite_code_list = [],
	 return_code_list = [], need_captcha = 0}).

-file("src/mod/mail/mail.erl", 55).

-file("inc/timer.hrl", 1).

-record(timer,
	{id  :: term(), timeout = 1000  :: pos_integer(),
	 m  :: undefined | atom(), f  :: function() | atom(),
	 a = []  :: [term()], times = 1  :: integer(),
	 next_tick = 0  :: non_neg_integer(),
	 set_time = 1  :: pos_integer()}).

-record(rtimer,
	{ref  :: undefined | reference(),
	 key = 0  :: non_neg_integer(),
	 timers = []  :: [#timer{}]}).

-record(s_timer,
	{ref  :: undefined | reference(),
	 timers = []  :: [#timer{}]}).

-file("src/mod/mail/mail.erl", 56).

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

-file("src/mod/mail/mail.erl", 57).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/mail/mail.erl", 58).

-record(state, {}).

gm_del_shipping_mail() ->
    Ms = [{{mail, '_', '_', '_', '_', '_', '_', '_', '_',
	    '$1', '_', '_', '_', '_', '_', '_', '_', '_', '_'},
	   [{'=:=', '$1', <<"远航夺宝活动排行奖励"/utf8>>}], ['$_']}],
    L = dets:select(mailbox, Ms),
    DelList = del_list(),
    Fun = fun (Mail = #mail{sess = Sess, to = ToId}, Acc) ->
		  case lists:member(ToId, DelList) of
		    true ->
			dets:delete_object(mailbox, Mail), [{ToId, Sess} | Acc];
		    _ -> Acc
		  end
	  end,
    Dels = lists:foldl(Fun, [], L),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmail77, _, {__Levelmail77, __Tracesmail77}}
	  when __Levelmail77 band 64 /= 0 orelse
		 __Tracesmail77 /= [] ->
	  lager:do_log(info,
		       [{module, mail}, {function, gm_del_shipping_mail},
			{line, 77}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("删除错误邮件~w", [Dels]), none, 4096, 64,
		       __Levelmail77, __Tracesmail77, lager_event,
		       __Pidmail77);
      _ -> ok
    end,
    role_group:apply(world,
		     {mail, gm_del_shipping_mail, []}).

gm_del_shipping_mail(Role = #role{m_mail = Mails}) ->
    NewMail = [Mail
	       || Mail = #mail{subject = Sub} <- Mails,
		  Sub =/= <<"远航夺宝活动排行奖励"/utf8>>],
    {ok, Role#role{m_mail = NewMail}}.

check_send_mail() ->
    Ms = [{{mail, '_', '_', '_', '_', '_', '_', '_', '_',
	    '$1', '_', '_', '_', '_', '_', '_', '_', '_', '_'},
	   [{'=:=', '$1', <<"星空试炼奖励"/utf8>>}], ['$_']}],
    case dets:select(mailbox, Ms, 1) of
      {[_ | _], _} -> ok;
      _ ->
	  {false, erlang:binary_to_atom(sys_lib:srv_id(), utf8)}
    end.

check_del_mail(Role = #role{id = Id, m_mail = Mails}) ->
    DelList = del_list(),
    case lists:member(Id, DelList) of
      true ->
	  NewMail = lists:keydelete(<<"组队竞技场排行奖励"/utf8>>,
				    #mail.subject, Mails),
	  {ok, Role#role{m_mail = NewMail}};
      _ -> {ok, Role}
    end.

del_mail_by_subject() ->
    Ms = [{{mail, '_', '_', '_', '_', '_', '_', '_', '_',
	    '$1', '_', '_', '_', '_', '_', '_', '_', '_', '_'},
	   [{'=:=', '$1', <<"组队竞技场排行奖励"/utf8>>}], ['$_']}],
    L = dets:select(mailbox, Ms),
    DelList = del_list(),
    Fun = fun (Mail = #mail{sess = Sess, to = ToId}, Acc) ->
		  case lists:member(ToId, DelList) of
		    true ->
			case lists:keyfind(ToId, 1, Acc) of
			  false ->
			      dets:delete_object(mailbox, Mail),
			      [{ToId, Sess} | Acc];
			  _ -> Acc
			end;
		    _ -> Acc
		  end
	  end,
    Dels = lists:foldl(Fun, [], L),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmail130, _, {__Levelmail130, __Tracesmail130}}
	  when __Levelmail130 band 64 /= 0 orelse
		 __Tracesmail130 /= [] ->
	  lager:do_log(info,
		       [{module, mail}, {function, del_mail_by_subject},
			{line, 130}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("删除错误邮件~w", [Dels]), none, 4096, 64,
		       __Levelmail130, __Tracesmail130, lager_event,
		       __Pidmail130);
      _ -> ok
    end,
    Dels.

gm_del_global_mail() ->
    gm_del_global_mail(lang:get(<<"银魂原创图文攻略征集活动"/utf8>>)).

gm_del_global_mail(Subject) ->
    ets:match_delete(mailbox_global,
		     #gmail{subject = Subject, _ = '_'}),
    dets:match_delete(mailbox_global,
		      #gmail{subject = Subject, _ = '_'}),
    role_group:apply(world, {mail, gm_del_mail, [Subject]}).

gm_del_mail(Role = #role{m_mail = Mails}, Subject) ->
    NewMail = [Mail
	       || Mail = #mail{subject = Sub} <- Mails,
		  Sub =/= Subject],
    {ok, Role#role{m_mail = NewMail}}.

del_list() -> [].

ref_gemstone_mail() ->
    Dels = dets:match_object(mailbox,
			     #mail{subject = lang:get(<<"装备宝石碎片返还"/utf8>>),
				   _ = '_'}),
    del_mailbox(Dels).

to_cli(Mail) -> [do_to_cli(I) || I <- Mail].

do_to_cli(Mail = #mail{assets = [], items = []}) ->
    {Mail, 0};
do_to_cli(Mail) -> {Mail, 1}.

-spec clear(#role{}) -> {ok, #role{}}.

clear(Role) -> {ok, Role#role{m_mail = []}}.

-spec add(Role :: #role{}, Info :: tuple()) -> {ok,
						NewRole :: #role{}} |
					       {false, Why :: string()}.

add(Role = #role{id = Id,
		 misc = Misc = #role_misc{mail_posting = Posting}},
    Mail) ->
    NewPosting = [to_mail(Id, Mail) | Posting],
    Role1 = Role#role{misc =
			  Misc#role_misc{mail_posting = NewPosting}},
    case Posting of
      [] ->
	  Timer = #timer{id = mail_posting, timeout = 2000,
			 times = 1, m = mail, f = post, a = []},
	  {ok, role_timer:set(Timer, Role1)};
      _ -> {ok, Role1}
    end.

post(#role{misc = #role_misc{mail_posting = []}}) -> ok;
post(Role = #role{misc =
		      Misc = #role_misc{mail_posting = L},
		  m_mail = Mailbox}) ->
    Now = date:unixtime(),
    NewL = split_mail([M#mail{rev_ts = Now}
		       || #mail{time_out = TimeOut} = M <- L,
			  TimeOut =:= 0 orelse TimeOut > Now],
		      []),
    [log:save(log_mail, {NM}) || NM <- NewL],
    {Mbox, NewL1} = merge_mail(NewL, Mailbox, []),
    sys_conn:pack_send(10803, {to_cli(NewL1)}),
    notice_below:send(mail),
    {ok,
     set_timer(Role#role{m_mail = Mbox,
			 misc = Misc#role_misc{mail_posting = []}},
	       Now)}.

-spec start_link() -> {ok, pid()} | ignore |
		      {error, term()}.

start_link() ->
    gen_server:start_link({local, mail}, mail, [], []).

-spec send(#mail{}) -> ok | {error, term()}.

send([]) -> ok;
send([Mail | T]) -> send(Mail), send(T);
send(Mail = #mail{to = {_, SrvId}}) ->
    cluster_lib:call(SrvId, mail, local_send, [Mail]).

-spec send(#role{} | role_id(), tuple()) -> ok |
					    {error, term()}.

send([], _Mail) -> ok;
send([RoleInfo | T], Mail) ->
    send(RoleInfo, Mail), send(T, Mail);
send(#role{id = Id}, Mail) -> send(Id, Mail);
send({_, <<>>}, _Mail) -> ok;
send(RoleId = {_, SrvId}, Mail) ->
    cluster_lib:call(SrvId, mail, local_send,
		     [RoleId, Mail]).

-spec local_send(#mail{} | [#mail{}]) -> ok |
					 {error, term()}.

local_send(Mail) -> mail ! {send, Mail}, ok.

-spec feedback(#feedback{}) -> ok.

feedback(FeedBack) ->
    mail ! {add_feedback, FeedBack}, ok.

-spec local_send(#role{} | role_id(), tuple()) -> ok |
						  {error, term()}.

local_send([], _Mail) -> ok;
local_send([RoleInfo | T], Mail) ->
    local_send(RoleInfo, Mail), local_send(T, Mail);
local_send(#role{id = Id}, Mail) ->
    local_send(Id, Mail);
local_send(To, Mail) ->
    NewMail = to_mail(To, Mail), local_send(NewMail).

-spec to_mail(tuple(), tuple()) -> #mail{}.

to_mail(_To, Mail = #mail{}) -> Mail;
to_mail(To, {Title, Content}) ->
    to_mail(To, {Title, Content, [], [], <<"">>});
to_mail(To, {Title, Content, Assets, Items}) ->
    to_mail(To, {Title, Content, Assets, Items, <<"">>});
to_mail(To, {Title, Content, Assets, Items, Source}) ->
    to_mail(To, {Title, Content, Assets, Items, Source, 0});
to_mail(To,
	{Title, Content, Assets, Items, Source, TimeOut}) ->
    to_mail(To,
	    {Title, Content, Assets, Items, Source, TimeOut,
	     date:unixtime()});
to_mail(To,
	{Title, Content, items, Items, Source, TimeOut,
	 SendTime}) ->
    {Assets0, Items0} = format:split_assets_items(Items),
    to_mail(To,
	    {Title, Content, Assets0, Items0, Source, TimeOut,
	     SendTime});
to_mail(To,
	{Title, Content, Assets, Items, Source, TimeOut,
	 SendTime}) ->
    to_mail(To,
	    #{title => Title, content => Content, assets => Assets,
	      items => Items, source => Source, timeout => TimeOut,
	      send_time => SendTime});
to_mail(To,
	{Title, Content, Assets, Items,
	 Source = <<"反馈回复"/utf8>>, TimeOut, SendTime,
	 UniqueId}) ->
    to_mail(To,
	    #{title => Title, content => Content, assets => Assets,
	      items => Items, source => Source, timeout => TimeOut,
	      send_time => SendTime, type => 3,
	      feedback_id => UniqueId});
to_mail(To = {_, SrvId},
	Map = #{type := 3, feedback_id := UniqueId}) ->
    {Assets0, Items0} =
	format:split_assets_items(maps:get(items, Map, [])),
    Sess = {sys_env:update_counter(mail_sess_id, 1), SrvId},
    Now = date:unixtime(),
    SendTime = maps:get(send_time, Map, Now),
    TimeOut = maps:get(timeout, Map, Now + 86400 * 7),
    NewFeedBack = #feedback{sess = Sess, rid = To,
			    feedback_id = UniqueId, status = 0,
			    send_time = SendTime, time_out = TimeOut},
    feedback(NewFeedBack),
    #mail{sess = Sess, type = 3, to = To, from = {0, SrvId},
	  from_name = <<>>, subject = maps:get(title, Map),
	  content = maps:get(content, Map),
	  source = maps:get(source, Map, <<"">>),
	  assets =
	      format:to_assets(item_lib:merge(Assets0,
					      maps:get(assets, Map, []))),
	  items = format:to_items(Items0, mail),
	  send_time = SendTime, time_out = TimeOut,
	  can_del = maps:get(can_del, Map, 1)};
to_mail(To = {_, SrvId}, Map) ->
    {Assets0, Items0} =
	format:split_assets_items(maps:get(items, Map, [])),
    #mail{sess =
	      {sys_env:update_counter(mail_sess_id, 1), SrvId},
	  type = maps:get(type, Map, 1), to = To,
	  from = {0, SrvId}, from_name = <<>>,
	  subject = maps:get(title, Map),
	  content = maps:get(content, Map),
	  source = maps:get(source, Map, <<"">>),
	  assets =
	      format:to_assets(item_lib:merge(Assets0,
					      maps:get(assets, Map, []))),
	  items = format:to_items(Items0, mail),
	  send_time = maps:get(send_time, Map, date:unixtime()),
	  time_out = maps:get(timeout, Map, 0),
	  can_del = maps:get(can_del, Map, 1)}.

-spec group_send([role_id()], tuple()) -> ok.

group_send(RoleIds = [To | _], Mail) ->
    Mail1 = to_mail(To, Mail),
    mail ! {group_send, RoleIds, Mail1};
group_send(_, _Mail) -> ok.

-spec global_send(#gmail{}) -> ok.

global_send(GMail = #gmail{end_time = 0,
			   start_time = StartTime}) ->
    global_send(GMail#gmail{end_time =
				max(date:unixtime(), StartTime) + 864000});
global_send(GMail = #gmail{}) ->
    mail ! {global_send, GMail}.

-spec login(#role{}) -> ok | {ok, #role{}}.

login(#role{pid = Pid}) ->
    role:apply(async, Pid, {fun mail_arrive/2, [login]}),
    role:apply(async, Pid,
	       {fun apply_gmail/3, [all, login]}),
    ok.

logout(Role) -> post(Role).

-spec check_gmail(Id :: pos_integer()) -> ok.

check_gmail(all) ->
    role_group:apply(world,
		     {fun apply_gmail/3, [all, login]});
check_gmail(Id) -> mail ! {check_gmail, Id}.

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmail341, _, {__Levelmail341, __Tracesmail341}}
	  when __Levelmail341 band 64 /= 0 orelse
		 __Tracesmail341 /= [] ->
	  lager:do_log(info,
		       [{module, mail}, {function, init}, {line, 341},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [mail]), none, 4096, 64,
		       __Levelmail341, __Tracesmail341, lager_event,
		       __Pidmail341);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    case sys_env:get(mail_sess_id) of
      SessId when is_integer(SessId) -> ignore;
      _ -> sys_env:set(mail_sess_id, 1)
    end,
    dets:open_file(mailbox,
		   [{file, "./dets/mailbox.dets"}, {keypos, #mail.to},
		    {type, duplicate_bag}]),
    dets:open_file(mailbox_global,
		   [{file, "./dets/mailbox_global.dets"},
		    {keypos, #gmail.id}, {type, set}]),
    ets:new(mailbox_global,
	    [set, named_table, public, {keypos, #gmail.id}]),
    dets:open_file(mailbox_feedback,
		   [{file, "./dets/mailbox_feedback.dets"},
		    {keypos, #feedback.sess}, {type, set}]),
    ets:new(mailbox_feedback,
	    [set, named_table, public, {keypos, #feedback.sess}]),
    do_init(),
    self() ! loop,
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmail357, _, {__Levelmail357, __Tracesmail357}}
	  when __Levelmail357 band 64 /= 0 orelse
		 __Tracesmail357 /= [] ->
	  lager:do_log(info,
		       [{module, mail}, {function, init}, {line, 357},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [mail]), none, 4096, 64,
		       __Levelmail357, __Tracesmail357, lager_event,
		       __Pidmail357);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(global_send_mail, State) ->
    catch erlang:cancel_timer(get(fuli_global_send_mail)),
    {noreply, State};
handle_info({global_send, GMail = #gmail{id = Id}},
	    State) ->
    ets:insert(mailbox_global, GMail),
    dets:insert(mailbox_global, GMail),
    self() ! {check_gmail, Id},
    {noreply, State};
handle_info({check_gmail, Id}, State) ->
    Now = date:unixtime(),
    case ets:lookup(mailbox_global, Id) of
      [#gmail{start_time = StartTime}] when StartTime > Now ->
	  util:set_timer({check_gmail, Id},
			 min(864000, StartTime - Now), {check_gmail, Id});
      [Gmail = #gmail{end_time = EndTime, type = 1}]
	  when Now < EndTime ->
	  role_group:apply(world,
			   {fun apply_gmail/3, [Gmail, {Now, new_mail}]}),
	  ets:delete(mailbox_global, Id),
	  dets:delete(mailbox_global, Id);
      [Gmail = #gmail{end_time = EndTime}]
	  when Now < EndTime ->
	  role_group:apply(world,
			   {fun apply_gmail/3, [Gmail, {Now, new_mail}]}),
	  util:set_timer({check_gmail, Id},
			 min(864000, EndTime - Now), {check_gmail, Id});
      [_] ->
	  ets:delete(mailbox_global, Id),
	  dets:delete(mailbox_global, Id);
      _ -> skip
    end,
    {noreply, State};
handle_info({group_send, Rids, Mail}, State) ->
    do_group_send(20, Rids, Mail), {noreply, State};
handle_info({send,
	     [M1, M2, M3, M4, M5, M6, M7, M8, M9, M10 | T]},
	    State) ->
    do_send([M1, M2, M3, M4, M5, M6, M7, M8, M9, M10]),
    erlang:send_after(100, self(), {send, T}),
    {noreply, State};
handle_info({send, Mail}, State) ->
    do_send(Mail), {noreply, State};
handle_info({add_feedback, FeedBack}, State) ->
    ets:insert(mailbox_feedback, FeedBack),
    dets:insert(mailbox_feedback, FeedBack),
    {noreply, State};
handle_info(loop, State) ->
    sys_env:save_counter(mail_sess_id, 0),
    erlang:send_after(10000, self(), loop),
    {noreply, State};
handle_info(Info, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmail431, _, {__Levelmail431, __Tracesmail431}}
	  when __Levelmail431 band 8 /= 0 orelse
		 __Tracesmail431 /= [] ->
	  lager:do_log(error,
		       [{module, mail}, {function, handle_info}, {line, 431},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("收到未知消息: ~w", [Info]), none, 4096, 8,
		       __Levelmail431, __Tracesmail431, lager_event,
		       __Pidmail431);
      _ -> ok
    end,
    {noreply, State}.

terminate(_Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmail435, _, {__Levelmail435, __Tracesmail435}}
	  when __Levelmail435 band 64 /= 0 orelse
		 __Tracesmail435 /= [] ->
	  lager:do_log(info,
		       [{module, mail}, {function, terminate}, {line, 435},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在关闭...", [mail]), none, 4096, 64,
		       __Levelmail435, __Tracesmail435, lager_event,
		       __Pidmail435);
      _ -> ok
    end,
    dets:insert(mailbox_feedback,
		ets:tab2list(mailbox_feedback)),
    sys_env:save_counter(mail_sess_id, 0),
    util:close_dets(mailbox),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmail439, _, {__Levelmail439, __Tracesmail439}}
	  when __Levelmail439 band 64 /= 0 orelse
		 __Tracesmail439 /= [] ->
	  lager:do_log(info,
		       [{module, mail}, {function, terminate}, {line, 439},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 关闭完成", [mail]), none, 4096, 64,
		       __Levelmail439, __Tracesmail439, lager_event,
		       __Pidmail439);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_group_send(_, [], _Mail) -> ok;
do_group_send(0, Rids, Mail) ->
    erlang:send_after(20, self(), {group_send, Rids, Mail});
do_group_send(N, [To = {_, SrvId} | T], Mail) ->
    NewMail = Mail#mail{sess =
			    {sys_env:update_counter(mail_sess_id, 1), SrvId},
			to = To},
    do_send(NewMail),
    do_group_send(N - 1, T, Mail).

do_send([I | T]) -> do_send(I), do_send(T);
do_send(Mail = #mail{time_out = 0}) ->
    do_send(Mail#mail{time_out =
			  date:unixtime() + 86400 * 7});
do_send(Mail = #mail{send_time = 0}) ->
    do_send(Mail#mail{send_time = date:unixtime()});
do_send(Mail = #mail{to = {Rid, SrvId}}) ->
    dets:insert(mailbox, Mail),
    case log_send(Mail) of
      true -> catch log:save(log_mail, {Mail});
      _ -> pass
    end,
    case role_query:pid(by_id, Rid, SrvId) of
      {ok, Pid} ->
	  role:apply(async, Pid, {fun mail_arrive/2, [new_mail]});
      _ -> ignore
    end;
do_send(_) -> ok.

log_send(#mail{source = <<"log"/utf8>>}) -> false;
log_send(_) -> true.

-spec apply_gmail(#role{}, all | list() | #gmail{},
		  tuple()) -> {ok, #role{}}.

apply_gmail(Role, all, Flag) ->
    Now = date:unixtime(),
    L = ets:tab2list(mailbox_global),
    L1 = [M
	  || M <- L, M#gmail.start_time =< Now,
	     M#gmail.end_time > Now + 20],
    apply_gmail(Role, L1, {Now, Flag});
apply_gmail(Role, [], _) -> {ok, Role};
apply_gmail(Role, [I | T], Opt) ->
    {ok, NRole} = apply_gmail(Role, I, Opt),
    apply_gmail(NRole, T, Opt);
apply_gmail(Role = #role{id = RoleId, m_mail = MailBox},
	    #gmail{id = Id, subject = Subject, content = Content,
		   assets = Assets, items = Items, end_time = EndTime,
		   source = Remark, conds = Conds, mail_type = MailType,
		   can_del = CanDel},
	    {Now, Flag}) ->
    case var:get_var(Role, timeout, {3004, Id}) of
      0 ->
	  case check_gmail_conds(Conds, Role) of
	    true ->
		Mail0 = to_mail(RoleId,
				#{title => Subject, content => Content,
				  assets => Assets, items => Items,
				  source => Remark, timeout => EndTime,
				  type => MailType, can_del => CanDel}),
		Mail = Mail0#mail{rev_ts = Now},
		catch log:save(log_mail, {Mail}),
		Mbox = [Mail | MailBox],
		case Flag of
		  login -> skip;
		  _ -> sys_conn:pack_send(10803, {to_cli([Mail])})
		end,
		Role1 = var:set_var(Role, {timeout, EndTime + 86400},
				    {3004, Id}, Now),
		{ok, set_timer(Role1#role{m_mail = Mbox}, Now)};
	    _ -> {ok, Role}
	  end;
      _ -> {ok, Role}
    end.

check_gmail_conds([], _Role) -> true;
check_gmail_conds([{minlev, MinLev} | _],
		  #role{lev = Lev})
    when Lev < MinLev ->
    false;
check_gmail_conds([{maxlev, MaxLev} | _],
		  #role{lev = Lev})
    when Lev > MaxLev andalso MaxLev > 0 ->
    false;
check_gmail_conds([{minvip, MinVipLev} | _],
		  #role{m_vip = #m_vip{lev = VipLev}})
    when VipLev < MinVipLev ->
    false;
check_gmail_conds([{maxvip, MaxVipLev} | _],
		  #role{m_vip = #m_vip{lev = VipLev}})
    when VipLev > MaxVipLev andalso MaxVipLev > 0 ->
    false;
check_gmail_conds([{reg_time_start, RegStartTime} | _],
		  #role{reg_time = RegTime})
    when RegTime < RegStartTime ->
    false;
check_gmail_conds([{reg_time_end, RegEndTime} | _],
		  #role{reg_time = RegTime})
    when RegTime > RegEndTime andalso RegEndTime > 0 ->
    false;
check_gmail_conds([{login_time_start, LoginStartTime}
		   | _],
		  #role{login = #login{login_time = LoginTime}})
    when LoginTime < LoginStartTime ->
    false;
check_gmail_conds([{login_time_end, LoginEndTime} | _],
		  #role{login = #login{login_time = LoginTime}})
    when LoginTime > LoginEndTime andalso
	   LoginEndTime > 0 ->
    false;
check_gmail_conds([{logout_time_start, LogoutStartTime}
		   | _],
		  #role{login = #login{prev_logout_time = LogoutTime}})
    when LogoutTime < LogoutStartTime ->
    false;
check_gmail_conds([{logout_time_end, LogoutEndTime}
		   | _],
		  #role{login = #login{prev_logout_time = LogoutTime}})
    when LogoutTime > LogoutEndTime andalso
	   LogoutEndTime > 0 ->
    false;
check_gmail_conds([{channel_names, ChannelNames} | T],
		  Role = #role{channel = Channel})
    when is_list(ChannelNames) ->
    case ChannelNames =:= [] orelse
	   lists:member(Channel, ChannelNames)
	of
      true -> check_gmail_conds(T, Role);
      _ -> false
    end;
check_gmail_conds([{platform_names_not, PlatformNames}
		   | T],
		  Role = #role{platform = Platform})
    when is_list(PlatformNames) ->
    case PlatformNames =:= [] orelse
	   not lists:member(Platform, PlatformNames)
	of
      true -> check_gmail_conds(T, Role);
      _ -> false
    end;
check_gmail_conds([{is_adventure, 0} | T],
		  Role = #role{m_adventure =
				   #m_adventure{plist = PList}}) ->
    case PList of
      [] -> check_gmail_conds(T, Role);
      _ -> false
    end;
check_gmail_conds([{role_weekly_report, _} | T],
		  Role = #role{id = RoleId}) ->
    case role_weekly_mgr:has_last_week_data(RoleId) of
      true -> check_gmail_conds(T, Role);
      _ -> false
    end;
check_gmail_conds([Cond = #condition{} | T], Role) ->
    case role_cond:check(Cond, Role) of
      true -> check_gmail_conds(T, Role);
      _ -> false
    end;
check_gmail_conds([_ | T], Role) ->
    check_gmail_conds(T, Role).

mail_arrive(Role = #role{id = RoleId, m_mail = Mailbox},
	    Flag) ->
    Now = date:unixtime(),
    case recv(RoleId) of
      {error, _} -> {ok, set_timer(Role, Now)};
      ok when Flag =:= login ->
	  Mbox = clean(Mailbox, Now, Flag, []),
	  {ok, set_timer(Role#role{m_mail = Mbox}, Now)};
      ok -> ok;
      {ok, L} when Flag =:= login ->
	  NewL = split_mail([M#mail{rev_ts = Now}
			     || #mail{time_out = TimeOut} = M <- L,
				TimeOut =:= 0 orelse TimeOut > Now],
			    []),
	  [log:save(log_mail, {NM})
	   || NM <- NewL, not log_send(NM)],
	  {NewMailbox, _} = merge_mail(NewL, Mailbox, []),
	  Mbox = clean(NewMailbox, Now, Flag, []),
	  {ok, set_timer(Role#role{m_mail = Mbox}, Now)};
      {ok, L} ->
	  NewL = split_mail([M#mail{rev_ts = Now}
			     || #mail{time_out = TimeOut} = M <- L,
				TimeOut =:= 0 orelse TimeOut > Now],
			    []),
	  [log:save(log_mail, {NM})
	   || NM <- NewL, not log_send(NM)],
	  case NewL of
	    [_ | _] ->
		sys_conn:pack_send(10803, {to_cli(NewL)}),
		notice_below:send(mail);
	    _ -> skip
	  end,
	  {NewMailbox, _} = merge_mail(NewL, Mailbox, []),
	  {ok, set_timer(Role#role{m_mail = NewMailbox}, Now)}
    end.

merge_mail([], L, NewL) -> {L, NewL};
merge_mail([M = #mail{sess = Sess} | T], L, NewL) ->
    case lists:keymember(Sess, #mail.sess, L) of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmail618, _, {__Levelmail618, __Tracesmail618}}
		when __Levelmail618 band 8 /= 0 orelse
		       __Tracesmail618 /= [] ->
		lager:do_log(error,
			     [{module, mail}, {function, merge_mail},
			      {line, 618}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("存在重复邮件:~w", [Sess]), none, 4096, 8,
			     __Levelmail618, __Tracesmail618, lager_event,
			     __Pidmail618);
	    _ -> ok
	  end,
	  merge_mail(T, L, NewL);
      false -> merge_mail(T, [M | L], [M | NewL])
    end.

split_mail([], List) -> List;
split_mail([Mail = #mail{sess = {_, SrvId},
			 items = Items}
	    | T],
	   List)
    when length(Items) > 15 ->
    {T1, T2} = list_util:split(15, Items),
    split_mail([Mail#mail{sess =
			      {sys_env:update_counter(mail_sess_id, 1), SrvId},
			  items = T2, assets = []}
		| T],
	       [Mail#mail{items = T1} | List]);
split_mail([Mail | T], List) ->
    split_mail(T, [Mail | List]).

-spec check_timeout(#role{}) -> ok | {ok, #role{}}.

check_timeout(Role = #role{m_mail = ML}) ->
    Now = date:unixtime(),
    NRole = Role#role{m_mail = clean(ML, Now, timeout, [])},
    {ok, set_timer(NRole, Now)}.

set_timer(Role = #role{m_mail = ML}, Now) ->
    case min_timeout(ML, Now, 0) of
      0 -> skip;
      Time ->
	  role:set_ms_timer(mail_timeout_timer, Time * 1000,
			    {mail, check_timeout, []})
    end,
    Role.

min_timeout([], _Now, T) -> T;
min_timeout([#mail{time_out = 0} | T], Now, Time) ->
    min_timeout(T, Now, Time);
min_timeout([#mail{time_out = To} | T], Now, Time)
    when Time =/= 0 ->
    min_timeout(T, Now, min(max(To - Now, 1), Time));
min_timeout([#mail{time_out = To} | T], Now, _Time) ->
    min_timeout(T, Now, max(To - Now, 1)).

-spec recv(role_id()) -> ok | {ok, [#mail{}]} |
			 {error, term()}.

recv(RoleId) ->
    case catch dets:lookup(mailbox, RoleId) of
      MailList = [#mail{} | _] ->
	  del_mailbox(MailList),
	  NewMailList = [Mail#mail{items =
				       [item_ver:do(I, #{}) || I <- Items]}
			 || Mail = #mail{items = Items} <- MailList],
	  {ok, NewMailList};
      [] -> ok;
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmail666, _, {__Levelmail666, __Tracesmail666}}
		when __Levelmail666 band 8 /= 0 orelse
		       __Tracesmail666 /= [] ->
		lager:do_log(error,
			     [{module, mail}, {function, recv}, {line, 666},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("收取邮件时发生异常: ~w", [Err]), none, 4096,
			     8, __Levelmail666, __Tracesmail666, lager_event,
			     __Pidmail666);
	    _ -> ok
	  end,
	  {error, lang:get(<<"邮件系统暂时不可用，请稍后再试"/utf8>>)}
    end.

del_mailbox([]) -> ok;
del_mailbox([_Mail = #mail{sess = Sess, to = To,
			   send_time = SendTime}
	     | T]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmail671, _, {__Levelmail671, __Tracesmail671}}
	  when __Levelmail671 band 128 /= 0 orelse
		 __Tracesmail671 /= [] ->
	  lager:do_log(debug,
		       [{module, mail}, {function, del_mailbox}, {line, 671},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("邮件接收，删除投递邮件:~w", [Sess]), none, 4096,
		       128, __Levelmail671, __Tracesmail671, lager_event,
		       __Pidmail671);
      _ -> ok
    end,
    dets:match_delete(mailbox,
		      #mail{sess = Sess, to = To, send_time = SendTime,
			    _ = '_'}),
    del_mailbox(T).

clean([], _Now, _Flag, L) ->
    SortL = lists:reverse(lists:keysort(#mail.send_time,
					L)),
    lists:sublist(SortL, 100);
clean([M = #mail{time_out = To} | T], Now, Flag, L)
    when Now >= To andalso To > 0 ->
    push_del(M, Flag), clean(T, Now, Flag, L);
clean([M = #mail{rev_ts = 0} | T], Now, Flag, L) ->
    clean(T, Now, Flag, [M#mail{rev_ts = Now} | L]);
clean([M = #mail{sess = Sess, rev_ts = Ts} | T], Now,
      Flag, L)
    when Now - Ts < 86400 * 7 * 2 ->
    case lists:keymember(Sess, #mail.sess, L) of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmail688, _, {__Levelmail688, __Tracesmail688}}
		when __Levelmail688 band 8 /= 0 orelse
		       __Tracesmail688 /= [] ->
		lager:do_log(error,
			     [{module, mail}, {function, clean}, {line, 688},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("存在重复邮件:~w", [Sess]), none, 4096, 8,
			     __Levelmail688, __Tracesmail688, lager_event,
			     __Pidmail688);
	    _ -> ok
	  end,
	  clean(T, Now, Flag, L);
      _ -> clean(T, Now, Flag, [M | L])
    end;
clean([M | T], Now, Flag, L) ->
    push_del(M, Flag), clean(T, Now, Flag, L).

push_del(#mail{sess = Sess}, timeout) ->
    sys_conn:pack_send(10804, {[Sess], <<>>});
push_del(_M, _Flag) -> ok.

do_init() ->
    Num = dets:info(mailbox, size),
    Now = date:unixtime(),
    TimeOutT = if Num > 10000 -> Now - 86400 * 30;
		  true -> Now - 86400 * 90
	       end,
    put(del_mailbox, []),
    Fun = fun (Mail = #mail{send_time = Ts})
		  when Ts < TimeOutT ->
		  put(del_mailbox, [Mail | get(del_mailbox)]), continue;
	      (Mail = #mail{time_out = To})
		  when Now >= To andalso To > 0 ->
		  put(del_mailbox, [Mail | get(del_mailbox)]), continue;
	      (_Mail = #mail{items = _Items}) -> continue
	  end,
    dets:traverse(mailbox, Fun),
    L = erase(del_mailbox),
    [dets:delete_object(mailbox, Mail) || Mail <- L],
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmail723, _, {__Levelmail723, __Tracesmail723}}
	  when __Levelmail723 band 64 /= 0 orelse
		 __Tracesmail723 /= [] ->
	  lager:do_log(info,
		       [{module, mail}, {function, do_init}, {line, 723},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("信件清除：~w -> ~w",
				     [Num, dets:info(mailbox, size)]),
		       none, 4096, 64, __Levelmail723, __Tracesmail723,
		       lager_event, __Pidmail723);
      _ -> ok
    end,
    Fun1 = fun (GMail = #gmail{id = Id}) ->
		   ets:insert(mailbox_global, GMail),
		   self() ! {check_gmail, Id},
		   continue
	   end,
    dets:traverse(mailbox_global, Fun1),
    dets:to_ets(mailbox_feedback, mailbox_feedback),
    ok.

t(N) ->
    M = #mail{sess =
		  {sys_env:update_counter(mail_sess_id, 1),
		   sys_lib:srv_id()},
	      from = {0, sys_lib:srv_id()},
	      send_time = date:unixtime(), type = 1,
	      subject =
		  lang:get(<<"邮件标题邮件标题邮件标题邮件标题邮件标题邮件标题邮件标题邮件标题邮件标题"/utf8>>),
	      content =
		  lang:get(<<"邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮"
			     "件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件"
			     "内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内"
			     "容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容"
			     "邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮"
			     "件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件"
			     "内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容"/utf8>>)},
    F1 = fun (I) ->
		 Rid = I rem 1000 + 1,
		 send(M#mail{to = {Rid, sys_lib:srv_id()}})
	 end,
    F2 = fun (I) ->
		 Rid = I rem 1000 + 1, recv({Rid, sys_lib:srv_id()})
	 end,
    ptester:run(N, [{"send", F1}, {"recv", F2}]).


