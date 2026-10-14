-file("src/mod/role/role_looks.erl", 1).

-module(role_looks).

-lager_records([{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
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
		{vip_effect_data, [name, val]},
		{vip_data,
		 [lev, gold, price, old_price, items, ext_reward]},
		{m_vip, [ver, lev, lev_reward, tired_charge]},
		{m_look, [use_id, list]},
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

-export([init/0, init/1, login/1, add/3, del/2, check/2,
	 find/2, push/3, calc/1, activate/1, activate/3,
	 del_activate/2, push_info/1, use/2, look_used/1,
	 level_up/2, do_open/2, attr/1]).

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

-file("src/mod/role/role_looks.erl", 27).

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

-file("src/mod/role/role_looks.erl", 28).

-file("inc/looks.hrl", 1).

-record(m_look, {use_id = 0, list = []}).

-file("src/mod/role/role_looks.erl", 29).

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

-file("src/mod/role/role_looks.erl", 30).

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

-file("src/mod/role/role_looks.erl", 31).

-file("inc/log.hrl", 1).

-file("src/mod/role/role_looks.erl", 32).

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

-file("src/mod/role/role_looks.erl", 33).

-spec init() -> #m_look{}.

init() -> #m_look{use_id = 110401, list = []}.

init(Role = #role{platform = <<"verifyios">>,
		  m_look = MLook = #m_look{list = List}}) ->
    RandId = util:rand_list(looks_data:list()),
    Role#role{m_look =
		  MLook#m_look{use_id = RandId, list = [RandId | List]}};
init(Role = #role{sex = 0,
		  m_look = MLook = #m_look{list = List}}) ->
    Role#role{m_look =
		  MLook#m_look{use_id = 120402, list = [120402 | List]}};
init(Role = #role{m_look =
		      MLook = #m_look{list = List}}) ->
    Role#role{m_look =
		  MLook#m_look{use_id = 110401, list = [110401 | List]}}.

-spec login(#role{}) -> ok | {ok, #role{}}.

login(Role = #role{m_look = D}) when not is_tuple(D) ->
    login(Role#role{m_look = init()});
login(Role) ->
    NRole = activate(Role), {ok, calc(NRole)}.

look_used(#role{m_look = #m_look{use_id = LookId}}) ->
    LookId.

-spec add(#role{}, tuple(),
	  add | check | replace) -> #role{}.

add(Role = #role{s_looks = Looks},
    {Type, Mode, Val, Str}, add) ->
    Role#role{s_looks = [{Type, Mode, Val, Str} | Looks]};
add(Role = #role{s_looks = Looks},
    {Type, Mode, Val, Str}, check) ->
    case lists:keyfind(Type, 1, Looks) of
      false ->
	  Role#role{s_looks = [{Type, Mode, Val, Str} | Looks]};
      _ -> Role
    end;
add(Role = #role{s_looks = Looks},
    {Type, Mode, Val, Str}, replace) ->
    Role#role{s_looks =
		  lists:keystore(Type, 1, Looks, {Type, Mode, Val, Str})}.

-spec del(#role{},
	  pos_integer() | [pos_integer()]) -> #role{}.

del(Role = #role{s_looks = Looks}, Types)
    when is_list(Types) ->
    NewLooks = [Look
		|| Look <- Looks,
		   not lists:member(element(1, Look), Types)],
    Role#role{s_looks = NewLooks};
del(Role = #role{s_looks = Looks}, Type) ->
    NewLooks = [Look
		|| Look <- Looks, element(1, Look) =/= Type],
    Role#role{s_looks = NewLooks}.

-spec check(#role{},
	    pos_integer() | [pos_integer()]) -> true | false.

check(Role, Type) -> find(Role, Type) =/= [].

-spec find(#role{},
	   pos_integer() | [pos_integer()]) -> [tuple()].

find(#role{s_looks = Looks}, Types)
    when is_list(Types) ->
    [Look
     || Look <- Looks,
	lists:member(element(1, Look), Types)];
find(#role{s_looks = Looks}, Type) ->
    [Look || Look <- Looks, element(1, Look) =:= Type].

-spec push(#role{}, #role{} | [tuple()],
	   map_role | all | update) -> ok.

push(Role, #role{s_looks = OldLooks}, Label) ->
    push(Role, OldLooks, Label);
push(Role = #role{s_looks = NewLooks}, OldLooks,
     map_role) ->
    case length(NewLooks) =:= length(OldLooks) of
      true ->
	  case OldLooks -- NewLooks of
	    [] -> skip;
	    _ -> map:role_update(Role)
	  end;
      _ -> map:role_update(Role)
    end;
push(Role = #role{s_looks = NewLooks}, OldLooks, all) ->
    case length(NewLooks) =:= length(OldLooks) of
      true ->
	  case OldLooks -- NewLooks of
	    [] -> skip;
	    _ -> map:role_looks(Role, NewLooks, 0)
	  end;
      _ -> map:role_looks(Role, NewLooks, 0)
    end;
push(Role = #role{s_looks = NewLooks}, OldLooks,
     update) ->
    case calc_diff(NewLooks, OldLooks, []) of
      [] -> skip;
      DiffLooks -> map:role_looks(Role, DiffLooks, 1)
    end.

calc_diff([], OldLooks, DiffLooks) ->
    [{Type, Mode, 0, <<>>}
     || {Type, Mode, _, _} <- OldLooks]
      ++ DiffLooks;
calc_diff([I = {Type, Mode, _, _} | Looks], OldLooks,
	  DiffLooks) ->
    case [I1
	  || I1 = {Type1, Mode1, _, _} <- OldLooks,
	     Type1 =:= Type, Mode1 =:= Mode]
	of
      [] -> calc_diff(Looks, OldLooks, [I | DiffLooks]);
      [I] -> calc_diff(Looks, OldLooks -- [I], DiffLooks);
      L -> calc_diff(Looks, OldLooks -- L, [I | DiffLooks])
    end.

-spec calc(#role{}) -> #role{}.

calc(Role = #role{m_look = #m_look{use_id = LookId}}) ->
    NewLooks = [{1, 0, LookId, <<>>}],
    Role#role{s_looks = NewLooks}.

-spec push_info(#role{}) -> ok.

push_info(#role{m_look =
		    #m_look{use_id = LookId, list = L}}) ->
    NewList = lists:usort(L),
    sys_conn:pack_send(10345, {LookId, NewList}),
    ok.

-spec do_open(#role{}, pos_integer()) -> {ok, #role{}} |
					 {false, binary()}.

do_open(Role = #role{m_look =
			 Mlook = #m_look{list = L}},
	Id) ->
    case check_can_open(Role, Id) of
      {false, Msg} -> {false, Msg};
      {ok, Expend} ->
	  Loss = format:val_to_loss(Expend, role_look_open),
	  case role_gain:do(Role, Loss) of
	    {ok, NRole} ->
		log:log_gain(Loss, Role, NRole, <<"激活形象"/utf8>>,
			     util:fbin(lang:get(<<"形象激活：~w"/utf8>>), [Id])),
		NewRole = NRole#role{m_look =
					 Mlook#m_look{list = [Id | L]}},
		push_info(NewRole),
		NewRole2 = partner_lib:ref_partner_by_type(NewRole, [0],
							   []),
		{ok, NewRole2};
	    {false, #loss{msg = Msg}} -> {false, Msg}
	  end
    end.

check_can_open(Role = #role{m_look = #m_look{list = L}},
	       Id) ->
    case lists:member(Id, L) of
      true -> {false, lang:get(<<"外观已激活"/utf8>>)};
      _ ->
	  case looks_data:get(Id) of
	    Cache = #{expend := Expend = [_ | _]} ->
		case check_activate([lev, vip_lev, partner_skin,
				     partner],
				    Role, Cache)
		    of
		  true -> {ok, Expend};
		  {false, Msg} -> {false, Msg}
		end;
	    _ -> {false, lang:get(<<"该形象无需主动激活"/utf8>>)}
	  end
    end.

-spec attr(#role{}) -> list().

attr(#role{m_look = #m_look{list = L}}) ->
    lists:flatten([looks_data:get_attr(Id) || Id <- L]);
attr(_Role) -> [].

-spec use(#role{}, Id :: pos_integer()) -> {false,
					    bitstring()} |
					   {ok, #role{}}.

use(Role = #role{id = RoleId,
		 m_look = MLook = #m_look{list = L}},
    Id) ->
    case lists:member(Id, L) of
      true ->
	  NRole = calc(Role#role{m_look =
				     MLook#m_look{use_id = Id, list = L}}),
	  push(NRole, Role, update),
	  guild_member:update(NRole, sync),
	  arena_mgr:sync_role(NRole, all),
	  sky_ladder_mgr:sync_role(NRole, all),
	  role_robot:sync_role(NRole),
	  rank_listener:update_val(look_id, RoleId, Id),
	  {ok, NRole};
      _ ->
	  case check_activate([lev, vip_lev, partner_skin,
			       partner, expend],
			      Role, looks_data:get(Id))
	      of
	    true ->
		NRole = calc(Role#role{m_look =
					   MLook#m_look{use_id = Id,
							list = L}}),
		push(NRole, Role, update),
		guild_member:update(NRole, sync),
		arena_mgr:sync_role(NRole, all),
		sky_ladder_mgr:sync_role(NRole, all),
		role_robot:sync_role(NRole),
		rank_listener:update_val(look_id, RoleId, Id),
		NRole2 = partner_lib:ref_partner_by_type(NRole, [0],
							 []),
		{ok, NRole2};
	    {false, Reason} -> {false, Reason}
	  end
    end.

-spec level_up(OldRole :: #role{},
	       Role :: #role{}) -> {ok, #role{}}.

level_up(_OldRole, Role) ->
    NRole = activate(Role), {ok, NRole}.

-spec del_activate(#role{}, pos_integer()) -> #role{}.

del_activate(Role = #role{m_look =
			      MLook = #m_look{use_id = UseId, list = L}},
	     LooksIds) ->
    NewUseId = util:if_true(lists:member(UseId, LooksIds),
			    110401, UseId),
    NRole = Role#role{m_look =
			  MLook#m_look{use_id = NewUseId,
				       list = L -- LooksIds}},
    push_info(NRole),
    NRole.

-spec activate(#role{}) -> #role{}.

activate(Role = #role{m_look =
			  MLook = #m_look{list = L}}) ->
    All = looks_data:list(),
    All0 = All -- L,
    AddL = [Id
	    || Id <- All0,
	       check_activate([lev, vip_lev, partner_skin, partner,
			       expend],
			      Role, looks_data:get(Id))
		 =:= true],
    NRole = Role#role{m_look =
			  MLook#m_look{list = AddL ++ L}},
    NRole2 = partner_lib:ref_partner_by_type(NRole, [0],
					     []),
    NRole2.

-spec activate(#role{}, PartnerId :: integer(),
	       Star :: integer()) -> #role{}.

activate(Role = #role{m_look =
			  MLook = #m_look{list = L}},
	 PartnerBid, Star) ->
    LooksIds = looks_data:get_looks_id({PartnerBid, Star}),
    Fun = fun (LooksId, Acc) ->
		  case lists:member(LooksId, Acc) of
		    false ->
			case check_activate([lev, vip_lev, partner_skin,
					     partner, expend],
					    Role, looks_data:get(LooksId))
			    of
			  true -> [LooksId | Acc];
			  _ -> Acc
			end;
		    _ -> Acc
		  end
	  end,
    NewLoosIds = lists:foldl(Fun, [], LooksIds),
    NewL = lists:usort(L ++ NewLoosIds),
    NRole = Role#role{m_look = MLook#m_look{list = NewL}},
    NewRole = change_use(NRole, lists:usort(NewLoosIds)),
    NewRole.

change_use(Role, []) -> Role;
change_use(Role = #role{m_look =
			    MLook = #m_look{use_id = UseId}},
	   [Id | Other]) ->
    PreId = looks_data:get_pre(Id),
    case UseId =:= PreId of
      true ->
	  change_use(Role#role{m_look =
				   MLook#m_look{use_id = Id}},
		     Other);
      _ -> change_use(Role, Other)
    end.

-spec check_activate(list(), #role{}, #{}) -> true |
					      {false, bitstring()}.

check_activate([lev | _], #role{lev = Lev},
	       #{lev := NeedLev})
    when Lev < NeedLev ->
    {false, lang:get(<<"等级不足"/utf8>>)};
check_activate([lev | Other], Role, Cache) ->
    check_activate(Other, Role, Cache);
check_activate([vip_lev | _],
	       #role{m_vip = #m_vip{lev = Lev}}, #{vip_lev := NeedLev})
    when Lev < NeedLev ->
    {false, lang:get(<<"VIP等级不足"/utf8>>)};
check_activate([vip_lev | Other], Role, Cache) ->
    check_activate(Other, Role, Cache);
check_activate([partner | Other],
	       Role = #role{partner_bag =
				#partner_bag{partner_list = List,
					     partner_had = HadList}},
	       Cache = #{partner_id := Id, star := NeedStar}) ->
    case lists:keyfind(Id, 1, HadList) of
      {_, _Likes, _CommentNum, Star} when Star >= NeedStar ->
	  check_activate(Other, Role, Cache);
      _ ->
	  case lists:keyfind(Id, #partner.bid, List) of
	    #partner{star = Star, end_time = 0}
		when Star >= NeedStar ->
		check_activate(Other, Role, Cache);
	    #partner{} -> {false, lang:get(<<"对应英雄星级不足"/utf8>>)};
	    false -> {false, lang:get(<<"对应英雄未激活"/utf8>>)}
	  end
    end;
check_activate([partner_skin | Other],
	       Role = #role{partner_bag =
				#partner_bag{partner_skins = Skins}},
	       Cache = #{skin_id := SkinId}) ->
    Now = date:unixtime(),
    case lists:keyfind(SkinId, #partner_skin.id, Skins) of
      #partner_skin{end_time = EndTime}
	  when EndTime >= Now orelse EndTime == 0 ->
	  check_activate(Other, Role, Cache);
      _ when SkinId == 0 ->
	  check_activate(Other, Role, Cache);
      _ -> {false, lang:get(<<"对应英雄皮肤未激活"/utf8>>)}
    end;
check_activate([expend | _], _Role,
	       #{expend := [_ | _]}) ->
    {false, lang:get(<<"消耗道具才能激活"/utf8>>)};
check_activate([expend | Other], Role, Cache) ->
    check_activate(Other, Role, Cache);
check_activate([], _Role, _) -> true;
check_activate(_, _Role, _) ->
    {false, lang:get(<<"没有相应外观"/utf8>>)}.


