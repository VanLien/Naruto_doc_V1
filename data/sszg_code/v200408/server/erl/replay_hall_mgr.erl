-file("src/mod/replay_hall/replay_hall_mgr.erl", 1).

-module(replay_hall_mgr).

-lager_records([{cluster_dynamic_local_group,
		 [type, main, list]},
		{cluster_dynamic_srv,
		 [id, name, main_srv, list, mode, group_lev,
		  init_world_lev, world_lev, open_time, time]},
		{cluster_dynamic_group,
		 [id, min_world_lev, group_lev, mode, list, srv_num,
		  time]},
		{combat_drama,
		 [id, next, timeout, ts, winner, play_list, combat_list,
		  guide_list]},
		{item_reward_p, [bid, is_bind, num]},
		{assets_reward_p, [type, val]},
		{exp_reward_p,
		 [object_type, object_id, srv_id, career, sex, old_lev,
		  old_exp, new_lev, new_exp, is_die, assets_reward]},
		{combat_order_p, [pos, distance, group]},
		{skill_p, [skill_bid, end_round]},
		{fight_object_p,
		 [pos, group, owner_id, owner_srv_id, object_type,
		  object_id, object_bid, is_awake, star, object_name, sex,
		  career, lev, hp, hp_max, face_id, round, skills,
		  is_strong_partner, extra_data, camp_type, sprites]},
		{buff_play,
		 [target, buff_bid, end_round, remain_round, action_type,
		  change_type, change_value, is_dead, id, id2]},
		{sub_effect_play,
		 [sub_target, sub_effect_id, sub_hp_changed,
		  sub_distance, sub_is_hit, sub_skill_id, extra_effect]},
		{effect_play,
		 [order, actor, target, effect_bid, is_hit, is_crit,
		  hp_changed, hp, buff_list, summon_list, distance,
		  is_dead, sub_effect_play_list, is_blind,
		  skill_bid_of_effect, actor_hp_changed, actor_is_dead,
		  aid_actor, total_hurt, hurt_reward, camp_restrain]},
		{skill_play,
		 [order, actor, target, skill_bid, talk_pos,
		  talk_content, effect_play]},
		{mon_ai,
		 [bid, name, ai, is_loop, condition, rate, skill_target,
		  skill_id, talk_target, talk_content]},
		{combat_result,
		 [result, dead_monster_num, wave_num, dead_partner,
		  replay_id, a_stat_info, b_stat_info, end_type,
		  opponent_id, total_hurt, action_count, group_a_num,
		  hurt_statistics_a, curt_statistics_a, hurt_statistics,
		  replay_info, combat_pid, a_halo_dizzy_num,
		  a_max_num_def, a_control_info, a_kill_info,
		  a_continue_hurt, a_revive_info, a_dodge_count,
		  a_anti_kill_count, a_halo_kill_count, a_fire_buff_num,
		  hurt_statistics_b, curt_statistics_b, b_halo_dizzy_num,
		  b_max_num_def, b_control_info, b_kill_info,
		  b_continue_hurt, b_revive_info, b_dodge_count,
		  b_anti_kill_count, b_halo_kill_count, b_fire_buff_num,
		  is_balance, a_sprite_kill_count]},
		{partner_hurt,
		 [master_id, id, bid, star, lev, camp_type, dps, cure,
		  ext_data, be_hurt]},
		{combat,
		 [type, attack_list, defend_list, combat_roles,
		  formation, on_combat_begin, on_combat_end,
		  on_role_combat_end, state_end_time, round_countdown,
		  min_play_time, take_action, ext_args, wave, total_wave,
		  multi_wave_defend, combat_result, is_pause, combat_map,
		  combat_drama, target_role_name, is_combat_end, end_time,
		  begin_time, watching_roles, is_skip, round, is_robot,
		  select_buff_callback, terminate_func, attack_power,
		  defend_power, replay_info, other_arge]},
		{combat_buff,
		 [id, bid, actor, group, end_round, buff_result_type,
		  positive_or_negative, buff_result, join_num, can_reduce,
		  lev, probability, clean_when_dead, hit_count, is_show,
		  wave, group_pro]},
		{fight_object,
		 [master_id, master_pid, object_type, object_id,
		  object_bid, is_clone, is_auto, is_leader, host_bid,
		  object_name, is_awake, star, sex, career, lev, face_id,
		  hp, hp_max, pos, round, wave_round, distance,
		  rand_speed, init_attr, base_attr, fight_attr,
		  active_skills, passive_skills, skill_order, buff_list,
		  owner_id, passive_effects_of_skill, is_boss,
		  is_strong_partner, quality, initial_hp_max, extra_data,
		  awaken_type, camp_type, power, replay, hallows_looks,
		  sprites, guild_break_power]},
		{combat_role,
		 [id, pid, conn_pid, name, gid, gname, is_auto, is_ready,
		  is_play_over, is_offline, group, auto_watch_model, lev,
		  face_id, watching, is_load_map_finish]},
		{combat_buff_data,
		 [bid, name, group, join_type, lev, join_num, duration,
		  buff_result_type, buff_result, desc,
		  positive_or_negative, can_reduce, probability,
		  clean_when_dead, clean_next_wave, is_show, group_pro,
		  dot_type]},
		{effect_data,
		 [bid, group, target_type, target_num, effect_type,
		  hurt_type, base_hit, hit_type, effect_param, condition,
		  condition_param, extra_param, passive_effect,
		  effect_desc]},
		{skill_data,
		 [bid, name, owner, group, next_id, min_play_time, level,
		  is_normal_skill, type, trigger_condition, trigger_param,
		  target, effect_list, add_attr, cd, count, best_target,
		  fit_combat_type, skill_changed, power, is_combat_hidden,
		  priority]},
		{m_skill, [skills_used, skills_owned]},
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
		{combat_replay, [ver, combat_type, combat_plays, info]},
		{replay_partner,
		 [id, pos, bid, lev, star, break_lev, power, hp, hp_max,
		  atk, def, speed, crit_rate, crit_ratio, hit_magic,
		  dodge_magic, hurt, behurt, curt, skills, eqms,
		  artifacts, ext]},
		{replay_stat, [id, like, share, play, collect]},
		{replay_info,
		 [id, combat_type, round, sec_type, a_rid, a_name, a_lev,
		  a_face, a_power, a_formation_type, a_camp_type,
		  a_hallow, a_rank, b_rid, b_name, b_lev, b_face, b_power,
		  b_formation_type, b_camp_type, b_hallow, b_rank,
		  a_plist, b_plist, ret, time, like, share, play, collect,
		  ext]},
		{replay,
		 [id, type, combat_type, sec_type, a_rid, a_cond_val,
		  a_power, a_lev, b_rid, b_cond_val, b_power, b_lev,
		  time]},
		{replay_role, [key, list]}, {state, [min, max]}]).

-behaviour(gen_server).

-export([save/2, zero_update/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state, {min = 0, max = 0}).

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

-file("src/mod/replay_hall/replay_hall_mgr.erl", 13).

-file("inc/replay_hall.hrl", 1).

-record(replay_role, {key = {{0, <<>>}, 0}, list = []}).

-record(replay,
	{id = 0, type = 0, combat_type = 0, sec_type = 0,
	 a_rid = 0, a_cond_val = 0, a_power = 0, a_lev = 0,
	 b_rid = 0, b_cond_val = 0, b_power = 0, b_lev = 0,
	 time = 0}).

-record(replay_info,
	{id = 0, combat_type = 0, round = 0, sec_type = 0,
	 a_rid = {0, <<>>}, a_name = <<>>, a_lev = 0, a_face = 0,
	 a_power = 0, a_formation_type = 0, a_camp_type = 0,
	 a_hallow, a_rank = 0, b_rid = {0, <<>>}, b_name = <<>>,
	 b_lev = 0, b_face = 0, b_power = 0,
	 b_formation_type = 0, b_camp_type = 0, b_hallow,
	 b_rank = 0, a_plist = [], b_plist = [], ret = 0,
	 time = 0, like = 0, share = 0, play = 0, collect = 0,
	 ext = []}).

-record(replay_stat,
	{id = 0, like = 0, share = 0, play = 0, collect = 0}).

-record(replay_partner,
	{id = 0, pos = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, hp = 0, hp_max = 0, atk = 0,
	 def = 0, speed = 0, crit_rate = 0, crit_ratio = 0,
	 hit_magic = 0, dodge_magic = 0, hurt = 0, behurt = 0,
	 curt = 0, skills = [], eqms = [], artifacts = [],
	 ext = []}).

-file("src/mod/replay_hall/replay_hall_mgr.erl", 14).

-file("inc/combat_replay.hrl", 1).

-record(combat_replay,
	{ver = 1, combat_type, combat_plays = [], info}).

-file("src/mod/replay_hall/replay_hall_mgr.erl", 15).

-file("inc/combat.hrl", 1).

-file("inc/common.hrl", 1).

-file("inc/combat.hrl", 13).

-file("inc/attr.hrl", 1).

-record(attr,
	{fc = 0, toughness = 0, atk = 0, def = 0, def_s = 0,
	 def_p = 0, hp_max = 0, hp = 0, speed = 0, hit_rate = 0,
	 dodge_rate = 0, crit_rate = 0, crit_ratio = 0,
	 hit_magic = 0, dodge_magic = 0, dam = 0, res = 0,
	 cure = 0, be_cure = 0, dam_p = 0, res_p = 0, dam_s = 0,
	 res_s = 0, tenacity = 0}).

-record(attr_calc,
	{attr = #attr{}  :: #attr{},
	 attr_no_ratio = #attr{}  :: #attr{},
	 ratio = #attr{}  :: #attr{},
	 attr_no_fc = #attr{}  :: #attr{},
	 ratio_no_fc = #attr{}  :: #attr{}}).

-file("inc/combat.hrl", 14).

-file("inc/skill.hrl", 1).

-record(m_skill,
	{skills_used = [], skills_owned = []  :: [integer()]}).

-record(skill_data,
	{bid, name, owner, group, next_id = 0,
	 min_play_time = 0, level, is_normal_skill = 0,
	 type  ::
	     passive_skill | active_skill | eqm_passive_skill,
	 trigger_condition = none, trigger_param = 0, target,
	 effect_list = [], add_attr = [], cd, count,
	 best_target = normal, fit_combat_type = all,
	 skill_changed = none, power = 0, is_combat_hidden = 0,
	 priority = 0}).

-record(effect_data,
	{bid, group, target_type, target_num, effect_type,
	 hurt_type, base_hit, hit_type = effect_hit,
	 effect_param, condition = none, condition_param = none,
	 extra_param = [], passive_effect = none,
	 effect_desc = <<>>}).

-record(combat_buff_data,
	{bid, name, group, join_type, lev, join_num, duration,
	 buff_result_type, buff_result = [], desc,
	 positive_or_negative, can_reduce, probability = 1000,
	 clean_when_dead = true, clean_next_wave = 0,
	 is_show = true, group_pro = 0, dot_type = 0}).

-file("inc/combat.hrl", 15).

-record(combat_role,
	{id = {0, <<>>}, pid = none, conn_pid = none,
	 name = <<>>, gid = {0, <<>>}, gname = <<>>,
	 is_auto = true, is_ready = false, is_play_over = false,
	 is_offline = false, group = 0, auto_watch_model = 0,
	 lev = 0, face_id = 0, watching = 1,
	 is_load_map_finish = false}).

-record(fight_object,
	{master_id = {0, <<>>}, master_pid = none,
	 object_type = 0, object_id = 0  :: integer(),
	 object_bid = 0, is_clone = 0, is_auto = 0,
	 is_leader = 0, host_bid = 0, object_name = <<>>,
	 is_awake = 0, star = 0, sex = 0, career = 0, lev = 0,
	 face_id = 0, hp = 1, hp_max = 1, pos = 0, round = 0,
	 wave_round = 0, distance = 0, rand_speed = 0, init_attr,
	 base_attr, fight_attr = #attr{},
	 active_skills = []  :: [#skill_data{}],
	 passive_skills = []  :: [#skill_data{}],
	 skill_order = []  :: [#skill_data{}], buff_list = [],
	 owner_id = {0, <<>>},
	 passive_effects_of_skill = []  :: [#effect_data{}],
	 is_boss = false, is_strong_partner = 0, quality = 0,
	 initial_hp_max = 0, extra_data = [], awaken_type = 0,
	 camp_type = 0, power = 0, replay, hallows_looks = [],
	 sprites = [], guild_break_power = 0}).

-record(combat_buff,
	{id, bid, actor, group, end_round, buff_result_type,
	 positive_or_negative, buff_result = [], join_num,
	 can_reduce, lev, probability = 1000,
	 clean_when_dead = true, hit_count = 0, is_show = true,
	 wave = 1, group_pro = 0}).

-record(combat,
	{type = 0, attack_list = []  :: [#fight_object{}],
	 defend_list = []  :: [#fight_object{}],
	 combat_roles = []  :: [#combat_role{}],
	 formation = []  ::
	     [{pos_integer(), pos_integer(), pos_integer()}],
	 on_combat_begin, on_combat_end, on_role_combat_end,
	 state_end_time = 0, round_countdown = 0,
	 min_play_time = 0, take_action = {}, ext_args = [],
	 wave = 1, total_wave = undefined,
	 multi_wave_defend = [], combat_result,
	 is_pause = false  :: false | {true, integer()},
	 combat_map = 0, combat_drama, target_role_name = <<>>,
	 is_combat_end = {combat_util, is_combat_end, []},
	 end_time = 0, begin_time = 0, watching_roles = [],
	 is_skip = 0, round = 0, is_robot = 0,
	 select_buff_callback, terminate_func, attack_power = 0,
	 defend_power = 0, replay_info, other_arge = []}).

-record(partner_hurt,
	{master_id, id, bid, star, lev, camp_type, dps, cure,
	 ext_data = [], be_hurt = 0}).

-record(combat_result,
	{result  :: 1 | 2, dead_monster_num = 0, wave_num = 0,
	 dead_partner = [], replay_id = 0, a_stat_info = [],
	 b_stat_info = [], end_type = normal  :: normal | quit,
	 opponent_id = {0, <<>>}, total_hurt = 0,
	 action_count = 0, group_a_num = 0,
	 hurt_statistics_a = [], curt_statistics_a = [],
	 hurt_statistics = [], replay_info = [], combat_pid = 0,
	 a_halo_dizzy_num = 0, a_max_num_def = 0,
	 a_control_info = [], a_kill_info = [],
	 a_continue_hurt = [], a_revive_info = [],
	 a_dodge_count = 0, a_anti_kill_count = 0,
	 a_halo_kill_count = 0, a_fire_buff_num = 0,
	 hurt_statistics_b = [], curt_statistics_b = [],
	 b_halo_dizzy_num = 0, b_max_num_def = 0,
	 b_control_info = [], b_kill_info = [],
	 b_continue_hurt = [], b_revive_info = [],
	 b_dodge_count = 0, b_anti_kill_count = 0,
	 b_halo_kill_count = 0, b_fire_buff_num = 0,
	 is_balance = 0, a_sprite_kill_count = 0}).

-record(mon_ai,
	{bid, name, ai, is_loop, condition = [], rate,
	 skill_target = false, skill_id, talk_target = none,
	 talk_content = <<>>}).

-record(skill_play,
	{order, actor, target, skill_bid = 0, talk_pos = 0,
	 talk_content = <<>>, effect_play = []}).

-record(effect_play,
	{order, actor, target = 0, effect_bid = 0, is_hit = 1,
	 is_crit = 0, hp_changed = 0, hp = 0, buff_list = [],
	 summon_list = [], distance = -1, is_dead = 0,
	 sub_effect_play_list = [], is_blind = 0,
	 skill_bid_of_effect = 0, actor_hp_changed = 0,
	 actor_is_dead = 0, aid_actor = 0, total_hurt = 0,
	 hurt_reward = [], camp_restrain = 0}).

-record(sub_effect_play,
	{sub_target = 0, sub_effect_id = 0, sub_hp_changed = 0,
	 sub_distance = -1, sub_is_hit = 1, sub_skill_id = 0,
	 extra_effect = []}).

-record(buff_play,
	{target = 0, buff_bid = 0, end_round = 0,
	 remain_round = 0, action_type = 0, change_type = 0,
	 change_value = 0, is_dead = 0, id = 0, id2 = 0}).

-record(fight_object_p,
	{pos = 0, group = 0, owner_id = 0, owner_srv_id = <<>>,
	 object_type = 0, object_id = 0, object_bid = 0,
	 is_awake = 0, star = 0, object_name = <<>>, sex = 0,
	 career = 0, lev = 0, hp = 0, hp_max = 0, face_id = 0,
	 round = 0, skills = [], is_strong_partner = 0,
	 extra_data = [], camp_type = 0, sprites = []}).

-record(skill_p, {skill_bid = 0, end_round = 0}).

-record(combat_order_p,
	{pos = 0, distance = 0, group = 0}).

-record(exp_reward_p,
	{object_type, object_id = 0, srv_id = <<>>, career = 0,
	 sex = 0, old_lev, old_exp, new_lev, new_exp, is_die = 0,
	 assets_reward}).

-record(assets_reward_p, {type, val}).

-record(item_reward_p, {bid, is_bind, num}).

-record(combat_drama,
	{id, next, timeout = infinity, ts, winner,
	 play_list = []  :: [pos_integer()],
	 combat_list = []  :: [tuple()],
	 guide_list = []  :: [pos_integer()]}).

-file("src/mod/replay_hall/replay_hall_mgr.erl", 16).

-file("inc/cluster_dynamic_group.hrl", 1).

-record(cluster_dynamic_group,
	{id = {1, <<>>}, min_world_lev = 0, group_lev = 0,
	 mode = 1, list = [], srv_num = 0, time = 0}).

-record(cluster_dynamic_srv,
	{id = {1, <<>>}, name = <<>>, main_srv = <<>>,
	 list = [], mode = 1, group_lev = 0, init_world_lev = 0,
	 world_lev = 0, open_time = 0, time = 0}).

-record(cluster_dynamic_local_group,
	{type = 0, main, list = []}).

-file("src/mod/replay_hall/replay_hall_mgr.erl", 17).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/replay_hall/replay_hall_mgr.erl", 18).

-spec save(pos_integer(), #combat_replay{}) -> ok.

save(ReplayId,
     #combat_replay{info =
			ReplayInfo = #replay_info{a_rid = {_, ASrvId},
						  combat_type = 18}}) ->
    NewReplayInfo = ReplayInfo#replay_info{id =
					       {ReplayId, ASrvId}},
    cluster_dynamic_group:group_cast(1, replay_hall_mgr,
				     info, [{save, NewReplayInfo}]);
save(ReplayId,
     #combat_replay{info =
			ReplayInfo = #replay_info{combat_type = 31}}) ->
    Sid = sys_env:get(arena_cluster_champion_srv_id,
		      cluster_dynamic_group:group_main_srvid(1)),
    NewReplayInfo = ReplayInfo#replay_info{id =
					       {ReplayId, Sid}},
    cluster_dynamic_group:group_cast(1, replay_hall_mgr,
				     info, [{save, NewReplayInfo}]);
save(ReplayId,
     #combat_replay{info =
			ReplayInfo = #replay_info{combat_type = 37}}) ->
    Sid = sys_lib:srv_id(),
    NewReplayInfo = ReplayInfo#replay_info{id =
					       {ReplayId, Sid}},
    cluster_dynamic_group:group_cast(1, replay_hall_mgr,
				     info, [{save, NewReplayInfo}]);
save(ReplayId,
     #combat_replay{info = ReplayInfo = #replay_info{}}) ->
    NewReplayInfo = ReplayInfo#replay_info{id = ReplayId},
    info({save, NewReplayInfo});
save(_, _) -> ok.

zero_update(WeekNum) -> info({zero_update, WeekNum}).

info(Info) -> replay_hall_mgr ! Info.

cast(Info) -> gen_server:cast(replay_hall_mgr, Info).

call(Info) ->
    case catch gen_server:call(replay_hall_mgr, Info, 10000)
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
	    {__Pidreplay_hall_mgr53, _,
	     {__Levelreplay_hall_mgr53, __Tracesreplay_hall_mgr53}}
		when __Levelreplay_hall_mgr53 band 8 /= 0 orelse
		       __Tracesreplay_hall_mgr53 /= [] ->
		lager:do_log(error,
			     [{module, replay_hall_mgr}, {function, call},
			      {line, 53}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [replay_hall_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelreplay_hall_mgr53,
			     __Tracesreplay_hall_mgr53, lager_event,
			     __Pidreplay_hall_mgr53);
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
    gen_server:start_link({local, replay_hall_mgr},
			  replay_hall_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidreplay_hall_mgr59, _,
       {__Levelreplay_hall_mgr59, __Tracesreplay_hall_mgr59}}
	  when __Levelreplay_hall_mgr59 band 64 /= 0 orelse
		 __Tracesreplay_hall_mgr59 /= [] ->
	  lager:do_log(info,
		       [{module, replay_hall_mgr}, {function, init},
			{line, 59}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [replay_hall_mgr]), none,
		       4096, 64, __Levelreplay_hall_mgr59,
		       __Tracesreplay_hall_mgr59, lager_event,
		       __Pidreplay_hall_mgr59);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    d_ets_lib:new_d_ets(replay_role,
			"dets/replay_role.dets", #replay_role.key, set),
    d_ets_lib:load_dets_to_ets(replay_role, undefined),
    d_ets_lib:new_d_ets(replay, "dets/replay.dets",
			#replay.id, set),
    d_ets_lib:load_dets_to_ets(replay, undefined),
    util:set_timer(loop_del,
		   {3, util:rand(0, 40), util:rand(0, 59)}, loop_del),
    load_type(),
    new_partner_change(),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidreplay_hall_mgr69, _,
       {__Levelreplay_hall_mgr69, __Tracesreplay_hall_mgr69}}
	  when __Levelreplay_hall_mgr69 band 64 /= 0 orelse
		 __Tracesreplay_hall_mgr69 /= [] ->
	  lager:do_log(info,
		       [{module, replay_hall_mgr}, {function, init},
			{line, 69}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [replay_hall_mgr]), none,
		       4096, 64, __Levelreplay_hall_mgr69,
		       __Tracesreplay_hall_mgr69, lager_event,
		       __Pidreplay_hall_mgr69);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({loaded_replay_info, ReplayId},
	    State = #state{max = Max}) ->
    erase(put(ReplayId, Max)),
    put(Max, ReplayId),
    set_del_cache_timer(State),
    {noreply, State#state{max = Max + 1}};
handle_info(del_cache_replay_info,
	    State = #state{min = Min}) ->
    case erase(Min) of
      undefined -> skip;
      ReplayId ->
	  erase(ReplayId),
	  Tab = combat_replay_mgr:replay_info_tab(ReplayId),
	  case ets:lookup(Tab, ReplayId) of
	    [Info = #replay_info{}] ->
		combat_replay_mgr:save_replay_info(Info),
		ets:delete(Tab, ReplayId);
	    _ -> skip
	  end
    end,
    erase(del_cache_timer),
    set_del_cache_timer(State),
    {noreply, State#state{min = Min + 1}};
handle_info(load_type, State) ->
    load_type(), {noreply, State};
handle_info(gm_clear, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidreplay_hall_mgr110, _,
       {__Levelreplay_hall_mgr110, __Tracesreplay_hall_mgr110}}
	  when __Levelreplay_hall_mgr110 band 64 /= 0 orelse
		 __Tracesreplay_hall_mgr110 /= [] ->
	  lager:do_log(info,
		       [{module, replay_hall_mgr}, {function, handle_info},
			{line, 110}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "GM清空录像数据", none, 4096, 64, __Levelreplay_hall_mgr110,
		       __Tracesreplay_hall_mgr110, lager_event,
		       __Pidreplay_hall_mgr110);
      _ -> ok
    end,
    [combat_replay_mgr:dec_replay_reference(Id)
     || #replay{id = Id} <- ets:tab2list(replay),
	is_integer(Id)],
    [[combat_replay_mgr:dec_replay_reference(Id)
      || Id <- List, is_integer(Id)]
     || #replay_role{list = List}
	    <- ets:tab2list(replay_role)],
    d_ets_lib:clear_d_ets(replay),
    d_ets_lib:clear_d_ets(replay_role),
    d_ets_lib:clear_d_ets(replay_info_1),
    d_ets_lib:clear_d_ets(replay_info_2),
    {noreply, State};
handle_info({add_hot, Id}, State) ->
    calc_hot_replay(Id), {noreply, State};
handle_info({zero_update, WeekNum}, State) ->
    case WeekNum of
      1 ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidreplay_hall_mgr128, _,
	     {__Levelreplay_hall_mgr128, __Tracesreplay_hall_mgr128}}
		when __Levelreplay_hall_mgr128 band 64 /= 0 orelse
		       __Tracesreplay_hall_mgr128 /= [] ->
		lager:do_log(info,
			     [{module, replay_hall_mgr},
			      {function, handle_info}, {line, 128},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("清空周热门录像:~w", [WeekNum]), none, 4096,
			     64, __Levelreplay_hall_mgr128,
			     __Tracesreplay_hall_mgr128, lager_event,
			     __Pidreplay_hall_mgr128);
	    _ -> ok
	  end,
	  d_ets_lib:clear_d_ets(replay_role, 98);
      _ -> pass
    end,
    new_partner_change(),
    {noreply, State};
handle_info({save,
	     ReplayInfo = #replay_info{id = ReplayId,
				       a_plist = APlist, b_plist = BPlist,
				       round = Round}},
	    State) ->
    do_save(ReplayInfo),
    save_new_partner_replay(ReplayId, APlist, BPlist,
			    Round),
    {noreply, State};
handle_info(loop_del, State) ->
    Timeout = date:unixtime() - 86400 * 30,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidreplay_hall_mgr144, _,
       {__Levelreplay_hall_mgr144, __Tracesreplay_hall_mgr144}}
	  when __Levelreplay_hall_mgr144 band 64 /= 0 orelse
		 __Tracesreplay_hall_mgr144 /= [] ->
	  lager:do_log(info,
		       [{module, replay_hall_mgr}, {function, handle_info},
			{line, 144}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("删除过期录像", []), none, 4096, 64,
		       __Levelreplay_hall_mgr144, __Tracesreplay_hall_mgr144,
		       lager_event, __Pidreplay_hall_mgr144);
      _ -> ok
    end,
    Ms = [{{replay, '$1', '_', '_', '_', '_', '_', '_', '_',
	    '_', '_', '_', '_', '$2'},
	   [{'<', '$2', {const, Timeout}}], ['$1']}],
    L = ets:select(replay, Ms),
    [d_ets_lib:clear_d_ets(replay, Id) || Id <- L],
    Fun = fun (ReplayId) when is_integer(ReplayId) ->
		  combat_replay_mgr:dec_replay_reference(ReplayId);
	      ({ReplayId, SrvId}) ->
		  cluster_lib:cast(SrvId, combat_replay_mgr,
				   dec_cluster_replay_reference,
				   [{ReplayId, SrvId}]);
	      (_) -> skip
	  end,
    lists:foreach(Fun, L),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidreplay_hall_mgr156, _,
       {__Levelreplay_hall_mgr156, __Tracesreplay_hall_mgr156}}
	  when __Levelreplay_hall_mgr156 band 64 /= 0 orelse
		 __Tracesreplay_hall_mgr156 /= [] ->
	  lager:do_log(info,
		       [{module, replay_hall_mgr}, {function, handle_info},
			{line, 156}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("删除过期录像完成:~w", [length(L)]), none, 4096,
		       64, __Levelreplay_hall_mgr156,
		       __Tracesreplay_hall_mgr156, lager_event,
		       __Pidreplay_hall_mgr156);
      _ -> ok
    end,
    util:set_timer(loop_del,
		   {3, util:rand(0, 40), util:rand(0, 59)}, loop_del),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    d_ets_lib:save(replay_role),
    d_ets_lib:save(replay),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidreplay_hall_mgr166, _,
       {__Levelreplay_hall_mgr166, __Tracesreplay_hall_mgr166}}
	  when __Levelreplay_hall_mgr166 band 64 /= 0 orelse
		 __Tracesreplay_hall_mgr166 /= [] ->
	  lager:do_log(info,
		       [{module, replay_hall_mgr}, {function, terminate},
			{line, 166}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelreplay_hall_mgr166,
		       __Tracesreplay_hall_mgr166, lager_event,
		       __Pidreplay_hall_mgr166);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

new_partner_change() ->
    NewBid = video_data:get_const(fresh_hero_id),
    OldBid = sys_env:get(replay_hall_new_partner_bid),
    case NewBid =:= OldBid of
      true -> pass;
      false ->
	  sys_env:save(replay_hall_new_partner_bid, NewBid),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidreplay_hall_mgr181, _,
	     {__Levelreplay_hall_mgr181, __Tracesreplay_hall_mgr181}}
		when __Levelreplay_hall_mgr181 band 64 /= 0 orelse
		       __Tracesreplay_hall_mgr181 /= [] ->
		lager:do_log(info,
			     [{module, replay_hall_mgr},
			      {function, new_partner_change}, {line, 181},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("有新英雄id:~w, 清空原新英雄录像:~w",
					   [NewBid, OldBid]),
			     none, 4096, 64, __Levelreplay_hall_mgr181,
			     __Tracesreplay_hall_mgr181, lager_event,
			     __Pidreplay_hall_mgr181);
	    _ -> ok
	  end,
	  #replay_role{list = L} =
	      replay_hall_lib:get_role_replay(97),
	  [combat_replay_mgr:dec_replay_reference(ReplayId1)
	   || ReplayId1 <- L],
	  d_ets_lib:clear_d_ets(replay_role, 97)
    end.

have_new_partner(L, NewBid) ->
    lists:keymember(NewBid, #replay_partner.bid, L).

do_save(ReplayInfo = #replay_info{combat_type =
				      8 = CombatType,
				  round = Round, b_rid = BRoleId = {TRid, _},
				  b_lev = BLev, b_rank = BRank,
				  b_power = BPower, a_rid = ARoleId,
				  a_lev = ALev, a_power = APower,
				  a_rank = ARank, id = ReplayId, time = Time})
    when TRid > 0 ->
    save_replay_info(ReplayInfo),
    Key = {ARoleId, 1},
    RoleReplay = #replay_role{list = List} =
		     replay_hall_lib:get_role_replay(Key),
    {NewList, DelList} =
	list_util:split(video_data:get_const(self_video_limit),
			[ReplayId | List]),
    NewRoleReplay = RoleReplay#replay_role{list = NewList},
    combat_replay_mgr:acc_replay_reference(ReplayId),
    [combat_replay_mgr:dec_replay_reference(ReplayId1)
     || ReplayId1 <- DelList],
    d_ets_lib:save_d_ets(replay_role, NewRoleReplay),
    LimitRound =
	video_data:get_const(public_round_condition),
    case Round >= LimitRound of
      true ->
	  del_same_replay(false, ARoleId, BRoleId, 3),
	  Replay = #replay{id = ReplayId, time = Time,
			   combat_type = CombatType, type = 3, a_rid = ARoleId,
			   a_cond_val = ARank, a_lev = ALev, a_power = APower,
			   b_rid = BRoleId, b_cond_val = BRank, b_lev = BLev,
			   b_power = BPower},
	  combat_replay_mgr:acc_replay_reference(ReplayId),
	  d_ets_lib:save_d_ets(replay, Replay),
	  add_type(3, ReplayId);
      _ -> pass
    end;
do_save(ReplayInfo = #replay_info{combat_type =
				      16 = CombatType,
				  round = Round, b_rid = BRoleId = {TRid, _},
				  b_lev = BLev, b_rank = BRank,
				  b_power = BPower, a_rid = ARoleId,
				  a_lev = ALev, a_power = APower,
				  a_rank = ARank, id = ReplayId, time = Time})
    when TRid > 0 ->
    save_replay_info(ReplayInfo),
    Key = {ARoleId, 1},
    RoleReplay = #replay_role{list = List} =
		     replay_hall_lib:get_role_replay(Key),
    {NewList, DelList} =
	list_util:split(video_data:get_const(self_video_limit),
			[ReplayId | List]),
    NewRoleReplay = RoleReplay#replay_role{list = NewList},
    combat_replay_mgr:acc_replay_reference(ReplayId),
    [combat_replay_mgr:dec_replay_reference(ReplayId1)
     || ReplayId1 <- DelList],
    d_ets_lib:save_d_ets(replay_role, NewRoleReplay),
    LimitRound =
	video_data:get_const(public_round_condition),
    case Round >= LimitRound of
      true ->
	  del_same_replay(false, ARoleId, BRoleId, 4),
	  Replay = #replay{id = ReplayId, time = Time,
			   combat_type = CombatType, type = 4, a_rid = ARoleId,
			   a_cond_val = ARank, a_lev = ALev, a_power = APower,
			   b_rid = BRoleId, b_cond_val = BRank, b_lev = BLev,
			   b_power = BPower},
	  combat_replay_mgr:acc_replay_reference(ReplayId),
	  d_ets_lib:save_d_ets(replay, Replay),
	  add_type(4, ReplayId);
      _ -> pass
    end;
do_save(ReplayInfo = #replay_info{combat_type =
				      2 = CombatType,
				  round = Round, b_rid = BRoleId = {TRid, _},
				  b_lev = BLev, b_rank = BRank,
				  b_power = BPower, a_rid = ARoleId,
				  a_lev = ALev, a_power = APower,
				  a_rank = ARank, id = ReplayId, time = Time})
    when TRid > 0 ->
    save_replay_info(ReplayInfo),
    Key = {ARoleId, 1},
    RoleReplay = #replay_role{list = List} =
		     replay_hall_lib:get_role_replay(Key),
    {NewList, DelList} =
	list_util:split(video_data:get_const(self_video_limit),
			[ReplayId | List]),
    NewRoleReplay = RoleReplay#replay_role{list = NewList},
    combat_replay_mgr:acc_replay_reference(ReplayId),
    [combat_replay_mgr:dec_replay_reference(ReplayId1)
     || ReplayId1 <- DelList],
    d_ets_lib:save_d_ets(replay_role, NewRoleReplay),
    LimitRank = video_data:get_const(area_video_condition),
    LimitRound =
	video_data:get_const(public_round_condition),
    case Round >= LimitRound andalso
	   (ARank =< LimitRank andalso ARank > 0 orelse
	      BRank =< LimitRank andalso BRank > 0)
	of
      true ->
	  del_same_replay(false, ARoleId, BRoleId, 1),
	  Replay = #replay{id = ReplayId, time = Time,
			   combat_type = CombatType, type = 1, a_rid = ARoleId,
			   a_cond_val = ARank, a_lev = ALev, a_power = APower,
			   b_rid = BRoleId, b_cond_val = BRank, b_lev = BLev,
			   b_power = BPower},
	  combat_replay_mgr:acc_replay_reference(ReplayId),
	  d_ets_lib:save_d_ets(replay, Replay),
	  add_type(1, ReplayId);
      _ -> pass
    end;
do_save(ReplayInfo = #replay_info{combat_type = 10,
				  sec_type = SecType, round = Round,
				  b_rid = BRoleId = {BRid, _}, b_lev = BLev,
				  b_rank = BRank, b_power = BPower,
				  a_rid = ARoleId = {ARid, _}, a_lev = ALev,
				  a_power = APower, a_rank = ARank,
				  id = ReplayId, time = Time, ext = Ext})
    when BRid > 0 ->
    save_replay_info(ReplayInfo),
    case ARid > 0 of
      true ->
	  AKey = {ARoleId, 1},
	  ARoleReplay = #replay_role{list = AList} =
			    replay_hall_lib:get_role_replay(AKey),
	  {ANewList, ADelList} =
	      list_util:split(video_data:get_const(self_video_limit),
			      [ReplayId | AList]),
	  ANewRoleReplay = ARoleReplay#replay_role{list =
						       ANewList},
	  combat_replay_mgr:acc_replay_reference(ReplayId),
	  [combat_replay_mgr:dec_replay_reference(ReplayId1)
	   || ReplayId1 <- ADelList],
	  d_ets_lib:save_d_ets(replay_role, ANewRoleReplay);
      _ -> pass
    end,
    case BRid > 0 of
      true ->
	  BKey = {BRoleId, 1},
	  BRoleReplay = #replay_role{list = BList} =
			    replay_hall_lib:get_role_replay(BKey),
	  {BNewList, BDelList} =
	      list_util:split(video_data:get_const(self_video_limit),
			      [ReplayId | BList]),
	  BNewRoleReplay = BRoleReplay#replay_role{list =
						       BNewList},
	  combat_replay_mgr:acc_replay_reference(ReplayId),
	  [combat_replay_mgr:dec_replay_reference(ReplayId1)
	   || ReplayId1 <- BDelList],
	  d_ets_lib:save_d_ets(replay_role, BNewRoleReplay);
      _ -> pass
    end,
    LimitRound =
	video_data:get_const(public_round_condition),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidreplay_hall_mgr289, _,
       {__Levelreplay_hall_mgr289, __Tracesreplay_hall_mgr289}}
	  when __Levelreplay_hall_mgr289 band 128 /= 0 orelse
		 __Tracesreplay_hall_mgr289 /= [] ->
	  lager:do_log(debug,
		       [{module, replay_hall_mgr}, {function, do_save},
			{line, 289}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("冠军赛录像处理:~w", [Ext]), none, 4096, 128,
		       __Levelreplay_hall_mgr289, __Tracesreplay_hall_mgr289,
		       lager_event, __Pidreplay_hall_mgr289);
      _ -> ok
    end,
    case Round >= LimitRound andalso
	   BRid > 0 andalso ARid > 0
	   orelse
	   SecType >= 20 orelse
	     list_util:keyfind(is_guess, Ext, false)
	of
      true ->
	  Replay = #replay{id = ReplayId, time = Time,
			   combat_type = 10, type = 2, sec_type = SecType,
			   a_rid = ARoleId, a_cond_val = ARank, a_lev = ALev,
			   a_power = APower, b_rid = BRoleId,
			   b_cond_val = BRank, b_lev = BLev, b_power = BPower},
	  combat_replay_mgr:acc_replay_reference(ReplayId),
	  d_ets_lib:save_d_ets(replay, Replay),
	  add_type(2, ReplayId);
      _ -> pass
    end;
do_save(ReplayInfo = #replay_info{combat_type = 31,
				  sec_type = SecType, round = Round,
				  b_rid = BRoleId = {BRid, BSid}, b_lev = BLev,
				  b_rank = BRank, b_power = BPower,
				  a_rid = ARoleId = {ARid, ASid}, a_lev = ALev,
				  a_power = APower, a_rank = ARank,
				  id = ReplayId, time = Time, ext = Ext})
    when BRid > 0 ->
    save_replay_info(ReplayInfo),
    case ARid > 0 andalso
	   sys_lib:is_local(ARoleId) andalso
	     ASid =/= <<>> andalso ASid =/= <<"robot">>
	of
      true ->
	  AKey = {ARoleId, 1},
	  ARoleReplay = #replay_role{list = AList} =
			    replay_hall_lib:get_role_replay(AKey),
	  {ANewList, ADelList} =
	      list_util:split(video_data:get_const(self_video_limit),
			      [ReplayId | AList]),
	  ANewRoleReplay = ARoleReplay#replay_role{list =
						       ANewList},
	  combat_replay_mgr:acc_replay_reference(ReplayId),
	  [combat_replay_mgr:dec_replay_reference(ReplayId1)
	   || ReplayId1 <- ADelList],
	  d_ets_lib:save_d_ets(replay_role, ANewRoleReplay);
      _ -> pass
    end,
    case BRid > 0 andalso
	   sys_lib:is_local(BRoleId) andalso
	     BSid =/= <<>> andalso BSid =/= <<"robot">>
	of
      true ->
	  BKey = {BRoleId, 1},
	  BRoleReplay = #replay_role{list = BList} =
			    replay_hall_lib:get_role_replay(BKey),
	  {BNewList, BDelList} =
	      list_util:split(video_data:get_const(self_video_limit),
			      [ReplayId | BList]),
	  BNewRoleReplay = BRoleReplay#replay_role{list =
						       BNewList},
	  combat_replay_mgr:acc_replay_reference(ReplayId),
	  [combat_replay_mgr:dec_replay_reference(ReplayId1)
	   || ReplayId1 <- BDelList],
	  d_ets_lib:save_d_ets(replay_role, BNewRoleReplay);
      _ -> pass
    end,
    LimitRound =
	video_data:get_const(public_round_condition),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidreplay_hall_mgr329, _,
       {__Levelreplay_hall_mgr329, __Tracesreplay_hall_mgr329}}
	  when __Levelreplay_hall_mgr329 band 128 /= 0 orelse
		 __Tracesreplay_hall_mgr329 /= [] ->
	  lager:do_log(debug,
		       [{module, replay_hall_mgr}, {function, do_save},
			{line, 329}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("周冠军赛录像处理:~w", [Ext]), none, 4096, 128,
		       __Levelreplay_hall_mgr329, __Tracesreplay_hall_mgr329,
		       lager_event, __Pidreplay_hall_mgr329);
      _ -> ok
    end,
    case Round >= LimitRound andalso
	   BRid > 0 andalso ARid > 0
	   orelse
	   SecType >= 20 orelse
	     list_util:keyfind(is_guess, Ext, false)
	of
      true ->
	  Replay = #replay{id = ReplayId, time = Time,
			   combat_type = 31, type = 7, sec_type = SecType,
			   a_rid = ARoleId, a_cond_val = ARank, a_lev = ALev,
			   a_power = APower, b_rid = BRoleId,
			   b_cond_val = BRank, b_lev = BLev, b_power = BPower},
	  combat_replay_mgr:acc_replay_reference(ReplayId),
	  d_ets_lib:save_d_ets(replay, Replay),
	  add_type(7, ReplayId);
      _ -> pass
    end;
do_save(ReplayInfo = #replay_info{combat_type =
				      18 = CombatType,
				  b_rid = BRoleId = {TRid, BSrvId},
				  a_rid = ARoleId, id = {ReplayId, ASrvId},
				  a_rank = ARank, b_lev = BLev, b_rank = BRank,
				  b_power = BPower, time = Time, a_lev = ALev,
				  a_power = APower, ret = Ret})
    when TRid > 0 ->
    save_replay_info(ReplayInfo),
    case sys_lib:is_local(ASrvId) of
      true ->
	  Key = {ARoleId, 1},
	  RoleReplay = #replay_role{list = List} =
			   replay_hall_lib:get_role_replay(Key),
	  {NewList, DelList} =
	      list_util:split(video_data:get_const(self_video_limit),
			      [{ReplayId, ASrvId} | List]),
	  NewRoleReplay = RoleReplay#replay_role{list = NewList},
	  cluster_lib:cast(ASrvId, combat_replay_mgr,
			   acc_replay_reference, [ReplayId]),
	  [cluster_lib:cast(SrvId1, combat_replay_mgr,
			    dec_cluster_replay_reference, [{ReplayId1, SrvId1}])
	   || {ReplayId1, SrvId1} <- DelList],
	  d_ets_lib:save_d_ets(replay_role, NewRoleReplay);
      _ -> skip
    end,
    LimitRank = sky_ladder_data:get_const(watch_rank),
    case BSrvId =/= <<"robot">> andalso
	   (ARank =/= 0 andalso ARank =< LimitRank orelse
	      BRank =/= 0 andalso BRank =< LimitRank)
	     andalso Ret =:= 1
	of
      true ->
	  del_same_replay(true, ARoleId, BRoleId, 5),
	  Replay = #replay{id = {ReplayId, ASrvId}, time = Time,
			   combat_type = CombatType, type = 5, a_rid = ARoleId,
			   a_cond_val = ARank, a_lev = ALev, a_power = APower,
			   b_rid = BRoleId, b_cond_val = BRank, b_lev = BLev,
			   b_power = BPower},
	  cluster_lib:cast(ASrvId, combat_replay_mgr,
			   acc_replay_reference, [ReplayId]),
	  d_ets_lib:save_d_ets(replay, Replay),
	  add_type(5, ReplayId, ASrvId);
      _ -> pass
    end;
do_save(ReplayInfo = #replay_info{combat_type = 23,
				  b_rid = {TRid, _}, a_rid = ARoleId,
				  id = ReplayId})
    when TRid > 0 ->
    save_replay_info(ReplayInfo),
    Key = {ARoleId, 1},
    RoleReplay = #replay_role{list = List} =
		     replay_hall_lib:get_role_replay(Key),
    {NewList, DelList} =
	list_util:split(video_data:get_const(self_video_limit),
			[ReplayId | List]),
    NewRoleReplay = RoleReplay#replay_role{list = NewList},
    combat_replay_mgr:acc_replay_reference(ReplayId),
    [combat_replay_mgr:dec_replay_reference(ReplayId1)
     || ReplayId1 <- DelList],
    d_ets_lib:save_d_ets(replay_role, NewRoleReplay);
do_save(_) -> ok.

save_replay_info(ReplayInfo = #replay_info{id = Id}) ->
    ets:insert(combat_replay_mgr:replay_info_tab(Id),
	       ReplayInfo),
    replay_hall_file:save_replay_info(ReplayInfo),
    info({loaded_replay_info, Id}),
    ok.

del_same_replay(true, ARoleId, BRoleId, Type) ->
    L = ets:match_object(replay,
			 #replay{a_rid = ARoleId, b_rid = BRoleId, type = Type,
				 _ = '_'}),
    [cluster_lib:cast(SrvId, combat_replay_mgr,
		      dec_cluster_replay_reference, [{Id, SrvId}])
     || #replay{id = {Id, SrvId}} <- L],
    [d_ets_lib:clear_d_ets(replay, Id)
     || #replay{id = Id} <- L],
    DelIds = [Id || #replay{id = Id} <- L],
    NewList = util:get({type_list, Type}, []) -- DelIds,
    put({type_list, Type}, NewList);
del_same_replay(_IsCluster, ARoleId, BRoleId, Type) ->
    L = ets:match_object(replay,
			 #replay{a_rid = ARoleId, b_rid = BRoleId,
				 combat_type = Type, _ = '_'}),
    [combat_replay_mgr:dec_replay_reference(Id)
     || #replay{id = Id} <- L],
    [d_ets_lib:clear_d_ets(replay, Id)
     || #replay{id = Id} <- L],
    DelIds = [Id || #replay{id = Id} <- L],
    NewList = util:get({type_list, Type}, []) -- DelIds,
    put({type_list, Type}, NewList).

calc_hot_replay(Id) ->
    Replay = #replay_role{list = L} =
		 replay_hall_lib:get_role_replay(98),
    Map = case L of
	    [M] -> M;
	    [] -> #{}
	  end,
    N = maps:get(Id, Map, 0) + 1,
    RandL = maps:get(list, Map, []),
    RandL1 = list_util:add_sort(RandL, {Id, N}, [2], 1),
    RandL2 = lists:sublist(RandL1, 30),
    Map1 = maps:put(Id, N, Map),
    Map2 = maps:put(list, RandL2, Map1),
    NewReplay = Replay#replay_role{list = [Map2]},
    d_ets_lib:save_ets(replay_role, NewReplay).

save_new_partner_replay(ReplayId, APlist, BPlist,
			Round) ->
    NewBid = video_data:get_const(fresh_hero_id),
    case (have_new_partner(APlist, NewBid) =:= true orelse
	    have_new_partner(BPlist, NewBid) =:= true)
	   andalso
	   Round >= video_data:get_const(nh_hot_round_condition)
	of
      false -> pass;
      _ ->
	  Replay = #replay_role{list = L} =
		       replay_hall_lib:get_role_replay(97),
	  {NewList, DelList} = list_util:split(30,
					       [ReplayId | L]),
	  NewReplay = Replay#replay_role{list = NewList},
	  combat_replay_mgr:acc_replay_reference(ReplayId),
	  [combat_replay_mgr:dec_replay_reference(ReplayId1)
	   || ReplayId1 <- DelList],
	  d_ets_lib:save_ets(replay_role, NewReplay)
    end.

load_type() ->
    [do_load_type(Type) || Type <- [1, 2, 3, 4, 5, 7]].

do_load_type(Type = 5) ->
    Ms = [{{replay, {'$1', '$2'}, '$3', '_', '_', '_', '_',
	    '_', '_', '_', '_', '_', '_', '_'},
	   [{'=:=', {const, Type}, '$3'}], [{{'$1', '$2'}}]}],
    L = lists:reverse(lists:sort(ets:select(replay, Ms))),
    set_type_cache_cluster(Type, L);
do_load_type(Type) ->
    Ms = [{{replay, '$1', '$2', '_', '_', '_', '_', '_',
	    '_', '_', '_', '_', '_', '_'},
	   [{'=:=', {const, Type}, '$2'}], ['$1']}],
    L = lists:reverse(lists:sort(ets:select(replay, Ms))),
    set_type_cache(Type, L).

add_type(Type, Id) ->
    set_type_cache(Type,
		   [Id | util:get({type_list, Type}, [])]).

set_type_cache(Type, L) ->
    {NewList, DelList} = list_util:split(30, L),
    [d_ets_lib:clear_d_ets(replay, Id) || Id <- DelList],
    [combat_replay_mgr:dec_replay_reference(Id)
     || Id <- DelList],
    put({type_list, Type}, NewList).

add_type(Type, Id, SrvId) ->
    set_type_cache_cluster(Type,
			   [{Id, SrvId} | util:get({type_list, Type}, [])]).

set_type_cache_cluster(Type, L) ->
    {NewList, DelList} = list_util:split(30, L),
    [d_ets_lib:clear_d_ets(replay, {Id, SrvId})
     || {Id, SrvId} <- DelList],
    [cluster_lib:cast(SrvId, combat_replay_mgr,
		      dec_cluster_replay_reference, [{Id, SrvId}])
     || {Id, SrvId} <- DelList],
    put({type_list, Type}, NewList).

set_del_cache_timer(#state{min = Min, max = Max})
    when Max - Min > 1000 ->
    case put(del_cache_timer, 1) of
      undefined when Max - Min > 10000 ->
	  erlang:send_after(1000, self(), del_cache_replay_info);
      undefined when Max - Min > 5000 ->
	  erlang:send_after(3000, self(), del_cache_replay_info);
      undefined when Max - Min > 3000 ->
	  erlang:send_after(8000, self(), del_cache_replay_info);
      undefined ->
	  erlang:send_after(10000, self(), del_cache_replay_info);
      _ -> skip
    end;
set_del_cache_timer(_) -> pass.


