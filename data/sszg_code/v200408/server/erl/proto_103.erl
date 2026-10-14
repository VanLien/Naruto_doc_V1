-file("src/proto/proto_103.erl", 1).

-module(proto_103).

-lager_records([{role_auth_adult,
		 [platform, name, can_charge, is_nonage, charge_limit,
		  is_wallow, down_sec, is_show_phone, show_info, is_mail,
		  is_mid_exp, is_lev_60]},
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
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
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

-file("src/proto/proto_103.erl", 16).

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

-file("src/proto/proto_103.erl", 17).

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

-file("src/proto/proto_103.erl", 18).

-file("inc/role_auth.hrl", 1).

-record(role_auth_adult,
	{platform = <<>>, name = <<>>, can_charge = 1,
	 is_nonage = 0, charge_limit = 5000, is_wallow = 0,
	 down_sec = 10800, is_show_phone = 0, show_info = <<>>,
	 is_mail = 0, is_mid_exp = 0, is_lev_60 = 0}).

-file("src/proto/proto_103.erl", 19).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(10300, cli, {}) -> {ok, <<2:32, 10300:16>>};
pack(10300, srv, {}) -> {ok, <<2:32, 10300:16>>};
pack(10301, srv,
     {V0_rid, V0_srv_id, V0_name, V0_lev, V0_is_vip,
      V0_vip_lev, V0_vip_exp, V0_is_show_vip, V0_sex,
      V0_career, V0_face_id, V0_event, V0_gid, V0_gsrv_id,
      V0_position, V0_gname, V0_signature, V0_exp_max,
      V0_exp_total_nextlev, V0_buffs, V0_reg_time,
      V0_guild_lev, V0_power, V0_is_first_rename,
      V0_avatar_base_id, V0_guild_quit_time, V0_look_id,
      V0_max_power, V0_auto_pk, V0_fans_num,
      V0_arena_elite_lev, V0_city_id, V0_room_bbs_set,
      V0_backdrop_id, V0_is_open_home, V0_sprite_lev,
      V0_sprites, V0_face_file, V0_face_update_time}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_name))/binary, V0_lev:16,
		V0_is_vip:8, V0_vip_lev:8, V0_vip_exp:32,
		V0_is_show_vip:8, V0_sex:8, V0_career:16, V0_face_id:32,
		V0_event:8, V0_gid:32,
		(protocol:pack(string, V0_gsrv_id))/binary,
		V0_position:8, (protocol:pack(string, V0_gname))/binary,
		(protocol:pack(string, V0_signature))/binary,
		V0_exp_max:32, V0_exp_total_nextlev:32,
		(length(V0_buffs)):16,
		(list_to_binary([<<V1_bid:32, V1_duration:32,
				   V1_count:8, (length(V1_effect)):16,
				   (list_to_binary([<<V2_key:8, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_effect]))/binary>>
				 || {V1_bid, V1_duration, V1_count, V1_effect}
					<- V0_buffs]))/binary,
		V0_reg_time:32, V0_guild_lev:8, V0_power:32,
		V0_is_first_rename:8, V0_avatar_base_id:32,
		V0_guild_quit_time:32, V0_look_id:32, V0_max_power:32,
		V0_auto_pk:8, V0_fans_num:32, V0_arena_elite_lev:32,
		V0_city_id:32, V0_room_bbs_set:8, V0_backdrop_id:32,
		V0_is_open_home:8, V0_sprite_lev:16,
		(length(V0_sprites)):16,
		(list_to_binary([<<V1_pos:8, V1_item_bid:32>>
				 || {V1_pos, V1_item_bid}
					<- V0_sprites]))/binary,
		(protocol:pack(string, V0_face_file))/binary,
		V0_face_update_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10301:16,
       D_a_t_a/binary>>};
pack(10302, srv,
     {V0_lev,
      #assets{exp = V0_exp, gold = V0_gold,
	      gold_acc = V0_gold_acc, coin = V0_coin,
	      red_gold = V0_red_gold, energy = V0_energy,
	      energy_max = V0_energy_max, arena_cent = V0_arena_cent,
	      activity = V0_activity, guild = V0_guild,
	      hero_soul = V0_hero_soul,
	      friend_point = V0_friend_point,
	      boss_point = V0_boss_point,
	      silver_coin = V0_silver_coin, star_hun = V0_star_hun,
	      star_point = V0_star_point,
	      arena_guesscent = V0_arena_guesscent,
	      sky_coin = V0_sky_coin, hero_exp = V0_hero_exp,
	      recruit_hero = V0_recruit_hero,
	      recruithigh_hero = V0_recruithigh_hero,
	      expedition_medal = V0_expedition_medal,
	      elite_coin = V0_elite_coin,
	      holy_eqm_coin = V0_holy_eqm_coin,
	      skin_debris = V0_skin_debris,
	      cluster_coin = V0_cluster_coin,
	      home_coin = V0_home_coin,
	      hallow_refine = V0_hallow_refine,
	      cluster_guess_cent = V0_cluster_guess_cent,
	      feather_exchange = V0_feather_exchange,
	      brave_symbol = V0_brave_symbol,
	      peak_guess_cent = V0_peak_guess_cent,
	      acc_recruit_hero = V0_acc_recruit_hero,
	      predict_point = V0_predict_point}}) ->
    D_a_t_a = <<V0_lev:16, V0_exp:32, V0_gold:32,
		V0_gold_acc:32, V0_coin:32, V0_red_gold:32,
		V0_energy:32, V0_energy_max:32, V0_arena_cent:32,
		V0_activity:16, V0_guild:32, V0_hero_soul:32,
		V0_friend_point:32, V0_boss_point:32, V0_silver_coin:32,
		V0_star_hun:32, V0_star_point:32, V0_arena_guesscent:32,
		V0_sky_coin:32, V0_hero_exp:32, V0_recruit_hero:32,
		V0_recruithigh_hero:32, V0_expedition_medal:32,
		V0_elite_coin:32, V0_holy_eqm_coin:32,
		V0_skin_debris:32, V0_cluster_coin:32, V0_home_coin:32,
		V0_hallow_refine:32, V0_cluster_guess_cent:32,
		V0_feather_exchange:32, V0_brave_symbol:32,
		V0_peak_guess_cent:32, V0_acc_recruit_hero:32,
		V0_predict_point:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10302:16,
       D_a_t_a/binary>>};
pack(10304, srv, {V0_play_video}) ->
    D_a_t_a = <<V0_play_video:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10304:16,
       D_a_t_a/binary>>};
pack(10305, srv, {V0_assets}) ->
    D_a_t_a = <<(length(V0_assets)):16,
		(list_to_binary([<<V1_label:8, V1_val:32>>
				 || {V1_label, V1_val} <- V0_assets]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10305:16,
       D_a_t_a/binary>>};
pack(10306, srv, {V0_power, V0_max_power}) ->
    D_a_t_a = <<V0_power:32, V0_max_power:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10306:16,
       D_a_t_a/binary>>};
pack(10307, srv, {V0_event}) ->
    D_a_t_a = <<V0_event:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10307:16,
       D_a_t_a/binary>>};
pack(10309, cli, {V0_signature}) ->
    D_a_t_a = <<(protocol:pack(string,
			       V0_signature))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10309:16,
       D_a_t_a/binary>>};
pack(10309, srv, {V0_code, V0_msg, V0_signature}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		(protocol:pack(string, V0_signature))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10309:16,
       D_a_t_a/binary>>};
pack(10310, srv, {V0_is_show, V0_msg}) ->
    D_a_t_a = <<V0_is_show:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10310:16,
       D_a_t_a/binary>>};
pack(10312, cli, {}) -> {ok, <<2:32, 10312:16>>};
pack(10312, srv, {}) -> {ok, <<2:32, 10312:16>>};
pack(10315, cli, {V0_rid, V0_srv_id}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10315:16,
       D_a_t_a/binary>>};
pack(10315, srv,
     {V0_rid, V0_srv_id, V0_name, V0_gname, V0_lev,
      V0_face_id, V0_power, V0_elite_lev, V0_partner_list,
      V0_room_partner_list, V0_gid, V0_gsrv_id, V0_avatar_bid,
      V0_sex, V0_city, V0_vip_lev, V0_is_show_vip,
      V0_honor_list, V0_is_friend, V0_is_fanse,
      V0_is_be_fanse, V0_fans_num, V0_fans_rank, V0_city_id,
      V0_honor, V0_use_badges, V0_room_bbs_set,
      V0_backdrop_id, V0_is_open_home, V0_sprite_lev,
      V0_sprites, V0_face_file, V0_face_update_time}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_name))/binary,
		(protocol:pack(string, V0_gname))/binary, V0_lev:16,
		V0_face_id:32, V0_power:32, V0_elite_lev:32,
		(length(V0_partner_list)):16,
		(list_to_binary([<<V1_id:32, V1_bid:32, V1_lev:16,
				   V1_star:8, V1_quality:8, V1_awaken_lev:32,
				   V1_use_skin:32, V1_end_time:8,
				   V1_resonate_lev:32>>
				 || {V1_id, V1_bid, V1_lev, V1_star, V1_quality,
				     V1_awaken_lev, V1_use_skin, V1_end_time,
				     V1_resonate_lev}
					<- V0_partner_list]))/binary,
		(length(V0_room_partner_list)):16,
		(list_to_binary([<<V1_id:32, V1_bid:32, V1_lev:16,
				   V1_star:8, V1_quality:8, V1_awaken_lev:32,
				   V1_use_skin:32, V1_pos:8, V1_end_time:8,
				   V1_resonate_lev:32>>
				 || {V1_id, V1_bid, V1_lev, V1_star, V1_quality,
				     V1_awaken_lev, V1_use_skin, V1_pos,
				     V1_end_time, V1_resonate_lev}
					<- V0_room_partner_list]))/binary,
		V0_gid:32, (protocol:pack(string, V0_gsrv_id))/binary,
		V0_avatar_bid:32, V0_sex:8, V0_city:32, V0_vip_lev:32,
		V0_is_show_vip:8, (length(V0_honor_list)):16,
		(list_to_binary([<<V1_type:32, V1_val:32, V1_rank:8>>
				 || {V1_type, V1_val, V1_rank}
					<- V0_honor_list]))/binary,
		V0_is_friend:8, V0_is_fanse:8, V0_is_be_fanse:8,
		V0_fans_num:32, V0_fans_rank:32, V0_city_id:32,
		V0_honor:32, (length(V0_use_badges)):16,
		(list_to_binary([<<V1_pos:8, V1_id:32, V1_time:32>>
				 || {V1_pos, V1_id, V1_time}
					<- V0_use_badges]))/binary,
		V0_room_bbs_set:8, V0_backdrop_id:32, V0_is_open_home:8,
		V0_sprite_lev:16, (length(V0_sprites)):16,
		(list_to_binary([<<V1_pos:8, V1_item_bid:32>>
				 || {V1_pos, V1_item_bid}
					<- V0_sprites]))/binary,
		(protocol:pack(string, V0_face_file))/binary,
		V0_face_update_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10315:16,
       D_a_t_a/binary>>};
pack(10316, cli,
     {V0_type, V0_rid, V0_srv_id, V0_idx}) ->
    D_a_t_a = <<V0_type:8, V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_idx:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10316:16,
       D_a_t_a/binary>>};
pack(10316, srv,
     {V0_code, V0_msg, V0_type, V0_rid, V0_srv_id,
      V0_idx}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_type:8,
		V0_rid:32, (protocol:pack(string, V0_srv_id))/binary,
		V0_idx:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10316:16,
       D_a_t_a/binary>>};
pack(10317, cli, {}) -> {ok, <<2:32, 10317:16>>};
pack(10317, srv, {V0_worship}) ->
    D_a_t_a = <<V0_worship:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10317:16,
       D_a_t_a/binary>>};
pack(10318, cli, {V0_auto_pk}) ->
    D_a_t_a = <<V0_auto_pk:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10318:16,
       D_a_t_a/binary>>};
pack(10318, srv, {V0_code, V0_msg, V0_auto_pk}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_auto_pk:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10318:16,
       D_a_t_a/binary>>};
pack(10319, cli, {}) -> {ok, <<2:32, 10319:16>>};
pack(10319, srv, {V0_worship}) ->
    D_a_t_a = <<V0_worship:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10319:16,
       D_a_t_a/binary>>};
pack(10320, cli, {}) -> {ok, <<2:32, 10320:16>>};
pack(10320, srv, {V0_worship}) ->
    D_a_t_a = <<V0_worship:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10320:16,
       D_a_t_a/binary>>};
pack(10322, cli, {V0_code}) ->
    D_a_t_a = <<V0_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10322:16,
       D_a_t_a/binary>>};
pack(10322, srv, {V0_code1}) ->
    D_a_t_a = <<V0_code1:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10322:16,
       D_a_t_a/binary>>};
pack(10323, srv, {V0_code}) ->
    D_a_t_a = <<V0_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10323:16,
       D_a_t_a/binary>>};
pack(10325, cli, {}) -> {ok, <<2:32, 10325:16>>};
pack(10325, srv, {V0_face_list}) ->
    D_a_t_a = <<(length(V0_face_list)):16,
		(list_to_binary([<<V1_face_id:32>>
				 || V1_face_id <- V0_face_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10325:16,
       D_a_t_a/binary>>};
pack(10327, cli, {V0_face_id}) ->
    D_a_t_a = <<V0_face_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10327:16,
       D_a_t_a/binary>>};
pack(10327, srv, {V0_code, V0_msg, V0_face_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_face_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10327:16,
       D_a_t_a/binary>>};
pack(10328, cli, {}) -> {ok, <<2:32, 10328:16>>};
pack(10328, srv, {V0_backdrop_list}) ->
    D_a_t_a = <<(length(V0_backdrop_list)):16,
		(list_to_binary([<<V1_backdrop_id:32>>
				 || V1_backdrop_id
					<- V0_backdrop_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10328:16,
       D_a_t_a/binary>>};
pack(10329, cli, {V0_backdrop_id}) ->
    D_a_t_a = <<V0_backdrop_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10329:16,
       D_a_t_a/binary>>};
pack(10329, srv, {V0_code, V0_msg, V0_backdrop_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_backdrop_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10329:16,
       D_a_t_a/binary>>};
pack(10330, cli, {}) -> {ok, <<2:32, 10330:16>>};
pack(10330, srv,
     {V0_secret_id, V0_secret_key, V0_face_file}) ->
    D_a_t_a = <<(protocol:pack(string,
			       V0_secret_id))/binary,
		(protocol:pack(string, V0_secret_key))/binary,
		(protocol:pack(string, V0_face_file))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10330:16,
       D_a_t_a/binary>>};
pack(10332, cli, {}) -> {ok, <<2:32, 10332:16>>};
pack(10332, srv,
     {V0_code, V0_msg, V0_face_file, V0_face_update_time}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		(protocol:pack(string, V0_face_file))/binary,
		V0_face_update_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10332:16,
       D_a_t_a/binary>>};
pack(10333, cli, {}) -> {ok, <<2:32, 10333:16>>};
pack(10333, srv,
     {V0_code, V0_msg, V0_face_file, V0_face_update_time}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		(protocol:pack(string, V0_face_file))/binary,
		V0_face_update_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10333:16,
       D_a_t_a/binary>>};
pack(10342, srv, {}) -> {ok, <<2:32, 10342:16>>};
pack(10343, cli, {V0_name, V0_sex}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary,
		V0_sex:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10343:16,
       D_a_t_a/binary>>};
pack(10343, srv,
     {V0_code, V0_msg, V0_name, V0_sex,
      V0_is_first_rename}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		(protocol:pack(string, V0_name))/binary, V0_sex:8,
		V0_is_first_rename:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10343:16,
       D_a_t_a/binary>>};
pack(10344, srv, {V0_old_lev, V0_lev}) ->
    D_a_t_a = <<V0_old_lev:16, V0_lev:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10344:16,
       D_a_t_a/binary>>};
pack(10345, cli, {}) -> {ok, <<2:32, 10345:16>>};
pack(10345, srv, {V0_use_id, V0_list}) ->
    D_a_t_a = <<V0_use_id:32, (length(V0_list)):16,
		(list_to_binary([<<V1_id:32>>
				 || V1_id <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10345:16,
       D_a_t_a/binary>>};
pack(10346, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10346:16,
       D_a_t_a/binary>>};
pack(10346, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10346:16,
       D_a_t_a/binary>>};
pack(10347, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10347:16,
       D_a_t_a/binary>>};
pack(10347, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10347:16,
       D_a_t_a/binary>>};
pack(10348, cli, {V0_is_show_vip}) ->
    D_a_t_a = <<V0_is_show_vip:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10348:16,
       D_a_t_a/binary>>};
pack(10348, srv, {V0_code, V0_msg, V0_is_show_vip}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_is_show_vip:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10348:16,
       D_a_t_a/binary>>};
pack(10350, srv, {V0_holiday_assets}) ->
    D_a_t_a = <<(length(V0_holiday_assets)):16,
		(list_to_binary([<<V1_id:32, V1_val:32>>
				 || {V1_id, V1_val}
					<- V0_holiday_assets]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10350:16,
       D_a_t_a/binary>>};
pack(10351, srv, {V0_holiday_assets}) ->
    D_a_t_a = <<(length(V0_holiday_assets)):16,
		(list_to_binary([<<V1_id:32, V1_val:32>>
				 || {V1_id, V1_val}
					<- V0_holiday_assets]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10351:16,
       D_a_t_a/binary>>};
pack(10360, srv, {V0_ids}) ->
    D_a_t_a = <<(length(V0_ids)):16,
		(list_to_binary([<<V1_id:32>>
				 || V1_id <- V0_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10360:16,
       D_a_t_a/binary>>};
pack(10380, cli, {}) -> {ok, <<2:32, 10380:16>>};
pack(10380, srv, {V0_reg_time, V0_open_time}) ->
    D_a_t_a = <<V0_reg_time:32, V0_open_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10380:16,
       D_a_t_a/binary>>};
pack(10391, cli, {V0_msg}) ->
    D_a_t_a = <<(protocol:pack(binary, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10391:16,
       D_a_t_a/binary>>};
pack(10391, srv, {V0_type, V0_data}) ->
    D_a_t_a = <<V0_type:8,
		(protocol:pack(binary, V0_data))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10391:16,
       D_a_t_a/binary>>};
pack(10392, cli, {V0_data, V0_data_len}) ->
    D_a_t_a = <<(protocol:pack(byte, V0_data))/binary,
		V0_data_len:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10392:16,
       D_a_t_a/binary>>};
pack(10392, srv, {}) -> {ok, <<2:32, 10392:16>>};
pack(10394, cli, {}) -> {ok, <<2:32, 10394:16>>};
pack(10394, srv, {}) -> {ok, <<2:32, 10394:16>>};
pack(10395, cli, {V0_age}) ->
    D_a_t_a = <<V0_age:8/signed>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10395:16,
       D_a_t_a/binary>>};
pack(10395, srv,
     {V0_status, V0_end_time,
      #role_auth_adult{down_sec = V0_down_sec}}) ->
    D_a_t_a = <<V0_status:8, V0_end_time:32,
		V0_down_sec:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10395:16,
       D_a_t_a/binary>>};
pack(10396, srv, {}) -> {ok, <<2:32, 10396:16>>};
pack(10397, cli, {V0_status}) ->
    D_a_t_a = <<V0_status:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10397:16,
       D_a_t_a/binary>>};
pack(10397, srv, {}) -> {ok, <<2:32, 10397:16>>};
pack(10399, cli, {V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10399:16,
       D_a_t_a/binary>>};
pack(10399, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10399:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(10300, srv, _B0) -> {ok, {}};
unpack(10300, cli, _B0) -> {ok, {}};
unpack(10301, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {V1_lev, _B4} = protocol:uint16(_B3),
    {V1_is_vip, _B5} = protocol:uint8(_B4),
    {V1_vip_lev, _B6} = protocol:uint8(_B5),
    {V1_vip_exp, _B7} = protocol:uint32(_B6),
    {V1_is_show_vip, _B8} = protocol:uint8(_B7),
    {V1_sex, _B9} = protocol:uint8(_B8),
    {V1_career, _B10} = protocol:uint16(_B9),
    {V1_face_id, _B11} = protocol:uint32(_B10),
    {V1_event, _B12} = protocol:uint8(_B11),
    {V1_gid, _B13} = protocol:uint32(_B12),
    {V1_gsrv_id, _B14} = protocol:string(_B13),
    {V1_position, _B15} = protocol:uint8(_B14),
    {V1_gname, _B16} = protocol:string(_B15),
    {V1_signature, _B17} = protocol:string(_B16),
    {V1_exp_max, _B18} = protocol:uint32(_B17),
    {V1_exp_total_nextlev, _B19} = protocol:uint32(_B18),
    {V1_buffs, _B30} = protocol:array(_B19,
				      fun (_B20) ->
					      {V2_bid, _B21} =
						  protocol:uint32(_B20),
					      {V2_duration, _B22} =
						  protocol:uint32(_B21),
					      {V2_count, _B23} =
						  protocol:uint8(_B22),
					      {V2_effect, _B28} =
						  protocol:array(_B23,
								 fun (_B24) ->
									 {V3_key,
									  _B25} =
									     protocol:uint8(_B24),
									 {V3_val,
									  _B26} =
									     protocol:uint32(_B25),
									 {{V3_key,
									   V3_val},
									  _B26}
								 end),
					      {{V2_bid, V2_duration, V2_count,
						V2_effect},
					       _B28}
				      end),
    {V1_reg_time, _B31} = protocol:uint32(_B30),
    {V1_guild_lev, _B32} = protocol:uint8(_B31),
    {V1_power, _B33} = protocol:uint32(_B32),
    {V1_is_first_rename, _B34} = protocol:uint8(_B33),
    {V1_avatar_base_id, _B35} = protocol:uint32(_B34),
    {V1_guild_quit_time, _B36} = protocol:uint32(_B35),
    {V1_look_id, _B37} = protocol:uint32(_B36),
    {V1_max_power, _B38} = protocol:uint32(_B37),
    {V1_auto_pk, _B39} = protocol:uint8(_B38),
    {V1_fans_num, _B40} = protocol:uint32(_B39),
    {V1_arena_elite_lev, _B41} = protocol:uint32(_B40),
    {V1_city_id, _B42} = protocol:uint32(_B41),
    {V1_room_bbs_set, _B43} = protocol:uint8(_B42),
    {V1_backdrop_id, _B44} = protocol:uint32(_B43),
    {V1_is_open_home, _B45} = protocol:uint8(_B44),
    {V1_sprite_lev, _B46} = protocol:uint16(_B45),
    {V1_sprites, _B51} = protocol:array(_B46,
					fun (_B47) ->
						{V2_pos, _B48} =
						    protocol:uint8(_B47),
						{V2_item_bid, _B49} =
						    protocol:uint32(_B48),
						{{V2_pos, V2_item_bid}, _B49}
					end),
    {V1_face_file, _B52} = protocol:string(_B51),
    {V1_face_update_time, _B53} = protocol:uint32(_B52),
    {ok,
     {V1_rid, V1_srv_id, V1_name, V1_lev, V1_is_vip,
      V1_vip_lev, V1_vip_exp, V1_is_show_vip, V1_sex,
      V1_career, V1_face_id, V1_event, V1_gid, V1_gsrv_id,
      V1_position, V1_gname, V1_signature, V1_exp_max,
      V1_exp_total_nextlev, V1_buffs, V1_reg_time,
      V1_guild_lev, V1_power, V1_is_first_rename,
      V1_avatar_base_id, V1_guild_quit_time, V1_look_id,
      V1_max_power, V1_auto_pk, V1_fans_num,
      V1_arena_elite_lev, V1_city_id, V1_room_bbs_set,
      V1_backdrop_id, V1_is_open_home, V1_sprite_lev,
      V1_sprites, V1_face_file, V1_face_update_time}};
unpack(10302, cli, _B0) ->
    {V1_lev, _B1} = protocol:uint16(_B0),
    {V1_exp, _B2} = protocol:uint32(_B1),
    {V1_gold, _B3} = protocol:uint32(_B2),
    {V1_gold_acc, _B4} = protocol:uint32(_B3),
    {V1_coin, _B5} = protocol:uint32(_B4),
    {V1_red_gold, _B6} = protocol:uint32(_B5),
    {V1_energy, _B7} = protocol:uint32(_B6),
    {V1_energy_max, _B8} = protocol:uint32(_B7),
    {V1_arena_cent, _B9} = protocol:uint32(_B8),
    {V1_activity, _B10} = protocol:uint16(_B9),
    {V1_guild, _B11} = protocol:uint32(_B10),
    {V1_hero_soul, _B12} = protocol:uint32(_B11),
    {V1_friend_point, _B13} = protocol:uint32(_B12),
    {V1_boss_point, _B14} = protocol:uint32(_B13),
    {V1_silver_coin, _B15} = protocol:uint32(_B14),
    {V1_star_hun, _B16} = protocol:uint32(_B15),
    {V1_star_point, _B17} = protocol:uint32(_B16),
    {V1_arena_guesscent, _B18} = protocol:uint32(_B17),
    {V1_sky_coin, _B19} = protocol:uint32(_B18),
    {V1_hero_exp, _B20} = protocol:uint32(_B19),
    {V1_recruit_hero, _B21} = protocol:uint32(_B20),
    {V1_recruithigh_hero, _B22} = protocol:uint32(_B21),
    {V1_expedition_medal, _B23} = protocol:uint32(_B22),
    {V1_elite_coin, _B24} = protocol:uint32(_B23),
    {V1_holy_eqm_coin, _B25} = protocol:uint32(_B24),
    {V1_skin_debris, _B26} = protocol:uint32(_B25),
    {V1_cluster_coin, _B27} = protocol:uint32(_B26),
    {V1_home_coin, _B28} = protocol:uint32(_B27),
    {V1_hallow_refine, _B29} = protocol:uint32(_B28),
    {V1_cluster_guess_cent, _B30} = protocol:uint32(_B29),
    {V1_feather_exchange, _B31} = protocol:uint32(_B30),
    {V1_brave_symbol, _B32} = protocol:uint32(_B31),
    {V1_peak_guess_cent, _B33} = protocol:uint32(_B32),
    {V1_acc_recruit_hero, _B34} = protocol:uint32(_B33),
    {V1_predict_point, _B35} = protocol:uint32(_B34),
    {ok,
     {V1_lev, V1_exp, V1_gold, V1_gold_acc, V1_coin,
      V1_red_gold, V1_energy, V1_energy_max, V1_arena_cent,
      V1_activity, V1_guild, V1_hero_soul, V1_friend_point,
      V1_boss_point, V1_silver_coin, V1_star_hun,
      V1_star_point, V1_arena_guesscent, V1_sky_coin,
      V1_hero_exp, V1_recruit_hero, V1_recruithigh_hero,
      V1_expedition_medal, V1_elite_coin, V1_holy_eqm_coin,
      V1_skin_debris, V1_cluster_coin, V1_home_coin,
      V1_hallow_refine, V1_cluster_guess_cent,
      V1_feather_exchange, V1_brave_symbol,
      V1_peak_guess_cent, V1_acc_recruit_hero,
      V1_predict_point}};
unpack(10304, cli, _B0) ->
    {V1_play_video, _B1} = protocol:uint8(_B0),
    {ok, {V1_play_video}};
unpack(10305, cli, _B0) ->
    {V1_assets, _B5} = protocol:array(_B0,
				      fun (_B1) ->
					      {V2_label, _B2} =
						  protocol:uint8(_B1),
					      {V2_val, _B3} =
						  protocol:uint32(_B2),
					      {{V2_label, V2_val}, _B3}
				      end),
    {ok, {V1_assets}};
unpack(10306, cli, _B0) ->
    {V1_power, _B1} = protocol:uint32(_B0),
    {V1_max_power, _B2} = protocol:uint32(_B1),
    {ok, {V1_power, V1_max_power}};
unpack(10307, cli, _B0) ->
    {V1_event, _B1} = protocol:uint8(_B0), {ok, {V1_event}};
unpack(10309, srv, _B0) ->
    {V1_signature, _B1} = protocol:string(_B0),
    {ok, {V1_signature}};
unpack(10309, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_signature, _B3} = protocol:string(_B2),
    {ok, {V1_code, V1_msg, V1_signature}};
unpack(10310, cli, _B0) ->
    {V1_is_show, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_is_show, V1_msg}};
unpack(10312, srv, _B0) -> {ok, {}};
unpack(10312, cli, _B0) -> {ok, {}};
unpack(10315, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_rid, V1_srv_id}};
unpack(10315, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {V1_gname, _B4} = protocol:string(_B3),
    {V1_lev, _B5} = protocol:uint16(_B4),
    {V1_face_id, _B6} = protocol:uint32(_B5),
    {V1_power, _B7} = protocol:uint32(_B6),
    {V1_elite_lev, _B8} = protocol:uint32(_B7),
    {V1_partner_list, _B20} = protocol:array(_B8,
					     fun (_B9) ->
						     {V2_id, _B10} =
							 protocol:uint32(_B9),
						     {V2_bid, _B11} =
							 protocol:uint32(_B10),
						     {V2_lev, _B12} =
							 protocol:uint16(_B11),
						     {V2_star, _B13} =
							 protocol:uint8(_B12),
						     {V2_quality, _B14} =
							 protocol:uint8(_B13),
						     {V2_awaken_lev, _B15} =
							 protocol:uint32(_B14),
						     {V2_use_skin, _B16} =
							 protocol:uint32(_B15),
						     {V2_end_time, _B17} =
							 protocol:uint8(_B16),
						     {V2_resonate_lev, _B18} =
							 protocol:uint32(_B17),
						     {{V2_id, V2_bid, V2_lev,
						       V2_star, V2_quality,
						       V2_awaken_lev,
						       V2_use_skin, V2_end_time,
						       V2_resonate_lev},
						      _B18}
					     end),
    {V1_room_partner_list, _B33} = protocol:array(_B20,
						  fun (_B21) ->
							  {V2_id, _B22} =
							      protocol:uint32(_B21),
							  {V2_bid, _B23} =
							      protocol:uint32(_B22),
							  {V2_lev, _B24} =
							      protocol:uint16(_B23),
							  {V2_star, _B25} =
							      protocol:uint8(_B24),
							  {V2_quality, _B26} =
							      protocol:uint8(_B25),
							  {V2_awaken_lev,
							   _B27} =
							      protocol:uint32(_B26),
							  {V2_use_skin, _B28} =
							      protocol:uint32(_B27),
							  {V2_pos, _B29} =
							      protocol:uint8(_B28),
							  {V2_end_time, _B30} =
							      protocol:uint8(_B29),
							  {V2_resonate_lev,
							   _B31} =
							      protocol:uint32(_B30),
							  {{V2_id, V2_bid,
							    V2_lev, V2_star,
							    V2_quality,
							    V2_awaken_lev,
							    V2_use_skin, V2_pos,
							    V2_end_time,
							    V2_resonate_lev},
							   _B31}
						  end),
    {V1_gid, _B34} = protocol:uint32(_B33),
    {V1_gsrv_id, _B35} = protocol:string(_B34),
    {V1_avatar_bid, _B36} = protocol:uint32(_B35),
    {V1_sex, _B37} = protocol:uint8(_B36),
    {V1_city, _B38} = protocol:uint32(_B37),
    {V1_vip_lev, _B39} = protocol:uint32(_B38),
    {V1_is_show_vip, _B40} = protocol:uint8(_B39),
    {V1_honor_list, _B46} = protocol:array(_B40,
					   fun (_B41) ->
						   {V2_type, _B42} =
						       protocol:uint32(_B41),
						   {V2_val, _B43} =
						       protocol:uint32(_B42),
						   {V2_rank, _B44} =
						       protocol:uint8(_B43),
						   {{V2_type, V2_val, V2_rank},
						    _B44}
					   end),
    {V1_is_friend, _B47} = protocol:uint8(_B46),
    {V1_is_fanse, _B48} = protocol:uint8(_B47),
    {V1_is_be_fanse, _B49} = protocol:uint8(_B48),
    {V1_fans_num, _B50} = protocol:uint32(_B49),
    {V1_fans_rank, _B51} = protocol:uint32(_B50),
    {V1_city_id, _B52} = protocol:uint32(_B51),
    {V1_honor, _B53} = protocol:uint32(_B52),
    {V1_use_badges, _B59} = protocol:array(_B53,
					   fun (_B54) ->
						   {V2_pos, _B55} =
						       protocol:uint8(_B54),
						   {V2_id, _B56} =
						       protocol:uint32(_B55),
						   {V2_time, _B57} =
						       protocol:uint32(_B56),
						   {{V2_pos, V2_id, V2_time},
						    _B57}
					   end),
    {V1_room_bbs_set, _B60} = protocol:uint8(_B59),
    {V1_backdrop_id, _B61} = protocol:uint32(_B60),
    {V1_is_open_home, _B62} = protocol:uint8(_B61),
    {V1_sprite_lev, _B63} = protocol:uint16(_B62),
    {V1_sprites, _B68} = protocol:array(_B63,
					fun (_B64) ->
						{V2_pos, _B65} =
						    protocol:uint8(_B64),
						{V2_item_bid, _B66} =
						    protocol:uint32(_B65),
						{{V2_pos, V2_item_bid}, _B66}
					end),
    {V1_face_file, _B69} = protocol:string(_B68),
    {V1_face_update_time, _B70} = protocol:uint32(_B69),
    {ok,
     {V1_rid, V1_srv_id, V1_name, V1_gname, V1_lev,
      V1_face_id, V1_power, V1_elite_lev, V1_partner_list,
      V1_room_partner_list, V1_gid, V1_gsrv_id, V1_avatar_bid,
      V1_sex, V1_city, V1_vip_lev, V1_is_show_vip,
      V1_honor_list, V1_is_friend, V1_is_fanse,
      V1_is_be_fanse, V1_fans_num, V1_fans_rank, V1_city_id,
      V1_honor, V1_use_badges, V1_room_bbs_set,
      V1_backdrop_id, V1_is_open_home, V1_sprite_lev,
      V1_sprites, V1_face_file, V1_face_update_time}};
unpack(10316, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_rid, _B2} = protocol:uint32(_B1),
    {V1_srv_id, _B3} = protocol:string(_B2),
    {V1_idx, _B4} = protocol:uint32(_B3),
    {ok, {V1_type, V1_rid, V1_srv_id, V1_idx}};
unpack(10316, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {V1_rid, _B4} = protocol:uint32(_B3),
    {V1_srv_id, _B5} = protocol:string(_B4),
    {V1_idx, _B6} = protocol:uint32(_B5),
    {ok,
     {V1_code, V1_msg, V1_type, V1_rid, V1_srv_id, V1_idx}};
unpack(10317, srv, _B0) -> {ok, {}};
unpack(10317, cli, _B0) ->
    {V1_worship, _B1} = protocol:uint32(_B0),
    {ok, {V1_worship}};
unpack(10318, srv, _B0) ->
    {V1_auto_pk, _B1} = protocol:uint8(_B0),
    {ok, {V1_auto_pk}};
unpack(10318, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_auto_pk, _B3} = protocol:uint8(_B2),
    {ok, {V1_code, V1_msg, V1_auto_pk}};
unpack(10319, srv, _B0) -> {ok, {}};
unpack(10319, cli, _B0) ->
    {V1_worship, _B1} = protocol:uint32(_B0),
    {ok, {V1_worship}};
unpack(10320, srv, _B0) -> {ok, {}};
unpack(10320, cli, _B0) ->
    {V1_worship, _B1} = protocol:uint32(_B0),
    {ok, {V1_worship}};
unpack(10322, srv, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0), {ok, {V1_code}};
unpack(10322, cli, _B0) ->
    {V1_code1, _B1} = protocol:uint8(_B0), {ok, {V1_code1}};
unpack(10323, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0), {ok, {V1_code}};
unpack(10325, srv, _B0) -> {ok, {}};
unpack(10325, cli, _B0) ->
    {V1_face_list, _B4} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_face_id, _B2} =
						     protocol:uint32(_B1),
						 {V2_face_id, _B2}
					 end),
    {ok, {V1_face_list}};
unpack(10327, srv, _B0) ->
    {V1_face_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_face_id}};
unpack(10327, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_face_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_face_id}};
unpack(10328, srv, _B0) -> {ok, {}};
unpack(10328, cli, _B0) ->
    {V1_backdrop_list, _B4} = protocol:array(_B0,
					     fun (_B1) ->
						     {V2_backdrop_id, _B2} =
							 protocol:uint32(_B1),
						     {V2_backdrop_id, _B2}
					     end),
    {ok, {V1_backdrop_list}};
unpack(10329, srv, _B0) ->
    {V1_backdrop_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_backdrop_id}};
unpack(10329, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_backdrop_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_backdrop_id}};
unpack(10330, srv, _B0) -> {ok, {}};
unpack(10330, cli, _B0) ->
    {V1_secret_id, _B1} = protocol:string(_B0),
    {V1_secret_key, _B2} = protocol:string(_B1),
    {V1_face_file, _B3} = protocol:string(_B2),
    {ok, {V1_secret_id, V1_secret_key, V1_face_file}};
unpack(10332, srv, _B0) -> {ok, {}};
unpack(10332, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_face_file, _B3} = protocol:string(_B2),
    {V1_face_update_time, _B4} = protocol:uint32(_B3),
    {ok,
     {V1_code, V1_msg, V1_face_file, V1_face_update_time}};
unpack(10333, srv, _B0) -> {ok, {}};
unpack(10333, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_face_file, _B3} = protocol:string(_B2),
    {V1_face_update_time, _B4} = protocol:uint32(_B3),
    {ok,
     {V1_code, V1_msg, V1_face_file, V1_face_update_time}};
unpack(10342, cli, _B0) -> {ok, {}};
unpack(10343, srv, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {V1_sex, _B2} = protocol:uint8(_B1),
    {ok, {V1_name, V1_sex}};
unpack(10343, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {V1_sex, _B4} = protocol:uint8(_B3),
    {V1_is_first_rename, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_code, V1_msg, V1_name, V1_sex, V1_is_first_rename}};
unpack(10344, cli, _B0) ->
    {V1_old_lev, _B1} = protocol:uint16(_B0),
    {V1_lev, _B2} = protocol:uint16(_B1),
    {ok, {V1_old_lev, V1_lev}};
unpack(10345, srv, _B0) -> {ok, {}};
unpack(10345, cli, _B0) ->
    {V1_use_id, _B1} = protocol:uint32(_B0),
    {V1_list, _B5} = protocol:array(_B1,
				    fun (_B2) ->
					    {V2_id, _B3} = protocol:uint32(_B2),
					    {V2_id, _B3}
				    end),
    {ok, {V1_use_id, V1_list}};
unpack(10346, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(10346, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(10347, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(10347, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(10348, srv, _B0) ->
    {V1_is_show_vip, _B1} = protocol:uint8(_B0),
    {ok, {V1_is_show_vip}};
unpack(10348, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_is_show_vip, _B3} = protocol:uint8(_B2),
    {ok, {V1_code, V1_msg, V1_is_show_vip}};
unpack(10350, cli, _B0) ->
    {V1_holiday_assets, _B5} = protocol:array(_B0,
					      fun (_B1) ->
						      {V2_id, _B2} =
							  protocol:uint32(_B1),
						      {V2_val, _B3} =
							  protocol:uint32(_B2),
						      {{V2_id, V2_val}, _B3}
					      end),
    {ok, {V1_holiday_assets}};
unpack(10351, cli, _B0) ->
    {V1_holiday_assets, _B5} = protocol:array(_B0,
					      fun (_B1) ->
						      {V2_id, _B2} =
							  protocol:uint32(_B1),
						      {V2_val, _B3} =
							  protocol:uint32(_B2),
						      {{V2_id, V2_val}, _B3}
					      end),
    {ok, {V1_holiday_assets}};
unpack(10360, cli, _B0) ->
    {V1_ids, _B4} = protocol:array(_B0,
				   fun (_B1) ->
					   {V2_id, _B2} = protocol:uint32(_B1),
					   {V2_id, _B2}
				   end),
    {ok, {V1_ids}};
unpack(10380, srv, _B0) -> {ok, {}};
unpack(10380, cli, _B0) ->
    {V1_reg_time, _B1} = protocol:uint32(_B0),
    {V1_open_time, _B2} = protocol:uint32(_B1),
    {ok, {V1_reg_time, V1_open_time}};
unpack(10391, srv, _B0) ->
    {V1_msg, _B1} = protocol:binary(_B0), {ok, {V1_msg}};
unpack(10391, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_data, _B2} = protocol:binary(_B1),
    {ok, {V1_type, V1_data}};
unpack(10392, srv, _B0) ->
    {V1_data, _B1} = protocol:byte(_B0),
    {V1_data_len, _B2} = protocol:uint32(_B1),
    {ok, {V1_data, V1_data_len}};
unpack(10392, cli, _B0) -> {ok, {}};
unpack(10394, srv, _B0) -> {ok, {}};
unpack(10394, cli, _B0) -> {ok, {}};
unpack(10395, srv, _B0) ->
    {V1_age, _B1} = protocol:int8(_B0), {ok, {V1_age}};
unpack(10395, cli, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_end_time, _B2} = protocol:uint32(_B1),
    {V1_down_sec, _B3} = protocol:uint32(_B2),
    {ok, {V1_status, V1_end_time, V1_down_sec}};
unpack(10396, cli, _B0) -> {ok, {}};
unpack(10397, srv, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {ok, {V1_status}};
unpack(10397, cli, _B0) -> {ok, {}};
unpack(10399, srv, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0), {ok, {V1_msg}};
unpack(10399, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


