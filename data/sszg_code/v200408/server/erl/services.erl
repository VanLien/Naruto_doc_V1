-file("src/services.erl", 1).

-module(services).

-lager_records([{service,
		 [id, name, mfa, multi, world, depend_on, can_stop,
		  restart, type]}]).

-export([check/0, check/1, cfg/1, config/1, get/1]).

-file("inc/service.hrl", 1).

-record(service,
	{id  :: atom(), name = ""  :: bitstring(),
	 mfa  :: undefined | {atom(), atom(), list()},
	 multi = false  :: boolean(),
	 world = false  :: boolean(), depend_on = []  :: list(),
	 can_stop = false  :: boolean(),
	 restart = transient  ::
	     permanent | transient | temporary,
	 type = worker  :: worker | supervisor}).

-file("src/services.erl", 18).

check() -> check(undefined).

check(Ver)
    when is_atom(Ver) andalso Ver =/= undefined ->
    check(atom_to_list(Ver));
check(Ver) ->
    {ok, L} = cfg(sys_env:get(server_type)),
    LastMod = lists:last(L),
    NowVer = sys_env:get(version),
    case whereis(LastMod) of
      undefined -> not_start_ok;
      _ when Ver =/= NowVer andalso Ver =/= undefined ->
	  not_start_ok;
      _ -> start_finish
    end.

-spec cfg(atom()) -> {ok, list()} | {error, undefined}.

cfg(shell) -> {ok, []};
cfg(center) ->
    {ok,
     [sys_gc, sup_db_buffer, map_mgr, role_num_online,
      rank_mgr, c_group_control_mgr, log_http, log_http_json,
      c_cluster_dynamic_group, say_subtitle,
      partner_comment_mgr, combat_mgr, c_guild_war_mgr,
      c_invite_code_mgr, c_arena_elite_mgr,
      c_holiday_personal_gift_mgr, c_arena_peak_champion_mgr,
      c_role_auth_visitors, c_partner_rand_mgr,
      c_formation_role_mgr, c_holiday_arena_team_mgr,
      c_gm_mgr, cluster_srv, cluster_msg, big_world_srv,
      global_event, sup_acceptor, sys_listener]};
cfg(zone) ->
    {ok,
     [ip_mgr, sys_gc, var, sup_db_buffer, cluster_cli,
      cluster_group, cluster_msg, role_group, mail, world_lev,
      big_world_cli, cluster_dynamic_group, role_data,
      role_query, activity_global, role_match, unit_mgr,
      map_mgr, combat_mgr, combat_replay_mgr,
      combat_replay_cache_mgr, replay_hall_mgr, keyword,
      say_voice, say_mgr, role_num_online, notice_mgr,
      notice_board, adm_mgr, guild_dun_mgr, holiday_dial_mgr,
      home_mgr, guild_secret_area_rank, guild_secret_area_mgr,
      friend_mgr, log_mgr, log_http, log_http_json,
      guild_rank, guild_mgr, drop_mgr, rank_mgr, charge_mgr,
      role_robot, profile_mgr, holiday_valentines_mgr,
      arena_mgr, arena_log, arena_champion_mgr,
      holiday_groupon, holiday_term_begins_mgr,
      holiday_merge_goal_mgr, holiday_petard_mgr,
      holiday_nian_mgr, holiday_practise_tower_mgr,
      monopoly_dungeons_guild_rank, holiday_mgr, recruit_mgr,
      adventure_mgr, say_subtitle, star_tower_mgr,
      guild_dun_rank, questionnaire_mgr, group_control_mgr,
      stronger_mgr, getui_mgr, endless_mgr, escort_mgr,
      escort_log_mgr, invite_code_mgr, server_monitor,
      honor_mgr, primus_mgr, holiday_dial, sky_ladder_mgr,
      role_auth, expedition_mgr, lev_gift_mgr, dungeon_mgr,
      guild_war_mgr, arena_elite_mgr, arena_elite_log_mgr,
      element_temple_mgr, holiday_break_egg_mgr,
      holy_eqm_lottery_mgr, arena_cluster_mgr, role_room_mgr,
      room_feat_mgr, room_bbs_mgr, arena_cluster_champion_mgr,
      holiday_personal_gift_mgr, voting_mgr, ets_mgr,
      arena_team_mgr, arena_team_lobby_mgr, role_weekly_mgr,
      arena_peak_champion_mgr, holiday_return_new_mgr,
      feedback_mgr, holiday_lucky_dog_mgr, adventure_mine_mgr,
      partner_rand_mgr, formation_role_mgr,
      holiday_arena_team_mgr, global_event, sys_shutdown,
      sup_acceptor, sys_listener]};
cfg(_) -> {error, undefined}.

-spec get(atom()) -> {ok, #service{}} |
		     {error, undefined}.

get(sup_acceptor = Id) ->
    {ok,
     #service{id = Id, name = "acceptor监控树",
	      mfa = {sup_acceptor, start_link, []},
	      type = supervisor}};
get(sys_listener = Id) ->
    {ok,
     #service{id = Id, name = "socket监听服务",
	      mfa = {sys_listener, start_link, []},
	      depend_on = [env, sup_acceptor]}};
get(c_guild_war_mgr = Id) ->
    {ok,
     #service{id = Id, name = "联盟战中央服进程",
	      mfa = {c_guild_war_mgr, start_link, []},
	      depend_on = [env, sup_acceptor]}};
get(guild_war_mgr = Id) ->
    {ok,
     #service{id = Id, name = "联盟战管理进程",
	      mfa = {guild_war_mgr, start_link, []},
	      depend_on = [env, sup_acceptor]}};
get(sys_shutdown = Id) ->
    {ok,
     #service{id = Id, name = "关闭应用善后服务",
	      mfa = {sys_shutdown, start_link, []}}};
get(sys_gc = Id) ->
    {ok,
     #service{id = Id, name = "垃圾回收",
	      mfa = {sys_gc, start_link, []}}};
get(cross_group = Id) ->
    {ok,
     #service{id = Id, name = "跨服组内调用服务",
	      mfa = {cross_group, start_link, []}}};
get(ip_mgr = Id) ->
    {ok,
     #service{id = Id, name = "IP管理服务",
	      mfa = {ip_mgr, start_link, []}}};
get(c_gm_mgr = Id) ->
    {ok,
     #service{id = Id, name = "GM管理服务",
	      mfa = {c_gm_mgr, start_link, []}}};
get(sup_db_buffer = Id) ->
    {ok,
     #service{id = Id, name = "数据库缓存",
	      mfa = {sup_db_buffer, start_link, []}}};
get(var = Id) ->
    {ok,
     #service{id = Id, name = "角色变量",
	      mfa = {var, start_link, []}}};
get(big_world_srv = Id) ->
    {ok,
     #service{id = Id, name = "大世界服务端集群",
	      mfa = {big_world_srv, start_link, []}}};
get(big_world_cli = Id) ->
    {ok,
     #service{id = Id, name = "大世界客户端集群",
	      mfa = {big_world_cli, start_link, []}}};
get(cluster_srv = Id) ->
    {ok,
     #service{id = Id, name = "服务端集群",
	      mfa = {cluster_srv, start_link, []}}};
get(cluster_cli = Id) ->
    {ok,
     #service{id = Id, name = "客户端集群",
	      mfa = {cluster_cli, start_link, []}}};
get(cluster_group = Id) ->
    {ok,
     #service{id = Id, name = "客户端集群分组",
	      mfa = {cluster_group, start_link, []}}};
get(cluster_msg = Id) ->
    {ok,
     #service{id = Id, name = "集群信息分发进程",
	      mfa = {cluster_msg, start_link, []}}};
get(global_event = Id) ->
    {ok,
     #service{id = Id, name = "全局事件",
	      mfa = {global_event, start_link, []}}};
get(role_data = Id) ->
    {ok,
     #service{id = Id, name = "角色数据",
	      mfa = {role_data, start_link, []}}};
get(role_query = Id) ->
    {ok,
     #service{id = Id, name = "角色查询接口",
	      mfa = {role_query, start_link, []}}};
get(role_match = Id) ->
    {ok,
     #service{id = Id, name = "角色匹配接口",
	      mfa = {role_match, start_link, []}}};
get(role_group = Id) ->
    {ok,
     #service{id = Id, name = "角色分组",
	      mfa = {role_group, start_link, []}}};
get(activity_global = Id) ->
    {ok,
     #service{id = Id, name = "活动状态管理",
	      mfa = {activity_global, start_link, []}}};
get(role_num_online = Id) ->
    {ok,
     #service{id = Id, name = "每日最大在线人数",
	      mfa = {role_num_online, start_link, []}}};
get(adm_mgr = Id) ->
    {ok,
     #service{id = Id, name = "GM封停相关",
	      mfa = {adm_mgr, start_link, []}}};
get(keyword = Id) ->
    {ok,
     #service{id = Id, name = "关键词",
	      mfa = {keyword, start_link, []}}};
get(say_mgr = Id) ->
    {ok,
     #service{id = Id, name = "世界聊天",
	      mfa = {say_mgr, start_link, []}}};
get(say_voice = Id) ->
    {ok,
     #service{id = Id, name = "语音缓存",
	      mfa = {say_voice, start_link, []}}};
get(notice_mgr = Id) ->
    {ok,
     #service{id = Id, name = "公告管理",
	      mfa = {notice_mgr, start_link, []}}};
get(notice_board = Id) ->
    {ok,
     #service{id = Id, name = "通知管理",
	      mfa = {notice_board, start_link, []}}};
get(friend_mgr = Id) ->
    {ok,
     #service{id = Id, name = "好友管理进程",
	      mfa = {friend_mgr, start_link, []}}};
get(mail = Id) ->
    {ok,
     #service{id = Id, name = "邮件管理进程",
	      mfa = {mail, start_link, []}}};
get(log_mgr = Id) ->
    {ok,
     #service{id = Id, name = "日志管理进程",
	      mfa = {log_mgr, start_link, []}}};
get(log_http = Id) ->
    {ok,
     #service{id = Id, name = "HTTP上报管理进程",
	      mfa = {log_http, start_link, []}}};
get(log_http_json = Id) ->
    {ok,
     #service{id = Id, name = "HTTP_Json打包上报管理进程",
	      mfa = {log_http_json, start_link, []}}};
get(guild_mgr = Id) ->
    {ok,
     #service{id = Id, name = "公会管理进程",
	      mfa = {guild_mgr, start_link, []}}};
get(guild_rank = Id) ->
    {ok,
     #service{id = Id, name = "公会排行管理进程",
	      mfa = {guild_rank, start_link, []}}};
get(drop_mgr = Id) ->
    {ok,
     #service{id = Id, name = "掉落管理进程",
	      mfa = {drop_mgr, start_link, []}}};
get(rank_mgr = Id) ->
    {ok,
     #service{id = Id, name = "排行榜管理进程",
	      mfa = {Id, start_link, []}}};
get(charge_mgr = Id) ->
    {ok,
     #service{id = Id, name = "充值管理进程",
	      mfa = {Id, start_link, []}}};
get(role_robot = Id) ->
    {ok,
     #service{id = Id, name = "角色机器人",
	      mfa = {Id, start_link, []}}};
get(arena_mgr = Id) ->
    {ok,
     #service{id = Id, name = "竞技场进程",
	      mfa = {Id, start_link, []}}};
get(arena_log = Id) ->
    {ok,
     #service{id = Id, name = "竞技场日志",
	      mfa = {Id, start_link, []}}};
get(arena_champion_mgr = Id) ->
    {ok,
     #service{id = Id, name = "竞技场冠军赛进程",
	      mfa = {Id, start_link, []}}};
get(holiday_groupon = Id) ->
    {ok,
     #service{id = Id, name = "团购活动管理进程",
	      mfa = {Id, start_link, []}}};
get(holiday_mgr = Id) ->
    {ok,
     #service{id = Id, name = "活动管理进程",
	      mfa = {Id, start_link, []}}};
get(combat_replay_mgr = Id) ->
    {ok,
     #service{id = Id, name = "战斗录像管理进程",
	      mfa = {Id, start_link, []}}};
get(combat_replay_cache_mgr = Id) ->
    {ok,
     #service{id = Id, name = "战斗录像管理进程",
	      mfa = {Id, start_link, []}}};
get(replay_hall_mgr = Id) ->
    {ok,
     #service{id = Id, name = "录像大厅管理进程",
	      mfa = {Id, start_link, []}}};
get(partner_comment_mgr = Id) ->
    {ok,
     #service{id = Id, name = "伙伴评论",
	      mfa = {Id, start_link, []}}};
get(say_subtitle = Id) ->
    {ok,
     #service{id = Id, name = "弹幕进程",
	      mfa = {Id, start_link, []}}};
get(profile_mgr = Id) ->
    {ok,
     #service{id = Id, name = "个性化设置管理进程",
	      mfa = {Id, start_link, []}}};
get(map_mgr = Id) ->
    {ok,
     #service{id = Id, name = "地图管理进程",
	      mfa = {Id, start_link, []}}};
get(unit_mgr = Id) ->
    {ok,
     #service{id = Id, name = "单位管理进程",
	      mfa = {Id, start_link, []}}};
get(c_group_control_mgr = Id) ->
    {ok,
     #service{id = Id, name = "中心服跨服时空进程",
	      mfa = {Id, start_link, []}}};
get(group_control_mgr = Id) ->
    {ok,
     #service{id = Id, name = "跨服时空进程",
	      mfa = {Id, start_link, []}}};
get(combat_mgr = Id) ->
    {ok,
     #service{id = Id, name = "战斗管理进程",
	      mfa = {Id, start_link, []}}};
get(world_boss_mgr = Id) ->
    {ok,
     #service{id = Id, name = "世界BOSS管理进程",
	      mfa = {Id, start_link, []}}};
get(recruit_mgr = Id) ->
    {ok,
     #service{id = Id, name = "召唤管理进程",
	      mfa = {Id, start_link, []}}};
get(adventure_mgr = Id) ->
    {ok,
     #service{id = Id, name = "神界冒险管理进程",
	      mfa = {Id, start_link, []}}};
get(star_tower_mgr = Id) ->
    {ok,
     #service{id = Id, name = "星命塔录像管理进程",
	      mfa = {Id, start_link, []}}};
get(market_gold = Id) ->
    {ok,
     #service{id = Id, name = "金币市场进程",
	      mfa = {Id, start_link, []}}};
get(market_silver = Id) ->
    {ok,
     #service{id = Id, name = "银币市场进程",
	      mfa = {Id, start_link, []}}};
get(guild_dun_mgr = Id) ->
    {ok,
     #service{id = Id, name = "联盟副本进程",
	      mfa = {Id, start_link, []}}};
get(guild_dun_rank = Id) ->
    {ok,
     #service{id = Id, name = "联盟副本排行进程",
	      mfa = {Id, start_link, []}}};
get(days_rank_mgr = Id) ->
    {ok,
     #service{id = Id, name = "七天排行",
	      mfa = {Id, start_link, []}}};
get(stronger_mgr = Id) ->
    {ok,
     #service{id = Id, name = "全服最强英雄管理进程",
	      mfa = {Id, start_link, []}}};
get(getui_mgr = Id) ->
    {ok,
     #service{id = Id, name = "个推信息管理进程",
	      mfa = {Id, start_link, []}}};
get(endless_mgr = Id) ->
    {ok,
     #service{id = Id, name = "无尽试炼管理进程",
	      mfa = {Id, start_link, []}}};
get(escort_mgr = Id) ->
    {ok,
     #service{id = Id, name = "护送管理进程",
	      mfa = {Id, start_link, []}}};
get(escort_log_mgr = Id) ->
    {ok,
     #service{id = Id, name = "护送日志管理进程",
	      mfa = {Id, start_link, []}}};
get(zs_war_mgr = Id) ->
    {ok,
     #service{id = Id, name = "众神战场管理进程",
	      mfa = {Id, start_link, []}}};
get(world_lev = Id) ->
    {ok,
     #service{id = Id, name = "世界等级管理进程",
	      mfa = {Id, start_link, []}}};
get(primus_mgr = Id) ->
    {ok,
     #service{id = Id, name = "神殿-最强仙尊",
	      mfa = {Id, start_link, []}}};
get(honor_mgr = Id) ->
    {ok,
     #service{id = Id, name = "称号管理",
	      mfa = {Id, start_link, []}}};
get(holiday_dial = Id) ->
    {ok,
     #service{id = Id, name = "抽奖管理",
	      mfa = {Id, start_link, []}}};
get(sky_ladder_mgr = Id) ->
    {ok,
     #service{id = Id, name = "跨服天梯管理",
	      mfa = {Id, start_link, []}}};
get(role_auth = Id) ->
    {ok,
     #service{id = Id, name = "防沉迷管理进程",
	      mfa = {Id, start_link, []}}};
get(expedition_mgr = Id) ->
    {ok,
     #service{id = Id, name = "远征管理进程",
	      mfa = {Id, start_link, []}}};
get(lev_gift_mgr = Id) ->
    {ok,
     #service{id = Id, name = "等级礼包",
	      mfa = {Id, start_link, []}}};
get(dungeon_mgr = Id) ->
    {ok,
     #service{id = Id, name = "副本进程",
	      mfa = {Id, start_link, []}}};
get(questionnaire_mgr = Id) ->
    {ok,
     #service{id = Id, name = "问卷进程",
	      mfa = {Id, start_link, []}}};
get(invite_code_mgr = Id) ->
    {ok,
     #service{id = Id, name = "邀请码本地进程",
	      mfa = {Id, start_link, []}}};
get(c_invite_code_mgr = Id) ->
    {ok,
     #service{id = Id, name = "邀请码中央服进程",
	      mfa = {Id, start_link, []}}};
get(c_arena_elite_mgr = Id) ->
    {ok,
     #service{id = Id, name = "精英赛中央服进程",
	      mfa = {Id, start_link, []}}};
get(arena_elite_mgr = Id) ->
    {ok,
     #service{id = Id, name = "精英赛本地进程",
	      mfa = {Id, start_link, []}}};
get(arena_elite_log_mgr = Id) ->
    {ok,
     #service{id = Id, name = "精英赛日志进程",
	      mfa = {Id, start_link, []}}};
get(element_temple_mgr = Id) ->
    {ok,
     #service{id = Id, name = "元素神殿进程",
	      mfa = {Id, start_link, []}}};
get(holiday_break_egg_mgr = Id) ->
    {ok,
     #service{id = Id, name = "砸蛋进程",
	      mfa = {Id, start_link, []}}};
get(holy_eqm_lottery_mgr = Id) ->
    {ok,
     #service{id = Id, name = "神装抽奖进程",
	      mfa = {Id, start_link, []}}};
get(arena_cluster_mgr = Id) ->
    {ok,
     #service{id = Id, name = "神装抽奖进程",
	      mfa = {Id, start_link, []}}};
get(holiday_dial_mgr = Id) ->
    {ok,
     #service{id = Id, name = "转盘活动进程",
	      mfa = {Id, start_link, []}}};
get(c_cluster_dynamic_group = Id) ->
    {ok,
     #service{id = Id, name = "动态分组中央服进程",
	      mfa = {Id, start_link, []}}};
get(cluster_dynamic_group = Id) ->
    {ok,
     #service{id = Id, name = "动态分组本地进程",
	      mfa = {Id, start_link, []}}};
get(role_room_mgr = Id) ->
    {ok,
     #service{id = Id, name = "个人空间本地进程",
	      mfa = {Id, start_link, []}}};
get(room_feat_mgr = Id) ->
    {ok,
     #service{id = Id, name = "个人空间成就本地进程",
	      mfa = {Id, start_link, []}}};
get(room_bbs_mgr = Id) ->
    {ok,
     #service{id = Id, name = "个人空间留言板本地进程",
	      mfa = {Id, start_link, []}}};
get(c_home_mgr = Id) ->
    {ok,
     #service{id = Id, name = "家园管理中央服进程",
	      mfa = {Id, start_link, []}}};
get(home_mgr = Id) ->
    {ok,
     #service{id = Id, name = "家园管理进程",
	      mfa = {Id, start_link, []}}};
get(arena_cluster_champion_mgr = Id) ->
    {ok,
     #service{id = Id, name = "跨服精英赛管理进程",
	      mfa = {Id, start_link, []}}};
get(adventure_mine_mgr = Id) ->
    {ok,
     #service{id = Id, name = "矿战管理进程",
	      mfa = {Id, start_link, []}}};
get(holiday_personal_gift_mgr = Id) ->
    {ok,
     #service{id = Id, name = "个人推送礼包管理进程",
	      mfa = {Id, start_link, []}}};
get(c_holiday_personal_gift_mgr = Id) ->
    {ok,
     #service{id = Id, name = "个人推送礼包中央服管理进程",
	      mfa = {Id, start_link, []}}};
get(holiday_term_begins_mgr = Id) ->
    {ok,
     #service{id = Id, name = "开学副本管理进程",
	      mfa = {Id, start_link, []}}};
get(guild_secret_area_mgr = Id) ->
    {ok,
     #service{id = Id, name = "公会秘境Boss",
	      mfa = {Id, start_link, []}}};
get(guild_secret_area_rank = Id) ->
    {ok,
     #service{id = Id, name = "公会秘境Boss排行榜",
	      mfa = {Id, start_link, []}}};
get(server_monitor = Id) ->
    {ok,
     #service{id = Id, name = "服务运行监控管理进程",
	      mfa = {Id, start_link, []}}};
get(ets_mgr = Id) ->
    {ok,
     #service{id = Id, name = "ets管理进程",
	      mfa = {Id, start_link, []}}};
get(holiday_petard_mgr = Id) ->
    {ok,
     #service{id = Id, name = "花火大会管理进程",
	      mfa = {Id, start_link, []}}};
get(voting_mgr = Id) ->
    {ok,
     #service{id = Id, name = "合服投票管理进程",
	      mfa = {Id, start_link, []}}};
get(holiday_merge_goal_mgr = Id) ->
    {ok,
     #service{id = Id, name = "合服目标进程",
	      mfa = {Id, start_link, []}}};
get(arena_team_mgr = Id) ->
    {ok,
     #service{id = Id, name = "组队竞技场管理进程",
	      mfa = {Id, start_link, []}}};
get(arena_team_lobby_mgr = Id) ->
    {ok,
     #service{id = Id, name = "组队大厅管理进程",
	      mfa = {Id, start_link, []}}};
get(monopoly_dungeons_guild_rank = Id) ->
    {ok,
     #service{id = Id, name = "圣夜奇境公会排行榜进程",
	      mfa = {Id, start_link, []}}};
get(role_weekly_mgr = Id) ->
    {ok,
     #service{id = Id, name = "个人周报管理进程",
	      mfa = {Id, start_link, []}}};
get(c_arena_peak_champion_mgr = Id) ->
    {ok,
     #service{id = Id, name = "巅峰冠军赛中央服管理进程",
	      mfa = {Id, start_link, []}}};
get(arena_peak_champion_mgr = Id) ->
    {ok,
     #service{id = Id, name = "巅峰冠军赛管理进程",
	      mfa = {Id, start_link, []}}};
get(holiday_return_new_mgr = Id) ->
    {ok,
     #service{id = Id, name = "新版回归活动管理进程",
	      mfa = {Id, start_link, []}}};
get(holiday_nian_mgr = Id) ->
    {ok,
     #service{id = Id, name = "年兽活动管理进程",
	      mfa = {Id, start_link, []}}};
get(c_role_auth_visitors = Id) ->
    {ok,
     #service{id = Id, name = "游客模式管理进程",
	      mfa = {Id, start_link, []}}};
get(feedback_mgr = Id) ->
    {ok,
     #service{id = Id, name = "客服反馈管理进程",
	      mfa = {Id, start_link, []}}};
get(holiday_lucky_dog_mgr = Id) ->
    {ok,
     #service{id = Id, name = "幸运锦鲤活动处理",
	      mfa = {Id, start_link, []}}};
get(holiday_valentines_mgr = Id) ->
    {ok,
     #service{id = Id, name = "情人节活动管理进程",
	      mfa = {Id, start_link, []}}};
get(c_partner_rand_mgr = Id) ->
    {ok,
     #service{id = Id, name = "英雄随机库中央服管理进程",
	      mfa = {Id, start_link, []}}};
get(partner_rand_mgr = Id) ->
    {ok,
     #service{id = Id, name = "英雄随机库中本地管理进程",
	      mfa = {Id, start_link, []}}};
get(c_formation_role_mgr = Id) ->
    {ok,
     #service{id = Id, name = "阵法中央服管理进程",
	      mfa = {Id, start_link, []}}};
get(formation_role_mgr = Id) ->
    {ok,
     #service{id = Id, name = "阵法本地管理进程",
	      mfa = {Id, start_link, []}}};
get(c_holiday_arena_team_mgr = Id) ->
    {ok,
     #service{id = Id, name = "活动竞技场中央服管理进程",
	      mfa = {Id, start_link, []}}};
get(holiday_arena_team_mgr = Id) ->
    {ok,
     #service{id = Id, name = "活动竞技场本地管理进程",
	      mfa = {Id, start_link, []}}};
get(holiday_practise_tower_mgr = Id) ->
    {ok,
     #service{id = Id, name = "英灵武神殿排行榜管理进程",
	      mfa = {Id, start_link, []}}};
get(_Name) -> {error, undefined}.

-spec config(atom()) -> {ok, list()} |
			{error, undefined}.

config(Type) ->
    case cfg(Type) of
      {ok, L} -> {ok, parse(L, Type, [])};
      Else -> Else
    end.

parse([], _Type, L) -> lists:reverse(L);
parse([Id = sup_db_buffer | T], Type, L) ->
    parse(T, Type, [{Id, [Type]} | L]);
parse([Id | T], Type, L) ->
    parse(T, Type, [{Id, []} | L]).


