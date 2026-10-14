-file("src/mod/halidom/halidom.erl", 1).

-module(halidom).

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
		{halidom, [ver, id, lev, exp, lev_num, step, all_attr]},
		{m_halidom, [ver, list]},
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

-export([init/0, gm/2, push/1, calc_attr/2, active/3,
	 uplev/2, up_step/4]).

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

-file("src/mod/halidom/halidom.erl", 17).

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

-file("src/mod/halidom/halidom.erl", 18).

-file("inc/halidom.hrl", 1).

-record(m_halidom, {ver = 1, list = []}).

-record(halidom,
	{ver = 1, id = 0, lev = 1, exp = 0, lev_num = 0,
	 step = 0, all_attr = []}).

-file("src/mod/halidom/halidom.erl", 19).

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

-file("src/mod/halidom/halidom.erl", 20).

-file("inc/log.hrl", 1).

-file("src/mod/halidom/halidom.erl", 21).

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

-file("src/mod/halidom/halidom.erl", 22).

-spec init() -> #m_halidom{}.

init() -> #m_halidom{}.

-spec gm(#role{}, tuple()) -> {ok, #role{}}.

gm(Role = #role{m_halidom =
		    MHalidom = #m_halidom{list = List}},
   {set_lev, Id, Lev}) ->
    case halidom_data:get(Id) of
      #{} ->
	  H = case lists:keyfind(Id, #halidom.id, List) of
		false -> #halidom{id = Id, lev = Lev};
		H1 -> H1#halidom{lev = Lev}
	      end,
	  Halidom = calc_halidom_attr(H),
	  NewList = lists:keystore(Id, #halidom.id, List,
				   Halidom),
	  Role1 = Role#role{m_halidom =
				MHalidom#m_halidom{list = NewList}},
	  NRole = partner_lib:ref_partner_by_camp(Role1, [Id],
						  []),
	  push_halidom(Halidom),
	  {ok, NRole};
      _ -> {ok, Role}
    end;
gm(Role = #role{m_halidom =
		    MHalidom = #m_halidom{list = List}},
   {set_step, Id, Step}) ->
    case halidom_data:get(Id) of
      #{} ->
	  H = case lists:keyfind(Id, #halidom.id, List) of
		false -> #halidom{id = Id, step = Step};
		H1 -> H1#halidom{step = Step}
	      end,
	  Halidom = calc_halidom_attr(H),
	  NewList = lists:keystore(Id, #halidom.id, List,
				   Halidom),
	  Role1 = Role#role{m_halidom =
				MHalidom#m_halidom{list = NewList}},
	  NRole = partner_lib:ref_partner_by_camp(Role1, [Id],
						  []),
	  push_halidom(Halidom),
	  {ok, NRole};
      _ -> {ok, Role}
    end;
gm(Role, _) -> {ok, Role}.

-spec push(#role{}) -> ok.

push(#role{m_halidom = #m_halidom{list = List}}) ->
    CliL = [to_cli(I) || I <- List],
    sys_conn:pack_send(22200, {CliL}),
    ok.

-spec push_halidom(#halidom{}) -> ok.

push_halidom(Halidom) ->
    sys_conn:pack_send(22201, to_cli(Halidom)), ok.

to_cli(#halidom{id = Id, lev = Lev, exp = Exp,
		step = Step, all_attr = AllAttr}) ->
    AttrL =
	lists:reverse([{attr_data:attr_atom2id(AttrName),
			AttrVal}
		       || {AttrName, AttrVal} <- AllAttr]),
    {Id, Lev, Exp, Step, AttrL}.

-spec calc_attr(#role{}, pos_integer()) -> list().

calc_attr(#role{m_halidom = #m_halidom{list = List}},
	  Id) ->
    case lists:keyfind(Id, #halidom.id, List) of
      false -> [];
      #halidom{all_attr = AllAttr} ->
	  #{attr_args := AttrArgs} = halidom_data:get(Id),
	  do_calc_attr(AllAttr, AttrArgs, [])
    end.

do_calc_attr([], _, AttrL) -> AttrL;
do_calc_attr([{AttrName, Val} | T], AttrArgs, AttrL) ->
    case lists:keyfind(AttrName, 1, AttrArgs) of
      {_, Arg} ->
	  do_calc_attr(T, AttrArgs,
		       [{AttrName, round(Val * Arg / 1000)} | AttrL]);
      _ ->
	  do_calc_attr(T, AttrArgs, [{AttrName, Val} | AttrL])
    end.

calc_halidom_attr(Halidom = #halidom{id = Id, lev = Lev,
				     step = Step, lev_num = LevNum}) ->
    LevData = halidom_data:get_lev({Id, Lev}),
    StepData = halidom_data:get_step({Id, Step}),
    LevExpAttr0 = maps:get(exp_attr, LevData, []),
    LevAttr = maps:get(attr, LevData, []),
    StepAttr = maps:get(fixed_attr, StepData, []),
    LevExpAttr = [{AttrName, round(Val * LevNum)}
		  || {AttrName, Val} <- LevExpAttr0],
    AttrL1 = item_lib:merge(LevExpAttr, LevAttr),
    AttrL2 = item_lib:merge(StepAttr, AttrL1),
    DynamicAttr = maps:get(dynamic_attr, StepData, []),
    AllAttr = calc_dynamic_attr(DynamicAttr, AttrL2),
    Halidom#halidom{all_attr = AllAttr}.

calc_dynamic_attr([], AttrL) -> AttrL;
calc_dynamic_attr([{AttrNamePer, Per} | T], AttrL) ->
    AttrName = attr_calc:attr_per2name(AttrNamePer),
    case lists:keyfind(AttrName, 1, AttrL) of
      {AttrName, Val} ->
	  calc_dynamic_attr(T,
			    lists:keyreplace(AttrName, 1, AttrL,
					     {AttrName,
					      Val + round(Val * Per / 1000)}));
      _ -> calc_dynamic_attr(T, AttrL)
    end.

-spec active(#role{}, Id :: pos_integer(),
	     list()) -> {ok, #role{}} | {false, binary()}.

active(Role = #role{m_halidom =
			MHalidom = #m_halidom{list = List}},
       Id, PList) ->
    case lists:keyfind(Id, #halidom.id, List) of
      false ->
	  case halidom_data:get(Id) of
	    #{loss := Loss} ->
		case loss_partner(PList, Role, Loss, []) of
		  {false, Reason} -> {false, Reason};
		  {ok, Role1, LossPL} ->
		      {ok, AddLists, AddItems} =
			  partner_decompose:partner_decompose_info(Role, PList,
								   [], []),
		      AllItems = AddLists ++ AddItems,
		      GL = format:val_to_gain(AllItems, halidom),
		      case role_gain:do(Role1, GL) of
			{false, #gain{msg = Msg}} -> {false, Msg};
			{ok, Role2} ->
			    Halidom = calc_halidom_attr(#halidom{id = Id}),
			    Role3 = Role2#role{m_halidom =
						   MHalidom#m_halidom{list =
									  [Halidom
									   | List]}},
			    NRole = partner_lib:ref_partner_by_camp(Role3, [Id],
								    []),
			    notice:assets(GL),
			    push_halidom(Halidom),
			    PartnerIds = [{PId, BidT, LevT, StarT, BreakT}
					  || #partner{id = PId, bid = BidT,
						      star = StarT, lev = LevT,
						      break_lev = BreakT}
						 <- LossPL],
			    log:save(custom,
				     {NRole, <<"halidom_active">>,
				      [{id, Id},
				       {msg,
					util:fbin(lang:get(<<"消耗英雄数据:~w"/utf8>>),
						  [PartnerIds])}]}),
			    sys_conn:pack_send(11006, {PList}),
			    log:log_gain(GL, Role, NRole, <<"圣物激活"/utf8>>,
					 util:fbin(lang:get(<<"id:~w,消耗伙伴:~w"/utf8>>),
						   [Id, PartnerIds])),
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
			      {__Pidhalidom153, _,
			       {__Levelhalidom153, __Traceshalidom153}}
				  when __Levelhalidom153 band 128 /= 0 orelse
					 __Traceshalidom153 /= [] ->
				  lager:do_log(debug,
					       [{module, halidom},
						{function, active}, {line, 153},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("~ts激活圣物:~w plist=~w all_items=~w",
							     [Role#role.name,
							      Id, PList,
							      AllItems]),
					       none, 4096, 128,
					       __Levelhalidom153,
					       __Traceshalidom153, lager_event,
					       __Pidhalidom153);
			      _ -> ok
			    end,
			    {ok, NRole}
		      end
		end;
	    _ -> {false, lang:get(<<"配置数据不存在"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"圣物已激活"/utf8>>)}
    end.

-spec uplev(#role{}, Id :: pos_integer()) -> {ok,
					      #role{}} |
					     {false, binary()}.

uplev(Role = #role{m_halidom =
		       MHalidom = #m_halidom{list = List}},
      Id) ->
    case lists:keyfind(Id, #halidom.id, List) of
      false -> {false, lang:get(<<"圣物未激活"/utf8>>)};
      Halidom = #halidom{lev = Lev, exp = Exp,
			 lev_num = LevNum} ->
	  case halidom_data:get_lev({Id, Lev}) of
	    #{loss := Loss, exp := AddExp, total_exp := TotalExp,
	      exp_attr := ExpAttr} ->
		GL = format:val_to_loss(Loss, holidom_up_lev),
		case role_gain:do(Role, GL,
				  #gain_loss_opts{need_notify_fail_item = true})
		    of
		  {false, #loss{msg = Msg}} -> {false, Msg};
		  {ok, Role1, _} ->
		      NewExp = Exp + AddExp,
		      Halidom1 = #halidom{lev = NewLev} = case NewExp >=
								 TotalExp
							      of
							    true ->
								Halidom#halidom{lev
										    =
										    Lev
										      +
										      1,
										exp
										    =
										    0,
										lev_num
										    =
										    0};
							    _ ->
								Halidom#halidom{exp
										    =
										    NewExp,
										lev_num
										    =
										    LevNum
										      +
										      1}
							  end,
		      NewHalidom = calc_halidom_attr(Halidom1),
		      push_halidom(NewHalidom),
		      case NewLev > Lev of
			true -> sys_conn:pack_send(22205, {Id});
			_ ->
			    #gain_loss_opts{split_str = SplitStr} =
				#gain_loss_opts{},
			    Fun = fun ({AttrId, Val}, Acc) ->
					  Msg =
					      util:fbin(lang:get(<<"~ts+~w"/utf8>>),
							[attr_data:attr_atom2name(AttrId),
							 Val]),
					  case Acc of
					    <<>> -> Msg;
					    _ ->
						<<Acc/binary, SplitStr/binary,
						  Msg/binary>>
					  end
				  end,
			    PtnMsg = lists:foldl(Fun, <<>>, ExpAttr),
			    notice:alert(PtnMsg),
			    pass
		      end,
		      NewList = lists:keyreplace(Id, #halidom.id, List,
						 NewHalidom),
		      Role2 = Role1#role{m_halidom =
					     MHalidom#m_halidom{list =
								    NewList}},
		      NRole = partner_lib:ref_partner_by_camp(Role2, [Id],
							      []),
		      log:log_gain(GL, Role, NRole, <<"圣物升级"/utf8>>,
				   util:fbin(lang:get(<<"id:~w,等级:~w=>~w,经验:~w"/utf8>>),
					     [Id, Lev, NewLev, NewExp])),
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidhalidom205, _,
			 {__Levelhalidom205, __Traceshalidom205}}
			    when __Levelhalidom205 band 128 /= 0 orelse
				   __Traceshalidom205 /= [] ->
			    lager:do_log(debug,
					 [{module, halidom}, {function, uplev},
					  {line, 205},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~ts升级圣物:~w lev~w",
						       [Role#role.name, Id,
							Lev]),
					 none, 4096, 128, __Levelhalidom205,
					 __Traceshalidom205, lager_event,
					 __Pidhalidom205);
			_ -> ok
		      end,
		      {ok, NRole}
		end;
	    _ -> {false, lang:get(<<"已满级"/utf8>>)}
	  end
    end.

-spec up_step(#role{}, Id :: pos_integer(), list(),
	      list()) -> {ok, #role{}} | {false, binary()}.

up_step(Role = #role{m_halidom =
			 MHalidom = #m_halidom{list = List}},
	Id, PList1, PList2) ->
    case lists:keyfind(Id, #halidom.id, List) of
      false -> {false, lang:get(<<"圣物未激活"/utf8>>)};
      Halidom = #halidom{step = Step} ->
	  case halidom_data:get_step({Id, Step + 1}) of
	    Data = #{} ->
		case check_conds(maps:get(conds, Data, []), Role,
				 Halidom)
		    of
		  true ->
		      case loss_partner(PList1, Role,
					maps:get(loss_fixed, Data, []), [])
			  of
			{false, Reason} -> {false, Reason};
			{ok, Role1, LossPL1} ->
			    case loss_partner(PList2, Role1,
					      maps:get(loss_rand, Data, []), [])
				of
			      {false, Reason} -> {false, Reason};
			      {ok, Role2, LossPL2} ->
				  PList = PList1 ++ PList2,
				  {ok, AddLists, AddItems} =
				      partner_decompose:partner_decompose_info(Role,
									       PList,
									       [],
									       []),
				  AllItems = AddLists ++ AddItems,
				  Loss = format:val_to_loss(maps:get(loss_items,
								     Data, []),
							    holiday_up_step),
				  Gain = format:val_to_gain(AllItems,
							    holiday_up_step),
				  GL = Loss ++ Gain,
				  case role_gain:do(Role2, GL,
						    #gain_loss_opts{need_notify_fail_item
									= true})
				      of
				    {false, #loss{msg = Msg}} -> {false, Msg};
				    {false, #gain{msg = Msg}} -> {false, Msg};
				    {ok, Role3, _} ->
					NewHalidom =
					    calc_halidom_attr(Halidom#halidom{step
										  =
										  Step
										    +
										    1}),
					NewList = lists:keyreplace(Id,
								   #halidom.id,
								   List,
								   NewHalidom),
					Role4 = Role3#role{m_halidom =
							       MHalidom#m_halidom{list
										      =
										      NewList}},
					NRole =
					    partner_lib:ref_partner_by_camp(Role4,
									    [Id],
									    []),
					LossPL = LossPL1 ++ LossPL2,
					PartnerIds = [{PId, BidT, LevT, StarT,
						       BreakT}
						      || #partner{id = PId,
								  bid = BidT,
								  star = StarT,
								  lev = LevT,
								  break_lev =
								      BreakT}
							     <- LossPL],
					log:log_gain(GL, Role, NRole,
						     <<"圣物进阶"/utf8>>,
						     util:fbin(lang:get(<<"id:~w,阶:~w,消耗伙伴:~w"/utf8>>),
							       [Id, Step + 1,
								PartnerIds])),
					sys_conn:pack_send(11006, {PList}),
					notice:assets(Gain),
					push_halidom(NewHalidom),
					case {whereis(lager_event),
					      whereis(lager_event),
					      lager_config:get({lager_event,
								loglevel},
							       {0, []})}
					    of
					  {undefined, undefined, _} ->
					      fun () ->
						      {error, lager_not_running}
					      end();
					  {undefined, _, _} ->
					      fun () ->
						      {error,
						       {sink_not_configured,
							lager_event}}
					      end();
					  {__Pidhalidom254, _,
					   {__Levelhalidom254,
					    __Traceshalidom254}}
					      when __Levelhalidom254 band 128 /=
						     0
						     orelse
						     __Traceshalidom254 /= [] ->
					      lager:do_log(debug,
							   [{module, halidom},
							    {function, up_step},
							    {line, 254},
							    {pid,
							     pid_to_list(self())},
							    {node, node()}
							    | lager:md()],
							   io_lib:format("~ts进阶圣物:~w step=~w plist=~w all_items=~w",
									 [Role#role.name,
									  Id,
									  Step,
									  PList,
									  AllItems]),
							   none, 4096, 128,
							   __Levelhalidom254,
							   __Traceshalidom254,
							   lager_event,
							   __Pidhalidom254);
					  _ -> ok
					end,
					{ok, NRole}
				  end
			    end
		      end;
		  {false, Reason} -> {false, Reason}
		end;
	    _ -> {false, lang:get(<<"圣物已满阶"/utf8>>)}
	  end
    end.

check_conds([], _Role, _) -> true;
check_conds([{lev, NeedLev} | T], Role,
	    Halidom = #halidom{lev = Lev}) ->
    case Lev >= NeedLev of
      true -> check_conds(T, Role, Halidom);
      _ -> {false, lang:get(<<"圣物等级不足"/utf8>>)}
    end.

loss_partner([], Role, Loss, LossPL) ->
    case check_partner(Loss, LossPL) of
      true ->
	  NewRole = cystal_resonate:fire(Role),
	  {ok, NewRole, LossPL};
      {false, Reason} -> {false, Reason}
    end;
loss_partner([Id | T],
	     Role = #role{partner_bag =
			      PartnerBag = #partner_bag{partner_list =
							    Partners}},
	     Loss, LossPL) ->
    case lists:keyfind(Id, #partner.id, Partners) of
      false -> {false, lang:get(<<"伙伴不存在"/utf8>>)};
      #partner{end_time = EndTime} when EndTime =/= 0 ->
	  {false, lang:get(<<"赋能英雄不能用作材料"/utf8>>)};
      P = #partner{} ->
	  case partner:check_formation_id(Role, [Id]) of
	    {false, Msg} -> {false, Msg};
	    _ ->
		case partner:is_lock(Role, [Id], [1, 2]) of
		  {false, Msg} -> {false, Msg};
		  _ ->
		      NewPartners = lists:keydelete(Id, #partner.id,
						    Partners),
		      loss_partner(T,
				   Role#role{partner_bag =
						 PartnerBag#partner_bag{partner_list
									    =
									    NewPartners}},
				   Loss, [P | LossPL])
		end
	  end
    end.

check_partner([], []) -> true;
check_partner([], _) ->
    {false, lang:get(<<"伙伴数量对不上"/utf8>>)};
check_partner([{Need, NeedStar, Num} | T], PL) ->
    L1 = [P
	  || P = #partner{bid = Bid, star = Star,
			  camp_type = CampType}
		 <- PL,
	     Star =:= NeedStar,
	     Need =:= 0 orelse
	       Need =:= CampType orelse Need =:= Bid],
    case length(L1) =:= Num of
      true -> check_partner(T, PL -- L1);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidhalidom317, _,
	     {__Levelhalidom317, __Traceshalidom317}}
		when __Levelhalidom317 band 128 /= 0 orelse
		       __Traceshalidom317 /= [] ->
		lager:do_log(debug,
			     [{module, halidom}, {function, check_partner},
			      {line, 317}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("num_err=~w ==~w",
					   [{Need, NeedStar, Num},
					    [{Bid, Star, CampType}
					     || #partner{bid = Bid, star = Star,
							 camp_type = CampType}
						    <- PL]]),
			     none, 4096, 128, __Levelhalidom317,
			     __Traceshalidom317, lager_event, __Pidhalidom317);
	    _ -> ok
	  end,
	  {false, lang:get(<<"消耗数量有误"/utf8>>)}
    end.


