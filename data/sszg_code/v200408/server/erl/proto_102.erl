-file("src/proto/proto_102.erl", 1).

-module(proto_102).

-lager_records([{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
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
		{unit_make_args, [pos, evts, disabled]},
		{map_unit,
		 [id, type, activity, status, guide_lev, name, layer,
		  base_id, lev, career, sex, hp, hp_max, speed, x, y, gx,
		  gy, looks]},
		{unit,
		 [id, type, minor_type, pid, activity, combat_pid, name,
		  status, guide_lev, nature, quality, layer, disabled,
		  base_id, lev, career, sex, hp, hp_max, speed, lock,
		  def_status, pos, looks, evt, ts, timeout, t_move, t_atk,
		  extra]},
		{unit_data,
		 [bid, type, minor_type, name, activity, cli_create,
		  guide_lev, status, nature, disabled, condition, lev,
		  career, sex, hp, mp, hp_max, mp_max, speed, lock,
		  t_move, t_atk, range_trace, range_atk, gain, slave,
		  waves, talk, looks, order, data, layer, def_status,
		  status_list, drop_id, act_drops, tran_pos,
		  reward_panel_type, reward, formation, camp_type]},
		{unit_order, [order, type, arg, data, condition, over]},
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

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

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

-file("src/proto/proto_102.erl", 16).

-file("inc/unit.hrl", 1).

-record(unit_order,
	{order  :: move | guard | attack | atom(),
	 type = 0  :: 0..2,
	 arg  :: undefined | tuple() | [tuple()],
	 data  :: undefined | term(), condition = []  :: list(),
	 over  :: undefined | defense | stop | atom()}).

-record(unit_data,
	{bid = auto  :: auto | pos_integer(),
	 type = 200  :: non_neg_integer(),
	 minor_type = 1  :: non_neg_integer(),
	 name = ""  :: bitstring(), activity = 0  :: 0..1,
	 cli_create = 0  :: 0..1,
	 guide_lev = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 nature = 0  :: non_neg_integer(),
	 disabled = <<>>  :: bitstring(),
	 condition = []  :: [tuple()],
	 lev = 0  :: non_neg_integer(),
	 career = 0  :: non_neg_integer(),
	 sex = 2  :: non_neg_integer(),
	 hp = 0  :: non_neg_integer(),
	 mp = 0  :: non_neg_integer(),
	 hp_max = 0  :: non_neg_integer(),
	 mp_max = 0  :: non_neg_integer(),
	 speed = 180  :: pos_integer(), lock = 0  :: 0 | 1,
	 t_move = 3  :: pos_integer(),
	 t_atk = 3  :: pos_integer(),
	 range_trace = 200  :: pos_integer(),
	 range_atk = 100  :: pos_integer(), gain = []  :: list(),
	 slave = []  :: list(), waves = []  :: list(),
	 talk = []  :: list(), looks = []  :: list(),
	 order = []  :: list(), data = []  :: list(),
	 layer = 0  :: non_neg_integer(),
	 def_status = defense  :: defense | patrol | loaf,
	 status_list = []  :: list(),
	 drop_id = 0  :: non_neg_integer(),
	 act_drops = []  :: list(), tran_pos = [],
	 reward_panel_type = 1, reward = [], formation = {1, 1},
	 camp_type = 0}).

-record(unit,
	{id = {1, 1}  :: {pos_integer(), pos_integer()},
	 type = 200  :: non_neg_integer(),
	 minor_type = 1  :: non_neg_integer(),
	 pid = 0  :: non_neg_integer() | pid(),
	 activity = 0  :: 0..1,
	 combat_pid = 0  :: non_neg_integer() | pid(),
	 name = ""  :: bitstring(),
	 status = 0  :: non_neg_integer(),
	 guide_lev = 0  :: non_neg_integer(),
	 nature = 0  :: non_neg_integer(), quality = 0  :: 0..4,
	 layer = 0  :: non_neg_integer(),
	 disabled = <<>>  :: bitstring(),
	 base_id = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 career = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 hp = 0  :: non_neg_integer(),
	 hp_max = 0  :: non_neg_integer(),
	 speed = 1  :: pos_integer(), lock = 0  :: 0 | 1,
	 def_status = defense  :: defense,
	 pos  :: undefined | tuple(), looks = []  :: [tuple()],
	 evt = []  :: [atom()],
	 ts = {1, 1, 1}  ::
	     {pos_integer(), pos_integer(), pos_integer()},
	 timeout = 864000  :: non_neg_integer(),
	 t_move = 1  :: pos_integer(),
	 t_atk = 1  :: pos_integer(), extra = []  :: [tuple()]}).

-record(map_unit,
	{id = {1, 1}  :: {pos_integer(), pos_integer()},
	 type = 200  :: pos_integer(), activity = 0  :: 0..1,
	 status = 0  :: non_neg_integer(),
	 guide_lev = 0  :: non_neg_integer(),
	 name = ""  :: bitstring(),
	 layer = 0  :: non_neg_integer(),
	 base_id = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 career = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 hp = 0  :: non_neg_integer(),
	 hp_max = 0  :: non_neg_integer(),
	 speed = 1  :: pos_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer(),
	 gx = 0  :: non_neg_integer(),
	 gy = 0  :: non_neg_integer(),
	 looks = []  :: [tuple()]}).

-record(unit_make_args,
	{pos = {0, 0, 0}, evts = [], disabled = 0  :: 0 | 1}).

-file("src/proto/proto_102.erl", 17).

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

-file("src/proto/proto_102.erl", 18).

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

-file("src/proto/proto_102.erl", 19).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(10200, cli, {V0_battle_id, V0_id, V0_code}) ->
    D_a_t_a = <<V0_battle_id:32, V0_id:32, V0_code:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10200:16,
       D_a_t_a/binary>>};
pack(10200, srv,
     {V0_result, V0_msg, V0_battle_id, V0_id, V0_time}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_battle_id:32,
		V0_id:32, V0_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10200:16,
       D_a_t_a/binary>>};
pack(10210, srv,
     {V0_bid, V0_res_id, V0_x, V0_y, V0_dir}) ->
    D_a_t_a = <<V0_bid:32, V0_res_id:32, V0_x:16, V0_y:16,
		V0_dir:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10210:16,
       D_a_t_a/binary>>};
pack(10211, srv, {V0_bid, V0_dynamic_block}) ->
    D_a_t_a = <<V0_bid:32, (length(V0_dynamic_block)):16,
		(list_to_binary([<<V1_id:8, V1_val:8>>
				 || {V1_id, V1_val}
					<- V0_dynamic_block]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10211:16,
       D_a_t_a/binary>>};
pack(10213, srv,
     #map_role{rid = V0_rid, srv_id = V0_srv_id,
	       name = V0_name, speed = V0_speed, dir = V0_dir,
	       x = V0_x, y = V0_y, face = V0_face, lev = V0_lev,
	       sex = V0_sex, avatar = V0_avatar, status = V0_status,
	       event = V0_event, looks = V0_looks}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_name))/binary, V0_speed:16,
		V0_dir:8, V0_x:16, V0_y:16, V0_face:32, V0_lev:8,
		V0_sex:8, V0_avatar:32, V0_status:8, V0_event:8,
		(length(V0_looks)):16,
		(list_to_binary([<<V1_looks_type:32, V1_looks_mode:32,
				   V1_looks_val:32,
				   (protocol:pack(string,
						  V1_looks_str))/binary>>
				 || {V1_looks_type, V1_looks_mode, V1_looks_val,
				     V1_looks_str}
					<- V0_looks]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10213:16,
       D_a_t_a/binary>>};
pack(10214, srv, {V0_bid, V0_role_ids}) ->
    D_a_t_a = <<V0_bid:32, (length(V0_role_ids)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary>>
				 || {V1_rid, V1_srv_id}
					<- V0_role_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10214:16,
       D_a_t_a/binary>>};
pack(10215, cli, {V0_base_id, V0_x, V0_y, V0_dir}) ->
    D_a_t_a = <<V0_base_id:32, V0_x:16, V0_y:16, V0_dir:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10215:16,
       D_a_t_a/binary>>};
pack(10215, srv,
     {V0_rid, V0_srv_id, V0_dir, V0_dx, V0_dy}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_dir:8,
		V0_dx:16, V0_dy:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10215:16,
       D_a_t_a/binary>>};
pack(10216, srv, {V0_role_list}) ->
    D_a_t_a = <<(length(V0_role_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_speed:16, V1_dir:8, V1_x:16, V1_y:16,
				   V1_face:32, V1_lev:8, V1_sex:8, V1_avatar:32,
				   V1_status:8, V1_event:8,
				   (length(V1_looks)):16,
				   (list_to_binary([<<V2_looks_type:32,
						      V2_looks_mode:32,
						      V2_looks_val:32,
						      (protocol:pack(string,
								     V2_looks_str))/binary>>
						    || {V2_looks_type,
							V2_looks_mode,
							V2_looks_val,
							V2_looks_str}
							   <- V1_looks]))/binary>>
				 || #map_role{rid = V1_rid, srv_id = V1_srv_id,
					      name = V1_name, speed = V1_speed,
					      dir = V1_dir, x = V1_x, y = V1_y,
					      face = V1_face, lev = V1_lev,
					      sex = V1_sex, avatar = V1_avatar,
					      status = V1_status,
					      event = V1_event,
					      looks = V1_looks}
					<- V0_role_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10216:16,
       D_a_t_a/binary>>};
pack(10217, srv,
     #map_role{rid = V0_rid, srv_id = V0_srv_id,
	       name = V0_name, speed = V0_speed, dir = V0_dir,
	       x = V0_x, y = V0_y, face = V0_face, lev = V0_lev,
	       sex = V0_sex, avatar = V0_avatar, status = V0_status,
	       event = V0_event, looks = V0_looks}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_name))/binary, V0_speed:16,
		V0_dir:8, V0_x:16, V0_y:16, V0_face:32, V0_lev:8,
		V0_sex:8, V0_avatar:32, V0_status:8, V0_event:8,
		(length(V0_looks)):16,
		(list_to_binary([<<V1_looks_type:32, V1_looks_mode:32,
				   V1_looks_val:32,
				   (protocol:pack(string,
						  V1_looks_str))/binary>>
				 || {V1_looks_type, V1_looks_mode, V1_looks_val,
				     V1_looks_str}
					<- V0_looks]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10217:16,
       D_a_t_a/binary>>};
pack(10219, srv,
     {{V0_rid, V0_srv_id}, V0_type, V0_looks}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_type:8,
		(length(V0_looks)):16,
		(list_to_binary([<<V1_looks_type:32, V1_looks_mode:32,
				   V1_looks_val:32,
				   (protocol:pack(string,
						  V1_looks_str))/binary>>
				 || {V1_looks_type, V1_looks_mode, V1_looks_val,
				     V1_looks_str}
					<- V0_looks]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10219:16,
       D_a_t_a/binary>>};
pack(10220, srv, {V0_unit_list}) ->
    D_a_t_a = <<(length(V0_unit_list)):16,
		(list_to_binary([<<V1_battle_id:32, V1_id:32,
				   V1_base_id:32,
				   (protocol:pack(string, V1_name))/binary,
				   V1_status:8, V1_speed:16, V1_x:16, V1_y:16,
				   V1_lev:8, (length(V1_looks)):16,
				   (list_to_binary([<<V2_looks_type:32,
						      V2_looks_mode:32,
						      V2_looks_val:32,
						      (protocol:pack(string,
								     V2_looks_str))/binary>>
						    || {V2_looks_type,
							V2_looks_mode,
							V2_looks_val,
							V2_looks_str}
							   <- V1_looks]))/binary>>
				 || #map_unit{id = {V1_battle_id, V1_id},
					      base_id = V1_base_id,
					      name = V1_name,
					      status = V1_status,
					      speed = V1_speed, x = V1_x,
					      y = V1_y, lev = V1_lev,
					      looks = V1_looks}
					<- V0_unit_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10220:16,
       D_a_t_a/binary>>};
pack(10222, srv, {V0_role_list}) ->
    D_a_t_a = <<(length(V0_role_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_speed:16, V1_dir:8, V1_x:16, V1_y:16,
				   V1_face:32, V1_lev:8, V1_sex:8, V1_avatar:32,
				   V1_status:8, V1_event:8,
				   (length(V1_looks)):16,
				   (list_to_binary([<<V2_looks_type:32,
						      V2_looks_mode:32,
						      V2_looks_val:32,
						      (protocol:pack(string,
								     V2_looks_str))/binary>>
						    || {V2_looks_type,
							V2_looks_mode,
							V2_looks_val,
							V2_looks_str}
							   <- V1_looks]))/binary>>
				 || #map_role{rid = V1_rid, srv_id = V1_srv_id,
					      name = V1_name, speed = V1_speed,
					      dir = V1_dir, x = V1_x, y = V1_y,
					      face = V1_face, lev = V1_lev,
					      sex = V1_sex, avatar = V1_avatar,
					      status = V1_status,
					      event = V1_event,
					      looks = V1_looks}
					<- V0_role_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10222:16,
       D_a_t_a/binary>>};
pack(10250, srv,
     {{V0_rid, V0_srv_id}, V0_act_type, V0_num}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		V0_act_type:32, V0_num:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10250:16,
       D_a_t_a/binary>>};
pack(10260, srv,
     #map_unit{id = {V0_battle_id, V0_id},
	       base_id = V0_base_id, name = V0_name,
	       status = V0_status, speed = V0_speed, x = V0_x,
	       y = V0_y, lev = V0_lev, looks = V0_looks}) ->
    D_a_t_a = <<V0_battle_id:32, V0_id:32, V0_base_id:32,
		(protocol:pack(string, V0_name))/binary, V0_status:8,
		V0_speed:16, V0_x:16, V0_y:16, V0_lev:8,
		(length(V0_looks)):16,
		(list_to_binary([<<V1_looks_type:32, V1_looks_mode:32,
				   V1_looks_val:32,
				   (protocol:pack(string,
						  V1_looks_str))/binary>>
				 || {V1_looks_type, V1_looks_mode, V1_looks_val,
				     V1_looks_str}
					<- V0_looks]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10260:16,
       D_a_t_a/binary>>};
pack(10262, srv, {V0_battle_id, V0_id}) ->
    D_a_t_a = <<V0_battle_id:32, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10262:16,
       D_a_t_a/binary>>};
pack(10264, srv, {V0_battle_id, V0_id, V0_dx, V0_dy}) ->
    D_a_t_a = <<V0_battle_id:32, V0_id:32, V0_dx:16,
		V0_dy:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10264:16,
       D_a_t_a/binary>>};
pack(10265, srv, {{V0_battle_id, V0_id}, V0_msg}) ->
    D_a_t_a = <<V0_battle_id:32, V0_id:32,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10265:16,
       D_a_t_a/binary>>};
pack(10266, srv,
     #map_unit{id = {V0_battle_id, V0_id},
	       base_id = V0_base_id, name = V0_name,
	       status = V0_status, speed = V0_speed, x = V0_x,
	       y = V0_y, lev = V0_lev, looks = V0_looks}) ->
    D_a_t_a = <<V0_battle_id:32, V0_id:32, V0_base_id:32,
		(protocol:pack(string, V0_name))/binary, V0_status:8,
		V0_speed:16, V0_x:16, V0_y:16, V0_lev:8,
		(length(V0_looks)):16,
		(list_to_binary([<<V1_looks_type:32, V1_looks_mode:32,
				   V1_looks_val:32,
				   (protocol:pack(string,
						  V1_looks_str))/binary>>
				 || {V1_looks_type, V1_looks_mode, V1_looks_val,
				     V1_looks_str}
					<- V0_looks]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10266:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(10200, srv, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_code, _B3} = protocol:uint16(_B2),
    {ok, {V1_battle_id, V1_id, V1_code}};
unpack(10200, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_battle_id, _B3} = protocol:uint32(_B2),
    {V1_id, _B4} = protocol:uint32(_B3),
    {V1_time, _B5} = protocol:uint32(_B4),
    {ok, {V1_result, V1_msg, V1_battle_id, V1_id, V1_time}};
unpack(10210, cli, _B0) ->
    {V1_bid, _B1} = protocol:uint32(_B0),
    {V1_res_id, _B2} = protocol:uint32(_B1),
    {V1_x, _B3} = protocol:uint16(_B2),
    {V1_y, _B4} = protocol:uint16(_B3),
    {V1_dir, _B5} = protocol:uint8(_B4),
    {ok, {V1_bid, V1_res_id, V1_x, V1_y, V1_dir}};
unpack(10211, cli, _B0) ->
    {V1_bid, _B1} = protocol:uint32(_B0),
    {V1_dynamic_block, _B6} = protocol:array(_B1,
					     fun (_B2) ->
						     {V2_id, _B3} =
							 protocol:uint8(_B2),
						     {V2_val, _B4} =
							 protocol:uint8(_B3),
						     {{V2_id, V2_val}, _B4}
					     end),
    {ok, {V1_bid, V1_dynamic_block}};
unpack(10213, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {V1_speed, _B4} = protocol:uint16(_B3),
    {V1_dir, _B5} = protocol:uint8(_B4),
    {V1_x, _B6} = protocol:uint16(_B5),
    {V1_y, _B7} = protocol:uint16(_B6),
    {V1_face, _B8} = protocol:uint32(_B7),
    {V1_lev, _B9} = protocol:uint8(_B8),
    {V1_sex, _B10} = protocol:uint8(_B9),
    {V1_avatar, _B11} = protocol:uint32(_B10),
    {V1_status, _B12} = protocol:uint8(_B11),
    {V1_event, _B13} = protocol:uint8(_B12),
    {V1_looks, _B20} = protocol:array(_B13,
				      fun (_B14) ->
					      {V2_looks_type, _B15} =
						  protocol:uint32(_B14),
					      {V2_looks_mode, _B16} =
						  protocol:uint32(_B15),
					      {V2_looks_val, _B17} =
						  protocol:uint32(_B16),
					      {V2_looks_str, _B18} =
						  protocol:string(_B17),
					      {{V2_looks_type, V2_looks_mode,
						V2_looks_val, V2_looks_str},
					       _B18}
				      end),
    {ok,
     {V1_rid, V1_srv_id, V1_name, V1_speed, V1_dir, V1_x,
      V1_y, V1_face, V1_lev, V1_sex, V1_avatar, V1_status,
      V1_event, V1_looks}};
unpack(10214, cli, _B0) ->
    {V1_bid, _B1} = protocol:uint32(_B0),
    {V1_role_ids, _B6} = protocol:array(_B1,
					fun (_B2) ->
						{V2_rid, _B3} =
						    protocol:uint32(_B2),
						{V2_srv_id, _B4} =
						    protocol:string(_B3),
						{{V2_rid, V2_srv_id}, _B4}
					end),
    {ok, {V1_bid, V1_role_ids}};
unpack(10215, srv, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_x, _B2} = protocol:uint16(_B1),
    {V1_y, _B3} = protocol:uint16(_B2),
    {V1_dir, _B4} = protocol:uint8(_B3),
    {ok, {V1_base_id, V1_x, V1_y, V1_dir}};
unpack(10215, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_dir, _B3} = protocol:uint8(_B2),
    {V1_dx, _B4} = protocol:uint16(_B3),
    {V1_dy, _B5} = protocol:uint16(_B4),
    {ok, {V1_rid, V1_srv_id, V1_dir, V1_dx, V1_dy}};
unpack(10216, cli, _B0) ->
    {V1_role_list, _B23} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_rid, _B2} =
						      protocol:uint32(_B1),
						  {V2_srv_id, _B3} =
						      protocol:string(_B2),
						  {V2_name, _B4} =
						      protocol:string(_B3),
						  {V2_speed, _B5} =
						      protocol:uint16(_B4),
						  {V2_dir, _B6} =
						      protocol:uint8(_B5),
						  {V2_x, _B7} =
						      protocol:uint16(_B6),
						  {V2_y, _B8} =
						      protocol:uint16(_B7),
						  {V2_face, _B9} =
						      protocol:uint32(_B8),
						  {V2_lev, _B10} =
						      protocol:uint8(_B9),
						  {V2_sex, _B11} =
						      protocol:uint8(_B10),
						  {V2_avatar, _B12} =
						      protocol:uint32(_B11),
						  {V2_status, _B13} =
						      protocol:uint8(_B12),
						  {V2_event, _B14} =
						      protocol:uint8(_B13),
						  {V2_looks, _B21} =
						      protocol:array(_B14,
								     fun
								       (_B15) ->
									   {V3_looks_type,
									    _B16} =
									       protocol:uint32(_B15),
									   {V3_looks_mode,
									    _B17} =
									       protocol:uint32(_B16),
									   {V3_looks_val,
									    _B18} =
									       protocol:uint32(_B17),
									   {V3_looks_str,
									    _B19} =
									       protocol:string(_B18),
									   {{V3_looks_type,
									     V3_looks_mode,
									     V3_looks_val,
									     V3_looks_str},
									    _B19}
								     end),
						  {{V2_rid, V2_srv_id, V2_name,
						    V2_speed, V2_dir, V2_x,
						    V2_y, V2_face, V2_lev,
						    V2_sex, V2_avatar,
						    V2_status, V2_event,
						    V2_looks},
						   _B21}
					  end),
    {ok, {V1_role_list}};
unpack(10217, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {V1_speed, _B4} = protocol:uint16(_B3),
    {V1_dir, _B5} = protocol:uint8(_B4),
    {V1_x, _B6} = protocol:uint16(_B5),
    {V1_y, _B7} = protocol:uint16(_B6),
    {V1_face, _B8} = protocol:uint32(_B7),
    {V1_lev, _B9} = protocol:uint8(_B8),
    {V1_sex, _B10} = protocol:uint8(_B9),
    {V1_avatar, _B11} = protocol:uint32(_B10),
    {V1_status, _B12} = protocol:uint8(_B11),
    {V1_event, _B13} = protocol:uint8(_B12),
    {V1_looks, _B20} = protocol:array(_B13,
				      fun (_B14) ->
					      {V2_looks_type, _B15} =
						  protocol:uint32(_B14),
					      {V2_looks_mode, _B16} =
						  protocol:uint32(_B15),
					      {V2_looks_val, _B17} =
						  protocol:uint32(_B16),
					      {V2_looks_str, _B18} =
						  protocol:string(_B17),
					      {{V2_looks_type, V2_looks_mode,
						V2_looks_val, V2_looks_str},
					       _B18}
				      end),
    {ok,
     {V1_rid, V1_srv_id, V1_name, V1_speed, V1_dir, V1_x,
      V1_y, V1_face, V1_lev, V1_sex, V1_avatar, V1_status,
      V1_event, V1_looks}};
unpack(10219, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {V1_looks, _B10} = protocol:array(_B3,
				      fun (_B4) ->
					      {V2_looks_type, _B5} =
						  protocol:uint32(_B4),
					      {V2_looks_mode, _B6} =
						  protocol:uint32(_B5),
					      {V2_looks_val, _B7} =
						  protocol:uint32(_B6),
					      {V2_looks_str, _B8} =
						  protocol:string(_B7),
					      {{V2_looks_type, V2_looks_mode,
						V2_looks_val, V2_looks_str},
					       _B8}
				      end),
    {ok, {V1_rid, V1_srv_id, V1_type, V1_looks}};
unpack(10220, cli, _B0) ->
    {V1_unit_list, _B19} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_battle_id, _B2} =
						      protocol:uint32(_B1),
						  {V2_id, _B3} =
						      protocol:uint32(_B2),
						  {V2_base_id, _B4} =
						      protocol:uint32(_B3),
						  {V2_name, _B5} =
						      protocol:string(_B4),
						  {V2_status, _B6} =
						      protocol:uint8(_B5),
						  {V2_speed, _B7} =
						      protocol:uint16(_B6),
						  {V2_x, _B8} =
						      protocol:uint16(_B7),
						  {V2_y, _B9} =
						      protocol:uint16(_B8),
						  {V2_lev, _B10} =
						      protocol:uint8(_B9),
						  {V2_looks, _B17} =
						      protocol:array(_B10,
								     fun
								       (_B11) ->
									   {V3_looks_type,
									    _B12} =
									       protocol:uint32(_B11),
									   {V3_looks_mode,
									    _B13} =
									       protocol:uint32(_B12),
									   {V3_looks_val,
									    _B14} =
									       protocol:uint32(_B13),
									   {V3_looks_str,
									    _B15} =
									       protocol:string(_B14),
									   {{V3_looks_type,
									     V3_looks_mode,
									     V3_looks_val,
									     V3_looks_str},
									    _B15}
								     end),
						  {{V2_battle_id, V2_id,
						    V2_base_id, V2_name,
						    V2_status, V2_speed, V2_x,
						    V2_y, V2_lev, V2_looks},
						   _B17}
					  end),
    {ok, {V1_unit_list}};
unpack(10222, cli, _B0) ->
    {V1_role_list, _B23} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_rid, _B2} =
						      protocol:uint32(_B1),
						  {V2_srv_id, _B3} =
						      protocol:string(_B2),
						  {V2_name, _B4} =
						      protocol:string(_B3),
						  {V2_speed, _B5} =
						      protocol:uint16(_B4),
						  {V2_dir, _B6} =
						      protocol:uint8(_B5),
						  {V2_x, _B7} =
						      protocol:uint16(_B6),
						  {V2_y, _B8} =
						      protocol:uint16(_B7),
						  {V2_face, _B9} =
						      protocol:uint32(_B8),
						  {V2_lev, _B10} =
						      protocol:uint8(_B9),
						  {V2_sex, _B11} =
						      protocol:uint8(_B10),
						  {V2_avatar, _B12} =
						      protocol:uint32(_B11),
						  {V2_status, _B13} =
						      protocol:uint8(_B12),
						  {V2_event, _B14} =
						      protocol:uint8(_B13),
						  {V2_looks, _B21} =
						      protocol:array(_B14,
								     fun
								       (_B15) ->
									   {V3_looks_type,
									    _B16} =
									       protocol:uint32(_B15),
									   {V3_looks_mode,
									    _B17} =
									       protocol:uint32(_B16),
									   {V3_looks_val,
									    _B18} =
									       protocol:uint32(_B17),
									   {V3_looks_str,
									    _B19} =
									       protocol:string(_B18),
									   {{V3_looks_type,
									     V3_looks_mode,
									     V3_looks_val,
									     V3_looks_str},
									    _B19}
								     end),
						  {{V2_rid, V2_srv_id, V2_name,
						    V2_speed, V2_dir, V2_x,
						    V2_y, V2_face, V2_lev,
						    V2_sex, V2_avatar,
						    V2_status, V2_event,
						    V2_looks},
						   _B21}
					  end),
    {ok, {V1_role_list}};
unpack(10250, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_act_type, _B3} = protocol:uint32(_B2),
    {V1_num, _B4} = protocol:uint8(_B3),
    {ok, {V1_rid, V1_srv_id, V1_act_type, V1_num}};
unpack(10260, cli, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_base_id, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_status, _B5} = protocol:uint8(_B4),
    {V1_speed, _B6} = protocol:uint16(_B5),
    {V1_x, _B7} = protocol:uint16(_B6),
    {V1_y, _B8} = protocol:uint16(_B7),
    {V1_lev, _B9} = protocol:uint8(_B8),
    {V1_looks, _B16} = protocol:array(_B9,
				      fun (_B10) ->
					      {V2_looks_type, _B11} =
						  protocol:uint32(_B10),
					      {V2_looks_mode, _B12} =
						  protocol:uint32(_B11),
					      {V2_looks_val, _B13} =
						  protocol:uint32(_B12),
					      {V2_looks_str, _B14} =
						  protocol:string(_B13),
					      {{V2_looks_type, V2_looks_mode,
						V2_looks_val, V2_looks_str},
					       _B14}
				      end),
    {ok,
     {V1_battle_id, V1_id, V1_base_id, V1_name, V1_status,
      V1_speed, V1_x, V1_y, V1_lev, V1_looks}};
unpack(10262, cli, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_battle_id, V1_id}};
unpack(10264, cli, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_dx, _B3} = protocol:uint16(_B2),
    {V1_dy, _B4} = protocol:uint16(_B3),
    {ok, {V1_battle_id, V1_id, V1_dx, V1_dy}};
unpack(10265, cli, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_battle_id, V1_id, V1_msg}};
unpack(10266, cli, _B0) ->
    {V1_battle_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_base_id, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_status, _B5} = protocol:uint8(_B4),
    {V1_speed, _B6} = protocol:uint16(_B5),
    {V1_x, _B7} = protocol:uint16(_B6),
    {V1_y, _B8} = protocol:uint16(_B7),
    {V1_lev, _B9} = protocol:uint8(_B8),
    {V1_looks, _B16} = protocol:array(_B9,
				      fun (_B10) ->
					      {V2_looks_type, _B11} =
						  protocol:uint32(_B10),
					      {V2_looks_mode, _B12} =
						  protocol:uint32(_B11),
					      {V2_looks_val, _B13} =
						  protocol:uint32(_B12),
					      {V2_looks_str, _B14} =
						  protocol:string(_B13),
					      {{V2_looks_type, V2_looks_mode,
						V2_looks_val, V2_looks_str},
					       _B14}
				      end),
    {ok,
     {V1_battle_id, V1_id, V1_base_id, V1_name, V1_status,
      V1_speed, V1_x, V1_y, V1_lev, V1_looks}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


