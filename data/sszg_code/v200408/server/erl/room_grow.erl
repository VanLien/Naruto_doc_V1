-file("src/mod/role_room/room_grow.erl", 1).

-module(room_grow).

-lager_records([{rank_cfg,
		 [type, num, keys, min_val, nologin, zone, exit_rank]},
		{rank_rc,
		 [ver, id, idx, val1, val2, val3, rid, srv_id, name,
		  look_id, sex, lev, face_id, vip_lev, guild_name, power,
		  all_power, desc, looks, ext, time, is_cross, avatar_bid,
		  face_update_time, face_file]},
		{rank, [type, list, last_val, len, is_cross, ctime]},
		{quest_stats, [type, stats, desc]},
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

-export([gm_set_log/2, gm_init/1, login/1, init/0,
	 get_info/3, update/3, do_finish/3,
	 get_carnival_data/1]).

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

-file("src/mod/role_room/room_grow.erl", 18).

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

-file("src/mod/role_room/room_grow.erl", 19).

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

-file("src/mod/role_room/room_grow.erl", 20).

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

-file("src/mod/role_room/room_grow.erl", 21).

-file("inc/rank.hrl", 1).

-record(rank,
	{type = 0  :: non_neg_integer(), list = []  :: list(),
	 last_val = 0  :: non_neg_integer(),
	 len = 0  :: non_neg_integer(), is_cross = 0  :: 0 | 1,
	 ctime = 0  :: non_neg_integer()}).

-record(rank_rc,
	{ver = 3  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 idx = 0  :: non_neg_integer(),
	 val1 = 0  :: non_neg_integer(),
	 val2 = 0  :: non_neg_integer(),
	 val3 = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(),
	 srv_id = <<>>  :: bitstring(),
	 name = <<>>  :: bitstring(),
	 look_id = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 face_id = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 guild_name = <<>>  :: bitstring(),
	 power = 0  :: non_neg_integer(),
	 all_power = 0  :: non_neg_integer(),
	 desc = <<>>  :: bitstring(), looks = []  :: list(),
	 ext = []  :: list(), time = 0  :: non_neg_integer(),
	 is_cross = false, avatar_bid = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(rank_cfg,
	{type = 0  :: non_neg_integer(),
	 num = 300  :: non_neg_integer(),
	 keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1],
	 min_val = 1  :: non_neg_integer(),
	 nologin = 0  :: non_neg_integer(),
	 zone = rank_zone_1  :: atom(), exit_rank = 0  :: 0..1}).

-file("src/mod/role_room/room_grow.erl", 22).

gm_set_log(Role, Id) ->
    NRole1 = #role{m_room_grow =
		       M = #m_room_grow{finish = Finishs, doing = Quests}} =
		 to_log_info(Role, Id, #{}),
    FinishIds = calc_finish_ids(Id),
    NFinishs = FinishIds ++ Finishs,
    NQuests = [T
	       || T = #quest{id = IdT} <- Quests,
		  not lists:member(IdT, NFinishs)],
    DelQuest = Quests -- NQuests,
    NRole2 = del_quest(DelQuest, NRole1),
    {ok,
     NRole2#role{m_room_grow =
		     M#m_room_grow{finish = NFinishs, doing = NQuests}}}.

gm_init(Role) ->
    {ok, Role#role{m_room_grow = #m_room_grow{}}}.

-spec init() -> #m_room_grow{}.

init() -> #m_room_grow{}.

-spec login(#role{}) -> {ok, #role{}}.

login(Role) ->
    NewRole = do_ref_quest(Role), {ok, NewRole}.

-spec get_info(#role{}, pos_integer(),
	       pos_integer()) -> [].

get_info(#role{m_room_grow = #m_room_grow{info = Info}},
	 Start0, Num) ->
    Len = length(Info),
    Start = util:check_range(Start0, 1, max(1, Len)),
    NInfo = util:if_true(Start0 == 0, Info,
			 lists:reverse(Info)),
    PushList = lists:sublist(NInfo, Start, Num),
    sys_conn:pack_send(25830, {Start0, Num, Len, PushList}).

-spec get_carnival_data(#role{}) -> [].

get_carnival_data(#role{m_room_grow =
			    #m_room_grow{info = Info}}) ->
    Ids =
	lists:reverse(lists:sort(room_grow_data:get_carnival_ids())),
    case get_carnival_data(Ids, Info) of
      {ok, Id, Name} -> sys_conn:pack_send(25833, {Id, Name});
      _ -> sys_conn:pack_send(25833, {0, <<>>})
    end.

get_carnival_data([], _Info) -> false;
get_carnival_data([Id | Ids], Info) ->
    case lists:keyfind(Id, #room_grow.id, Info) of
      #room_grow{arge = Arges} ->
	  case lists:keyfind(1, 1, Arges) of
	    {_, Name} -> {ok, Id, Name};
	    _ -> get_carnival_data(Ids, Info)
	  end;
      _ -> get_carnival_data(Ids, Info)
    end.

-spec update(#role{}, #quest{},
	     #quest_progress{}) -> #role{}.

update(Role = #role{trigger = {_, List},
		    m_room_grow =
			M = #m_room_grow{finish = Finishs, doing = Quests}},
       Q = #quest{id = QuestId},
       P = #quest_progress{ext_data = ExtData}) ->
    case lists:member(QuestId, Finishs) of
      true -> Role;
      _ ->
	  NewP = [P],
	  NRole = case [false
			|| #quest_progress{finish = 0} <- NewP]
		      of
		    [] ->
			Cache = list_util:keyfind(cache, ExtData,
						  #{time => date:unixtime()}),
			do_finish(Role, QuestId, Cache);
		    _ ->
			NewQuest = Q#quest{progress = NewP},
			NewQuests = lists:keyreplace(QuestId, #quest.id, Quests,
						     NewQuest),
			Role#role{m_room_grow =
				      M#m_room_grow{doing = NewQuests}}
		  end,
	  NRole
    end;
update(Role, _Q, _P) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidroom_grow97, _,
       {__Levelroom_grow97, __Tracesroom_grow97}}
	  when __Levelroom_grow97 band 8 /= 0 orelse
		 __Tracesroom_grow97 /= [] ->
	  lager:do_log(error,
		       [{module, room_grow}, {function, update}, {line, 97},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts]增加任务进度时异常:~w",
				     [Role#role.name, _P]),
		       none, 4096, 8, __Levelroom_grow97, __Tracesroom_grow97,
		       lager_event, __Pidroom_grow97);
      _ -> ok
    end,
    Role.

-spec do_finish(#role{}, pos_integer(),
		map()) -> #role{}.

do_finish(Role, Id, Cache) ->
    NRole1 = #role{m_room_grow =
		       M = #m_room_grow{finish = Finishs, doing = Quests}} =
		 to_log_info(Role, Id, Cache),
    FinishIds = calc_finish_ids(Id),
    NFinishs = FinishIds ++ Finishs,
    NQuests = [T
	       || T = #quest{id = IdT} <- Quests,
		  not lists:member(IdT, NFinishs)],
    DelQuest = Quests -- NQuests,
    NRole2 = del_quest(DelQuest, NRole1),
    {NewQuests, NewFinishs, NRole3} = case
					room_grow_data:get_is_repeat(Id)
					  of
					1 ->
					    #quest_data{progress = Progress} =
						room_grow_data:get(Id),
					    case room_grow_init:do(NRole2,
								   Progress, Id)
						of
					      Progress1 = [_ | _] ->
						  Finish = case [false
								 || #quest_progress{finish
											=
											0}
									<- Progress1]
							       of
							     [] -> 1;
							     _ -> 0
							   end,
						  NewQuest = #quest{id = Id,
								    finish =
									Finish,
								    progress =
									Progress1},
						  {NewQuestT, RoleT} =
						      quest:load_quest([NewQuest],
								       [],
								       room_grow,
								       NRole2),
						  {NewQuestT ++ NQuests,
						   lists:delete(Id, NFinishs),
						   RoleT};
					      _ERR ->
						  case {whereis(lager_event),
							whereis(lager_event),
							lager_config:get({lager_event,
									  loglevel},
									 {0,
									  []})}
						      of
						    {undefined, undefined, _} ->
							fun () ->
								{error,
								 lager_not_running}
							end();
						    {undefined, _, _} ->
							fun () ->
								{error,
								 {sink_not_configured,
								  lager_event}}
							end();
						    {__Pidroom_grow122, _,
						     {__Levelroom_grow122,
						      __Tracesroom_grow122}}
							when __Levelroom_grow122
							       band 8
							       /= 0
							       orelse
							       __Tracesroom_grow122
								 /= [] ->
							lager:do_log(error,
								     [{module,
								       room_grow},
								      {function,
								       do_finish},
								      {line,
								       122},
								      {pid,
								       pid_to_list(self())},
								      {node,
								       node()}
								      | lager:md()],
								     io_lib:format("~ts的成长之路重新加载~w任务时出错~w",
										   [Role#role.name,
										    Id,
										    _ERR]),
								     none, 4096,
								     8,
								     __Levelroom_grow122,
								     __Tracesroom_grow122,
								     lager_event,
								     __Pidroom_grow122);
						    _ -> ok
						  end,
						  {NQuests, NFinishs, NRole2}
					    end;
					_ -> {NQuests, NFinishs, NRole2}
				      end,
    NRole3#role{m_room_grow =
		    M#m_room_grow{finish = NewFinishs, doing = NewQuests}}.

calc_finish_ids(Id) ->
    case room_grow_data:get_group(Id) of
      {val_not_exist, _} -> [Id];
      {Group, Pro} ->
	  Ids = room_grow_data:get_id_by_group(Group),
	  [IdT || {IdT, Pro2} <- Ids, Pro2 =< Pro];
      _ -> [Id]
    end.

to_log_info(Role, Id, Cache) ->
    RandId = room_grow_data:get_rand_id(Id),
    case room_grow_data:get_rand_list(RandId) of
      RandList = [_ | _] ->
	  RecId = list_util:rand(RandList),
	  to_log(Role, RandId, RecId, Cache);
      _ -> Role
    end.

to_log(Role = #role{m_room_grow =
			M = #m_room_grow{info = List, next_id = Order}},
       RandId, RecId, Cache) ->
    Atoms = case room_grow_data:get_vals(RandId) of
	      AtomsT = [_ | _] ->
		  [Atom || Atom <- AtomsT, Atom =/= undefined];
	      _ -> []
	    end,
    Vals = to_log_vals(Role, Atoms, 1, Cache, []),
    Time = maps:get(time, Cache, date:unixtime()),
    Info = #room_grow{id = RecId, order = Order,
		      time = Time, arge = Vals},
    Role#role{m_room_grow =
		  M#m_room_grow{info = [Info | List],
				next_id = Order + 1}}.

to_log_vals(_Role, [], _, _Cache, L) -> L;
to_log_vals(Role = #role{name = Name},
	    [role_name | Atoms], Pos, Cache, L) ->
    to_log_vals(Role, Atoms, Pos + 1, Cache,
		[{Pos, Name} | L]);
to_log_vals(Role = #role{id = RoleId},
	    [best_power_rank | Atoms], Pos, Cache, L) ->
    Rank = rank:idx(6, RoleId),
    RankStr = util:if_true(Rank == 0,
			   lang:get(<<"999+"/utf8>>), integer_to_binary(Rank)),
    to_log_vals(Role, Atoms, Pos + 1, Cache,
		[{Pos, RankStr} | L]);
to_log_vals(Role, [Atom | Atoms], Pos, Cache, L) ->
    Val = util:to_binary(maps:get(Atom, Cache,
				  lang:get(<<"未知"/utf8>>))),
    to_log_vals(Role, Atoms, Pos + 1, Cache,
		[{Pos, Val} | L]).

do_ref_quest(Role = #role{m_room_grow =
			      #m_room_grow{doing = DoQuests}}) ->
    Role1 = del_quest(DoQuests, Role),
    DoQuests1 = quest_revise:do_list(Role1, room_grow,
				     DoQuests),
    Role2 = #role{m_room_grow =
		      #m_room_grow{finish = Finishs1, doing = DoQuests2}} =
		do_check_finish(Role1, DoQuests1, []),
    {Role3, DoQuests3} = add_new(Role2, Finishs1,
				 DoQuests2),
    Role4 = #role{m_room_grow =
		      #m_room_grow{doing = DoQuests4}} =
		do_check_finish(Role3, DoQuests3, []),
    {NewL, Role5 = #role{m_room_grow = M}} =
	quest:load_quest(lists:reverse(lists:keysort(#quest.id,
						     DoQuests4)),
			 [], room_grow, Role4),
    NewMLanterm = M#m_room_grow{doing = NewL},
    Role5#role{m_room_grow = NewMLanterm}.

do_check_finish(Role = #role{m_room_grow = M}, [],
		Quests) ->
    Role#role{m_room_grow = M#m_room_grow{doing = Quests}};
do_check_finish(Role = #role{m_room_grow =
				 M = #m_room_grow{finish = Finishs}},
		[Q = #quest{id = Id, finish = 1,
			    progress = [#quest_progress{ext_data = ExtData}]}
		 | DoQuests],
		Quests) ->
    NRole1 = Role,
    FinishIds = calc_finish_ids(Id),
    NFinishs = FinishIds ++ Finishs,
    NQuests = [T
	       || T = #quest{id = IdT} <- Quests,
		  not lists:member(IdT, NFinishs)],
    NRole = NRole1#role{m_room_grow =
			    M#m_room_grow{finish = NFinishs}},
    do_check_finish(NRole, DoQuests, NQuests);
do_check_finish(Role = #role{m_room_grow =
				 #m_room_grow{finish = Finishs}},
		[Q = #quest{id = Id} | DoQuests], Quests) ->
    case lists:member(Id, Finishs) of
      true -> do_check_finish(Role, DoQuests, Quests);
      _ -> do_check_finish(Role, DoQuests, [Q | Quests])
    end.

add_new(Role, Finishs, DoQuests) ->
    QuestList = room_grow_data:list(),
    Now = date:unixtime(),
    add_new2(QuestList, DoQuests, Finishs, Role, Now, []).

add_new2([], _OldQuest, _Finishs, Role, _Now, L) ->
    {Role, L};
add_new2([Id | Ids], OldQuest, Finishs,
	 Role = #role{m_room_grow =
			  M = #m_room_grow{finish = AllFinish}},
	 Now, L) ->
    case lists:member(Id, Finishs) of
      true -> add_new2(Ids, OldQuest, Finishs, Role, Now, L);
      _ ->
	  case lists:keyfind(Id, #quest.id, OldQuest) of
	    Q = #quest{} ->
		add_new2(Ids, OldQuest, Finishs, Role, Now, [Q | L]);
	    _ ->
		#quest_data{progress = Progress} =
		    room_grow_data:get(Id),
		case room_grow_init:do(Role, Progress, Id) of
		  Progress1 = [_ | _] ->
		      Finish = case [false
				     || #quest_progress{finish = 0}
					    <- Progress1]
				   of
				 [] -> 1;
				 _ -> 0
			       end,
		      NewQuest = #quest{id = Id, finish = Finish,
					progress = Progress1},
		      add_new2(Ids, OldQuest, Finishs, Role, Now,
			       [NewQuest | L]);
		  finish ->
		      add_new2(Ids, OldQuest, Finishs,
			       Role#role{m_room_grow =
					     M#m_room_grow{finish =
							       [Id
								| AllFinish]}},
			       Now, L);
		  {finish, Cache} ->
		      NRole = do_finish(Role, Id, Cache),
		      add_new2(Ids, OldQuest, Finishs, NRole, Now, L);
		  _ -> add_new2(Ids, OldQuest, Finishs, Role, Now, L)
		end
	  end
    end.

-spec del_quest([#quest{}], #role{}) -> #role{}.

del_quest([], Role) -> Role;
del_quest([#quest{progress = Progress} | Other],
	  Role) ->
    Tids = [Tid
	    || #quest_progress{finish = 0, trigger = Tid}
		   <- Progress,
	       is_tuple(Tid)],
    NewRole = role_trigger:del(Tids, Role),
    del_quest(Other, NewRole).


