-file("src/mod/item/gift.erl", 1).

-module(gift).

-lager_records([{group_attr, [atk, hp_max, def, speed]},
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
		{gift_chose_data,
		 [id, name, bid, num, bind, sex, career, min_lev,
		  max_lev, auto_open, sort_id]},
		{gift_rand_data,
		 [id, name, bid, num, bind, sex, career, rand, min_lev,
		  max_lev, can_out, can_out2, must_out, max_out,
		  rand_list]},
		{gift_data,
		 [id, name, loss, items, notice_items, max_open,
		  day_open, rand_num, rand_type, priority_rand_gifts,
		  stat_num]},
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

-export([open/4, chose/6, exchange_expire/4,
	 get_show_items/3, open_exchange_expire_gift/5]).

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

-file("src/mod/item/gift.erl", 15).

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

-file("src/mod/item/gift.erl", 16).

-file("inc/gift.hrl", 1).

-record(gift_data,
	{id = 0, name = <<>>, loss = [], items = [],
	 notice_items = [], max_open = 0, day_open = 0,
	 rand_num = 0, rand_type = 0, priority_rand_gifts = [],
	 stat_num = 0}).

-record(gift_rand_data,
	{id = 0, name = <<>>, bid = 0, num = 1, bind = 1,
	 sex = 2, career = 0, rand = 0, min_lev = 0, max_lev = 0,
	 can_out = 0, can_out2 = 0, must_out = 0, max_out = 0,
	 rand_list = []}).

-record(gift_chose_data,
	{id = 0, name = <<>>, bid = 0, num = 1, bind = 1,
	 sex = 2, career = 0, min_lev = 0, max_lev = 0,
	 auto_open = 0, sort_id = 1}).

-file("src/mod/item/gift.erl", 17).

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

-file("src/mod/item/gift.erl", 18).

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

-file("src/mod/item/gift.erl", 19).

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

-file("src/mod/item/gift.erl", 20).

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

-file("src/mod/item/gift.erl", 21).

-file("inc/log.hrl", 1).

-file("src/mod/item/gift.erl", 22).

-spec open(#role{}, pos_integer(), pos_integer(),
	   pos_integer()) -> {ok, #role{}} | {false, bitstring()}.

open(Role, GiftBid, Bind, Num) when Num > 0 ->
    case gift_data:get(GiftBid) of
      GiftData = #gift_data{loss = Loss} ->
	  case check([max_open, day_open, bag_pos], Role,
		     GiftData, Num)
	      of
	    true ->
		GL = format:val_to_loss(Loss, open_gift),
		case role_gain:do(Role, GL) of
		  {false, #loss{msg = Msg}} -> {false, Msg};
		  {ok, Role1} ->
		      {Role2, GetAllItems} = do_open(Role1, GiftData, Bind,
						     Num),
		      GetItems = item_lib:merge(GetAllItems, []),
		      GL1 = format:val_to_gain(GetItems, open_gift),
		      case role_gain:do_notice(Role2, GL1) of
			{false, #gain{msg = Msg}} -> {false, Msg};
			{ok, NRole} ->
			    notice(GetAllItems, GiftData, Num, NRole),
			    notice_spec(GetItems, <<", ">>, GiftBid, Num,
					NRole),
			    log:log_gain(GL, Role, NRole, <<"开启礼包"/utf8>>,
					 util:fbin("开启礼包:~w*~w",
						   [GiftBid, Num])),
			    log:log_gain(GL1, Role, NRole, <<"开启礼包"/utf8>>,
					 util:fbin("开启礼包:~w*~w",
						   [GiftBid, Num])),
			    {ok, NRole}
		      end
		end;
	    {false, Reason} -> {false, Reason}
	  end;
      _ -> {false, lang:get(<<"礼包数据不存在"/utf8>>)}
    end;
open(_Role, _GiftBid, _Bind, _Num) ->
    {false, lang:get(<<"礼包开启数量错误"/utf8>>)}.

do_open(Role, GiftData = #gift_data{items = BaseItems0},
	Bind, Num) ->
    BaseItems = get_base_items(BaseItems0, Role, Bind, Num,
			       []),
    {Role1, RandItems} = get_rand_items(Role, GiftData,
					Bind, Num),
    {Role1, RandItems ++ BaseItems}.

get_show_items(Role, ItemId, ItemNum) ->
    case item_data:get(ItemId) of
      #item_base{type = 100, gain_type = 5} ->
	  case gift_data:get(ItemId) of
	    GiftData = #gift_data{} ->
		{NRole, Items1} = do_open(Role, GiftData, 1, ItemNum),
		{NRole, [{I, N} || {I, _, N} <- Items1]};
	    _ -> {Role, [{ItemId, ItemNum}]}
	  end;
      _ -> {Role, [{ItemId, ItemNum}]}
    end.

open_exchange_expire_gift(Role, GiftBid, Bind, Num, EId)
    when Num > 0 ->
    case gift_data:get(GiftBid) of
      GiftData = #gift_data{loss = Loss, name = GiftName} ->
	  case check([max_open, day_open, bag_pos], Role,
		     GiftData, Num)
	      of
	    true ->
		GL = format:val_to_loss(Loss, open_gift),
		case role_gain:do(Role, GL) of
		  {ok, Role1} ->
		      {NewRole, GetItems} = do_open(Role1, GiftData, Bind,
						    Num),
		      GL1 = format:val_to_gain(GetItems, open_gift),
		      {Items, Assets} = format:gain_to_items_assets(GL1),
		      Title = util:fbin(lang:get(<<"~ts每日奖励"/utf8>>),
					[GiftName]),
		      Subject =
			  util:fbin(lang:get(<<"亲爱的玩家，您购买的~ts每日奖励已送达，请确认查收（剩余每日奖励天数：~w）"/utf8>>),
				    [GiftName,
				     exchange_gift:expire_rest_num(NewRole,
								   EId)]),
		      mail:send(NewRole,
				{Title, Subject, Assets, Items, "商城特惠时效礼包"}),
		      {ok, NewRole};
		  {false, #loss{msg = Msg}} -> {false, Msg}
		end;
	    {false, Reason} -> {false, Reason}
	  end;
      _ -> {false, lang:get(<<"礼包数据不存在"/utf8>>)}
    end;
open_exchange_expire_gift(_Role, _GiftBid, _Bind, _Num,
			  _EId) ->
    {false, lang:get(<<"礼包开启数量错误"/utf8>>)}.

-spec chose(#role{}, pos_integer(), 0 | 1,
	    pos_integer(), list(), pos_integer()) -> {ok, #role{}} |
						     {false, bitstring()}.

chose(Role = #role{sex = Sex, career = Career,
		   lev = Lev},
      GiftId, Bind, Num, ChoseIds, SortId) ->
    L = [I
	 || I = #gift_chose_data{bid = Bid, sex = NeedSex,
				 career = NeedCareer, min_lev = MinLev,
				 max_lev = MaxLev, sort_id = SId}
		<- gift_data:chose_list(GiftId),
	    NeedSex =:= 2 orelse NeedSex =:= Sex,
	    NeedCareer =:= 0 orelse NeedCareer =:= Career,
	    MaxLev =:= 0 orelse Lev =< MaxLev, Lev >= MinLev,
	    lists:member(Bid, ChoseIds), SId =:= SortId],
    case do_chose(L, Role, Bind, Num, []) of
      {false, Reason} -> {false, Reason};
      {ok, Role1, GetItems0} ->
	  GetItems = item_lib:merge(GetItems0, []),
	  GL = format:val_to_gain(GetItems, open_gift),
	  case role_gain:do_notice(Role1, GL) of
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    {ok, NRole} ->
		notice_spec(GetItems, <<",">>, GiftId, Num, NRole),
		log:log_gain(GL, Role, NRole, <<"开启礼包"/utf8>>,
			     util:fbin("开启自选礼包:~w*~w", [GiftId, Num])),
		{ok, NRole}
	  end
    end.

do_chose([], _Role, _Bind, _Num, []) ->
    {false, lang:get(<<"开启礼包失败"/utf8>>)};
do_chose([], Role, _Bind, _Num, Items) ->
    {ok, Role, Items};
do_chose([#gift_chose_data{bid = Bid, bind = Bind0,
			   num = N, auto_open = AutoOpen}
	  | T],
	 Role, Bind, Num, Items) ->
    case gift_data:get(Bid) of
      GiftData = #gift_data{} when AutoOpen =:= 1 ->
	  case check([max_open, day_open, bag_pos], Role,
		     GiftData, N * Num)
	      of
	    true ->
		{NRole, GetItems} = do_open(Role, GiftData,
					    max(Bind0, Bind), N * Num),
		do_chose(T, NRole, Bind, Num, GetItems ++ Items);
	    {false, Reason} -> {false, Reason}
	  end;
      _ ->
	  do_chose(T, Role, Bind, Num,
		   [{Bid, max(Bind, Bind0), Num * N} | Items])
    end.

exchange_expire(Role,
		Item = #item{base_id = GiftBid, bind = Bind},
		#item_base{effect = Effect}, Num) ->
    case lists:keyfind(8, 1, Effect) of
      {8, {EId, ExpireTime}} ->
	  case exchange_gift:check_expire(Role, EId) of
	    ok ->
		{ok, ExpireRole} = exchange_gift:activate_expire(Role,
								 EId,
								 ExpireTime,
								 Item, Num),
		case open_exchange_expire_gift(ExpireRole, GiftBid,
					       Bind, Num, EId)
		    of
		  {ok, NewRole} -> {ok, NewRole};
		  {false, Msg} -> {false, Msg}
		end;
	    {false, Msg} -> {false, Msg}
	  end;
      _ -> {false, lang:get(<<"无法使用礼包效果"/utf8>>)}
    end.

check([], _Role, _GiftData, _Num) -> true;
check([Label | T], Role, GiftData, Num) ->
    case check(Label, Role, GiftData, Num) of
      true -> check(T, Role, GiftData, Num);
      {false, Reason} -> {false, Reason}
    end;
check(max_open, Role,
      #gift_data{id = GiftBid, max_open = MaxOpen}, Num)
    when MaxOpen > 0 ->
    N = var:get_list_val(Role, acc, 2001, GiftBid),
    case N + Num > MaxOpen of
      true -> {false, lang:get(<<"礼包累计开启数量超出上限"/utf8>>)};
      _ -> true
    end;
check(max_open, _Role, _GiftData, _Num) -> true;
check(day_open, Role,
      #gift_data{id = GiftBid, day_open = MaxOpen}, Num)
    when MaxOpen > 0 ->
    N = var:get_list_val(Role, day, 2001, GiftBid),
    case N + Num > MaxOpen of
      true -> {false, lang:get(<<"礼包今天开启数量超出上限"/utf8>>)};
      _ -> true
    end;
check(day_open, _Role, _GiftData, _Num) -> true;
check(bag_pos, Role,
      #gift_data{id = GiftId, items = BaseItems0,
		 rand_num = RandNum},
      Num)
    when RandNum > 0 ->
    BaseItems = get_base_items(BaseItems0, Role, 1, Num,
			       []),
    RandItems = rand_list_data(GiftId, Role),
    NeedPos = item_lib:calc_need_pos(BaseItems) +
		Num *
		  lists:sum(lists:sublist(lists:reverse(lists:sort([item_lib:calc_need_pos({Bid,
											    N})
								    || #gift_rand_data{bid
											   =
											   Bid,
										       num
											   =
											   N}
									   <- RandItems])),
					  RandNum)),
    FreePos = package:free(Role#role.p_bag),
    case FreePos >= NeedPos of
      true -> true;
      _ ->
	  {false,
	   util:fbin(lang:get(<<"需要~w个空格子才能开启礼包"/utf8>>),
		     [NeedPos])}
    end;
check(bag_pos, _Role, _GiftData, _Num) -> true;
check(_Label, _Role, _GiftData, _Num) ->
    {false, lang:get(<<"礼包开启异常"/utf8>>)}.

get_base_items([], _Role, _Bind, _Num, Items) -> Items;
get_base_items([{Bid, N} | T], Role, Bind, Num,
	       Items) ->
    get_base_items(T, Role, Bind, Num,
		   [{Bid, 1, N * Num} | Items]);
get_base_items([{Bid, Bind0, N} | T], Role, Bind, Num,
	       Items) ->
    get_base_items(T, Role, Bind, Num,
		   [{Bid, max(Bind, Bind0), N * Num} | Items]);
get_base_items([{sex, Bid, Bind0, N, NeedSex} | T],
	       Role = #role{sex = Sex}, Bind, Num, Items)
    when NeedSex =:= 2 orelse NeedSex =:= Sex ->
    get_base_items(T, Role, Bind, Num,
		   [{Bid, max(Bind, Bind0), N * Num} | Items]);
get_base_items([{career, Bid, Bind0, N, NeedCareer}
		| T],
	       Role = #role{career = Career}, Bind, Num, Items)
    when NeedCareer =:= 0 orelse NeedCareer =:= Career ->
    get_base_items(T, Role, Bind, Num,
		   [{Bid, max(Bind, Bind0), N * Num} | Items]);
get_base_items([_ | T], Role, Bind, Num, Items) ->
    get_base_items(T, Role, Bind, Num, Items).

get_rand_items(Role,
	       GiftData = #gift_data{rand_num = RandNum}, Bind, Num)
    when RandNum > 0 andalso Num > 0 ->
    do_rand_items(Num, Role, GiftData, Bind, []);
get_rand_items(Role, _GiftData, _Bind, _Num) ->
    {Role, []}.

rand_priority_items(Role, [], TotalNum, _Bind,
		    ResultItems) ->
    {Role, ResultItems, TotalNum};
rand_priority_items(Role, _, TotalNum, _Bind,
		    ResultItems)
    when TotalNum =< 0 ->
    {Role, ResultItems, 0};
rand_priority_items(Role, [{GiftId, RandNums} | T],
		    TotalNum, Bind, ResultItems) ->
    {RandNum0, _} = list_util:keyrand(RandNums, 2),
    RandNum = min(RandNum0, TotalNum),
    {Role1, ResultItems1} = do_rand_items_(Role, GiftId, 1,
					   RandNum),
    rand_priority_items(Role1, T, TotalNum - RandNum, Bind,
			ResultItems ++ ResultItems1).

do_rand_items(0, Role, _GiftData, Bind, Items) ->
    {Role,
     [{Bid, max(Bind, Bind0), Num}
      || #gift_rand_data{bid = Bid, bind = Bind0, num = Num}
	     <- Items]};
do_rand_items(N, Role,
	      GiftData = #gift_data{id = GiftId, rand_type = RandType,
				    rand_num = RandNum,
				    priority_rand_gifts = PriorityItems,
				    stat_num = StatNum},
	      Bind, Items) ->
    {Role1, Items1, RemainCount} = rand_priority_items(Role,
						       PriorityItems, RandNum,
						       Bind, []),
    case RemainCount of
      0 ->
	  Role2 = util:if_true(StatNum =:= 1,
			       var:acc_list_val(Role1, acc, 2035, GiftId),
			       Role1),
	  do_rand_items(N - 1, Role2, GiftData, Bind,
			Items ++ Items1);
      _ ->
	  {Role2, Items2} = do_rand_items_(Role1, GiftId,
					   RandType, RemainCount),
	  Role3 = util:if_true(StatNum =:= 1,
			       var:acc_list_val(Role2, acc, 2035, GiftId),
			       Role2),
	  do_rand_items(N - 1, Role3, GiftData, Bind,
			Items ++ Items1 ++ Items2)
    end.

do_rand_items_(Role, GiftId, RandType, RandNum) ->
    RandItems = rand_list_data(GiftId, Role),
    CanOutItems = can_out_items(RandItems, Role),
    MustOutItems = must_out_items(CanOutItems, Role),
    OutItems = case length(MustOutItems) of
		 RandNum -> MustOutItems;
		 Len when RandNum > Len ->
		     MustOutItems ++
		       do_rand_items1(RandType, CanOutItems -- MustOutItems,
				      #gift_rand_data.rand, RandNum - Len);
		 _ ->
		     list_util:keyrand_more(MustOutItems,
					    #gift_rand_data.rand, RandNum)
	       end,
    NRole = update_out_times(RandItems, OutItems, Role),
    {NRole, OutItems}.

do_rand_items1(0, RandItems, Key, Num) ->
    list_util:keyrand_more(RandItems, Key, Num);
do_rand_items1(1, RandItems, Key, Num) ->
    list_util:keyrand_more2(RandItems, Key, Num).

can_out_items(L, Role) ->
    Fun = fun (I = #gift_rand_data{id = GiftId, bid = Bid,
				   num = Num, can_out = N, can_out2 = N2,
				   max_out = MaxOut},
	       Acc) ->
		  AllCount = var:get_list_val(Role, acc, 2002,
					      {GiftId, Bid, Num}),
		  Count = var:get_list_val(Role, acc, 2034,
					   {GiftId, Bid, Num}),
		  Flag1 = MaxOut =:= 0 orelse Count < MaxOut,
		  Flag2 = N =:= 0 orelse AllCount >= N,
		  if Count == 0, Flag1, Flag2 -> [I | Acc];
		     Count =/= 0, Flag1, AllCount >= N2 -> [I | Acc];
		     true -> Acc
		  end
	  end,
    lists:foldl(Fun, [], L).

must_out_items(L, Role) ->
    [I
     || I = #gift_rand_data{id = GiftId, bid = Bid,
			    num = Num, must_out = N}
	    <- L,
	N > 0,
	var:get_list_val(Role, acc, 2002, {GiftId, Bid, Num}) >=
	  N].

update_out_times([], [], Role) -> Role;
update_out_times([],
		 [#gift_rand_data{id = GiftId, bid = Bid, num = Num,
				  can_out2 = N, max_out = MaxOut}
		  | T],
		 Role)
    when MaxOut > 0 orelse N > 0 ->
    NRole = var:acc_list_val(Role, acc, 2034,
			     {GiftId, Bid, Num}),
    update_out_times([], T, NRole);
update_out_times([], [_ | T], Role) ->
    update_out_times([], T, Role);
update_out_times([#gift_rand_data{can_out = 0,
				  can_out2 = 0, must_out = 0}
		  | T],
		 OutItems, Role) ->
    update_out_times(T, OutItems, Role);
update_out_times([I = #gift_rand_data{id = GiftId,
				      bid = Bid, num = Num}
		  | T],
		 OutItems, Role) ->
    NRole = case lists:member(I, OutItems) of
	      true ->
		  var:del_list_val(Role, acc, 2002, {GiftId, Bid, Num});
	      _ ->
		  var:acc_list_val(Role, acc, 2002, {GiftId, Bid, Num})
	    end,
    update_out_times(T, OutItems, NRole).

rand_list_data(GiftId,
	       Role = #role{sex = Sex, career = Career, lev = Lev}) ->
    L = gift_data:rand_list(GiftId),
    N = var:get_list_val(Role, acc, 2035, GiftId),
    Fun = fun (I = #gift_rand_data{rand_list = RandList}) ->
		  case [Rand1
			|| {Min, Max, Rand1} <- RandList, N >= Min, N =< Max]
		      of
		    [Rand1 | _] -> I#gift_rand_data{rand = Rand1};
		    _ -> I
		  end
	  end,
    [Fun(I)
     || I = #gift_rand_data{sex = NeedSex,
			    career = NeedCareer, min_lev = MinLev,
			    max_lev = MaxLev}
	    <- L,
	NeedSex =:= 2 orelse NeedSex =:= Sex,
	NeedCareer =:= 0 orelse NeedCareer =:= Career,
	MaxLev =:= 0 orelse Lev =< MaxLev, Lev >= MinLev].

find_notice_items(AllItems, NoticeItems) ->
    [T
     || T = {Bid, _, Num} <- AllItems,
	lists:member(Bid, NoticeItems) orelse
	  lists:member({Bid, Num}, NoticeItems)].

notice(AllItems,
       #gift_data{id = GiftId, notice_items = NoticeItems},
       Num, Role) ->
    case find_notice_items(AllItems, NoticeItems) of
      NeedNoticeItems = [_ | _] ->
	  Msg =
	      color:msg(lang:get(<<"恭喜~ts打开~ts,金光一闪,获得了：~ts"/utf8>>),
			[Role, {item, {GiftId, Num}}, {item, NeedNoticeItems}]),
	  notice:broadcast(world, undefined, rumor_left_top, Msg);
      _ -> skip
    end.

notice_spec(GetItems, Split, Bid, Num, Role) ->
    ItemMsg = make_spec_notice(GetItems, Split, partner,
			       <<>>),
    case ItemMsg of
      <<>> -> ok;
      _ ->
	  Msg =
	      color:msg(lang:get(<<"恭喜~ts打开~ts，金光一闪，获得了~ts"/utf8>>),
			[Role, {item, {Bid, Num}}, ItemMsg]),
	  notice:broadcast(world, undefined, rumor_left_top, Msg)
    end.

make_spec_notice([], _Split, _Label, Acc) -> Acc;
make_spec_notice([{Bid, Num} | Rest], Split, Label,
		 Acc) ->
    Msg = do_make_spec_notice(Bid, Num, Label),
    NewAcc = add_split_bin(Msg, Split, Acc),
    make_spec_notice(Rest, Split, Label, NewAcc);
make_spec_notice([{Bid, _Bind, Num} | Rest], Split,
		 Label, Acc) ->
    Msg = do_make_spec_notice(Bid, Num, Label),
    NewAcc = add_split_bin(Msg, Split, Acc),
    make_spec_notice(Rest, Split, Label, NewAcc);
make_spec_notice([_ | Rest], Split, Label, Acc) ->
    make_spec_notice(Rest, Split, Label, Acc).

do_make_spec_notice(Bid, _Num, partner) ->
    case item_data:get(Bid) of
      #item_base{effect = Effect} ->
	  case lists:keyfind(7, 1, Effect) of
	    {_, PtnBid} ->
		case partner_data:get_base(PtnBid) of
		  #partner_base_data{rare_type = RareType, name = PtnName,
				     init_star = Star} ->
		      util:fbin("~ts英雄~ts",
				[partner_lib:rare_type_name(RareType),
				 color:format({partner,
					       {PtnBid, 0, PtnName, 0, <<>>,
						Star, 0}})]);
		  _ -> <<>>
		end;
	    _ -> <<>>
	  end;
      _ -> <<>>
    end;
do_make_spec_notice(_Bid, _Num, _Label) -> <<>>.

add_split_bin(<<>>, _Split, Rtn) -> Rtn;
add_split_bin(Add, Split, Rtn) when is_binary(Add) ->
    case Rtn of
      <<>> -> <<Add/binary>>;
      _ -> <<Rtn/binary, Split/binary, Add/binary>>
    end;
add_split_bin(_Add, _Split, Rtn) -> Rtn.


