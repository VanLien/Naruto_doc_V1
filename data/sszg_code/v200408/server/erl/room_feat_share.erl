-file("src/mod/role_room/room_feat_share.erl", 1).

-module(room_feat_share).

-lager_records([{quest_stats, [type, stats, desc]},
		{quest_progress,
		 [id, label, target, param, finish, trigger, target_val,
		  value, msg, ext_data, dyn_ext_data]},
		{quest,
		 [id, name, type, finish, quality, progress, accept_time,
		  end_time, finish_time, round]},
		{m_quest,
		 [ver, quest, acceptable, finished, daily_finished]},
		{quest_data,
		 [id, type, name, phase, can_giveup, lev, max_lev,
		  career, pre_quest, suffix_quest, start_time, end_time,
		  condition, progress, accept_rewards, commit_rewards,
		  commit_loss, commit_type, times, desc, group, layer,
		  dungeon_id, is_auto_finished_gain, auto_accept,
		  weekdays, white_list, black_list, extra, val_from_prev,
		  hide]},
		{room_rank_info,
		 [id, name, lev, face, avatar_bid, time, fans_num, rank,
		  look_id, face_update_time, face_file]},
		{room_fans_num, [id, fans]}, {room_fans, [myid, fid]},
		{room_bbs_message_below, [id, role_id, name, bbs_id]},
		{room_bbs_message,
		 [id, bbs_id, bbs_type, reply_name, reply_bbs_id,
		  reply_id, msg, time, tar_id, face_id, avatar_id, lev,
		  sex, name, face_update_time, face_file]},
		{room_honor_badges, [id, time]},
		{room_grow, [id, order, time, arge, ext]},
		{m_room_grow, [ver, finish, doing, info, next_id, ext]},
		{m_room_feat, [ver, flag, finish, doing, overdue, ext]},
		{m_room,
		 [ver, city_id, fanse_list, honor_badges, honor_point,
		  use_badges, room_bbs_set, room_bbs_num]},
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

-export([badges_share/3, look_badges_share/2,
	 feat_share/3, look_feat_share/2, honor_share/2,
	 look_honor_share/2, grow_share/2, look_grow_share/4]).

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

-file("src/mod/role_room/room_feat_share.erl", 18).

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

-file("src/mod/role_room/room_feat_share.erl", 19).

-file("inc/role_room.hrl", 1).

-record(m_room,
	{ver = 3, city_id = 0, fanse_list = [],
	 honor_badges = [], honor_point = 0, use_badges = [],
	 room_bbs_set = 1, room_bbs_num = 0}).

-record(m_room_feat,
	{ver = 1, flag = 0,
	 finish = []  :: [{pos_integer(), pos_integer()}],
	 doing = []  :: [tuple()],
	 overdue = []  :: [pos_integer()], ext = []}).

-record(m_room_grow,
	{ver = 1, finish = []  :: [pos_integer()],
	 doing = []  :: [tuple()], info = [], next_id = 1,
	 ext = []}).

-record(room_grow,
	{id = 0, order = 0, time = 0, arge = [], ext = []}).

-record(room_honor_badges, {id = 0, time = 0}).

-record(room_bbs_message,
	{id = {0, <<>>}, bbs_id = 0, bbs_type = 0,
	 reply_name = <<>>, reply_bbs_id = 0,
	 reply_id = {0, <<>>}, msg = <<>>, time = 0,
	 tar_id = {0, <<>>}, face_id = 0, avatar_id = 0, lev = 0,
	 sex = 0, name = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(room_bbs_message_below,
	{id = {0, <<>>}, role_id = {0, <<>>}, name = <<>>,
	 bbs_id = 0}).

-record(room_fans, {myid = {0, <<>>}, fid = {0, <<>>}}).

-record(room_fans_num, {id = {0, <<>>}, fans = 0}).

-record(room_rank_info,
	{id = {0, <<>>}, name = <<>>, lev = 0, face = 0,
	 avatar_bid = 0, time = 0, fans_num = 0, rank = 0,
	 look_id = 0, face_update_time = 0, face_file = <<>>}).

-file("src/mod/role_room/room_feat_share.erl", 20).

-file("inc/quest.hrl", 1).

-record(quest_data,
	{id = 1  :: pos_integer(), type = 1  :: pos_integer(),
	 name = <<>>  :: binary(),
	 phase = 0  :: non_neg_integer(),
	 can_giveup = 0  :: 0..1, lev = 1  :: pos_integer(),
	 max_lev = 0  :: non_neg_integer(), career = 0  :: 0..4,
	 pre_quest  ::
	     undefined | non_neg_integer() | [non_neg_integer()],
	 suffix_quest = 0  :: non_neg_integer(),
	 start_time = 0  ::
	     tuple() | non_neg_integer() | undefined,
	 end_time = 0  ::
	     tuple() | non_neg_integer() | undefined,
	 condition = []  :: [tuple()],
	 progress = []  :: [tuple()],
	 accept_rewards = []  :: [tuple()],
	 commit_rewards = []  :: [tuple()],
	 commit_loss = []  :: [tuple()],
	 commit_type = 1  :: pos_integer(),
	 times = 1  :: non_neg_integer(), desc = <<>>  :: list(),
	 group = 0, layer = 0, dungeon_id = 0,
	 is_auto_finished_gain = 0, auto_accept = 0  :: 0..1,
	 weekdays = []  :: [pos_integer()],
	 white_list = []  :: list(), black_list = []  :: list(),
	 extra = [], val_from_prev = 0  :: 0 | 1,
	 hide = 0  :: 0 | 1}).

-record(m_quest,
	{ver = 1, quest = []  :: list(),
	 acceptable = []  :: list(), finished = []  :: list(),
	 daily_finished = []}).

-record(quest,
	{id = 1  :: pos_integer(), name = <<>>  :: binary(),
	 type = 1  :: pos_integer(), finish = 0  :: 0..2,
	 quality = 0  :: 0..4, progress = []  :: [tuple()],
	 accept_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 finish_time = 0  :: non_neg_integer(),
	 round = 0  :: non_neg_integer()}).

-record(quest_progress,
	{id = 0  :: non_neg_integer(), label  :: atom(),
	 target = 0  :: non_neg_integer(), param = []  :: list(),
	 finish = 0  :: 0..1, trigger  :: undefined | tuple(),
	 target_val = 1  :: pos_integer(),
	 value = 0  :: non_neg_integer(),
	 msg = <<>>  :: bitstring() | string(),
	 ext_data = []  :: [tuple()],
	 dyn_ext_data = []  :: [tuple()]}).

-record(quest_stats, {type = 1, stats = [], desc = []}).

-file("src/mod/role_room/room_feat_share.erl", 21).

-spec badges_share(#role{}, pos_integer(),
		   pos_integer()) -> ok.

badges_share(Role = #role{lev = Lev,
			  m_room = #m_room{honor_badges = Honors}},
	     Id, Channel) ->
    case Lev >= 10 of
      false -> {false, lang:get(<<"等级不足10级"/utf8>>)};
      _ ->
	  case role_misc:check_cd(room_feat_badges_share, 10000)
	      of
	    true ->
		case lists:keyfind(Id, #room_honor_badges.id, Honors) of
		  #room_honor_badges{id = Id, time = Time} ->
		      ShareData = {Id, Time},
		      ShareId = say_mgr:add_cache(ShareData),
		      Msg =
			  util:format_ex(lang:get(<<"大家看看我这个徽章如何？~s"/utf8>>),
					 [color:format({share_badges,
							{Id, ShareId}})]),
		      case say:speak(Role,
				     #{from => sys, channel => Channel,
				       len => 0, msg => Msg})
			  of
			{false, Msg1} -> {false, Msg1};
			{false, Msg2, _} -> {false, Msg2};
			_ -> ok
		      end;
		  _ -> {false, lang:get(<<"该徽章未激活"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"分享过于频繁..."/utf8>>)}
	  end
    end.

-spec look_badges_share(binary(), pos_integer()) -> ok.

look_badges_share(SrvId, ShareId) ->
    case cluster_lib:call(SrvId, say_mgr, get_cache,
			  [ShareId])
	of
      {ok, {Id, Time}} ->
	  role:pack_send(25816, {Id, Time, ShareId});
      _ -> notice:alert(lang:get(<<"分享已过期"/utf8>>)), ok
    end.

-spec feat_share(#role{}, pos_integer(),
		 pos_integer()) -> ok.

feat_share(Role = #role{lev = Lev,
			m_room_feat =
			    #m_room_feat{doing = DoLists, finish = Finish}},
	   Id, Channel) ->
    case Lev >= 10 of
      false -> {false, lang:get(<<"等级不足10级"/utf8>>)};
      _ ->
	  case role_misc:check_cd(room_feat_feat_share, 10000) of
	    true ->
		case lists:keyfind(Id, 1, Finish) of
		  {Id, Time} ->
		      ShareData = {Id, Time},
		      ShareId = say_mgr:add_cache(ShareData),
		      Msg =
			  util:format_ex(lang:get(<<"太开心了，终于完成~s这个历练任务了"/utf8>>),
					 [color:format({share_room_feat,
							{Id, ShareId}})]),
		      case say:speak(Role,
				     #{from => sys, channel => Channel,
				       len => 0, msg => Msg})
			  of
			{false, Msg1} -> {false, Msg1};
			{false, Msg2, _} -> {false, Msg2};
			_ -> ok
		      end;
		  _ ->
		      case lists:keyfind(Id, #quest.id, DoLists) of
			#quest{finish = IsFinish} when IsFinish > 0 ->
			    ShareData = {Id, date:unixtime()},
			    ShareId = say_mgr:add_cache(ShareData),
			    Msg =
				util:format_ex(lang:get(<<"太开心了，终于完成~s这个历练任务了"/utf8>>),
					       [color:format({share_room_feat,
							      {Id, ShareId}})]),
			    case say:speak(Role,
					   #{from => sys, channel => Channel,
					     len => 0, msg => Msg})
				of
			      {false, Msg1} -> {false, Msg1};
			      {false, Msg2, _} -> {false, Msg2};
			      _ -> ok
			    end;
			_ -> {false, lang:get(<<"该成就未完成"/utf8>>)}
		      end
		end;
	    _ -> {false, lang:get(<<"分享过于频繁..."/utf8>>)}
	  end
    end.

-spec look_feat_share(binary(), pos_integer()) -> ok.

look_feat_share(SrvId, ShareId) ->
    case cluster_lib:call(SrvId, say_mgr, get_cache,
			  [ShareId])
	of
      {ok, {Id, Time}} ->
	  role:pack_send(25818, {Id, Time, ShareId});
      _ -> notice:alert(lang:get(<<"分享已过期"/utf8>>)), ok
    end.

-spec honor_share(#role{}, pos_integer()) -> ok.

honor_share(Role = #role{lev = Lev,
			 m_room =
			     #m_room{honor_badges = L, honor_point = Point}},
	    Channel) ->
    case Lev >= 10 of
      false -> {false, lang:get(<<"等级不足10级"/utf8>>)};
      _ ->
	  case role_misc:check_cd(room_feat_honor_share, 10000) of
	    true ->
		Num = length(L),
		ShareData = {Point, Num},
		ShareId = say_mgr:add_cache(ShareData),
		Msg =
		    util:format_ex(lang:get(<<"看看我这波徽章收集是什么水平~s"/utf8>>),
				   [color:format({share_room_honor,
						  {Point, ShareId}})]),
		case say:speak(Role,
			       #{from => sys, channel => Channel, len => 0,
				 msg => Msg})
		    of
		  {false, Msg1} -> {false, Msg1};
		  {false, Msg2, _} -> {false, Msg2};
		  _ -> ok
		end;
	    _ -> {false, lang:get(<<"分享过于频繁..."/utf8>>)}
	  end
    end.

-spec look_honor_share(binary(), pos_integer()) -> ok.

look_honor_share(SrvId, ShareId) ->
    case cluster_lib:call(SrvId, say_mgr, get_cache,
			  [ShareId])
	of
      {ok, {Point, Num}} ->
	  role:pack_send(25820, {Point, Num, ShareId});
      _ -> notice:alert(lang:get(<<"分享已过期"/utf8>>)), ok
    end.

-spec grow_share(#role{}, pos_integer()) -> ok.

grow_share(Role = #role{lev = Lev,
			m_room_grow = #m_room_grow{info = _L}},
	   Channel) ->
    case Lev >= 10 of
      false -> {false, lang:get(<<"等级不足10级"/utf8>>)};
      _ ->
	  case role_misc:check_cd(room_grow_share, 10000) of
	    true ->
		Msg = util:format_ex(lang:get(<<"看看我的成长之路~s"/utf8>>),
				     [color:format({share_room_grow, {0}})]),
		case say:speak(Role,
			       #{from => sys, channel => Channel, len => 0,
				 msg => Msg})
		    of
		  {false, Msg1} -> {false, Msg1};
		  {false, Msg2, _} -> {false, Msg2};
		  _ -> ok
		end;
	    _ -> {false, lang:get(<<"分享过于频繁..."/utf8>>)}
	  end
    end.

-spec look_grow_share(binary(), pos_integer(),
		      pos_integer(), pos_integer()) -> ok.

look_grow_share(#role{id = Id,
		      m_room_grow = #m_room_grow{info = Info}},
		Id = {Rid, SrvId}, Start0, Num) ->
    Len = length(Info),
    Start = util:check_range(Start0, 1, max(1, Len)),
    NInfo = util:if_true(Start0 == 0, Info,
			 lists:reverse(Info)),
    PushList = lists:sublist(NInfo, Start, Num),
    role:pack_send(25832,
		   {Rid, SrvId, Start0, Num, Len, PushList});
look_grow_share(_Role, Id = {Rid, SrvId}, Start0,
		Num) ->
    case role_robot:get_role(Id) of
      {ok, #role_robot{grow_info = Info}} ->
	  Len = length(Info),
	  Start = util:check_range(Start0, 1, max(1, Len)),
	  NInfo = util:if_true(Start0 == 0, Info,
			       lists:reverse(Info)),
	  PushList = lists:sublist(NInfo, Start, Num),
	  role:pack_send(25832,
			 {Rid, SrvId, Start0, Num, Len, PushList});
      _ -> skip
    end.


