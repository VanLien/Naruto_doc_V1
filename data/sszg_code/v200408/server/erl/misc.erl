-file("src/mod/misc/misc.erl", 1).

-module(misc).

-lager_records([{triple_rebate_data,
		 [id, charge_sum, reward_times, mail_title,
		  mail_content]},
		{charge_data,
		 [id, name, val, gold, first_add, add, vip_exp, pic,
		  is_show, is_iosverify, type, items]},
		{m_charge,
		 [ver, charge_list, first_gift, triple_rebate_list,
		  merge_count, merge_charge_list, day_gift, week_refresh,
		  week_gift, month_refresh, month_gift, day_first_gift,
		  first_gift_ver, choose_first_gift_status,
		  reset_charge_list, warehouse_charge_list]},
		{holiday,
		 [camp_id, total_id, bid, tbid, cli_type, cli_type_name,
		  start_time, end_time, condition, type, title, title2,
		  main_ico, ico, type_ico, top_banner, rule_str, time_str,
		  bottom_alert, sort_val, reward_title, aim_title, reward,
		  item_effect, mail_subject, mail_content, cli_reward,
		  panel_type, open_day, open_day_min, open_day_max,
		  merge_day, process_show_reward, platform_id,
		  platform_exclude_id, hide_srv_ids, channel_ban]},
		{holiday_total,
		 [id, name, icon_id, start_time, end_time, status,
		  open_day, merge_day, is_show, type]},
		{avatar_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{avatar_frame, [ver, base_id, expire_time]},
		{m_avatar, [ver, used, frames]},
		{s_timer, [ref, timers]}, {rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
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

-export([gm/2, login/1, push_time_reward/1,
	 get_time_reward/2, apply_timer/1, five_data_to_zero/3,
	 get_holiday_token/2, get_pay_url/3]).

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

-file("src/mod/misc/misc.erl", 17).

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

-file("src/mod/misc/misc.erl", 18).

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

-file("src/mod/misc/misc.erl", 19).

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

-file("src/mod/misc/misc.erl", 20).

-file("inc/log.hrl", 1).

-file("src/mod/misc/misc.erl", 21).

-file("inc/timer.hrl", 1).

-record(timer,
	{id  :: term(), timeout = 1000  :: pos_integer(),
	 m  :: undefined | atom(), f  :: function() | atom(),
	 a = []  :: [term()], times = 1  :: integer(),
	 next_tick = 0  :: non_neg_integer(),
	 set_time = 1  :: pos_integer()}).

-record(rtimer,
	{ref  :: undefined | reference(),
	 key = 0  :: non_neg_integer(),
	 timers = []  :: [#timer{}]}).

-record(s_timer,
	{ref  :: undefined | reference(),
	 timers = []  :: [#timer{}]}).

-file("src/mod/misc/misc.erl", 22).

-file("inc/avatar.hrl", 1).

-record(m_avatar, {ver = 1, used = 0, frames = []}).

-record(avatar_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(avatar_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-file("src/mod/misc/misc.erl", 23).

-file("inc/holiday.hrl", 1).

-record(holiday_total,
	{id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 icon_id = 0  :: non_neg_integer(),
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 open_day = 0  :: non_neg_integer(),
	 merge_day = 0  :: non_neg_integer(),
	 is_show = 0  :: 0..1, type = 0  :: 0..2}).

-record(holiday,
	{camp_id = 0  :: non_neg_integer(),
	 total_id = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer(),
	 tbid = 0  :: non_neg_integer(),
	 cli_type = 0  :: non_neg_integer(),
	 cli_type_name = <<>>  :: binary(),
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(), condition = [],
	 type = 0  :: 0..2, title = <<>>  :: bitstring(),
	 title2 = <<>>  :: bitstring(),
	 main_ico = 0  :: pos_integer() | tuple(),
	 ico = <<>>  :: bitstring(),
	 type_ico = 0  :: non_neg_integer(),
	 top_banner = <<>>  :: bitstring(),
	 rule_str = <<>>  :: bitstring(),
	 time_str = <<>>  :: bitstring(),
	 bottom_alert = <<>>  :: bitstring(),
	 sort_val = 0  :: non_neg_integer(),
	 reward_title = <<>>  :: bitstring(),
	 aim_title = <<>>  :: bitstring(),
	 reward = []  :: list(), item_effect = []  :: list(),
	 mail_subject = <<>>  :: bitstring(),
	 mail_content = <<>>  :: bitstring(),
	 cli_reward = <<>>  :: bitstring(),
	 panel_type = 0  :: non_neg_integer(),
	 open_day = 0  :: non_neg_integer(),
	 open_day_min = 0  :: non_neg_integer(),
	 open_day_max = 0  :: non_neg_integer(),
	 merge_day = 0  :: non_neg_integer(),
	 process_show_reward = 0  :: non_neg_integer(),
	 platform_id = []  :: list(),
	 platform_exclude_id = []  :: list(), hide_srv_ids = [],
	 channel_ban = <<>>  :: bitstring()}).

-file("src/mod/misc/misc.erl", 24).

-file("inc/charge.hrl", 1).

-record(m_charge,
	{ver = 9, charge_list = [], first_gift = [],
	 triple_rebate_list = [], merge_count = 0,
	 merge_charge_list = [], day_gift = [], week_refresh = 0,
	 week_gift = [], month_refresh = 0, month_gift = [],
	 day_first_gift = {0, 0}, first_gift_ver = 0,
	 choose_first_gift_status = 0, reset_charge_list = [],
	 warehouse_charge_list = []}).

-record(charge_data,
	{id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(), val = 0  :: float(),
	 gold = 0  :: non_neg_integer(),
	 first_add = 0  :: non_neg_integer(),
	 add = 0  :: non_neg_integer(),
	 vip_exp = 0  :: non_neg_integer(),
	 pic = 0  :: non_neg_integer(), is_show = 0  :: 0..1,
	 is_iosverify = 1  :: 0..1,
	 type = 0  :: non_neg_integer(), items = []  :: list()}).

-record(triple_rebate_data,
	{id = 0  :: non_neg_integer(),
	 charge_sum = 0  :: bitstring(),
	 reward_times = 0  :: non_neg_integer(),
	 mail_title = <<>>  :: bitstring(),
	 mail_content = <<>>  :: bitstring()}).

-file("src/mod/misc/misc.erl", 25).

-spec gm(#role{}, tuple()) -> {ok, #role{}}.

gm(Role = #role{m_var = MVar}, {next_reward}) ->
    AccTime = var:total_online_time(Role),
    case [I || I <- misc_data:list_time(), I > AccTime] of
      [T1 | _] ->
	  NRole = Role#role{m_var =
				MVar#m_var{total_acc_time = T1,
					   last_acc_time = date:unixtime()}},
	  {ok,
	   role_timer:set(#timer{id = time_timer,
				 timeout = 1 * 1000, times = 1, m = misc,
				 f = apply_timer},
			  NRole)};
      _ -> {ok, Role}
    end.

-spec login(#role{}) -> {ok, #role{}}.

login(Role = #role{id = Id, name = Name,
		   face_id = FaceId,
		   m_avatar = #m_avatar{used = UsedId}}) ->
    rank_listener:update_val(name, Id, Name),
    rank_listener:update_val(face, Id, FaceId),
    rank_listener:update_val(avatar, Id, UsedId),
    push_time_reward(Role),
    {ok, set_timer(Role)}.

-spec push_time_reward(#role{}) -> ok.

push_time_reward(Role) ->
    AccTime = var:total_online_time(Role),
    L = var:get_var(Role, acc, 2051, []),
    Fun = fun (Id, Acc) ->
		  case misc_data:get_time_items(Id) of
		    {Time, _} -> [Time | Acc];
		    _ -> Acc
		  end
	  end,
    CliL = lists:foldr(Fun, [], L),
    sys_conn:pack_send(10926, {AccTime, CliL}),
    ok.

-spec get_time_reward(#role{},
		      Time :: pos_integer()) -> {false, binary()} |
						{ok, #role{}, pos_integer()}.

get_time_reward(Role = #role{}, 0) ->
    L = var:get_var(Role, acc, 2051, []),
    case misc_data:list_ids() -- L of
      [Id | _] -> get_time_reward(Role, Id);
      _ -> {false, lang:get(<<"奖励已领取完毕"/utf8>>)}
    end;
get_time_reward(Role, Id) ->
    AccTime = var:total_online_time(Role),
    case misc_data:get_time_items(Id) of
      {Time, _} when AccTime < Time ->
	  {false, lang:get(<<"时间不足"/utf8>>)};
      {Time, Items = [_ | _]} ->
	  L = var:get_var(Role, acc, 2051, []),
	  case lists:member(Id, L) of
	    true -> {false, lang:get(<<"奖励已领取"/utf8>>)};
	    false ->
		case misc_data:list_ids() -- L of
		  [Id | _] ->
		      GL = format:val_to_gain(Items, time_reward),
		      case role_gain:do_notice(Role, GL) of
			{false, #gain{msg = Msg}} -> {false, Msg};
			{ok, Role1} ->
			    NRole = var:set_var(Role1, acc, 2051, [Id | L]),
			    log:log_gain(GL, Role, NRole, <<"注册时间福利"/utf8>>,
					 util:fbin("id:~w，time:~w",
						   [Id, Time])),
			    push_time_reward(NRole),
			    {ok, NRole, Time}
		      end;
		  _ -> {false, lang:get(<<"先领取前一个档次"/utf8>>)}
		end
	  end;
      _ -> {false, lang:get(<<"奖励信息不存在"/utf8>>)}
    end.

-spec set_timer(#role{}) -> #role{}.

set_timer(Role) ->
    AccTime = var:total_online_time(Role),
    case [I || I <- misc_data:list_time(), I > AccTime] of
      [T1 | _] ->
	  role_timer:set(#timer{id = time_timer,
				timeout = (T1 - AccTime) * 1000, times = 1,
				m = misc, f = apply_timer},
			 Role);
      _ -> Role
    end.

-spec apply_timer(#role{}) -> {ok, #role{}}.

apply_timer(Role) ->
    push_time_reward(Role), {ok, set_timer(Role)}.

-spec five_data_to_zero(#role{}, pos_integer(),
			pos_integer()) -> #role{}.

five_data_to_zero(Role, OldVar, NewVar) ->
    Now = date:unixtime(),
    {_, {H, _, _}} = date:seconds_to_datetime(Now),
    case H < 5 of
      true -> Role;
      _ ->
	  case var:get_var(Role, five, OldVar, undefined) of
	    undefined -> Role;
	    OldVal ->
		Role1 = var:del_var(Role, five, OldVar),
		var:set_var(Role1, day, NewVar, OldVal)
	  end
    end.

-spec get_holiday_token(#role{},
			pos_integer()) -> {false, binary()} |
					  {ok, #role{}, binary()}.

get_holiday_token(Role = #role{name = Name,
			       account = Account},
		  Bid) ->
    case holiday_lib:get_open_holiday(Role, [Bid]) of
      Holiday = #holiday{camp_id = CampId} ->
	  Now = date:unixtime(),
	  {TokenEndTime, Token} = holiday_lib:get_tv_val(CampId,
							 Bid, Role),
	  case TokenEndTime > Now of
	    true -> {ok, Role, Token};
	    _ ->
		Url = case sys_env:get(platform) of
			"dev" ->
			    lists:concat(["http://", "test.shiyue.com",
					  "/game/token/getTokenById"]);
			"release2" ->
			    lists:concat(["http://", "test.shiyue.com",
					  "/game/token/getTokenById"]);
			"local" ->
			    lists:concat(["http://", "test.shiyue.com",
					  "/game/token/getTokenById"]);
			_ ->
			    lists:concat(["https://", "api.shiyue.com",
					  "/game/token/getTokenById"])
		      end,
		Time = date:unixtime(),
		Key = "ZMIUClkQieIL7tElz7VSjVrT",
		Query =
		    string_util:to_string(game_lib:to_url_body_str([{account_id,
								     Account},
								    {project_id,
								     11},
								    {ts,
								     Time}])),
		Sign = binary_to_list(string_util:sha(Query ++ Key)),
		List = [{account_id, Account}, {project_id, 11},
			{sign, Sign}, {ts, Time}],
		Body = game_lib:to_url_body_str(List),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidmisc162, _, {__Levelmisc162, __Tracesmisc162}}
		      when __Levelmisc162 band 128 /= 0 orelse
			     __Tracesmisc162 /= [] ->
		      lager:do_log(debug,
				   [{module, misc},
				    {function, get_holiday_token}, {line, 162},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("~ts==>~ts", [Url, Body]),
				   none, 4096, 128, __Levelmisc162,
				   __Tracesmisc162, lager_event, __Pidmisc162);
		  _ -> ok
		end,
		case catch httpc:request(post,
					 {Url, [],
					  "application/x-www-form-urlencoded",
					  Body},
					 [{timeout, 5000}], [])
		    of
		  {ok, {_StatusLine, _Headers, RtnBody}} ->
		      {L} = ejson:decode(RtnBody),
		      {_, Code} = lists:keyfind(<<"code">>, 1, L),
		      {_, Msg} = lists:keyfind(<<"message">>, 1, L),
		      case Code of
			1000 ->
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
			      {__Pidmisc170, _,
			       {__Levelmisc170, __Tracesmisc170}}
				  when __Levelmisc170 band 8 /= 0 orelse
					 __Tracesmisc170 /= [] ->
				  lager:do_log(error,
					       [{module, misc},
						{function, get_holiday_token},
						{line, 170},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("[~w]获取活动登录token时失败:~w, msg=~ts",
							     [Account, Code,
							      Msg]),
					       none, 4096, 8, __Levelmisc170,
					       __Tracesmisc170, lager_event,
					       __Pidmisc170);
			      _ -> ok
			    end,
			    {false, Msg};
			1101 ->
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
			      {__Pidmisc173, _,
			       {__Levelmisc173, __Tracesmisc173}}
				  when __Levelmisc173 band 8 /= 0 orelse
					 __Tracesmisc173 /= [] ->
				  lager:do_log(error,
					       [{module, misc},
						{function, get_holiday_token},
						{line, 173},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("[~w]获取活动登录token时失败:~w, msg=~ts",
							     [Account, Code,
							      Msg]),
					       none, 4096, 8, __Levelmisc173,
					       __Tracesmisc173, lager_event,
					       __Pidmisc173);
			      _ -> ok
			    end,
			    {false, Msg};
			0 ->
			    {_, {Data}} = lists:keyfind(<<"data">>, 1, L),
			    NewToken = list_util:keyfind(<<"token">>, Data,
							 <<>>),
			    NewTokenEndTime = list_util:keyfind(<<"exp">>, Data,
								0),
			    ExpireSec = holiday_lib:get_tv_timeout(Holiday),
			    NewRole = holiday_lib:set_tv_val(CampId, Role,
							     {NewTokenEndTime,
							      NewToken},
							     ExpireSec),
			    {ok, NewRole, NewToken};
			_ ->
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
			      {__Pidmisc185, _,
			       {__Levelmisc185, __Tracesmisc185}}
				  when __Levelmisc185 band 8 /= 0 orelse
					 __Tracesmisc185 /= [] ->
				  lager:do_log(error,
					       [{module, misc},
						{function, get_holiday_token},
						{line, 185},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("[~w]获取活动登录token时失败:~w, msg=~ts",
							     [Account, Code,
							      Msg]),
					       none, 4096, 8, __Levelmisc185,
					       __Tracesmisc185, lager_event,
					       __Pidmisc185);
			      _ -> ok
			    end,
			    {false, Msg}
		      end;
		  {error, _Reason} ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidmisc189, _, {__Levelmisc189, __Tracesmisc189}}
			    when __Levelmisc189 band 8 /= 0 orelse
				   __Tracesmisc189 /= [] ->
			    lager:do_log(error,
					 [{module, misc},
					  {function, get_holiday_token},
					  {line, 189},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("获取活动登录token时提交异常~w",
						       [_Reason]),
					 none, 4096, 8, __Levelmisc189,
					 __Tracesmisc189, lager_event,
					 __Pidmisc189);
			_ -> ok
		      end,
		      {false, lang:get(<<"参数错误"/utf8>>)};
		  Any ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidmisc192, _, {__Levelmisc192, __Tracesmisc192}}
			    when __Levelmisc192 band 8 /= 0 orelse
				   __Tracesmisc192 /= [] ->
			    lager:do_log(error,
					 [{module, misc},
					  {function, get_holiday_token},
					  {line, 192},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("获取活动登录token时提交异常~w",
						       [Any]),
					 none, 4096, 8, __Levelmisc192,
					 __Tracesmisc192, lager_event,
					 __Pidmisc192);
			_ -> ok
		      end,
		      {false, lang:get(<<"参数错误"/utf8>>)}
		end
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

get_pay_url(#role{id = {Rid, SrvId},
		  platform = Platform, zone_id = ZoneId,
		  account = Account, channel = Channel, idfa = Idfa},
	    PackageId, NotifyUrl) ->
    case charge_data:get(PackageId) of
      #charge_data{name = ChargeName, val = Amount} ->
	  Url = case sys_env:get(platform) of
		  "dev" ->
		      lists:concat(["http://", "test.shiyue.com",
				    "/game/token/getPayUrl"]);
		  "release2" ->
		      lists:concat(["http://", "test.shiyue.com",
				    "/game/token/getPayUrl"]);
		  "local" ->
		      lists:concat(["http://", "test.shiyue.com",
				    "/game/token/getPayUrl"]);
		  _ ->
		      lists:concat(["https://", "api.shiyue.com",
				    "/game/token/getPayUrl"])
		end,
	  Time = date:unixtime(),
	  Key = "ZMIUClkQieIL7tElz7VSjVrT",
	  ProductId = util:fbin("pay.~w", [PackageId]),
	  ExData =
	      util:fbin("~w$$~s$$~w$$~s$$~w$$~ts$$ios_srv_pay",
			[Rid, Platform, ZoneId, Channel, PackageId,
			 ChargeName]),
	  List1 = [{account_id, Account}, {amount, Amount * 1.0},
		   {dev_str, Idfa}, {exdata, ExData},
		   {notify_url, NotifyUrl}, {product_id, ProductId},
		   {project_id, 11}, {role_id, Rid}, {srv_id, SrvId},
		   {subject, ChargeName}, {ts, Time}],
	  List2 = [{K, urlencode(V)} || {K, V} <- List1],
	  Query =
	      string_util:to_string(game_lib:to_url_body_str(List2)),
	  Sign = binary_to_list(string_util:sha(Query ++ Key)),
	  List = [{sign, Sign} | List2],
	  Body = game_lib:to_url_body_str(List),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmisc222, _, {__Levelmisc222, __Tracesmisc222}}
		when __Levelmisc222 band 128 /= 0 orelse
		       __Tracesmisc222 /= [] ->
		lager:do_log(debug,
			     [{module, misc}, {function, get_pay_url},
			      {line, 222}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("~ts==>~ts", [Url, Body]), none,
			     4096, 128, __Levelmisc222, __Tracesmisc222,
			     lager_event, __Pidmisc222);
	    _ -> ok
	  end,
	  case catch httpc:request(post,
				   {Url, [],
				    "application/x-www-form-urlencoded", Body},
				   [{timeout, 5000}], [])
	      of
	    {ok, {_StatusLine, _Headers, RtnBody}} ->
		try case {whereis(lager_event), whereis(lager_event),
			  lager_config:get({lager_event, loglevel}, {0, []})}
			of
		      {undefined, undefined, _} ->
			  fun () -> {error, lager_not_running} end();
		      {undefined, _, _} ->
			  fun () -> {error, {sink_not_configured, lager_event}}
			  end();
		      {__Pidmisc226, _, {__Levelmisc226, __Tracesmisc226}}
			  when __Levelmisc226 band 128 /= 0 orelse
				 __Tracesmisc226 /= [] ->
			  lager:do_log(debug,
				       [{module, misc}, {function, get_pay_url},
					{line, 226}, {pid, pid_to_list(self())},
					{node, node()}
					| lager:md()],
				       io_lib:format("~ts==>~ts ~w",
						     [Url, Body, RtnBody]),
				       none, 4096, 128, __Levelmisc226,
				       __Tracesmisc226, lager_event,
				       __Pidmisc226);
		      _ -> ok
		    end,
		    {L} = ejson:decode(RtnBody),
		    {_, Code} = lists:keyfind(<<"code">>, 1, L),
		    case Code of
		      0 ->
			  {_, {Data}} = lists:keyfind(<<"data">>, 1, L),
			  PayUrl = list_util:keyfind(<<"url">>, Data, <<>>),
			  {1, PayUrl};
		      _ ->
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
			    {__Pidmisc235, _, {__Levelmisc235, __Tracesmisc235}}
				when __Levelmisc235 band 8 /= 0 orelse
				       __Tracesmisc235 /= [] ->
				lager:do_log(error,
					     [{module, misc},
					      {function, get_pay_url},
					      {line, 235},
					      {pid, pid_to_list(self())},
					      {node, node()}
					      | lager:md()],
					     io_lib:format("获取充值地址时提交异常~w",
							   [L]),
					     none, 4096, 8, __Levelmisc235,
					     __Tracesmisc235, lager_event,
					     __Pidmisc235);
			    _ -> ok
			  end,
			  {0, <<>>}
		    end
		catch
		  E:X ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidmisc240, _, {__Levelmisc240, __Tracesmisc240}}
			    when __Levelmisc240 band 8 /= 0 orelse
				   __Tracesmisc240 /= [] ->
			    lager:do_log(error,
					 [{module, misc},
					  {function, get_pay_url}, {line, 240},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("获取充值地址时提交异常~w ~w",
						       [{E, X}, RtnBody]),
					 none, 4096, 8, __Levelmisc240,
					 __Tracesmisc240, lager_event,
					 __Pidmisc240);
			_ -> ok
		      end,
		      {0, <<>>}
		end;
	    Any ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidmisc244, _, {__Levelmisc244, __Tracesmisc244}}
		      when __Levelmisc244 band 8 /= 0 orelse
			     __Tracesmisc244 /= [] ->
		      lager:do_log(error,
				   [{module, misc}, {function, get_pay_url},
				    {line, 244}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("获取充值地址时提交异常~w", [Any]), none,
				   4096, 8, __Levelmisc244, __Tracesmisc244,
				   lager_event, __Pidmisc244);
		  _ -> ok
		end,
		{0, <<>>}
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
	    {__Pidmisc248, _, {__Levelmisc248, __Tracesmisc248}}
		when __Levelmisc248 band 8 /= 0 orelse
		       __Tracesmisc248 /= [] ->
		lager:do_log(error,
			     [{module, misc}, {function, get_pay_url},
			      {line, 248}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("充值id不存在:~w", [PackageId]), none,
			     4096, 8, __Levelmisc248, __Tracesmisc248,
			     lager_event, __Pidmisc248);
	    _ -> ok
	  end,
	  {0, <<>>}
    end.

urlencode(V) when is_binary(V) ->
    string_util:urlencode(V);
urlencode(V) -> V.


