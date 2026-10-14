-file("src/mod/guild_secret_area/guild_secret_area_r"
      "ank.erl",
      1).

-module(guild_secret_area_rank).

-lager_records([{map_role,
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
		{g_mem_red_packet,
		 [id, rid, name, face_id, avatar_bid, post, type, num,
		  max_num, val, max_val, list, mems, start_time, end_time,
		  msg_id, face_update_time, face_file]},
		{guild_data, [lev, exp, num, maintain]},
		{guild_position, [id, name, limit]},
		{g_merge,
		 [gid, gname, gid2, gname2, role_id, rname, end_time,
		  gold]},
		{guild_rank,
		 [id, name, lev, exp, leader_name, leader_id,
		  leader_face, leader_lev, members_num, members_max,
		  apply_lev, apply_type, create_time, power, index,
		  leader_avatar_bid, leader_look_id,
		  leader_face_update_time, leader_face_file,
		  apply_power]},
		{guild_apply,
		 [gid, id, pid, name, face, lev, power, post, vip_lev,
		  online, apply_time, face_update_time, face_file]},
		{guild_member,
		 [ver, id, pid, name, face, lev, sex, power, post,
		  vip_lev, online, join_time, login_time, donate,
		  day_donate, avatar_bid, red_packet_num,
		  red_packet_price, red_packet_time, red_packet_recv_num,
		  red_packet_recv_time, active_lev, day_donate_type,
		  day_donate_time, day_dun_time, day_war_time, look_id,
		  face_update_time, face_file]},
		{guild_war_box,
		 [order, rid, sid, name, item_id, item_num]},
		{guild_cache, []},
		{guild,
		 [ver, id, name, lev, exp, day_exp, pid, leader_name,
		  leader_id, members, members_num, members_max, next_id,
		  sign, apply_lev, apply_type, recruit_num, cache, sync,
		  create_time, power, rename_time, lock_time, donate_exp,
		  red_packet, guild_war_box_end_time, guild_war_relust,
		  guild_war_box, guild_war_sign, day_var,
		  vice_leader_mail, normal_mail, vitality, apply_power]},
		{guild_bag,
		 [ver, id, pid, name, post, lev, join_time, quit_time,
		  send_time, send_num, recv_num, true_quit_time,
		  quit_post]},
		{guild_log_info,
		 [id, guild_id, type, time, role_id, role_name, msg]},
		{guild_log, [key, list]},
		{guild_secret_area_rank, [ver, id, rank_detail]},
		{secret_rank, [ver, number, chapter_id, dps_list]},
		{role_rank,
		 [ver, r_id, lev, face_id, avatar_bid, name, dps, rank,
		  max_dps, power, face_update_time, face_file]},
		{guild_secret_area,
		 [ver, id, boss_detail, boss_list, number,
		  fail_boss_list, last_crusade]},
		{boss_detail,
		 [ver, bid, hp, max_hp, end_time, count_time,
		  kill_time]},
		{state, []}]).

-behaviour(gen_server).

-export([update_guild_secret_rank/1,
	 get_guild_secret_rank/1, get_guild_secret_dps_list/2,
	 reward_count/2]).

-export([call_apply/1, apply/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state, {}).

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

-file("src/mod/guild_secret_area/guild_secret_area_r"
      "ank.erl",
      19).

-file("inc/guild_secret_area.hrl", 1).

-record(boss_detail,
	{ver = 2  :: pos_integer(), bid = 0  :: pos_integer(),
	 hp = 0  :: pos_integer(), max_hp = 0  :: pos_integer(),
	 end_time = 0  :: pos_integer(),
	 count_time = 0  :: pos_integer(),
	 kill_time = 0  :: pos_integer()}).

-record(guild_secret_area,
	{ver = 2  :: pos_integer(),
	 id = {0, <<>>}  :: {pos_integer(), binary()},
	 boss_detail = #boss_detail{}  :: tuple(),
	 boss_list = []  :: list(), number = 0  :: pos_integer(),
	 fail_boss_list = []  :: pos_integer(),
	 last_crusade = 0  :: pos_integer()}).

-record(role_rank,
	{ver = 2  :: pos_integer(),
	 r_id = {0, <<>>}  :: tuple(), lev = 0  :: pos_integer(),
	 face_id = 0  :: pos_integer(),
	 avatar_bid = 0  :: pos_integer(),
	 name = <<>>  :: string(), dps = 0  :: pos_integer(),
	 rank = 0  :: pos_integer(),
	 max_dps = 0  :: pos_integer(),
	 power = 0  :: pos_integer(),
	 face_update_time = 0  :: pos_integer(),
	 face_file = <<>>  :: string()}).

-record(secret_rank,
	{ver = 1  :: pos_integer(),
	 number = 0  :: pos_integer(),
	 chapter_id = 0  :: pos_integer(),
	 dps_list = []  :: list()}).

-record(guild_secret_area_rank,
	{ver = 1  :: pos_integer(),
	 id = {0, <<>>}  :: {pos_integer(), binary()},
	 rank_detail = []  :: list()}).

-file("src/mod/guild_secret_area/guild_secret_area_r"
      "ank.erl",
      20).

-file("inc/guild.hrl", 1).

-record(guild_log, {key = {0, <<>>}, list = []}).

-record(guild_log_info,
	{id = 0, guild_id = {0, <<>>}, type = 0, time = 0,
	 role_id = {0, <<>>}, role_name = 0, msg = <<>>}).

-record(guild_bag,
	{ver = 2, id = {0, <<>>}, pid, name = <<>>, post = 0,
	 lev = 0, join_time = 0, quit_time = 0, send_time = 0,
	 send_num = 0, recv_num = 0, true_quit_time = 0,
	 quit_post = 0}).

-record(guild,
	{ver = 7, id = {0, <<>>}, name = <<>>, lev = 1, exp = 0,
	 day_exp = 0, pid = 0, leader_name = <<>>,
	 leader_id = {0, <<>>}, members = [], members_num = 1,
	 members_max = 50, next_id = 1, sign = <<>>,
	 apply_lev = guild_data:get_const(guild_min_lev),
	 apply_type = 1, recruit_num = 0, cache, sync = 0,
	 create_time = 0, power = 0, rename_time = 0,
	 lock_time = 0, donate_exp = 0, red_packet = [],
	 guild_war_box_end_time = 0, guild_war_relust = 0,
	 guild_war_box = [], guild_war_sign = [], day_var = [],
	 vice_leader_mail = 0, normal_mail = 0, vitality = 0,
	 apply_power = 0}).

-record(guild_cache, {}).

-record(guild_war_box,
	{order = 0, rid = 0, sid = <<>>, name = <<>>,
	 item_id = 0, item_num = 0}).

-record(guild_member,
	{ver = 6, id = {0, <<>>}, pid = 0, name = <<>>,
	 face = 0, lev = 0, sex = 1, power = 0, post = 0,
	 vip_lev = 0, online = 1, join_time = 0, login_time = 0,
	 donate = 0, day_donate = 0, avatar_bid = 0,
	 red_packet_num = 0, red_packet_price = 0,
	 red_packet_time = 0, red_packet_recv_num = 0,
	 red_packet_recv_time = 0, active_lev = 0,
	 day_donate_type = 0, day_donate_time = 0,
	 day_dun_time = 0, day_war_time = 0, look_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(guild_apply,
	{gid = {0, <<>>}, id = {0, <<>>}, pid = 0, name = <<>>,
	 face = 0, lev = 0, power = 0, post = 0, vip_lev = 0,
	 online = 1, apply_time = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(guild_rank,
	{id = {0, <<>>}, name = <<>>, lev = 1, exp = 0,
	 leader_name = <<>>, leader_id = {0, <<>>},
	 leader_face = 0, leader_lev = 0, members_num = 1,
	 members_max = 50, apply_lev = 0, apply_type = 1,
	 create_time = 0, power = 0, index = 0,
	 leader_avatar_bid = 0, leader_look_id = 0,
	 leader_face_update_time = 0, leader_face_file = <<>>,
	 apply_power = 0}).

-record(g_merge,
	{gid = {0, <<>>}, gname = <<>>, gid2 = {0, <<>>},
	 gname2 = <<>>, role_id = {0, <<>>}, rname = <<>>,
	 end_time = 0, gold = 0}).

-record(guild_position,
	{id = 0, name = <<>>, limit = []}).

-record(guild_data,
	{lev = 0, exp = 0, num = 0, maintain = 0}).

-record(g_mem_red_packet,
	{id = {{0, <<>>}, 0}, rid = {0, <<>>}, name = <<>>,
	 face_id = 0, avatar_bid = 0, post = <<>>, type = 0,
	 num = 0, max_num = 0, val = 0, max_val = 0, list = [],
	 mems = [], start_time = 0, end_time = 0, msg_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-file("src/mod/guild_secret_area/guild_secret_area_r"
      "ank.erl",
      21).

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

-file("src/mod/guild_secret_area/guild_secret_area_r"
      "ank.erl",
      22).

-file("inc/log.hrl", 1).

-file("src/mod/guild_secret_area/guild_secret_area_r"
      "ank.erl",
      23).

-spec
     get_guild_secret_rank(tuple()) -> #guild_secret_area_rank{}.

get_guild_secret_rank(Id) ->
    case catch ets:lookup(guild_secret_area_rank, Id) of
      [SA = #guild_secret_area_rank{}] -> SA;
      _ -> false
    end.

-spec get_guild_secret_dps_list(tuple(),
				pos_integer()) -> list().

get_guild_secret_dps_list(Id, BossId) ->
    case catch ets:lookup(guild_secret_area_rank, Id) of
      [#guild_secret_area_rank{rank_detail =
				   SecretRankList}] ->
	  case guild_secret_area_data:get_pass_id(BossId) of
	    PassId when is_integer(PassId) ->
		case lists:keyfind(PassId, #secret_rank.chapter_id,
				   SecretRankList)
		    of
		  #secret_rank{dps_list = DpsList} ->
		      NewDpsList = lists:keysort(#role_rank.rank, DpsList),
		      NewDpsList;
		  _ -> false
		end;
	    _ -> false
	  end;
      _ -> false
    end.

-spec update_guild_secret_rank(pos_integer()) -> ok.

update_guild_secret_rank(Data) ->
    ets:insert(guild_secret_area_rank, Data),
    dets:insert(guild_secret_area_rank, Data).

-spec reward_count(#role{},
		   {pos_integer(), pos_integer(), pos_integer(),
		    pos_integer()}) -> {ok, #role{}} | ok.

reward_count(Role,
	     {BossId, Rank, KillTime, Flag, PutItemList, EndTime}) ->
    case guild_secret_area_data:get_rank_reward({BossId,
						 Rank})
	of
      RewardList when is_list(RewardList) ->
	  case guild_secret_area_data:get_boss(BossId) of
	    {_, DoTime, _} ->
		LastTime = max(0, EndTime - KillTime),
		UseTime = max(0, DoTime - LastTime),
		guild_secret_area_lib:push(26808, Role,
					   {Flag, UseTime, PutItemList,
					    RewardList}),
		ok;
	    _ -> ok
	  end;
      _ -> ok
    end.

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> guild_secret_area_rank ! Info.

cast(Info) ->
    gen_server:cast(guild_secret_area_rank, Info).

call(Info) ->
    case catch gen_server:call(guild_secret_area_rank, Info,
			       10000)
	of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_secret_area_rank104, _,
	     {__Levelguild_secret_area_rank104,
	      __Tracesguild_secret_area_rank104}}
		when __Levelguild_secret_area_rank104 band 8 /= 0 orelse
		       __Tracesguild_secret_area_rank104 /= [] ->
		lager:do_log(error,
			     [{module, guild_secret_area_rank},
			      {function, call}, {line, 104},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [guild_secret_area_rank, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelguild_secret_area_rank104,
			     __Tracesguild_secret_area_rank104, lager_event,
			     __Pidguild_secret_area_rank104);
	    _ -> ok
	  end,
	  case _Call_Err of
	    {timeout, _} -> {error, timeout};
	    {noproc, _} -> {error, noproc};
	    {normal, _} -> {error, exit};
	    _ -> {error, _Call_Err}
	  end;
      _Call_Return -> _Call_Return
    end.

start_link() ->
    gen_server:start_link({local, guild_secret_area_rank},
			  guild_secret_area_rank, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_secret_area_rank110, _,
       {__Levelguild_secret_area_rank110,
	__Tracesguild_secret_area_rank110}}
	  when __Levelguild_secret_area_rank110 band 64 /= 0
		 orelse __Tracesguild_secret_area_rank110 /= [] ->
	  lager:do_log(info,
		       [{module, guild_secret_area_rank}, {function, init},
			{line, 110}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [guild_secret_area_rank]),
		       none, 4096, 64, __Levelguild_secret_area_rank110,
		       __Tracesguild_secret_area_rank110, lager_event,
		       __Pidguild_secret_area_rank110);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(guild_secret_area_rank,
		   [{file, "./dets/guild_secret_area_rank.dets"},
		    {keypos, #guild_secret_area_rank.id}]),
    ets:new(guild_secret_area_rank,
	    [set, named_table, public,
	     {keypos, #guild_secret_area_rank.id}]),
    load_data(),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_secret_area_rank116, _,
       {__Levelguild_secret_area_rank116,
	__Tracesguild_secret_area_rank116}}
	  when __Levelguild_secret_area_rank116 band 64 /= 0
		 orelse __Tracesguild_secret_area_rank116 /= [] ->
	  lager:do_log(info,
		       [{module, guild_secret_area_rank}, {function, init},
			{line, 116}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [guild_secret_area_rank]),
		       none, 4096, 64, __Levelguild_secret_area_rank116,
		       __Tracesguild_secret_area_rank116, lager_event,
		       __Pidguild_secret_area_rank116);
      _ -> ok
    end,
    {ok, State}.

handle_call(Request, From, State) ->
    case catch do_handle_call(Request, From, State) of
      {reply, Reply, NewState} -> {reply, Reply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_secret_area_rank141, _,
	     {__Levelguild_secret_area_rank141,
	      __Tracesguild_secret_area_rank141}}
		when __Levelguild_secret_area_rank141 band 8 /= 0 orelse
		       __Tracesguild_secret_area_rank141 /= [] ->
		lager:do_log(error,
			     [{module, guild_secret_area_rank},
			      {function, handle_call}, {line, 141},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelguild_secret_area_rank141,
			     __Tracesguild_secret_area_rank141, lager_event,
			     __Pidguild_secret_area_rank141);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    guild_secret_area_rank, 142, _Reason}),
	  {reply, {false, lang:get(<<"执行出错"/utf8>>)}, State}
    end.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({in_rank, RoleGid, RoleNumber, RId, Dps,
	     Name, Lev, FaceId, AvatarBid, Power, FaceUpdateTime,
	     FaceFile},
	    State) ->
    do_in_rank(RoleGid, RoleNumber, RId, Dps, Name, Lev,
	       FaceId, AvatarBid, Power, FaceUpdateTime, FaceFile),
    {noreply, State};
handle_info({crusade, BossId, Gid, Number}, State) ->
    case get_guild_secret_rank(Gid) of
      Rank = #guild_secret_area_rank{rank_detail =
					 DetailList} ->
	  case guild_secret_area_data:get_pass_id(BossId) of
	    PassId when is_integer(PassId) ->
		SecretRank = #secret_rank{number = Number,
					  chapter_id = PassId, dps_list = []},
		NewDetailList = lists:keystore(PassId,
					       #secret_rank.chapter_id,
					       DetailList, SecretRank),
		NewRank = Rank#guild_secret_area_rank{id = Gid,
						      rank_detail =
							  NewDetailList},
		update_guild_secret_rank(NewRank);
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidguild_secret_area_rank165, _,
		   {__Levelguild_secret_area_rank165,
		    __Tracesguild_secret_area_rank165}}
		      when __Levelguild_secret_area_rank165 band 8 /= 0 orelse
			     __Tracesguild_secret_area_rank165 /= [] ->
		      lager:do_log(error,
				   [{module, guild_secret_area_rank},
				    {function, handle_info}, {line, 165},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   "公会秘境Boss信息配置错误", none, 4096, 8,
				   __Levelguild_secret_area_rank165,
				   __Tracesguild_secret_area_rank165,
				   lager_event, __Pidguild_secret_area_rank165);
		  _ -> ok
		end,
		SecretRank = #secret_rank{number = Number,
					  chapter_id = 0, dps_list = []},
		NewDetailList = lists:keystore(0,
					       #secret_rank.chapter_id,
					       DetailList, SecretRank),
		Rank = #guild_secret_area_rank{id = Gid,
					       rank_detail = NewDetailList},
		update_guild_secret_rank(Rank)
	  end;
      _ ->
	  case guild_secret_area_data:get_pass_id(BossId) of
	    PassId when is_integer(PassId) ->
		SecretRank = #secret_rank{number = Number,
					  chapter_id = PassId},
		Rank = #guild_secret_area_rank{id = Gid,
					       rank_detail = [SecretRank]},
		update_guild_secret_rank(Rank);
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidguild_secret_area_rank179, _,
		   {__Levelguild_secret_area_rank179,
		    __Tracesguild_secret_area_rank179}}
		      when __Levelguild_secret_area_rank179 band 8 /= 0 orelse
			     __Tracesguild_secret_area_rank179 /= [] ->
		      lager:do_log(error,
				   [{module, guild_secret_area_rank},
				    {function, handle_info}, {line, 179},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   "公会秘境Boss信息配置错误", none, 4096, 8,
				   __Levelguild_secret_area_rank179,
				   __Tracesguild_secret_area_rank179,
				   lager_event, __Pidguild_secret_area_rank179);
		  _ -> ok
		end,
		SecretRank = #secret_rank{number = Number,
					  chapter_id = 0},
		Rank = #guild_secret_area_rank{id = Gid,
					       rank_detail = [SecretRank]},
		update_guild_secret_rank(Rank)
	  end
    end,
    {noreply, State};
handle_info({count_over, Gid, BossId, KillTime,
	     PutItemList, Flag, EndTime},
	    State) ->
    case
      guild_secret_area_rank:get_guild_secret_dps_list(Gid,
						       BossId)
	of
      DpsList when is_list(DpsList) ->
	  case guild_lib:elem(Gid, #guild.members) of
	    {ok, Members = [_ | _]} ->
		{PidList, IdList} = filtrate_pid(DpsList, Members, [],
						 []),
		[role:apply(async, RolePid,
			    {guild_secret_area_rank, reward_count,
			     [{BossId, Rank, KillTime, Flag, PutItemList,
			       EndTime}]})
		 || {RolePid, Rank} <- PidList],
		reward_count_mail(IdList, BossId);
	    _ -> skip
	  end;
      _ -> skip
    end,
    {noreply, State};
handle_info(Info, State) ->
    case catch do_handle_info(Info, State) of
      {noreply, NewState} -> {noreply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_secret_area_rank207, _,
	     {__Levelguild_secret_area_rank207,
	      __Tracesguild_secret_area_rank207}}
		when __Levelguild_secret_area_rank207 band 8 /= 0 orelse
		       __Tracesguild_secret_area_rank207 /= [] ->
		lager:do_log(error,
			     [{module, guild_secret_area_rank},
			      {function, handle_info}, {line, 207},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelguild_secret_area_rank207,
			     __Tracesguild_secret_area_rank207, lager_event,
			     __Pidguild_secret_area_rank207);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    guild_secret_area_rank, 208, _Reason}),
	  {noreply, State}
    end.

terminate(_Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_secret_area_rank213, _,
       {__Levelguild_secret_area_rank213,
	__Tracesguild_secret_area_rank213}}
	  when __Levelguild_secret_area_rank213 band 64 /= 0
		 orelse __Tracesguild_secret_area_rank213 /= [] ->
	  lager:do_log(info,
		       [{module, guild_secret_area_rank},
			{function, terminate}, {line, 213},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64,
		       __Levelguild_secret_area_rank213,
		       __Tracesguild_secret_area_rank213, lager_event,
		       __Pidguild_secret_area_rank213);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_handle_call({apply, M, F, A}, _From, State) ->
    case util:exec_fun(M, F, [State | A]) of
      {ok, Reply, NewState} -> {reply, Reply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_secret_area_rank225, _,
	     {__Levelguild_secret_area_rank225,
	      __Tracesguild_secret_area_rank225}}
		when __Levelguild_secret_area_rank225 band 8 /= 0 orelse
		       __Tracesguild_secret_area_rank225 /= [] ->
		lager:do_log(error,
			     [{module, guild_secret_area_rank},
			      {function, do_handle_call}, {line, 225},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelguild_secret_area_rank225,
			     __Tracesguild_secret_area_rank225, lager_event,
			     __Pidguild_secret_area_rank225);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    guild_secret_area_rank, 226, _Reason}),
	  {reply, {false, lang:get(<<"执行错误"/utf8>>)}, State}
    end;
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_info({apply, M, F, A}, State) ->
    case util:exec_fun(M, F, [State | A]) of
      {ok, NewState} -> {noreply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_secret_area_rank239, _,
	     {__Levelguild_secret_area_rank239,
	      __Tracesguild_secret_area_rank239}}
		when __Levelguild_secret_area_rank239 band 8 /= 0 orelse
		       __Tracesguild_secret_area_rank239 /= [] ->
		lager:do_log(error,
			     [{module, guild_secret_area_rank},
			      {function, do_handle_info}, {line, 239},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelguild_secret_area_rank239,
			     __Tracesguild_secret_area_rank239, lager_event,
			     __Pidguild_secret_area_rank239);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    guild_secret_area_rank, 240, _Reason}),
	  {noreply, State}
    end;
do_handle_info(_Info, State) -> {noreply, State}.

rank_dps(DpsList) ->
    DpsList1 = lists:reverse(lists:keysort(#role_rank.dps,
					   DpsList)),
    NewDpsList = do_rank_dps(DpsList1, 1, []),
    NewDpsList.

do_rank_dps([], _, DpsList) -> DpsList;
do_rank_dps([RoleRank = #role_rank{} | Rest], Rank,
	    DpsList) ->
    do_rank_dps(Rest, Rank + 1,
		[RoleRank#role_rank{rank = Rank} | DpsList]);
do_rank_dps(_, _, DpsList) -> DpsList.

filtrate_pid([], _, OldPidList, OldIdList) ->
    {OldPidList, OldIdList};
filtrate_pid([#role_rank{r_id = Id, rank = Rank}
	      | Rest],
	     Members, OldPidList, OldIdList) ->
    case lists:keyfind(Id, #guild_member.id, Members) of
      #guild_member{pid = Pid} when is_pid(Pid) ->
	  filtrate_pid(Rest, Members, [{Pid, Rank} | OldPidList],
		       [{Id, Rank} | OldIdList]);
      #guild_member{} ->
	  filtrate_pid(Rest, Members, OldPidList,
		       [{Id, Rank} | OldIdList]);
      _ -> filtrate_pid(Rest, Members, OldPidList, OldIdList)
    end;
filtrate_pid(_, _, OldPidList, OldIdList) ->
    {OldPidList, OldIdList}.

reward_count_mail([], _) -> ok;
reward_count_mail([{Id, Rank} | Rest], BossId) ->
    case guild_secret_area_data:get_rank_reward({BossId,
						 Rank})
	of
      RewardList when is_list(RewardList) ->
	  mail:send(Id,
		    {lang:get(<<"公会秘境结算排名奖励"/utf8>>),
		     color:msg(lang:get(<<"尊敬的冒险者，您在本次公会秘境排行榜中获得第~ts名的名次，获得下列的排名奖励！请再接再厉"
					  "！ヾ（≧∇≦）〃"/utf8>>),
			       [{green, Rank}]),
		     items, RewardList, <<"公会秘境"/utf8>>}),
	  reward_count_mail(Rest, BossId);
      _ -> reward_count_mail(Rest, BossId)
    end;
reward_count_mail(_, _) -> ok.

do_in_rank(RoleGid, RoleNumber, RId, Dps, Name, Lev,
	   FaceId, AvatarBid, Power, FaceUpdateTime, FaceFile) ->
    case get_guild_secret_rank(RoleGid) of
      Rank = #guild_secret_area_rank{rank_detail =
					 DetailList} ->
	  case lists:keyfind(RoleNumber, #secret_rank.number,
			     DetailList)
	      of
	    SecretRank = #secret_rank{dps_list = DpsList} ->
		case lists:keyfind(RId, #role_rank.r_id, DpsList) of
		  RoleRank = #role_rank{dps = OldDps,
					max_dps = OldMaxDps} ->
		      NewDps = OldDps + Dps,
		      NewMaxDps = case Dps > OldMaxDps of
				    true -> Dps;
				    _ -> OldMaxDps
				  end,
		      NewRoleRank = RoleRank#role_rank{lev = Lev,
						       face_id = FaceId,
						       avatar_bid = AvatarBid,
						       name = Name,
						       power = Power,
						       dps = NewDps,
						       max_dps = NewMaxDps,
						       face_update_time =
							   FaceUpdateTime,
						       face_file = FaceFile},
		      DpsList1 = lists:keystore(RId, #role_rank.r_id, DpsList,
						NewRoleRank),
		      NewDpsList = rank_dps(DpsList1),
		      NewSecretRank = SecretRank#secret_rank{dps_list =
								 NewDpsList},
		      NewDetailList = lists:keystore(RoleNumber,
						     #secret_rank.number,
						     DetailList, NewSecretRank),
		      NewRank = Rank#guild_secret_area_rank{rank_detail =
								NewDetailList},
		      update_guild_secret_rank(NewRank);
		  _ ->
		      DpsList1 = lists:keystore(RId, #role_rank.r_id, DpsList,
						#role_rank{r_id = RId,
							   lev = Lev,
							   face_id = FaceId,
							   avatar_bid =
							       AvatarBid,
							   name = Name,
							   dps = Dps,
							   max_dps = Dps,
							   power = Power,
							   face_update_time =
							       FaceUpdateTime,
							   face_file =
							       FaceFile}),
		      NewDpsList = rank_dps(DpsList1),
		      NewSecretRank = SecretRank#secret_rank{dps_list =
								 NewDpsList},
		      NewDetailList = lists:keystore(RoleNumber,
						     #secret_rank.number,
						     DetailList, NewSecretRank),
		      NewRank = Rank#guild_secret_area_rank{rank_detail =
								NewDetailList},
		      update_guild_secret_rank(NewRank)
		end;
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidguild_secret_area_rank323, _,
		   {__Levelguild_secret_area_rank323,
		    __Tracesguild_secret_area_rank323}}
		      when __Levelguild_secret_area_rank323 band 8 /= 0 orelse
			     __Tracesguild_secret_area_rank323 /= [] ->
		      lager:do_log(error,
				   [{module, guild_secret_area_rank},
				    {function, do_in_rank}, {line, 323},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   "公会秘境排行榜数据缺失", none, 4096, 8,
				   __Levelguild_secret_area_rank323,
				   __Tracesguild_secret_area_rank323,
				   lager_event, __Pidguild_secret_area_rank323);
		  _ -> ok
		end,
		skip
	  end;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_secret_area_rank327, _,
	     {__Levelguild_secret_area_rank327,
	      __Tracesguild_secret_area_rank327}}
		when __Levelguild_secret_area_rank327 band 8 /= 0 orelse
		       __Tracesguild_secret_area_rank327 /= [] ->
		lager:do_log(error,
			     [{module, guild_secret_area_rank},
			      {function, do_in_rank}, {line, 327},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "公会秘境排行榜数据缺失", none, 4096, 8,
			     __Levelguild_secret_area_rank327,
			     __Tracesguild_secret_area_rank327, lager_event,
			     __Pidguild_secret_area_rank327);
	    _ -> ok
	  end,
	  skip
    end.

load_data() ->
    case dets:first(guild_secret_area_rank) of
      '$end_of_table' ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_secret_area_rank336, _,
	     {__Levelguild_secret_area_rank336,
	      __Tracesguild_secret_area_rank336}}
		when __Levelguild_secret_area_rank336 band 64 /= 0
		       orelse __Tracesguild_secret_area_rank336 /= [] ->
		lager:do_log(info,
			     [{module, guild_secret_area_rank},
			      {function, load_data}, {line, 336},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "没有数据需要加载", none, 4096, 64,
			     __Levelguild_secret_area_rank336,
			     __Tracesguild_secret_area_rank336, lager_event,
			     __Pidguild_secret_area_rank336);
	    _ -> ok
	  end,
	  [];
      _ ->
	  dets:traverse(guild_secret_area_rank,
			fun (C) ->
				case guild_secret_area_ver:do_rank(C) of
				  {false, Reason} ->
				      case {whereis(lager_event),
					    whereis(lager_event),
					    lager_config:get({lager_event,
							      loglevel},
							     {0, []})}
					  of
					{undefined, undefined, _} ->
					    fun () -> {error, lager_not_running}
					    end();
					{undefined, _, _} ->
					    fun () ->
						    {error,
						     {sink_not_configured,
						      lager_event}}
					    end();
					{__Pidguild_secret_area_rank343, _,
					 {__Levelguild_secret_area_rank343,
					  __Tracesguild_secret_area_rank343}}
					    when
					      __Levelguild_secret_area_rank343
						band 8
						/= 0
						orelse
						__Tracesguild_secret_area_rank343
						  /= [] ->
					    lager:do_log(error,
							 [{module,
							   guild_secret_area_rank},
							  {function, load_data},
							  {line, 343},
							  {pid,
							   pid_to_list(self())},
							  {node, node()}
							  | lager:md()],
							 io_lib:format("公会秘境排行榜数据转换失败:~w",
								       [Reason]),
							 none, 4096, 8,
							 __Levelguild_secret_area_rank343,
							 __Tracesguild_secret_area_rank343,
							 lager_event,
							 __Pidguild_secret_area_rank343);
					_ -> ok
				      end,
				      {done, false};
				  {ok, NewC} ->
				      update_guild_secret_rank(NewC), continue
				end
			end)
    end.


