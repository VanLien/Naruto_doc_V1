-file("src/mod/holiday_return_new/holiday_return_new"
      "_red_packet.erl",
      1).

-module(holiday_return_new_red_packet).

-lager_records([{holiday,
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
		{self_add_info,
		 [id, time, score, status, total_time, interval]},
		{get_red_packet_info,
		 [r_id, red_id, name, lev, face_id, avatar_bid, time,
		  item]},
		{petard_red_packet,
		 [id, rid, name, face_id, avatar_bid, num, max_num,
		  is_max, mems, must_not, start_time, end_time, msg_id]},
		{m_holiday_petard,
		 [ver, camp_id, end_time, get_red_count, send_red_count,
		  send_notice, must_not_small, must_not_big,
		  petard_reward, red_packet_info, get_red_info]},
		{holiday_return_new_feat_data,
		 [period, id, f_id, s_id, ref_day, progress, award]},
		{m_holiday_return_new,
		 [ver, period, start_time, end_time, gift_status,
		  sign_list, quest_list, exchange_day_list,
		  exchange_buy_list, free_draw_count, draw_count,
		  draw_info, draw_type_info, must_not, get_red_count,
		  red_packet_info, get_red_info, ext]},
		{avatar_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{avatar_frame, [ver, base_id, expire_time]},
		{m_avatar, [ver, used, frames]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
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

-export([push_red_packet/1, push_red_packet_broadcast/1,
	 red_packet_info/1, send_red_packet/2, get_red_packet/2,
	 get_petard_award/5, push_fire/2]).

-export([]).

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

-file("src/mod/holiday_return_new/holiday_return_new"
      "_red_packet.erl",
      18).

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

-file("src/mod/holiday_return_new/holiday_return_new"
      "_red_packet.erl",
      19).

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

-file("src/mod/holiday_return_new/holiday_return_new"
      "_red_packet.erl",
      20).

-file("inc/avatar.hrl", 1).

-record(m_avatar, {ver = 1, used = 0, frames = []}).

-record(avatar_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(avatar_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-file("src/mod/holiday_return_new/holiday_return_new"
      "_red_packet.erl",
      21).

-file("inc/holiday_return_new.hrl", 1).

-record(m_holiday_return_new,
	{ver = 1, period = 0, start_time = 0, end_time = 0,
	 gift_status = 0, sign_list = [], quest_list = [],
	 exchange_day_list = [], exchange_buy_list = [],
	 free_draw_count = 0, draw_count = 0, draw_info = 0,
	 draw_type_info = [], must_not = [], get_red_count = 0,
	 red_packet_info = [], get_red_info = [], ext = []}).

-record(holiday_return_new_feat_data,
	{period = 0  :: non_neg_integer(),
	 id = 0  :: non_neg_integer(), f_id = 0, s_id = 0,
	 ref_day = 0, progress = [], award = []}).

-file("src/mod/holiday_return_new/holiday_return_new"
      "_red_packet.erl",
      22).

-file("inc/holiday_petard.hrl", 1).

-record(m_holiday_petard,
	{ver = 2, camp_id = 0, end_time = 0, get_red_count = 0,
	 send_red_count = 0, send_notice = 0,
	 must_not_small = [], must_not_big = [],
	 petard_reward = [], red_packet_info = [],
	 get_red_info = []}).

-record(petard_red_packet,
	{id = 0, rid = {0, <<>>}, name = <<>>, face_id = 0,
	 avatar_bid = 0, num = 0, max_num = 0, is_max = 0,
	 mems = [], must_not = [], start_time = 0, end_time = 0,
	 msg_id = 0}).

-record(get_red_packet_info,
	{r_id = {0, <<>>}, red_id = 0, name = <<>>, lev = 0,
	 face_id = 0, avatar_bid = 0, time = 0, item = []}).

-record(self_add_info,
	{id = 0, time = 0, score = 0, status = 0,
	 total_time = 0, interval = 0}).

-file("src/mod/holiday_return_new/holiday_return_new"
      "_red_packet.erl",
      23).

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

-file("src/mod/holiday_return_new/holiday_return_new"
      "_red_packet.erl",
      24).

-spec push_red_packet(#role{}) -> ok.

push_red_packet(Role = #role{m_holiday_return_new =
				 #m_holiday_return_new{get_red_count =
							   GetRedCount,
						       get_red_info =
							   GetRedInfo,
						       red_packet_info =
							   RedPacketInfo}}) ->
    Cond =
	holiday_return_new_data:get_const(red_packet_cond),
    Period = holiday_return_new:calc_period2(Role),
    LimitCount =
	holiday_return_new_data:get_const(max_day_get_num),
    case role_misc:check_open_cond(Cond, Role) =:= true
	   andalso Period =/= 0
	of
      true ->
	  case GetRedCount < LimitCount of
	    true ->
		RedPacketList = get_red_packet_list(),
		Flag = del_take_red(RedPacketList, GetRedInfo),
		case RedPacketList =/= [] andalso Flag =:= true of
		  true ->
		      sys_conn:pack_send(27912,
					 {2,
					  lang:get(<<"有回归玩家发放了全服红包，请点击主城左下角的红包！"/utf8>>),
					  GetRedCount, LimitCount});
		  _ ->
		      List1 = [Id
			       || {Id, Status} <- RedPacketInfo, Status =:= 2],
		      case List1 of
			[_ | _] ->
			    sys_conn:pack_send(27912,
					       {1, lang:get(<<"无可领取的红包"/utf8>>),
						GetRedCount, LimitCount});
			_ ->
			    sys_conn:pack_send(27912,
					       {0, lang:get(<<"无可领取的红包"/utf8>>),
						GetRedCount, LimitCount})
		      end
		end;
	    _ ->
		sys_conn:pack_send(27912,
				   {0, lang:get(<<"已超过今日领取上限"/utf8>>),
				    GetRedCount, LimitCount})
	  end;
      _ ->
	  sys_conn:pack_send(27912,
			     {0, lang:get(<<"活动未开启"/utf8>>), GetRedCount,
			      LimitCount})
    end,
    ok.

del_take_red(RedPacketList, GetRedInfo) ->
    Fun = fun (Id, Acc) ->
		  case lists:keyfind(Id, #petard_red_packet.id, Acc) of
		    Red = #petard_red_packet{} -> Acc -- [Red];
		    _ -> Acc
		  end
	  end,
    NewRedPacketList = lists:foldl(Fun, RedPacketList,
				   GetRedInfo),
    case NewRedPacketList of
      [_ | _] -> true;
      _ -> false
    end.

-spec push_red_packet_broadcast(#role{}) -> ok.

push_red_packet_broadcast(_Role) ->
    BroadCastList = sys_env:get(return_red_packet_broadcast,
				[]),
    sys_conn:pack_send(27913, {BroadCastList}),
    ok.

-spec red_packet_info(#role{}) -> {ok, #role{}, term(),
				   pos_integer(), pos_integer()}.

red_packet_info(Role = #role{id = Rid,
			     m_holiday_return_new =
				 MHolidayPetard =
				     #m_holiday_return_new{red_packet_info =
							       RedPacketInfo,
							   get_red_info =
							       GetRedInfo}}) ->
    push_red_packet(Role),
    Cond =
	holiday_return_new_data:get_const(red_packet_cond),
    Period = holiday_return_new:calc_period2(Role),
    case role_misc:check_open_cond(Cond, Role) =:= true
	   andalso Period =/= 0
	of
      true ->
	  RedPacketTakeList = [Info
			       || Info = {_, Status} <- RedPacketInfo,
				  Status =:= 2],
	  SelfRedPacketList =
	      lists:keysort(#petard_red_packet.start_time,
			    get_self_red_packet_list(Rid)),
	  RedPacketActList =
	      lists:keysort(#petard_red_packet.start_time,
			    get_red_packet_list()),
	  TakeLength = length(RedPacketTakeList),
	  MaxTakeLength =
	      holiday_return_new_data:get_const(max_day_get_num),
	  Fun1 = fun (#petard_red_packet{id = Id}, Acc) ->
			 case lists:member(Id, GetRedInfo) =:= false of
			   true -> [{Id, 1} | Acc];
			   _ -> Acc
			 end
		 end,
	  SelfLength = max(0, MaxTakeLength - TakeLength),
	  SelfRedPacketInfo = lists:sublist(lists:foldl(Fun1, [],
							SelfRedPacketList),
					    SelfLength),
	  RedPacketActInfo = lists:foldl(Fun1, [],
					 RedPacketActList),
	  Length = max(0,
		       MaxTakeLength - TakeLength - length(SelfRedPacketInfo)),
	  Fun2 = fun (Red = {Id, _}, Acc) ->
			 case lists:keyfind(Id, 1, Acc) of
			   false -> Acc;
			   _ -> Acc -- [Red]
			 end
		 end,
	  RedPacketActInfo1 = lists:sublist(lists:foldl(Fun2,
							RedPacketActInfo,
							SelfRedPacketInfo),
					    Length),
	  NewRedPacketInfo = RedPacketTakeList ++
			       SelfRedPacketInfo ++ RedPacketActInfo1,
	  ReturnInfo = covert_info(NewRedPacketInfo),
	  NewRole = Role#role{m_holiday_return_new =
				  MHolidayPetard#m_holiday_return_new{red_packet_info
									  =
									  NewRedPacketInfo}},
	  {ok, NewRole, ReturnInfo, TakeLength, MaxTakeLength};
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

covert_info(NewRedPacketInfo) ->
    Fun3 = fun ({Id, Status}, Acc) ->
		   case ets:lookup(holiday_return_new_red_packet, Id) of
		     [#petard_red_packet{msg_id = MsgId, name = Name} | _] ->
			 [{Id, MsgId, Name, Status} | Acc];
		     _ -> Acc
		   end
	   end,
    ReturnInfo = lists:foldl(Fun3, [], NewRedPacketInfo),
    ReturnInfo.

get_red_packet_list() ->
    Now = date:unixtime(),
    List = ets:match_object(holiday_return_new_red_packet,
			    #petard_red_packet{is_max = 0, _ = '_'}),
    Fun = fun (#petard_red_packet{end_time = EndTime}) ->
		  EndTime > Now
	  end,
    NewList = lists:filter(Fun, List),
    NewList.

get_self_red_packet_list(Rid) ->
    Now = date:unixtime(),
    List = ets:match_object(holiday_return_new_red_packet,
			    #petard_red_packet{is_max = 0, rid = Rid, _ = '_'}),
    Fun = fun (#petard_red_packet{end_time = EndTime}) ->
		  EndTime > Now
	  end,
    NewList = lists:filter(Fun, List),
    NewList.

-spec push_fire(#role{}, term()) -> ok.

push_fire(#role{id = Rid,
		m_holiday_return_new =
		    #m_holiday_return_new{get_red_count = GetRedCount}},
	  SendRid) ->
    case Rid =:= SendRid of
      true ->
	  sys_conn:pack_send(27916,
			     {1, lang:get(<<"使用成功,已发送红包!"/utf8>>)}),
	  ok;
      _ ->
	  case GetRedCount <
		 holiday_return_new_data:get_const(max_day_get_num)
	      of
	    true ->
		sys_conn:pack_send(27916,
				   {1,
				    lang:get(<<"有回归玩家发放了红包，请点击主城左下角红包！"/utf8>>)}),
		ok;
	    _ -> ok
	  end
    end.

-spec send_red_packet(#role{}, pos_integer()) -> {ok,
						  #role{}} |
						 {false, binary()}.

send_red_packet(Role = #role{id = Rid,
			     m_holiday_return_new =
				 #m_holiday_return_new{end_time = EndTime,
						       must_not = MustNot}},
		Num) ->
    case holiday_return_new:check_open(Role) of
      {ok, Period} ->
	  {NewMustNot, RewardList} = get_petard_award(Period, 0,
						      MustNot, Num, []),
	  Gain = format:val_to_gain(RewardList,
				    holiday_return_new_red_packet_send_award),
	  case role_gain:do_notice(Role, Gain) of
	    {ok,
	     NRole = #role{m_holiday_return_new =
			       MH = #m_holiday_return_new{}}} ->
		case holiday_return_new_mgr:call({get_id, Num}) of
		  {RedId1, RedId2}
		      when is_integer(RedId1) andalso is_integer(RedId2) ->
		      log:log_gain(Gain, Role, NRole, <<"回归活动使用红包"/utf8>>,
				   util:fbin(<<"数量:~w"/utf8>>, [Num])),
		      NewRole = NRole#role{m_holiday_return_new =
					       MH#m_holiday_return_new{must_not
									   =
									   NewMustNot}},
		      PetardRedPacketList = init_red_packet(NewRole, EndTime,
							    [],
							    {RedId1, RedId2}),
		      d_ets_lib:save_d_ets(holiday_return_new_red_packet,
					   PetardRedPacketList),
		      role_group:apply(world,
				       {holiday_return_new_red_packet,
					push_red_packet, []}),
		      role_group:apply(world,
				       {holiday_return_new_red_packet,
					push_fire, [Rid]}),
		      {ok, NewRole};
		  _ -> {false, lang:get(<<"物品使用失败！"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"物品使用失败！"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

init_red_packet(_Role, _EndTime, List, {RedId1, RedId2})
    when RedId1 > RedId2 ->
    List;
init_red_packet(Role = #role{m_holiday_return_new =
				 #m_holiday_return_new{period = Period},
			     id = Rid, name = Name, face_id = FaceId,
			     m_avatar = #m_avatar{used = AvatarBaseId}},
		EndTime, List, {RedId1, RedId2}) ->
    Now = date:unixtime(),
    BlessRandList =
	holiday_return_new_data:bless_msg(Period),
    {MsgId, _, _} = util:rand_list(BlessRandList, 2),
    PEndTime = min(EndTime,
		   Now +
		     3600 * holiday_return_new_data:get_const(effect_time)),
    PetardRedPacket = #petard_red_packet{id = RedId1,
					 rid = Rid, name = Name,
					 face_id = FaceId,
					 avatar_bid = AvatarBaseId, num = 0,
					 max_num =
					     holiday_return_new_data:get_const(max_get_num),
					 is_max = 0, mems = [], must_not = [],
					 start_time = Now, end_time = PEndTime,
					 msg_id = MsgId},
    init_red_packet(Role, EndTime, [PetardRedPacket | List],
		    {RedId1 + 1, RedId2}).

-spec get_red_packet(#role{}, pos_integer()) -> {ok,
						 #role{}, binary(),
						 pos_integer(), term(),
						 pos_integer(), pos_integer(),
						 pos_integer()} |
						{false, binary()}.

get_red_packet(Role = #role{id = Rid, name = Name,
			    lev = Lev, face_id = FaceId,
			    m_avatar = #m_avatar{used = AvatarBaseId},
			    m_holiday_return_new =
				MHolidayPetard =
				    #m_holiday_return_new{get_red_count =
							      GetRedCount,
							  red_packet_info =
							      RedPacketInfo,
							  get_red_info =
							      GetRedInfo}},
	       Id) ->
    Cond =
	holiday_return_new_data:get_const(red_packet_cond),
    Period = holiday_return_new:calc_period2(Role),
    case role_misc:check_open_cond(Cond, Role) =:= true
	   andalso Period =/= 0
	of
      true ->
	  LimitNum =
	      holiday_return_new_data:get_const(max_day_get_num),
	  case lists:keyfind(Id, 1, RedPacketInfo) of
	    {Id, 1} when GetRedCount < LimitNum ->
		case holiday_return_new_mgr:call({get_red_packet,
						  Period, Rid, Name, Lev,
						  FaceId, AvatarBaseId, Id})
		    of
		  {true, Msg, Id, Mems, Num, MaxNum, EndTime, RewardList,
		   SendName, SendFaceId, SendAvatarBid}
		      when RewardList =/= [] ->
		      Gain = format:val_to_gain(RewardList,
						holiday_return_new_red_packet),
		      case role_gain:do_notice(Role, Gain) of
			{ok, NRole} ->
			    log:log_gain(Gain, Role, NRole,
					 <<"新版回归活动_打开红包"/utf8>>,
					 util:fbin(<<"红包id:~w, 获取:~w"/utf8>>,
						   [Id, RewardList])),
			    NewRedPacketInfo = lists:keystore(Id, 1,
							      RedPacketInfo,
							      {Id, 2}),
			    NewMHolidayPetard =
				MHolidayPetard#m_holiday_return_new{get_red_count
									=
									GetRedCount
									  + 1,
								    red_packet_info
									=
									NewRedPacketInfo,
								    get_red_info
									=
									[Id
									 | GetRedInfo]},
			    NewRole = NRole#role{m_holiday_return_new =
						     NewMHolidayPetard},
			    TranNewRedPacketInfo =
				covert_info(NewRedPacketInfo),
			    sys_conn:pack_send(27910,
					       {TranNewRedPacketInfo,
						GetRedCount + 1, LimitNum}),
			    holiday:push_bid_can_reward(NewRole, 93042),
			    push_red_packet(NewRole),
			    {ok, NewRole, Msg, Id, Mems, Num, MaxNum, EndTime,
			     SendName, SendFaceId, SendAvatarBid};
			{false, #loss{msg = Msg}} -> {false, Msg};
			{false, #gain{msg = Msg}} -> {false, Msg}
		      end;
		  {false, Msg} -> {false, Msg};
		  _ -> {false, lang:get(<<"领取失败"/utf8>>)}
		end;
	    {Id, 1} -> {false, lang:get(<<"已超过今日领取上限"/utf8>>)};
	    {Id, 2} ->
		case ets:lookup(holiday_return_new_red_packet, Id) of
		  [#petard_red_packet{name = SendName,
				      face_id = SendFaceId,
				      avatar_bid = SendAvatarBid, num = Num,
				      max_num = MaxNum, end_time = EndTime,
				      mems = Mems}
		   | _] ->
		      push_red_packet(Role),
		      {ok, Role, lang:get(<<"该红包已领取"/utf8>>), Id, Mems, Num,
		       MaxNum, EndTime, SendName, SendFaceId, SendAvatarBid};
		  _ -> {false, lang:get(<<"红包不存在"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"无法领取该红包"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

get_petard_award(_Period, _Type, MustNot, 0,
		 RewardList) ->
    {MustNot, RewardList};
get_petard_award(Period, Type, MustNot, Num,
		 RewardList) ->
    RandList = case Type of
		 0 -> holiday_return_new_data:firework_award(Period);
		 _ -> holiday_return_new_data:red_packet_award(Period)
	       end,
    Fun = fun ({Id, Award, Pro, MustNotCount}, Acc) ->
		  Count = list_util:keyfind(Id, MustNot, -1),
		  case Count < MustNotCount of
		    true -> [{Id, Award, Pro} | Acc];
		    _ -> Acc
		  end
	  end,
    RandList1 = lists:foldl(Fun, [], RandList),
    case RandList1 of
      [_ | _] ->
	  {Id, Award, _Pro} = util:rand_list(RandList1, 3),
	  NewMustNot = do_must_not(Period, Type, Id, MustNot),
	  NewRewardList = item_lib:merge(RewardList, Award),
	  get_petard_award(Period, Type, NewMustNot, Num - 1,
			   NewRewardList);
      _ ->
	  get_petard_award(Period, Type, MustNot, Num - 1,
			   RewardList)
    end.

do_must_not(Period, Type, Id, MustNot) ->
    MustNotCount = case Type of
		     0 ->
			 holiday_return_new_data:firework_must_not({Period,
								    Id});
		     _ ->
			 holiday_return_new_data:red_packet_must_not({Period,
								      Id})
		   end,
    case MustNotCount > 0 of
      true ->
	  Count = list_util:keyfind(Id, MustNot, 0),
	  NewMustNot = lists:keystore(Id, 1, MustNot,
				      {Id, Count + 1}),
	  NewMustNot;
      _ -> MustNot
    end.


