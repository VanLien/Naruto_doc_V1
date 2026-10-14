-file("data/avatar.erl", 1).

-file("src/mod/avatar/avatar.erl", 1).

-module(avatar).

-lager_records([{profile_add, [key, id, mod, ext]},
		{profile_reward, [ver, role_id, add_list]},
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

-export([init/0, login/1, frames/1, use/2, activate/2,
	 arena_elite_activate/3, add/2, add/3, check/1, del/2,
	 init_frame/1, make_avatar/4, set_timer/1, sync/1,
	 update/3, log/4]).

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

-file("src/mod/avatar/avatar.erl", 33).

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

-file("src/mod/avatar/avatar.erl", 34).

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

-file("src/mod/avatar/avatar.erl", 35).

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

-file("src/mod/avatar/avatar.erl", 36).

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

-file("src/mod/avatar/avatar.erl", 37).

-file("inc/avatar.hrl", 1).

-record(m_avatar, {ver = 1, used = 0, frames = []}).

-record(avatar_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(avatar_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-file("src/mod/avatar/avatar.erl", 38).

-file("inc/profile.hrl", 1).

-record(profile_reward,
	{ver = 1, role_id, add_list = []}).

-record(profile_add, {key, id, mod, ext = #{}}).

-file("src/mod/avatar/avatar.erl", 39).

-file("inc/log.hrl", 1).

-file("src/mod/avatar/avatar.erl", 40).

-export([gm_activate/2]).

gm_activate(Role, #{base_id := BaseId}) ->
    case avatar_data:get(BaseId) of
      Data = #avatar_frame_data{} ->
	  Add = make_avatar_profile_add(BaseId, #{}),
	  case make_avatar(Role, Add, Data) of
	    {ok, Frame, RplFrame} ->
		NRole = update(Role, Frame, RplFrame),
		SetRole = set_timer(NRole, Frame),
		NewRole = update_attr(SetRole, Data),
		push_frame(NewRole, Frame),
		{ok, NewRole};
	    {false, Msg} -> {false, Msg}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Không thể kích hoạt khung hình đại diện "
		      "không xác định"/utf8>>)}
    end.

-spec init() -> #m_avatar{}.

init() ->
    BaseId = avatar_data:const(default_avatar),
    case init_frame(BaseId) of
      {ok, Frame} ->
	  #m_avatar{used = BaseId, frames = [Frame]};
      _ -> #m_avatar{}
    end.

-spec login(#role{}) -> {ok, #role{}}.

login(Role) ->
    OverRole = overdue(Role), {ok, set_timer(OverRole)}.

-spec del(#role{}, BaseId :: integer()) -> {ok,
					    #role{}} |
					   {false, Msg :: binary()}.

del(Role = #role{m_avatar =
		     MAvatar = #m_avatar{frames = Frames, used = Used}},
    BaseId) ->
    case BaseId =/= avatar_data:const(default_avatar) of
      true ->
	  NewFrames = [#avatar_frame{base_id = UseBaseId} | _] =
			  lists:keydelete(BaseId, #avatar_frame.base_id,
					  Frames),
	  NRole = case Used =:= BaseId of
		    false ->
			NewMAvatar = MAvatar#m_avatar{frames = NewFrames},
			Role#role{m_avatar = NewMAvatar};
		    true ->
			NewMAvatar = MAvatar#m_avatar{frames = NewFrames,
						      used = UseBaseId},
			UseRole = Role#role{m_avatar = NewMAvatar},
			sync(UseRole),
			UseRole
		  end,
	  NewRole = profile_attr:update(NRole),
	  {ok, set_timer(NewRole)};
      false ->
	  {false,
	   lang:get(<<"Không thể xóa khung avatar mặc định"/utf8>>)}
    end.

-spec frames(#role{}) -> [#avatar_frame{}].

frames(#role{m_avatar = #m_avatar{frames = Frames}}) ->
    Frames.

-spec use(#role{}, BaseId :: integer()) -> {ok,
					    #role{}} |
					   {false, Msg :: binary()}.

use(#role{m_avatar = #m_avatar{used = BaseId}},
    BaseId) ->
    {false,
     lang:get(<<"Hiện đang sử dụng khung avatar này"/utf8>>)};
use(Role = #role{m_avatar =
		     MAvatar = #m_avatar{frames = Frames}},
    BaseId) ->
    case lists:keyfind(BaseId, #avatar_frame.base_id,
		       Frames)
	of
      #avatar_frame{base_id = BaseId} ->
	  NewMAvatar = MAvatar#m_avatar{used = BaseId},
	  NewRole = Role#role{m_avatar = NewMAvatar},
	  sync(NewRole),
	  {ok, NewRole};
      _ ->
	  {false,
	   lang:get(<<"Bạn chưa kích hoạt khung avatar này"/utf8>>)}
    end.

-spec activate(#role{}, Args :: map()) -> {ok,
					   #role{}} |
					  {false, Msg :: binary()}.

activate(Role, #{base_id := BaseId}) ->
    case avatar_data:get(BaseId) of
      Data = #avatar_frame_data{is_panel = 1,
				loss = LossCfg = [_ | _]} ->
	  Loss = format:val_to_loss(LossCfg, del_avatar),
	  case role_gain:do(Role, Loss) of
	    {ok, LossRole} ->
		Add = make_avatar_profile_add(BaseId, #{}),
		case make_avatar(Role, Add, Data) of
		  {ok, Frame, RplFrame} ->
		      NRole = update(LossRole, Frame, RplFrame),
		      TimerRole = set_timer(NRole, Frame),
		      NewRole = update_attr(TimerRole, Data),
		      push_frame(NewRole, Frame),
		      log(NewRole, Role, Frame, RplFrame,
			  #{log_title => lang:get(<<"kích hoạt"/utf8>>),
			    gl => Loss}),
		      {ok, NewRole};
		  {false, Msg} -> {false, Msg}
		end;
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidavatar152, _,
		   {__Levelavatar152, __Tracesavatar152}}
		      when __Levelavatar152 band 8 /= 0 orelse
			     __Tracesavatar152 /= [] ->
		      lager:do_log(error,
				   [{module, avatar}, {function, activate},
				    {line, 152}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]激活头像框失败:~w",
						 [Role#role.name, Err]),
				   none, 4096, 8, __Levelavatar152,
				   __Tracesavatar152, lager_event,
				   __Pidavatar152);
		  _ -> ok
		end,
		{false,
		 lang:get(<<"Không thể kích hoạt các vật phẩm không đủ"/utf8>>)}
	  end;
      #avatar_frame_data{} ->
	  {false,
	   lang:get(<<"Khung avatar hoạt động, tự động kích "
		      "hoạt khi lấy được"/utf8>>)};
      _ ->
	  {false,
	   lang:get(<<"Không thể kích hoạt khung hình đại diện "
		      "không xác định"/utf8>>)}
    end.

-spec arena_elite_activate(#role{}, pos_integer(),
			   pos_integer()) -> #role{}.

arena_elite_activate(Role = #role{m_avatar =
				      #m_avatar{frames = List}},
		     Lev, EndTime) ->
    case arena_elite_data:get_avatar_id(Lev) of
      BaseId when BaseId =/= 0 ->
	  case avatar_data:get(BaseId) of
	    Data = #avatar_frame_data{} ->
		case lists:keyfind(BaseId, #avatar_frame.base_id, List)
		    of
		  #avatar_frame{expire_time = EndTime} -> Role;
		  _ ->
		      Date = date:seconds_to_datetime(EndTime),
		      NewData = Data#avatar_frame_data{expire_type = 2,
						       expire_time = Date},
		      Add = make_avatar_profile_add(BaseId, #{}),
		      case make_avatar(Role, Add, NewData) of
			{ok, Frame, RplFrame} ->
			    NRole = update(Role, Frame, RplFrame),
			    TimerRole = set_timer(NRole, Frame),
			    NewRole = update_attr(TimerRole, NewData),
			    push_frame(NewRole, Frame),
			    log(NewRole, Role, Frame, RplFrame,
				#{log_title => lang:get(<<"kích hoạt"/utf8>>),
				  gl => []}),
			    NewRole;
			{false, Msg} ->
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
			      {__Pidavatar184, _,
			       {__Levelavatar184, __Tracesavatar184}}
				  when __Levelavatar184 band 8 /= 0 orelse
					 __Tracesavatar184 /= [] ->
				  lager:do_log(error,
					       [{module, avatar},
						{function,
						 arena_elite_activate},
						{line, 184},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("[~ts]激活精英赛头像框失败:~w ~w ~w",
							     [Role#role.name,
							      Lev, BaseId,
							      Msg]),
					       none, 4096, 8, __Levelavatar184,
					       __Tracesavatar184, lager_event,
					       __Pidavatar184);
			      _ -> ok
			    end,
			    Role
		      end
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
		  {__Pidavatar189, _,
		   {__Levelavatar189, __Tracesavatar189}}
		      when __Levelavatar189 band 8 /= 0 orelse
			     __Tracesavatar189 /= [] ->
		      lager:do_log(error,
				   [{module, avatar},
				    {function, arena_elite_activate},
				    {line, 189}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]激活精英赛头像框失败:~w ~w",
						 [Role#role.name, Lev, BaseId]),
				   none, 4096, 8, __Levelavatar189,
				   __Tracesavatar189, lager_event,
				   __Pidavatar189);
		  _ -> ok
		end,
		Role
	  end;
      _ -> Role
    end.

-spec update(#role{}, Frame :: #avatar_frame{},
	     RplFrame :: #avatar_frame{} | undefined) -> #role{}.

update(Role = #role{m_avatar =
			MAvatar = #m_avatar{frames = Frames, used = UseBaseId}},
       NewFrame = #avatar_frame{base_id = BaseId}, RplFrame) ->
    {NewFrames, RplBaseId} = case RplFrame of
			       #avatar_frame{base_id = RplBid} ->
				   DelFrames = lists:keydelete(RplBid,
							       #avatar_frame.base_id,
							       Frames),
				   {lists:keystore(BaseId,
						   #avatar_frame.base_id,
						   DelFrames, NewFrame),
				    RplBid};
			       _ ->
				   {lists:keystore(BaseId,
						   #avatar_frame.base_id,
						   Frames, NewFrame),
				    0}
			     end,
    NewMAvatar = case UseBaseId =:= RplBaseId of
		   false -> MAvatar#m_avatar{frames = NewFrames};
		   _ -> MAvatar#m_avatar{frames = NewFrames, used = BaseId}
		 end,
    Role#role{m_avatar = NewMAvatar}.

-spec add(RoleOrId :: #role{} | tuple(),
	  Bid :: integer()) -> ok | {ok, #role{}} |
			       {false, binary()}.

add(RoleOrId, Bid) -> add(RoleOrId, Bid, #{}).

-spec add(RoleOrId :: #role{} | tuple(),
	  Bid :: integer(), Ext :: map()) -> ok | {ok, #role{}} |
					     {false, binary()}.

add(Role = #role{}, Bid, Ext) ->
    ProfileAdd = make_avatar_profile_add(Bid, Ext),
    case avatar_data:get(Bid) of
      Data = #avatar_frame_data{} ->
	  case make_avatar(Role, ProfileAdd, Data) of
	    {ok, NewFrame, RplFrame} ->
		NRole = update(Role, NewFrame, RplFrame),
		NewRole = update_attr(NRole, Data),
		log(NewRole, Role, NewFrame, RplFrame),
		{ok, NewRole};
	    {false, Msg} -> {false, Msg}
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
	    {__Pidavatar231, _,
	     {__Levelavatar231, __Tracesavatar231}}
		when __Levelavatar231 band 8 /= 0 orelse
		       __Tracesavatar231 /= [] ->
		lager:do_log(error,
			     [{module, avatar}, {function, add}, {line, 231},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]更新未配置的头像框Bid:~w",
					   [Role#role.name, Bid]),
			     none, 4096, 8, __Levelavatar231, __Tracesavatar231,
			     lager_event, __Pidavatar231);
	    _ -> ok
	  end,
	  {false,
	   lang:get(<<"Khung hình đại diện không tồn tại"/utf8>>)}
    end;
add(RoleId = {_Rid, _SrvId}, Bid, Ext) ->
    profile_mgr:async_add(RoleId, avatar, Bid, Ext).

-spec check(#role{}) -> {ok, #role{}}.

check(Role) ->
    NRole = overdue(Role),
    NewRole = profile_attr:update(NRole),
    sync(Role, NewRole),
    {ok, set_timer(NewRole)}.

-spec set_timer(#role{}) -> #role{}.

set_timer(Role = #role{m_avatar =
			   #m_avatar{frames = L}}) ->
    Now = date:unixtime(),
    case [ExpireTime - Now
	  || #avatar_frame{expire_time = ExpireTime} <- L,
	     ExpireTime > 0]
	of
      [] -> Role;
      TL ->
	  T = max(1, lists:min(TL)),
	  role_timer:set(#timer{id = avatar_check_timer,
				timeout = T * 1000, m = avatar, f = check,
				a = []},
			 Role)
    end.

set_timer(Role, #avatar_frame{base_id = BaseId}) ->
    case avatar_data:get(BaseId) of
      #avatar_frame_data{expire_type = 0} -> Role;
      _ -> set_timer(Role)
    end;
set_timer(Role, _AvatarFrame) -> set_timer(Role).

-spec sync(#role{}) -> ok.

sync(NewRole = #role{id = Id,
		     m_avatar = #m_avatar{used = UsedId}}) ->
    friend:save_info(NewRole),
    guild_member:update(NewRole, sync),
    role_lib:push_base_info(NewRole),
    arena_mgr:sync_role(NewRole, all),
    sky_ladder_mgr:sync_role(NewRole, all),
    rank_listener:update_val(avatar, Id, UsedId),
    ok.

sync(#role{m_avatar = #m_avatar{used = Used}},
     #role{m_avatar = #m_avatar{used = Used}}) ->
    ok;
sync(_Role, NewRole) -> sync(NewRole).

-spec init_frame(#avatar_frame_data{} |
		 pos_integer()) -> {ok, #avatar_frame{}} |
				   {false, binary()}.

init_frame(#avatar_frame_data{base_id = BaseId,
			      expire_type = ExpireType,
			      expire_time = ExpireTime}) ->
    {_NewExpireType, NewExpireTime} =
	item:make_expire(BaseId, ExpireType, ExpireTime),
    {ok,
     #avatar_frame{base_id = BaseId,
		   expire_time = NewExpireTime}};
init_frame(BaseId) ->
    case avatar_data:get(BaseId) of
      Data = #avatar_frame_data{} -> init_frame(Data);
      _ ->
	  {false,
	   lang:get(<<"Không thể khởi tạo khung hình đại diện "
		      "không xác định"/utf8>>)}
    end.

-spec log(NRole :: #role{}, Role :: #role{},
	  Frame :: #avatar_frame{},
	  RplFrame :: #avatar_frame{}) -> ok.

log(NRole, Role, Frame, RplFrame) ->
    log(NRole, Role, Frame, RplFrame, #{}).

log(NRole, Role,
    #avatar_frame{base_id = BaseId,
		  expire_time = ExpireTime},
    RplFrame, LogData) ->
    LogTitle = maps:get(log_title, LogData,
			lang:get(<<"lấy"/utf8>>)),
    GL = maps:get(gl, LogData, []),
    LogMsg = case RplFrame of
	       #avatar_frame{base_id = RplBaseId,
			     expire_time = RplExpireTime} ->
		   util:fbin(<<"~ts:Bid:~w,Expire:~w,RplBid:~w,RplExpire:~w"/utf8>>,
			     [LogTitle, BaseId, ExpireTime, RplBaseId,
			      RplExpireTime]);
	       _ ->
		   util:fbin(<<"~ts:Bid:~w,Expire:~w"/utf8>>,
			     [LogTitle, BaseId, ExpireTime])
	     end,
    log:save(log_profile,
	     {GL, Role, NRole, <<"头像框"/utf8>>, LogMsg}),
    ok.

-spec make_avatar(#role{}, Add :: #profile_add{},
		  Data :: #avatar_frame_data{}) -> {ok, #avatar_frame{},
						    #avatar_frame{} |
						    undefined} |
						   {false, Msg :: binary()}.

make_avatar(Role, ProfileAdd, AddData) ->
    make_avatar(Role, ProfileAdd, AddData, #{}).

-spec make_avatar(#role{}, Add :: #profile_add{},
		  Data :: #avatar_frame_data{}, Opt :: map()) -> {ok,
								  #avatar_frame{},
								  #avatar_frame{} |
								  undefined} |
								 {false,
								  Msg ::
								      binary()}.

make_avatar(Role = #role{m_avatar =
			     #m_avatar{frames = Frames}},
	    ProfileAdd, AddData = #avatar_frame_data{group = Group},
	    Opt) ->
    case same_group(Frames, Group) of
      {ok, _RplFrame, #avatar_frame_data{expire_type = 0}} ->
	  {false,
	   lang:get(<<"Khung avatar cố định đã được kích hoạt "
		      "và không cần kích hoạt lại"/utf8>>)};
      {ok, RplFrame, _Data} ->
	  make_avatar(Role, ProfileAdd, AddData, RplFrame, Opt);
      false ->
	  make_avatar(Role, ProfileAdd, AddData, undefined, Opt)
    end.

make_avatar(Role, Add,
	    AddData = #avatar_frame_data{base_id = Bid,
					 overlap = Overlap,
					 expire_type = AddExpireType},
	    RplAvatarFrame, _Opt) ->
    case init_frame(AddData) of
      {ok,
       AddAvatarFrame = #avatar_frame{expire_time =
					  ExpireTime}} ->
	  case AddExpireType =:= 0 of
	    false ->
		case {Overlap, RplAvatarFrame} of
		  {1, #avatar_frame{expire_time = OldExpireTime}} ->
		      NewTime = calc_expire_time(Overlap, OldExpireTime,
						 ExpireTime, Add),
		      {ok, AddAvatarFrame#avatar_frame{expire_time = NewTime},
		       RplAvatarFrame};
		  {0, #avatar_frame{expire_time = OldExpireTime}} ->
		      case ExpireTime > OldExpireTime of
			true ->
			    NewTime = calc_expire_time(Overlap, OldExpireTime,
						       ExpireTime, Add),
			    {ok,
			     AddAvatarFrame#avatar_frame{expire_time = NewTime},
			     RplAvatarFrame};
			false ->
			    {false,
			     lang:get(<<"Khung avatar hiện tại tồn tại lâu hơn "
					"và không cần phải kích hoạt lại"/utf8>>)}
		      end;
		  {_, undefined} ->
		      Now = date:unixtime(),
		      ElapseTime = elapse_time(Add, Now),
		      NewTime = ExpireTime - ElapseTime,
		      case NewTime > Now of
			true ->
			    {ok,
			     AddAvatarFrame#avatar_frame{expire_time = NewTime},
			     RplAvatarFrame};
			false ->
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
			      {__Pidavatar348, _,
			       {__Levelavatar348, __Tracesavatar348}}
				  when __Levelavatar348 band 64 /= 0 orelse
					 __Tracesavatar348 /= [] ->
				  lager:do_log(info,
					       [{module, avatar},
						{function, make_avatar},
						{line, 348},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("[~ts]头像框已过期Bid:~w, ExTime:~w, Now:~w",
							     [Role#role.name,
							      Bid, ExpireTime,
							      Now]),
					       none, 4096, 64, __Levelavatar348,
					       __Tracesavatar348, lager_event,
					       __Pidavatar348);
			      _ -> ok
			    end,
			    {false,
			     lang:get(<<"Khung avatar đã hết hạn"/utf8>>)}
		      end;
		  {_, #avatar_frame{base_id = Bid}} ->
		      {false,
		       lang:get(<<"Không thể thay được khung avatar giống "
				  "nhau"/utf8>>)};
		  Unknow ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidavatar354, _,
			 {__Levelavatar354, __Tracesavatar354}}
			    when __Levelavatar354 band 8 /= 0 orelse
				   __Tracesavatar354 /= [] ->
			    lager:do_log(error,
					 [{module, avatar},
					  {function, make_avatar}, {line, 354},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("[~ts]更新头像框失败[bid:~w][Err:~w]",
						       [Role#role.name, Bid,
							Unknow]),
					 none, 4096, 8, __Levelavatar354,
					 __Tracesavatar354, lager_event,
					 __Pidavatar354);
			_ -> ok
		      end,
		      {false,
		       lang:get(<<"Lão hóa khung hình đại diện chưa được "
				  "xử lý"/utf8>>)}
		end;
	    true -> {ok, AddAvatarFrame, RplAvatarFrame}
	  end;
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidavatar361, _,
	     {__Levelavatar361, __Tracesavatar361}}
		when __Levelavatar361 band 8 /= 0 orelse
		       __Tracesavatar361 /= [] ->
		lager:do_log(error,
			     [{module, avatar}, {function, make_avatar},
			      {line, 361}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]更新头像框初始化失败[bid:~w][Err:~w]",
					   [Role#role.name, Bid, Err]),
			     none, 4096, 8, __Levelavatar361, __Tracesavatar361,
			     lager_event, __Pidavatar361);
	    _ -> ok
	  end,
	  {false,
	   lang:get(<<"Không tạo được khung avatar"/utf8>>)}
    end.

overdue(Role = #role{m_avatar =
			 MAvatar = #m_avatar{used = BaseId,
					     frames = Frames}}) ->
    Now = date:unixtime(),
    NewFrames = [Frame
		 || Frame = #avatar_frame{expire_time = ExpireTime}
			<- Frames,
		    ExpireTime =:= 0 orelse ExpireTime > Now],
    NewBaseId = case lists:keyfind(BaseId,
				   #avatar_frame.base_id, NewFrames)
		    of
		  false ->
		      case NewFrames of
			[#avatar_frame{base_id = NextBaseId} | _] -> NextBaseId;
			_ -> 0
		      end;
		  _ -> BaseId
		end,
    NewMAvatar = MAvatar#m_avatar{used = NewBaseId,
				  frames = NewFrames},
    Role#role{m_avatar = NewMAvatar}.

push_frame(Role, Frame) ->
    role:pack_send(Role, 21503, {[Frame]}), ok.

calc_expire_time(1, OldExpireTime, ExpireTime, Add) ->
    Now = date:unixtime(),
    ElapseTime = elapse_time(Add, Now),
    OldExpireTime + max(ExpireTime - ElapseTime - Now, 0);
calc_expire_time(0, OldExpireTime, ExpireTime, Add) ->
    Now = date:unixtime(),
    ElapseTime = elapse_time(Add, Now),
    max(ExpireTime - ElapseTime, OldExpireTime).

elapse_time(#profile_add{ext = Ext}, Now) ->
    StartTime = maps:get(start_time, Ext, 0),
    case StartTime > 0 of
      true -> Now - StartTime;
      false -> 0
    end.

same_group([], _Group) -> false;
same_group([Avatar = #avatar_frame{base_id = BaseId}
	    | Rest],
	   Group) ->
    case avatar_data:get(BaseId) of
      Data = #avatar_frame_data{group = Group} ->
	  {ok, Avatar, Data};
      _ -> same_group(Rest, Group)
    end.

make_avatar_profile_add(Bid, Ext) ->
    profile:make_profile_add(avatar, Bid, Ext).

update_attr(Role, #avatar_frame_data{attr = Attr}) ->
    case Attr of
      [_ | _] -> profile_attr:update(Role);
      _ -> Role
    end.


