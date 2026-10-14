-file("src/mod/mail/feedback.erl", 1).

-module(feedback).

-lager_records([{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{role_feedback_info,
		 [role_id, id, state, status2, start_time, end_msg_time,
		  finish_time, score_time, title, content,
		  questions_lists, answer_lists, score]},
		{feedback,
		 [sess, rid, feedback_id, status, score, send_time,
		  time_out]},
		{gmail,
		 [id, type, mail_type, subject, content, assets, items,
		  start_time, end_time, conds, source, can_del]},
		{mail,
		 [sess, to, to_name, from, from_name, type, group_id,
		  status, subject, content, assets, items, source, rev_ts,
		  read_time, send_time, time_out, can_del]},
		{vip_effect_data, [name, val]},
		{vip_data,
		 [lev, gold, price, old_price, items, ext_reward]},
		{m_vip, [ver, lev, lev_reward, tired_charge]},
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
		{link, [socket, conn_pid, ip, port, lag]},
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

-export([submit/8, reply_submit/3, get_feedback/1,
	 info/1, update_feed/2]).

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

-file("src/mod/mail/feedback.erl", 14).

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

-file("src/mod/mail/feedback.erl", 15).

-file("inc/link.hrl", 1).

-record(link,
	{socket, conn_pid, ip = {127, 0, 0, 1}, port, lag}).

-file("src/mod/mail/feedback.erl", 16).

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

-file("src/mod/mail/feedback.erl", 17).

-file("inc/vip.hrl", 1).

-record(m_vip,
	{ver = 2, lev = 0, lev_reward = [], tired_charge = []}).

-record(vip_data,
	{lev = 0  :: non_neg_integer(),
	 gold = 0  :: non_neg_integer(), price = []  :: list(),
	 old_price = []  :: list(), items = []  :: list(),
	 ext_reward = []}).

-record(vip_effect_data,
	{name = <<>>  :: bitstring(),
	 val = 0  :: non_neg_integer()}).

-file("src/mod/mail/feedback.erl", 18).

-file("inc/mail.hrl", 1).

-record(mail,
	{sess  :: {pos_integer(), bitstring()},
	 to  :: {pos_integer(), bitstring()},
	 to_name = <<>>  :: bitstring(),
	 from  :: {non_neg_integer(), bitstring()},
	 from_name = <<>>  :: bitstring(), type = 1  :: 0..1,
	 group_id = 0  :: non_neg_integer(), status = 0  :: 0..1,
	 subject = <<>>  :: bitstring(),
	 content = <<>>  :: bitstring(),
	 assets = []  :: [tuple()], items = []  :: [tuple()],
	 source = <<>>  :: pos_integer(),
	 rev_ts = 0  :: pos_integer(),
	 read_time = 0  :: pos_integer(),
	 send_time = 0  :: pos_integer(),
	 time_out = 0  :: pos_integer(), can_del = 1  :: 0..1}).

-record(gmail,
	{id = 0, type = 0  :: non_neg_integer(),
	 mail_type = 1  :: non_neg_integer(),
	 subject = <<>>  :: bitstring(),
	 content = <<>>  :: bitstring(),
	 assets = []  :: [tuple()], items = []  :: [tuple()],
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 conds = []  :: list(), source = <<>>  :: pos_integer(),
	 can_del = 1  :: 0..1}).

-record(feedback,
	{sess, rid, feedback_id = 0, status = 0, score = 0,
	 send_time = 0, time_out = 0}).

-record(role_feedback_info,
	{role_id, id = 0, state = 0, status2 = 0,
	 start_time = 0, end_msg_time = 0, finish_time = 0,
	 score_time = 0, title = <<>>, content = <<>>,
	 questions_lists = [], answer_lists = [], score = 0}).

-file("src/mod/mail/feedback.erl", 19).

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

-file("src/mod/mail/feedback.erl", 20).

info(Role) ->
    FeedLisst = feedback_mgr:get_log(Role),
    PushList = [Info#role_feedback_info{state =
					    util:if_true(State == 5, 4, State)}
		|| Info = #role_feedback_info{state = State}
		       <- FeedLisst],
    sys_conn:pack_send(10813, {PushList}),
    ok.

update_feed(Role = #role{id = RoleId}, Id) ->
    case feedback_mgr:get_log_info(RoleId, Id) of
      Info = #role_feedback_info{} ->
	  sys_conn:pack_send(10814, {Info});
      _ -> skip
    end,
    {ok, Role}.

-spec submit(#role{}, integer(), bitstring(),
	     bitstring(), bitstring(), bitstring(), bitstring(),
	     pos_integer()) -> {false, bitstring()} | {ok, #role{}}.

submit(_Role, _Type, <<>>, _Content, _Phone, _Email,
       _PhoneInfo, _Id) ->
    {false, lang:get(<<"请填写标题"/utf8>>)};
submit(_Role, _Type, _Title, <<>>, _Phone, _Email,
       _PhoneInfo, _Id) ->
    {false, lang:get(<<"请填写内容"/utf8>>)};
submit(_Role, _Type, Title, _Content, _Phone, _Email,
       _PhoneInfo, _Id)
    when byte_size(Title) > 100 ->
    {false, lang:get(<<"标题长度过长"/utf8>>)};
submit(_Role, _Type, _Title, Content, _Phone, _Email,
       _PhoneInfo, _Id)
    when byte_size(Content) > 1000 ->
    {false, lang:get(<<"内容长度过长"/utf8>>)};
submit(Role = #role{account = Account,
		    id = RoleId = {Rid, SrvId}, platform = Platform,
		    zone_id = ZoneId, channel = ChannelName, name = Name,
		    lev = Lev, link = #link{ip = IP},
		    package_name = PackageName, package_ver = PackageVer,
		    app_name = AppName, os_ver = OsVer,
		    m_vip = #m_vip{lev = VipLev},
		    assets = #assets{vip_exp = VipExp}},
       Type, Title, Content1, Phone, Email, PhoneInfo, Id) ->
    case check_submit(Role, Type, Id) of
      true ->
	  Url = lists:concat(["http://", game_lib:oss_url(),
			      "/index.php/message/feedback"]),
	  Time = date:unixtime(),
	  Sign =
	      string_util:md5(lists:concat([binary_to_list(<<"sszg">>),
					    Time,
					    "cmRcnnv1ky43qwc2379m28VKpcjc58cycYb2myXz"])),
	  IPStr = log_util:ipstr(IP),
	  FullName = <<>>,
	  Image = <<>>,
	  Content =
	      util:fbin("~ts(id:~ts,ver:~ts,name:~ts,os:~ts)",
			[Content1, PackageName, PackageVer, AppName, OsVer]),
	  FeedbackId = util:if_true(Type == 4, Id,
				    var:get_var(Role, other, 3086, 1)),
	  PushType = util:if_true(Type == 4, 1, Type),
	  List = [{product_name, <<"sszg">>}, {date_time, Time},
		  {sign, Sign}, {platform_name, Platform},
		  {channel_name, ChannelName}, {gameserver_no, ZoneId},
		  {role_id, Rid}, {role_name, Name}, {account, Account},
		  {lv, Lev}, {type, PushType}, {title, Title},
		  {content, Content}, {post_time, Time}, {ip, IPStr},
		  {phone, Phone}, {full_name, FullName}, {image, Image},
		  {vip_lv, VipLev}, {amount, VipExp div 10},
		  {order_id,
		   util:fbin("~w_~s:~w", [Rid, SrvId, FeedbackId])},
		  {mail, Email}, {device, PhoneInfo}],
	  Body = game_lib:to_url_body_str(List),
	  case catch httpc:request(post,
				   {Url, [],
				    "application/x-www-form-urlencoded", Body},
				   [{timeout, 5000}], [])
	      of
	    {ok, {_StatusLine, _Headers, RtnBody}} ->
		case ejson:decode(RtnBody) of
		  {[{<<"success">>, true} | _]} ->
		      NewRole = case Type == 4 of
				  true ->
				      feedback_mgr:info({new_questions, RoleId,
							 FeedbackId, Content1}),
				      Role;
				  _ ->
				      RoleFeedInfo = #role_feedback_info{role_id
									     =
									     RoleId,
									 id =
									     FeedbackId,
									 state =
									     1,
									 status2
									     =
									     1,
									 start_time
									     =
									     Time,
									 title =
									     Title,
									 content
									     =
									     Content1,
									 questions_lists
									     =
									     [{Time,
									       Content1}],
									 answer_lists
									     =
									     [{Time,
									       lang:get(<<"      亲爱的冒险者大人：您的问题已经成功提交，客服\n将在接到消息后1~2个工作日内"
											  "给您反馈，请您耐心\n等待~"/utf8>>)}]},
				      feedback_mgr:info({new_feedback,
							 RoleFeedInfo}),
				      var:set_var(Role, other, 3086,
						  FeedbackId + 1)
				end,
		      {ok, NewRole, FeedbackId};
		  {[{<<"success">>, false}, {<<"message">>, Msg}]}
		      when is_binary(Msg) ->
		      {false, Msg};
		  _ ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidfeedback91, _,
			 {__Levelfeedback91, __Tracesfeedback91}}
			    when __Levelfeedback91 band 8 /= 0 orelse
				   __Tracesfeedback91 /= [] ->
			    lager:do_log(error,
					 [{module, feedback},
					  {function, submit}, {line, 91},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("ret==>~ts", [RtnBody]),
					 none, 4096, 8, __Levelfeedback91,
					 __Tracesfeedback91, lager_event,
					 __Pidfeedback91);
			_ -> ok
		      end,
		      {false, lang:get(<<"提交失败"/utf8>>)}
		end;
	    {error, _Reason} ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidfeedback95, _,
		   {__Levelfeedback95, __Tracesfeedback95}}
		      when __Levelfeedback95 band 8 /= 0 orelse
			     __Tracesfeedback95 /= [] ->
		      lager:do_log(error,
				   [{module, feedback}, {function, submit},
				    {line, 95}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("反馈接口提交异常~w", [_Reason]), none,
				   4096, 8, __Levelfeedback95,
				   __Tracesfeedback95, lager_event,
				   __Pidfeedback95);
		  _ -> ok
		end,
		{false, lang:get(<<"提交失败"/utf8>>)};
	    Any ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidfeedback98, _,
		   {__Levelfeedback98, __Tracesfeedback98}}
		      when __Levelfeedback98 band 8 /= 0 orelse
			     __Tracesfeedback98 /= [] ->
		      lager:do_log(error,
				   [{module, feedback}, {function, submit},
				    {line, 98}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("反馈接口提交异常~w", [Any]), none,
				   4096, 8, __Levelfeedback98,
				   __Tracesfeedback98, lager_event,
				   __Pidfeedback98);
		  _ -> ok
		end,
		{false, lang:get(<<"提交失败"/utf8>>)}
	  end;
      {false, Msg} -> {false, Msg}
    end.

-spec reply_submit(#role{}, {integer(), bitstring()},
		   integer()) -> {false, bitstring()} | {ok, #role{}}.

reply_submit(_Role, _Id, Score)
    when Score < 1 orelse Score > 5 ->
    {false, lang:get(<<"请选择评分"/utf8>>)};
reply_submit(Role = #role{id = RoleId = {Rid, Sid}}, Id,
	     Score) ->
    case feedback_mgr:get_log_info(RoleId, Id) of
      #role_feedback_info{state = 3} ->
	  Url = lists:concat(["http://", game_lib:oss_url(),
			      "/index.php/message/feedbackScore"]),
	  Time = date:unixtime(),
	  Sign =
	      string_util:md5(lists:concat([binary_to_list(<<"sszg">>),
					    Time,
					    "cmRcnnv1ky43qwc2379m28VKpcjc58cycYb2myXz"])),
	  Extend = lists:flatten(json:encode({struct,
					      [{order_id,
						util:fbin("~w_~s:~w",
							  [Rid, Sid, Id])},
					       {score, Score}]})),
	  List = [{product_name, <<"sszg">>}, {date_time, Time},
		  {sign, Sign}, {extend, Extend}],
	  Body = game_lib:to_url_body_str(List),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidfeedback118, _,
	     {__Levelfeedback118, __Tracesfeedback118}}
		when __Levelfeedback118 band 128 /= 0 orelse
		       __Tracesfeedback118 /= [] ->
		lager:do_log(debug,
			     [{module, feedback}, {function, reply_submit},
			      {line, 118}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("反馈请求本体 ~w", [Body]), none, 4096,
			     128, __Levelfeedback118, __Tracesfeedback118,
			     lager_event, __Pidfeedback118);
	    _ -> ok
	  end,
	  case catch httpc:request(post,
				   {Url, [],
				    "application/x-www-form-urlencoded", Body},
				   [{timeout, 5000}], [])
	      of
	    {ok, {_StatusLine, _Headers, RtnBody}} ->
		case ejson:decode(RtnBody) of
		  {[{<<"success">>, true} | _]} ->
		      feedback_mgr:info({do_score, RoleId, Id, Score}),
		      {ok, Role};
		  {[{<<"success">>, false}, {<<"message">>, Msg}]}
		      when is_binary(Msg) ->
		      {false, Msg};
		  _ ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidfeedback128, _,
			 {__Levelfeedback128, __Tracesfeedback128}}
			    when __Levelfeedback128 band 8 /= 0 orelse
				   __Tracesfeedback128 /= [] ->
			    lager:do_log(error,
					 [{module, feedback},
					  {function, reply_submit}, {line, 128},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("ret==>~ts", [RtnBody]),
					 none, 4096, 8, __Levelfeedback128,
					 __Tracesfeedback128, lager_event,
					 __Pidfeedback128);
			_ -> ok
		      end,
		      {false, lang:get(<<"提交失败"/utf8>>)}
		end;
	    {error, _Reason} ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidfeedback132, _,
		   {__Levelfeedback132, __Tracesfeedback132}}
		      when __Levelfeedback132 band 8 /= 0 orelse
			     __Tracesfeedback132 /= [] ->
		      lager:do_log(error,
				   [{module, feedback},
				    {function, reply_submit}, {line, 132},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("客服反馈评分接口提交异常~w", [_Reason]),
				   none, 4096, 8, __Levelfeedback132,
				   __Tracesfeedback132, lager_event,
				   __Pidfeedback132);
		  _ -> ok
		end,
		{false, lang:get(<<"提交失败"/utf8>>)};
	    Any ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidfeedback135, _,
		   {__Levelfeedback135, __Tracesfeedback135}}
		      when __Levelfeedback135 band 8 /= 0 orelse
			     __Tracesfeedback135 /= [] ->
		      lager:do_log(error,
				   [{module, feedback},
				    {function, reply_submit}, {line, 135},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("客服反馈评分接口提交异常~w", [Any]), none,
				   4096, 8, __Levelfeedback135,
				   __Tracesfeedback135, lager_event,
				   __Pidfeedback135);
		  _ -> ok
		end,
		{false, lang:get(<<"提交失败"/utf8>>)}
	  end;
      #role_feedback_info{state = 4} ->
	  {false, lang:get(<<"已评分"/utf8>>)};
      #role_feedback_info{} ->
	  {false, lang:get(<<"该反馈不可评分"/utf8>>)};
      _ -> {false, lang:get(<<"反馈不存在"/utf8>>)}
    end.

get_feedback(Sess) ->
    case ets:lookup(mailbox_feedback, Sess) of
      [F] -> {ok, F};
      _ -> false
    end.

check_submit(#role{id = RoleId}, Type, Id) ->
    case role_misc:check_cd(feedback_cd_time, 1000) of
      false -> {false, lang:get(<<"提交过于频繁，请10分后再发送"/utf8>>)};
      true when Type == 4 ->
	  case feedback_mgr:get_log_info(RoleId, Id) of
	    #role_feedback_info{state = 2, questions_lists = QL}
		when length(QL) >= 10 ->
		{false, lang:get(<<"追问问题已达上限，不能再追加了"/utf8>>)};
	    #role_feedback_info{state = 2} -> true;
	    _ -> {false, lang:get(<<"参数错误"/utf8>>)}
	  end;
      _ -> true
    end.


