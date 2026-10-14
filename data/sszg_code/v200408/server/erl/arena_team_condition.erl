-file("data/arena_team_condition.erl", 1).

-file("src/mod/arena_team/arena_team_condition.erl", 1).

-module(arena_team_condition).

-lager_records([{arena_team_arge,
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

-export([check_creat/2, check_can_join/2,
	 check_can_quit/2, check_arena_team_state/2,
	 check_set_pos/2, check_arena_team_open/0,
	 check_arena_team_open/1, get_arena_state_info/0]).

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

-file("src/mod/arena_team/arena_team_condition.erl",
      19).

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

-file("src/mod/arena_team/arena_team_condition.erl",
      20).

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

-file("src/mod/arena_team/arena_team_condition.erl",
      21).

-spec check_creat(#role{}, binary()) -> true |
					{false, binary()}.

check_creat(Role = #role{m_arena_team =
			     #m_arena_team{team_id = {0, <<>>}}},
	    Name) ->
    case check_arena_team_state(Role, creat_team) of
      {false, Msg} -> {false, Msg};
      _ ->
	  NLen = string_util:string_width(Name),
	  case keyword:check(name, Name) of
	    false ->
		{false, lang:get(<<"Tên này là bất hợp pháp"/utf8>>)};
	    _ when NLen =< 2 orelse NLen > 12 ->
		{false, lang:get(<<"Độ dài tên sai"/utf8>>)};
	    true -> true
	  end
    end;
check_creat(_Role, _Name) ->
    {false, lang:get(<<"Bạn đã ở trong hàng đợi"/utf8>>)}.

-spec check_arena_team_state(#role{}, atom()) -> {false,
						  binary()} |
						 true.

check_arena_team_state(Role, Type) ->
    case check_arena_team_open(Role) of
      true ->
	  case get_arena_state_info() of
	    {_, _, _, StateName}
		when Type == creat_team andalso
		       (StateName == open_team orelse
			  StateName == open_combat) ->
		true;
	    _ when Type == creat_team ->
		{false,
		 lang:get(<<"Các đội chỉ có thể được tạo trong giai "
			    "đoạn thành lập đội và giai đoạn bắt "
			    "đầu chiến tranh."/utf8>>)};
	    {_, _, _, StateName}
		when Type == join_team andalso
		       (StateName == open_team orelse
			  StateName == open_combat) ->
		true;
	    _ when Type == join_team ->
		{false,
		 lang:get(<<"Bạn chỉ có thể tham gia vào đội trong "
			    "giai đoạn thành lập đội và bắt đầu giai "
			    "đoạn chiến tranh."/utf8>>)};
	    {_, _, _, StateName}
		when Type == search andalso
		       (StateName == open_team orelse
			  StateName == open_combat) ->
		true;
	    _ when Type == search ->
		{false,
		 lang:get(<<"Người chơi chỉ có thể được tìm kiếm "
			    "trong giai đoạn thành lập đội và giai "
			    "đoạn bắt đầu chiến tranh"/utf8>>)};
	    {_, _, _, StateName}
		when Type == team_quit andalso
		       (StateName == open_team orelse
			  StateName == open_combat) ->
		true;
	    _ when Type == team_quit ->
		{false,
		 lang:get(<<"Bạn chỉ có thể rời đội trong giai đoạn "
			    "thành lập đội và bắt đầu cuộc chiến."/utf8>>)};
	    _ -> {false, lang:get(<<"Lỗi tham số"/utf8>>)}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Các điều kiện để mở đấu trường đồng "
		      "đội chưa được đáp ứng."/utf8>>)}
    end.

-spec check_can_quit(#role{}, #arena_team{}) -> true |
						{false, binary()}.

check_can_quit(Role, TeamId = {_, _}) ->
    case arena_team_db:get_team_by_id(TeamId) of
      Team = #arena_team{team_pid = Pid} ->
	  case check_can_quit(Role, Team) of
	    {false, Msg} -> {false, Msg};
	    _ -> {true, Pid}
	  end;
      {false, Msg} -> {false, Msg}
    end;
check_can_quit(Role,
	       #arena_team{team_pid = Pid, is_sign = IsSign}) ->
    case check_arena_team_open(Role) of
      true ->
	  case get_arena_state_info() of
	    {_, _, _, open_combat} when IsSign == 1 ->
		{false,
		 lang:get(<<"Các đội đã đăng ký khi bắt đầu cuộc "
			    "chiến không thể rút lui."/utf8>>)};
	    _ -> {true, Pid}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Các điều kiện để mở đấu trường đồng "
		      "đội chưa được đáp ứng."/utf8>>)}
    end.

-spec check_can_join(#arena_team_member{},
		     #arena_team{}) -> true | {false, binary()}.

check_can_join(Data, TeamId = {_, _}) ->
    case arena_team_db:get_team_by_id(TeamId) of
      Team = #arena_team{team_pid = Pid} ->
	  case check_can_join(Data, Team) of
	    {false, Msg} -> {false, Msg};
	    _ -> {true, Pid}
	  end;
      {false, Msg} -> {false, Msg}
    end;
check_can_join(Role = #role{id = RoleId, lev = Lev,
			    power = Power},
	       Team) ->
    case check_arena_team_state(Role, join_team) of
      {false, Msg} -> {false, Msg};
      _ -> check_can_join({RoleId, Lev, Power}, Team)
    end;
check_can_join(#arena_team_member{id = RoleId,
				  lev = Lev, power = Power},
	       Team) ->
    check_can_join({RoleId, Lev, Power}, Team);
check_can_join({RoleId, Lev, Power},
	       #arena_team{team_limit_lev = LimitLev,
			   team_limit_power = LimitPower, is_sign = IsSign,
			   team_members = TemMembers}) ->
    MaxNum = 3,
    Num = length(TemMembers),
    MyTeamId = arena_team_db:get_role_team_id(RoleId),
    if MyTeamId =/= {0, <<>>} ->
	   {false, lang:get(<<"Bạn đã ở trong hàng đợi~"/utf8>>)};
       Lev < LimitLev ->
	   {false,
	    lang:get(<<"Cấp độ không đạt đến mức giới hạn"/utf8>>)};
       Power < LimitPower ->
	   {false,
	    lang:get(<<"Sức chiến đấu chưa đạt đến sức chiến "
		       "đấu hạn chế."/utf8>>)};
       Num >= MaxNum ->
	   {false, lang:get(<<"Đội ngũ đã đầy đủ"/utf8>>)};
       IsSign == 1 ->
	   {false, lang:get(<<"Đội đã đăng ký thi đấu"/utf8>>)};
       true -> true
    end;
check_can_join(Date, Team) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_condition126, _,
       {__Levelarena_team_condition126,
	__Tracesarena_team_condition126}}
	  when __Levelarena_team_condition126 band 128 /= 0 orelse
		 __Tracesarena_team_condition126 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_team_condition},
			{function, check_can_join}, {line, 126},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("==~w", [Date]), none, 4096, 128,
		       __Levelarena_team_condition126,
		       __Tracesarena_team_condition126, lager_event,
		       __Pidarena_team_condition126);
      _ -> ok
    end,
    {false, <<>>}.

-spec check_set_pos(list(), #arena_team{}) -> tuple().

check_set_pos(PosInfo,
	      #arena_team{team_members = Members}) ->
    HideNum = length([IsHide
		      || {_, _, IsHide} <- PosInfo, IsHide == 1]),
    PosList = lists:sort([Pos || {_, Pos, _} <- PosInfo]),
    Flag1 = PosList == lists:usort(PosList),
    Flag2 = PosList ==
	      lists:sort([PosT
			  || {_, PosT, _} <- PosInfo,
			     PosT =< 3 andalso PosT > 0]),
    Flag3 = lists:sort([Id
			|| #arena_team_member{id = Id} <- Members])
	      == lists:sort([Id2 || {Id2, _, _} <- PosInfo]),
    if HideNum > 1 ->
	   {false,
	    lang:get(<<"Chỉ có thể đặt một thành viên thành "
		       "không bị ẩn"/utf8>>)};
       Flag3 == false ->
	   case {whereis(lager_event), whereis(lager_event),
		 lager_config:get({lager_event, loglevel}, {0, []})}
	       of
	     {undefined, undefined, _} ->
		 fun () -> {error, lager_not_running} end();
	     {undefined, _, _} ->
		 fun () -> {error, {sink_not_configured, lager_event}}
		 end();
	     {__Pidarena_team_condition140, _,
	      {__Levelarena_team_condition140,
	       __Tracesarena_team_condition140}}
		 when __Levelarena_team_condition140 band 8 /= 0 orelse
			__Tracesarena_team_condition140 /= [] ->
		 lager:do_log(error,
			      [{module, arena_team_condition},
			       {function, check_set_pos}, {line, 140},
			       {pid, pid_to_list(self())}, {node, node()}
			       | lager:md()],
			      io_lib:format("组队竞技场设置阵位参数错误,队员信息已发生变更:~w",
					    [{Flag1, Flag2, Flag3, PosInfo}]),
			      none, 4096, 8, __Levelarena_team_condition140,
			      __Tracesarena_team_condition140, lager_event,
			      __Pidarena_team_condition140);
	     _ -> ok
	   end,
	   {false, <<>>};
       Flag1 == false orelse
	 Flag2 == false orelse Flag3 == false ->
	   case {whereis(lager_event), whereis(lager_event),
		 lager_config:get({lager_event, loglevel}, {0, []})}
	       of
	     {undefined, undefined, _} ->
		 fun () -> {error, lager_not_running} end();
	     {undefined, _, _} ->
		 fun () -> {error, {sink_not_configured, lager_event}}
		 end();
	     {__Pidarena_team_condition143, _,
	      {__Levelarena_team_condition143,
	       __Tracesarena_team_condition143}}
		 when __Levelarena_team_condition143 band 8 /= 0 orelse
			__Tracesarena_team_condition143 /= [] ->
		 lager:do_log(error,
			      [{module, arena_team_condition},
			       {function, check_set_pos}, {line, 143},
			       {pid, pid_to_list(self())}, {node, node()}
			       | lager:md()],
			      io_lib:format("组队竞技场设置阵位参数错误:~w",
					    [{Flag1, Flag2, Flag3, PosInfo}]),
			      none, 4096, 8, __Levelarena_team_condition143,
			      __Tracesarena_team_condition143, lager_event,
			      __Pidarena_team_condition143);
	     _ -> ok
	   end,
	   {false, lang:get(<<"Lỗi tham số"/utf8>>)};
       true -> true
    end.

-spec get_arena_state_info() -> tuple().

get_arena_state_info() ->
    {Period, Ts, TimeOut, StateName} =
	sys_env:get(arena_team_state, {0, 0, 0, idle}),
    {Period, Ts, TimeOut, StateName}.

-spec check_arena_team_open(#role{}) -> true | false.

check_arena_team_open(#role{lev = Lev}) ->
    Lev >= arena_team_data:get_const(open_lev) andalso
      check_arena_team_open().

check_arena_team_open() -> true.


