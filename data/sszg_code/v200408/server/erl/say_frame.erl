-file("data/say_frame.erl", 1).

-file("src/mod/say/say_frame.erl", 1).

-module(say_frame).

-lager_records([{profile_add, [key, id, mod, ext]},
		{profile_reward, [ver, role_id, add_list]},
		{violators_record, [id, name, lists]},
		{say_history, [id, clear_time, lists]},
		{say_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{say_frame, [ver, base_id, expire_time]},
		{m_say, [ver, used, frames]},
		{say_subtitle_msg, [id, role_id, name, msg, time]},
		{say_subtitle_role, [pid, conn_pid, type]},
		{say_msg, [len, msg, tick]},
		{say_send,
		 [id, name, sex, career, lev, face_id, vip_lev, capacity,
		  head_bid, chat_bubble, msg_list, face_update_time,
		  face_file]},
		{say_mon,
		 [rid, srv_id, name, ctime, lev, vip_lev, msg, remark]},
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

-export([init/0, info/1, use/2, activate/2, add/2,
	 add/3, check/1, login/1, set_timer/1, make_say_frame/4,
	 del/2, init_frame/1, update/3, log/4]).

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

-file("src/mod/say/say_frame.erl", 31).

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

-file("src/mod/say/say_frame.erl", 32).

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

-file("src/mod/say/say_frame.erl", 33).

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

-file("src/mod/say/say_frame.erl", 34).

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

-file("src/mod/say/say_frame.erl", 35).

-file("inc/say.hrl", 1).

-record(say_mon,
	{rid = 0  :: pos_integer(), srv_id = <<>>  :: binary(),
	 name = <<>>  :: bitstring(),
	 ctime = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 msg = <<>>  :: binary(), remark = <<>>  :: binary()}).

-record(say_send,
	{id = {0, <<>>}, name = <<>>, sex = 0, career = 0,
	 lev = 0, face_id = 0, vip_lev = 0, capacity = 0,
	 head_bid = 0, chat_bubble = 0, msg_list = [],
	 face_update_time = 0, face_file = <<>>}).

-record(say_msg, {len = 0, msg = <<>>, tick = 0}).

-record(say_subtitle_role,
	{pid = 0  :: 0 | pid(), conn_pid = 0  :: 0 | pid(),
	 type = 0  :: integer()}).

-record(say_subtitle_msg,
	{id = 0  :: non_neg_integer(),
	 role_id = {0, <<>>}  ::
	     {non_neg_integer(), bitstring()},
	 name = <<>>  :: bitstring(), msg = <<>>  :: bitstring(),
	 time = 0  :: non_neg_integer()}).

-record(m_say, {ver = 1, used = 0, frames = []}).

-record(say_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(say_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-record(say_history,
	{id = {0, <<>>}, clear_time = 0, lists = []}).

-record(violators_record,
	{id = {0, <<>>}, name = <<>>, lists = []}).

-file("src/mod/say/say_frame.erl", 36).

-file("inc/profile.hrl", 1).

-record(profile_reward,
	{ver = 1, role_id, add_list = []}).

-record(profile_add, {key, id, mod, ext = #{}}).

-file("src/mod/say/say_frame.erl", 37).

-file("inc/log.hrl", 1).

-file("src/mod/say/say_frame.erl", 38).

-export([gm_activate/2]).

gm_activate(Role, #{base_id := BaseId}) ->
    case say_data:get(BaseId) of
      Data = #say_frame_data{} ->
	  Add = make_say_frame_profile_add(BaseId, #{}),
	  case make_say_frame(Role, Add, Data) of
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
	   lang:get(<<"Không thể kích hoạt hộp trò chuyện không "
		      "xác định"/utf8>>)}
    end.

-spec init() -> #m_say{}.

init() ->
    BaseId = say_data:const(default_bubble),
    case init_frame(BaseId) of
      {ok, Frame} -> #m_say{used = BaseId, frames = [Frame]};
      _ -> #m_say{}
    end.

-spec login(#role{}) -> {ok, #role{}}.

login(Role) ->
    OverRole = overdue(Role), {ok, set_timer(OverRole)}.

-spec del(#role{}, BaseId :: pos_integer()) -> {ok,
						#role{}} |
					       {false, binary()}.

del(Role = #role{m_say =
		     MSay = #m_say{frames = Frames, used = Used}},
    BaseId) ->
    case BaseId =/= say_data:const(default_bubble) of
      true ->
	  NewFrames = [#say_frame{base_id = UseBaseId} | _] =
			  lists:keydelete(BaseId, #say_frame.base_id, Frames),
	  NRole = case Used =:= BaseId of
		    false ->
			NewMSay = MSay#m_say{frames = NewFrames},
			Role#role{m_say = NewMSay};
		    true ->
			NewMSay = MSay#m_say{frames = NewFrames,
					     used = UseBaseId},
			Role#role{m_say = NewMSay}
		  end,
	  NewRole = profile_attr:update(NRole),
	  {ok, set_timer(NewRole)};
      false ->
	  {false,
	   lang:get(<<"Không thể xóa hộp trò chuyện mặc định"/utf8>>)}
    end.

-spec info(#role{}) -> {ok,
			SayFrameBid :: pos_integer(), Frames :: list()}.

info(#role{m_say =
	       #m_say{frames = Frames, used = SayFrameBid}}) ->
    {ok, SayFrameBid, Frames}.

-spec use(#role{}, BaseId :: integer()) -> {ok,
					    #role{}} |
					   {false, binary()}.

use(#role{m_say = #m_say{used = BaseId}}, BaseId) ->
    {false,
     lang:get(<<"Hộp trò chuyện này hiện đang được sử "
		"dụng"/utf8>>)};
use(Role = #role{m_say =
		     MSay = #m_say{frames = Frames}},
    BaseId) ->
    case lists:keyfind(BaseId, #say_frame.base_id, Frames)
	of
      #say_frame{base_id = BaseId} ->
	  NewMSay = MSay#m_say{used = BaseId},
	  NewRole = Role#role{m_say = NewMSay},
	  push_used_frame(NewRole),
	  {ok, NewRole};
      _ ->
	  {false,
	   lang:get(<<"Bạn chưa kích hoạt hộp trò chuyện này"/utf8>>)}
    end.

-spec activate(#role{}, map()) -> {ok, #role{}} |
				  {false, binary()}.

activate(Role, #{base_id := BaseId}) ->
    case say_data:get(BaseId) of
      Data = #say_frame_data{is_panel = 1,
			     loss = LossCfg = [_ | _]} ->
	  Loss = format:val_to_loss(LossCfg, del_say),
	  case role_gain:do(Role, Loss) of
	    {ok, LossRole} ->
		Add = profile:make_profile_add(Role, BaseId, #{}),
		case make_say_frame(Role, Add, Data) of
		  {ok, NewFrame, RplFrame} ->
		      NRole = update(LossRole, NewFrame, RplFrame),
		      TimerRole = set_timer(NRole, NewFrame),
		      NewRole = update_attr(TimerRole, Data),
		      push_frame(NewRole, NewFrame),
		      log(NewRole, Role, NewFrame, RplFrame,
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
		  {__Pidsay_frame148, _,
		   {__Levelsay_frame148, __Tracessay_frame148}}
		      when __Levelsay_frame148 band 8 /= 0 orelse
			     __Tracessay_frame148 /= [] ->
		      lager:do_log(error,
				   [{module, say_frame}, {function, activate},
				    {line, 148}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]激活聊天框失败:~w",
						 [Role#role.name, Err]),
				   none, 4096, 8, __Levelsay_frame148,
				   __Tracessay_frame148, lager_event,
				   __Pidsay_frame148);
		  _ -> ok
		end,
		{false,
		 lang:get(<<"Đạo cụ không đủ, không thể kích hoạt"/utf8>>)}
	  end;
      #say_frame_data{} ->
	  {false,
	   lang:get(<<"Hộp trò chuyện đang hoạt động, tự động "
		      "kích hoạt khi nhận được"/utf8>>)};
      _ ->
	  {false,
	   lang:get(<<"Không thể kích hoạt hộp trò chuyện không "
		      "xác định"/utf8>>)}
    end.

-spec update(#role{}, NSayFrame :: #say_frame{},
	     RplSayFrame :: #say_frame{} | undefined) -> #role{}.

update(Role = #role{m_say =
			MSay = #m_say{frames = Frames, used = UseBaseId}},
       NewFrame = #say_frame{base_id = BaseId}, RplFrame) ->
    {NewFrames, RplBaseId} = case RplFrame of
			       #say_frame{base_id = RplBid} ->
				   DelFrames = lists:keydelete(RplBid,
							       #say_frame.base_id,
							       Frames),
				   {lists:keystore(BaseId, #say_frame.base_id,
						   DelFrames, NewFrame),
				    RplBid};
			       _ ->
				   {lists:keystore(BaseId, #say_frame.base_id,
						   Frames, NewFrame),
				    0}
			     end,
    NewMSay = case UseBaseId =:= RplBaseId of
		false -> MSay#m_say{frames = NewFrames};
		_ -> MSay#m_say{frames = NewFrames, used = BaseId}
	      end,
    Role#role{m_say = NewMSay}.

-spec add(RoleOrId :: #role{} | tuple(),
	  Bid :: integer()) -> ok | {ok, #role{}} |
			       {false, binary()}.

add(RoleOrId, Bid) -> add(RoleOrId, Bid, #{}).

-spec add(RoleOrId :: #role{} | tuple(),
	  Bid :: integer(), Ext :: map()) -> ok | {ok, #role{}} |
					     {false, binary()}.

add(Role = #role{}, Bid, Ext) ->
    ProfileAdd = make_say_frame_profile_add(Bid, Ext),
    case say_data:get(Bid) of
      Data = #say_frame_data{} ->
	  case make_say_frame(Role, ProfileAdd, Data) of
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
	    {__Pidsay_frame193, _,
	     {__Levelsay_frame193, __Tracessay_frame193}}
		when __Levelsay_frame193 band 8 /= 0 orelse
		       __Tracessay_frame193 /= [] ->
		lager:do_log(error,
			     [{module, say_frame}, {function, add}, {line, 193},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]更新未配置的聊天框Bid:~w",
					   [Role#role.name, Bid]),
			     none, 4096, 8, __Levelsay_frame193,
			     __Tracessay_frame193, lager_event,
			     __Pidsay_frame193);
	    _ -> ok
	  end,
	  {false,
	   lang:get(<<"Hộp trò chuyện không tồn tại"/utf8>>)}
    end;
add(RoleId = {_Rid, _SrvId}, Bid, Ext) ->
    profile_mgr:async_add(RoleId, say_frame, Bid, Ext).

-spec check(#role{}) -> {ok, #role{}}.

check(Role) ->
    NRole = overdue(Role),
    NewRole = profile_attr:update(NRole),
    {ok, set_timer(NewRole)}.

-spec init_frame(#say_frame_data{} |
		 pos_integer()) -> {ok, #say_frame{}} |
				   {false, binary()}.

init_frame(#say_frame_data{base_id = BaseId,
			   expire_type = ExpireType,
			   expire_time = ExpireTime}) ->
    {_NewExpireType, NewExpireTime} =
	item:make_expire(BaseId, ExpireType, ExpireTime),
    {ok,
     #say_frame{base_id = BaseId,
		expire_time = NewExpireTime}};
init_frame(BaseId) ->
    case say_data:get(BaseId) of
      Data = #say_frame_data{} -> init_frame(Data);
      _ ->
	  {false,
	   lang:get(<<"Không thể khởi tạo hộp trò chuyện không "
		      "xác định"/utf8>>)}
    end.

-spec set_timer(#role{}) -> #role{}.

set_timer(Role = #role{m_say = #m_say{frames = L}}) ->
    Now = date:unixtime(),
    case [ExpireTime - Now
	  || #say_frame{expire_time = ExpireTime} <- L,
	     ExpireTime > 0]
	of
      [] -> Role;
      TL ->
	  T = max(1, lists:min(TL)),
	  role_timer:set(#timer{id = say_frame_check_timer,
				timeout = T * 1000, m = say_frame, f = check,
				a = []},
			 Role)
    end.

set_timer(Role, #say_frame{base_id = BaseId}) ->
    case say_frame_data:get(BaseId) of
      #say_frame_data{expire_type = 0} -> Role;
      _ -> set_timer(Role)
    end;
set_timer(Role, _SayFrame) -> set_timer(Role).

-spec log(NRole :: #role{}, Role :: #role{},
	  Frame :: #say_frame{}, RplFrame :: #say_frame{}) -> ok.

log(NRole, Role, Frame, RplFrame) ->
    log(NRole, Role, Frame, RplFrame, #{}).

log(NRole, Role,
    #say_frame{base_id = BaseId, expire_time = ExpireTime},
    RplFrame, LogData) ->
    LogTitle = maps:get(log_title, LogData,
			lang:get(<<"Nhận được"/utf8>>)),
    GL = maps:get(gl, LogData, []),
    LogMsg = case RplFrame of
	       #say_frame{base_id = RplBaseId,
			  expire_time = RplExpireTime} ->
		   util:fbin(<<"~ts:Bid:~w,Expire:~w,RplBid:~w,RplExpire:~w"/utf8>>,
			     [LogTitle, BaseId, ExpireTime, RplBaseId,
			      RplExpireTime]);
	       _ ->
		   util:fbin(<<"~ts:Bid:~w,Expire:~w"/utf8>>,
			     [LogTitle, BaseId, ExpireTime])
	     end,
    log:save(log_profile,
	     {GL, Role, NRole, <<"聊天框"/utf8>>, LogMsg}),
    ok.

-spec make_say_frame(#role{}, Add :: #profile_add{},
		     Data :: #say_frame_data{}) -> {ok, #say_frame{},
						    #say_frame{} | undefined} |
						   {false, Msg :: binary()}.

make_say_frame(Role, ProfileAdd, AddData) ->
    make_say_frame(Role, ProfileAdd, AddData, #{}).

-spec make_say_frame(#role{}, Add :: #profile_add{},
		     Data :: #say_frame_data{}, Opt :: map()) -> {ok,
								  #say_frame{},
								  #say_frame{} |
								  undefined} |
								 {false,
								  Msg ::
								      binary()}.

make_say_frame(Role = #role{m_say =
				#m_say{frames = Frames}},
	       Add, AddData = #say_frame_data{group = Group}, Opt) ->
    case same_group(Frames, Group) of
      {ok, _RplSayFrame, #say_frame_data{expire_type = 0}} ->
	  {false,
	   lang:get(<<"Hộp trò chuyện cố định đã được kích "
		      "hoạt và không cần phải kích hoạt lại"/utf8>>)};
      {ok, RplSayFrame, _Data} ->
	  make_say_frame(Role, Add, AddData, RplSayFrame, Opt);
      false ->
	  make_say_frame(Role, Add, AddData, undefined, Opt)
    end.

make_say_frame(Role, Add,
	       AddData = #say_frame_data{base_id = Bid,
					 overlap = Overlap,
					 expire_type = AddExpireType},
	       RplSayFrame, _Opt) ->
    case init_frame(AddData) of
      {ok,
       AddSayFrame = #say_frame{expire_time = ExpireTime}} ->
	  case AddExpireType =:= 0 of
	    false ->
		case {Overlap, RplSayFrame} of
		  {1, #say_frame{expire_time = OldExpireTime}} ->
		      NewTime = calc_expire_time(Overlap, OldExpireTime,
						 ExpireTime, Add),
		      {ok, AddSayFrame#say_frame{expire_time = NewTime},
		       RplSayFrame};
		  {0, #say_frame{expire_time = OldExpireTime}} ->
		      case ExpireTime > OldExpireTime of
			true ->
			    NewTime = calc_expire_time(Overlap, OldExpireTime,
						       ExpireTime, Add),
			    {ok, AddSayFrame#say_frame{expire_time = NewTime},
			     RplSayFrame};
			false ->
			    {false,
			     lang:get(<<"Hộp trò chuyện hiện tại tồn tại lâu "
					"hơn và không cần phải kích hoạt lại"/utf8>>)}
		      end;
		  {_, undefined} ->
		      Now = date:unixtime(),
		      ElapseTime = elapse_time(Add, Now),
		      NewTime = ExpireTime - ElapseTime,
		      case NewTime > Now of
			true ->
			    {ok, AddSayFrame#say_frame{expire_time = NewTime},
			     RplSayFrame};
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
			      {__Pidsay_frame293, _,
			       {__Levelsay_frame293, __Tracessay_frame293}}
				  when __Levelsay_frame293 band 64 /= 0 orelse
					 __Tracessay_frame293 /= [] ->
				  lager:do_log(info,
					       [{module, say_frame},
						{function, make_say_frame},
						{line, 293},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("[~ts]聊天框已过期Bid:~w, ExTime:~w, Now:~w",
							     [Role#role.name,
							      Bid, ExpireTime,
							      Now]),
					       none, 4096, 64,
					       __Levelsay_frame293,
					       __Tracessay_frame293,
					       lager_event, __Pidsay_frame293);
			      _ -> ok
			    end,
			    {false,
			     lang:get(<<"Hộp trò chuyện đã hết hạn"/utf8>>)}
		      end;
		  {_, #say_frame{base_id = Bid}} ->
		      {false,
		       lang:get(<<"Không thể thay thế cùng một hộp trò "
				  "chuyện"/utf8>>)};
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
			{__Pidsay_frame299, _,
			 {__Levelsay_frame299, __Tracessay_frame299}}
			    when __Levelsay_frame299 band 8 /= 0 orelse
				   __Tracessay_frame299 /= [] ->
			    lager:do_log(error,
					 [{module, say_frame},
					  {function, make_say_frame},
					  {line, 299},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("[~ts]更新聊天框失败[bid:~w][Err:~w]",
						       [Role#role.name, Bid,
							Unknow]),
					 none, 4096, 8, __Levelsay_frame299,
					 __Tracessay_frame299, lager_event,
					 __Pidsay_frame299);
			_ -> ok
		      end,
		      {false,
		       lang:get(<<"Hết thời gian chờ hộp trò chuyện chưa "
				  "xử lý"/utf8>>)}
		end;
	    true -> {ok, AddSayFrame, RplSayFrame}
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
	    {__Pidsay_frame306, _,
	     {__Levelsay_frame306, __Tracessay_frame306}}
		when __Levelsay_frame306 band 8 /= 0 orelse
		       __Tracessay_frame306 /= [] ->
		lager:do_log(error,
			     [{module, say_frame}, {function, make_say_frame},
			      {line, 306}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]更新聊天框初始化失败[bid:~w][Err:~w]",
					   [Role#role.name, Bid, Err]),
			     none, 4096, 8, __Levelsay_frame306,
			     __Tracessay_frame306, lager_event,
			     __Pidsay_frame306);
	    _ -> ok
	  end,
	  {false,
	   lang:get(<<"Không thể tạo hộp trò chuyện"/utf8>>)}
    end.

overdue(Role = #role{m_say =
			 MSay = #m_say{used = BaseId, frames = Frames}}) ->
    Now = date:unixtime(),
    NewFrames = [Frame
		 || Frame = #say_frame{expire_time = ExpireTime}
			<- Frames,
		    ExpireTime =:= 0 orelse ExpireTime > Now],
    NewBaseId = case lists:keyfind(BaseId,
				   #say_frame.base_id, NewFrames)
		    of
		  false ->
		      case NewFrames of
			[#say_frame{base_id = NextBaseId} | _] -> NextBaseId;
			_ -> 0
		      end;
		  _ -> BaseId
		end,
    NewMSay = MSay#m_say{used = NewBaseId,
			 frames = NewFrames},
    Role#role{m_say = NewMSay}.

push_frame(Role, Frame) ->
    role:pack_send(Role, 12703, {[Frame]}), ok.

push_used_frame(Role = #role{m_say =
				 #m_say{used = Used}}) ->
    role:pack_send(Role, 12701, {Used}), ok.

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
same_group([Frame = #say_frame{base_id = BaseId}
	    | Rest],
	   Group) ->
    case say_data:get(BaseId) of
      Data = #say_frame_data{group = Group} ->
	  {ok, Frame, Data};
      _ -> same_group(Rest, Group)
    end.

make_say_frame_profile_add(Bid, Ext) ->
    profile:make_profile_add(say_frame, Bid, Ext).

update_attr(Role, #say_frame_data{attr = Attr}) ->
    case Attr of
      [_ | _] -> profile_attr:update(Role);
      _ -> Role
    end.


