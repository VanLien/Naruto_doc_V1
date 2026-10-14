-file("data/days_rank.erl", 1).

-file("src/mod/holiday_days_rank/days_rank.erl", 1).

-module(days_rank).

-lager_records([{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{m_days_rank, [ver, finish, doing, overdue]},
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

-export([init/0, login/1, flush/1, push_prog/2,
	 push_info/1, zero_flush/1, reward/2, data_mod/0]).

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

-file("src/mod/holiday_days_rank/days_rank.erl", 18).

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

-file("src/mod/holiday_days_rank/days_rank.erl", 19).

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

-file("src/mod/holiday_days_rank/days_rank.erl", 20).

-file("inc/days_rank.hrl", 1).

-record(m_days_rank,
	{ver = 1  :: pos_integer(),
	 finish = []  :: [{pos_integer(), pos_integer()}],
	 doing = []  :: [tuple()],
	 overdue = []  :: [pos_integer()]}).

-file("src/mod/holiday_days_rank/days_rank.erl", 21).

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

-file("src/mod/holiday_days_rank/days_rank.erl", 22).

-file("inc/log.hrl", 1).

-file("src/mod/holiday_days_rank/days_rank.erl", 23).

init() -> #m_days_rank{}.

-spec login(#role{}) -> {ok, #role{}}.

login(Role) ->
    Role1 = #role{m_days_ranks =
		      MDaysRanks = #m_days_rank{doing = Quests}} =
		overdue(Role),
    Quests1 = quest_revise:do_list(Role1, days_rank,
				   Quests),
    {NewQuests,
     NRole = #role{m_days_ranks =
		       #m_days_rank{finish = FinL}}} =
	quest:load_quest(Quests1, [], days_rank, Role1),
    NewRole = flush(NRole#role{m_days_ranks =
				   MDaysRanks#m_days_rank{doing = NewQuests,
							  finish = FinL}}),
    {ok, NewRole}.

-spec reward(#role{}, pos_integer()) -> {ok, #role{}} |
					{false, binary()}.

reward(Role = #role{m_days_ranks =
			#m_days_rank{doing = DoL, finish = FinL}},
       Id) ->
    case lists:keyfind(Id, #quest.id, DoL) of
      #quest{finish = 1} ->
	  case (data_mod()):get_quest_rewards(Id) of
	    RewardsCfg = [_ | _] ->
		Rewards = format:val_to_gain(RewardsCfg,
					     make_days_rank),
		case role_gain:do_notice(Role, Rewards,
					 #gain_loss_opts{type = 2})
		    of
		  {ok,
		   GainRole = #role{m_days_ranks =
					MDaysRank = #m_days_rank{doing = DoL1,
								 finish =
								     FinL1}}} ->
		      NewDoL = lists:keydelete(Id, #quest.id, DoL1),
		      FTime = date:unixtime(),
		      NewMDaysRank = MDaysRank#m_days_rank{doing = NewDoL,
							   finish =
							       [{Id, FTime}
								| FinL1]},
		      NewRole = GainRole#role{m_days_ranks = NewMDaysRank},
		      log:log_gain(Rewards, Role, NewRole, <<"七天排行"/utf8>>,
				   util:fbin("领取成就奖励:~w", [Id])),
		      {ok, NewRole};
		  {false, #gain{msg = Msg}} -> {false, Msg};
		  _ ->
		      {false,
		       lang:get(<<"Không thể nhận phần thưởng nhiệm vụ"/utf8>>)}
		end;
	    _ ->
		{false,
		 lang:get(<<"Dữ liệu nhiệm vụ không tồn tại"/utf8>>)}
	  end;
      #quest{finish = 0} ->
	  {false,
	   lang:get(<<"Nhiệm vụ chưa hoàn thành và không thể "
		      "nhận được phần thưởng"/utf8>>)};
      false ->
	  case lists:keyfind(Id, 1, FinL) of
	    false ->
		{false, lang:get(<<"Nhiệm vụ không tồn tại"/utf8>>)};
	    _ ->
		{false,
		 lang:get(<<"Phần thưởng đã được thu thập"/utf8>>)}
	  end;
      _ ->
	  {false, lang:get(<<"Nhiệm vụ không tồn tại"/utf8>>)}
    end.

-spec zero_flush(#role{}) -> #role{}.

zero_flush(Role) ->
    NRole = overdue(Role),
    NewRole = flush(NRole),
    push_info(NewRole),
    {ok, NewRole}.

-spec push_prog(#role{}, list()) -> ok.

push_prog(Role, Quests) ->
    role:pack_send(Role, 22702, {Quests}), ok.

-spec push_info(#role{}) -> ok.

push_info(Role = #role{m_days_ranks =
			   #m_days_rank{doing = DoL}}) ->
    role:pack_send(Role, 22703, {DoL}), ok.

-spec flush(#role{}) -> #role{}.

flush(Role) ->
    Date = date:unixtime(),
    List = days_rank_mgr:list(0),
    List2 =
	lists:flatten([(data_mod()):get_quest_ids(RankId)
		       || {RankId, EndTime} <- List, EndTime > Date]),
    NRole = calc_can_do(List2, Role),
    NRole.

calc_can_do([], Role) -> Role;
calc_can_do([Id | T], Role) ->
    NRole = case (data_mod()):get_quest(Id) of
	      Data = #quest_data{} ->
		  do_calc_can_do([lev, finish, doing, condition, add],
				 Role, Data);
	      _ ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Piddays_rank110, _,
		     {__Leveldays_rank110, __Tracesdays_rank110}}
			when __Leveldays_rank110 band 8 /= 0 orelse
			       __Tracesdays_rank110 /= [] ->
			lager:do_log(error,
				     [{module, days_rank},
				      {function, calc_can_do}, {line, 110},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("[~ts]没有成就数据:~w",
						   [Role#role.name, Id]),
				     none, 4096, 8, __Leveldays_rank110,
				     __Tracesdays_rank110, lager_event,
				     __Piddays_rank110);
		    _ -> ok
		  end,
		  Role
	    end,
    calc_can_do(T, NRole).

do_calc_can_do([], Role, _Data) -> Role;
do_calc_can_do([Label | T], Role, Data) ->
    case do_calc_can_do(Label, Role, Data) of
      true -> do_calc_can_do(T, Role, Data);
      {ok, NRole} -> do_calc_can_do(T, NRole, Data);
      _ -> Role
    end;
do_calc_can_do(finish,
	       #role{m_days_ranks =
			 #m_days_rank{finish = FinL, overdue = OverL}},
	       #quest_data{id = Id}) ->
    lists:keyfind(Id, 1, FinL) =:= false andalso
      lists:member(Id, OverL) =:= false;
do_calc_can_do(doing,
	       #role{m_days_ranks = #m_days_rank{doing = DoL}},
	       #quest_data{id = Id}) ->
    lists:keyfind(Id, #quest.id, DoL) =:= false;
do_calc_can_do(lev, #role{lev = Lev},
	       #quest_data{lev = MinLev}) ->
    Lev >= MinLev;
do_calc_can_do(condition, Role,
	       #quest_data{condition = Conds}) ->
    role_cond:check(Conds, Role) =:= true;
do_calc_can_do(add,
	       Role = #role{m_days_ranks =
				MDaysRank = #m_days_rank{doing = DoL}},
	       #quest_data{id = Id, progress = Progress,
			   end_time = EndT}) ->
    Progress1 = quest_prog_init:do(Role, Progress, Id),
    Finish = case [false
		   || #quest_progress{finish = 0} <- Progress1]
		 of
	       [] -> 1;
	       _ -> 0
	     end,
    {NewProgress, Role1} = quest:load_progress(Progress1,
					       days_rank, Id, [], Role),
    NewEndT = case EndT > 0 of
		true -> date:unixtime(zero) + EndT;
		_ -> 0
	      end,
    NewQuest = #quest{id = Id, finish = Finish,
		      progress = NewProgress, end_time = NewEndT},
    NRole = Role1#role{m_days_ranks =
			   MDaysRank#m_days_rank{doing = [NewQuest | DoL]}},
    {ok, NRole}.

overdue(Role = #role{m_days_ranks =
			 MDaysRanks = #m_days_rank{doing = Quests,
						   overdue = Overdues}}) ->
    NewQuests = [Quest
		 || Quest = #quest{id = Id, finish = Finish} <- Quests,
		    Finish =:= 1 orelse check_open(Id)],
    AddOverdues = [Quest
		   || Quest = #quest{id = Id, finish = 0} <- Quests,
		      check_open(Id) =:= false],
    Role#role{m_days_ranks =
		  MDaysRanks#m_days_rank{doing = NewQuests,
					 overdue = Overdues ++ AddOverdues}}.

check_open(Id) ->
    RankId = (data_mod()):get_quest_rank_id(Id),
    List = days_rank_mgr:list(0),
    Date = date:unixtime(),
    case lists:keyfind(RankId, 1, List) of
      {_, EndTime} when EndTime >= Date -> true;
      _ -> false
    end.

data_mod() -> days_rank_data.


