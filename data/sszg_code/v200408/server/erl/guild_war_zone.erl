-file("src/mod/guild_war2/guild_war_zone.erl", 1).

-module(guild_war_zone).

-lager_records([{combat_drama,
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
		{guild_war_role_log,
		 [id, name, lev, face, power, formation_type,
		  formation_lev, time, repaly_id, result, hp, defense,
		  face_update_time, face_file]},
		{guild_war_log,
		 [flag1, flag2, time, id1, name1, id2, name2, gid, gname,
		  int_args, str_args]},
		{guild_war_partner,
		 [id, bid, lev, star, break_lev, base_attr, all_attr,
		  skills, break_skills, set_skills, ext_data]},
		{guild_war_role,
		 [pos, id, name, lev, face, power, formation_type,
		  formation_lev, war_score, star, defense, hp, hp_max,
		  status, def_count, def_log, count, repaly_info,
		  relic_def_count, hallows_id, hallows_lev,
		  hallows_skill_lev, hallows_look_id, hallows_lucky,
		  hallows_seal, hallows_all_look_ids, extra, look_id,
		  face_update_time, face_file, break_groups]},
		{guild_war_sign,
		 [gid, group_id, srv_name, gname, def_num, defense,
		  last_matchs, avg_power, star_time, buff_lev, rank, hp,
		  hp_max, war_log, lev]},
		{state, []}]).

-behaviour(gen_server).

-export([info/1, info/2, cast/1, call/1, start_link/2]).

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

-file("src/mod/guild_war2/guild_war_zone.erl", 12).

-file("inc/guild_war.hrl", 1).

-record(guild_war_sign,
	{gid = {0, <<>>}, group_id = 0, srv_name = <<>>,
	 gname = <<>>, def_num = 0, defense = [],
	 last_matchs = {0, <<>>}, avg_power = 0, star_time = 0,
	 buff_lev = 0, rank = 0, hp = 0, hp_max = 0,
	 war_log = [], lev = 0}).

-record(guild_war_role,
	{pos = 0, id = {0, <<>>}, name = <<>>, lev = 0,
	 face = 0, power = 0, formation_type = 0,
	 formation_lev = 0, war_score = 0, star = 0,
	 defense = [], hp = 3, hp_max = 3, status = 0,
	 def_count = 0, def_log = [], count = 0,
	 repaly_info = [], relic_def_count = 0, hallows_id = 0,
	 hallows_lev = 0, hallows_skill_lev = 0, hallows_look_id,
	 hallows_lucky, hallows_seal, hallows_all_look_ids = [],
	 extra = [], look_id = 0, face_update_time = 0,
	 face_file = <<>>, break_groups = []}).

-record(guild_war_partner,
	{id = 0, bid = 0, lev = 0, star = 0, break_lev = 0,
	 base_attr = [], all_attr = [], skills = [],
	 break_skills = [], set_skills = [], ext_data = []}).

-record(guild_war_log,
	{flag1 = 0, flag2 = 0, time = 0, id1 = {0, <<>>},
	 name1 = <<>>, id2 = {0, <<>>}, name2 = <<>>,
	 gid = {0, <<>>}, gname = <<>>, int_args = [],
	 str_args = []}).

-record(guild_war_role_log,
	{id = {0, <<>>}, name = <<>>, lev = 0, face = 0,
	 power = 0, formation_type = 0, formation_lev = 0,
	 time = 0, repaly_id = 0, result = 0, hp = 0,
	 defense = [], face_update_time = 0, face_file = <<>>}).

-file("src/mod/guild_war2/guild_war_zone.erl", 13).

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

-file("src/mod/guild_war2/guild_war_zone.erl", 14).

info(Gid, Info) ->
    case ets:lookup(guild_war_zone, Gid) of
      [{_, Pid}] -> Pid ! Info;
      _ -> ok
    end,
    ok.

info(Info) -> guild_war_zone ! Info.

cast(Info) -> gen_server:cast(guild_war_zone, Info).

call(Info) ->
    case catch gen_server:call(guild_war_zone, Info, 10000)
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
	    {__Pidguild_war_zone31, _,
	     {__Levelguild_war_zone31, __Tracesguild_war_zone31}}
		when __Levelguild_war_zone31 band 8 /= 0 orelse
		       __Tracesguild_war_zone31 /= [] ->
		lager:do_log(error,
			     [{module, guild_war_zone}, {function, call},
			      {line, 31}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [guild_war_zone, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelguild_war_zone31,
			     __Tracesguild_war_zone31, lager_event,
			     __Pidguild_war_zone31);
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

start_link(G1 = #guild_war_sign{gid = {Id1, Sid1}},
	   G2 = #guild_war_sign{gid = {Id2, Sid2}}) ->
    LocalName = list_to_atom(lists:concat(["guild_war_",
					   Id1, "_", binary_to_list(Sid1), "_",
					   Id2, "_", binary_to_list(Sid2)])),
    gen_server:start_link({local, LocalName},
			  guild_war_zone, [G1, G2], []).

init([G1 = #guild_war_sign{gid = Gid1 = {_, SId1},
			   defense = Def1},
      G2 = #guild_war_sign{gid = Gid2 = {_, SId2},
			   defense = Def2}]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_war_zone40, _,
       {__Levelguild_war_zone40, __Tracesguild_war_zone40}}
	  when __Levelguild_war_zone40 band 64 /= 0 orelse
		 __Tracesguild_war_zone40 /= [] ->
	  lager:do_log(info,
		       [{module, guild_war_zone}, {function, init}, {line, 40},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动... ~w",
				     [guild_war_zone, {Gid1, Gid2}]),
		       none, 4096, 64, __Levelguild_war_zone40,
		       __Tracesguild_war_zone40, lager_event,
		       __Pidguild_war_zone40);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    SId = sys_env:get(server_id),
    Num1 = length(Def1),
    Num2 = length(Def2),
    Flag1 = sys_lib:is_local(SId1),
    Flag2 = sys_lib:is_local(SId2),
    if Flag1, Num1 < Num2 ->
	   guild_war:do_add(G1, Num2 - Num1, Gid2);
       Flag2, Num2 < Num1 ->
	   guild_war:do_add(G2, Num1 - Num2, Gid1);
       true -> ok
    end,
    guild_war_db:update_ets(guild_war_zone,
			    [{Gid1, self()}, {Gid2, self()}], ets),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_war_zone66, _,
       {__Levelguild_war_zone66, __Tracesguild_war_zone66}}
	  when __Levelguild_war_zone66 band 64 /= 0 orelse
		 __Tracesguild_war_zone66 /= [] ->
	  lager:do_log(info,
		       [{module, guild_war_zone}, {function, init}, {line, 66},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [guild_war_zone]), none,
		       4096, 64, __Levelguild_war_zone66,
		       __Tracesguild_war_zone66, lager_event,
		       __Pidguild_war_zone66);
      _ -> ok
    end,
    {ok, State}.

handle_call({can_combat, Pos, Gid, Hp, Flag}, _From,
	    State) ->
    Reply = case guild_war_db:get_match_info(Gid) of
	      undefined ->
		  {false,
		   util:fbin(lang:get(<<"公会活跃人数不足~w人，本轮公会战不参与"/utf8>>),
			     [guild_war_data:get_const(active_member_num)])};
	      Gid2 ->
		  case guild_war_db:get_sign(Gid2) of
		    {ok,
		     G = #guild_war_sign{defense = Def, gname = GName,
					 hp = AllHp}} ->
			case lists:keyfind(Pos, #guild_war_role.pos, Def) of
			  #guild_war_role{hp = 0} when Flag == 0 ->
			      {false, lang:get(<<"该据点已被摧毁"/utf8>>)};
			  #guild_war_role{hp = HpT} when HpT < Hp ->
			      {false, lang:get(<<"根据剩余可获星数，不能挑战该难度"/utf8>>)};
			  #guild_war_role{status = 1} ->
			      {false, lang:get(<<"该据点正在被攻打"/utf8>>)};
			  WarRole = #guild_war_role{status = 0, power = Power,
						    hp = 0,
						    relic_def_count =
							RelicCount}
			      when Flag == 1 andalso Hp == 0 ->
			      case RelicCount <
				     guild_war_data:get_const(ruins_challange_limit)
				  of
				true ->
				    guild_war_db:update_ets(guild_war_sign,
							    G#guild_war_sign{defense
										 =
										 lists:keyreplace(Pos,
												  #guild_war_role.pos,
												  Def,
												  WarRole#guild_war_role{status
															     =
															     1})}),
				    {ok, Gid2, Power, GName, AllHp};
				_ ->
				    {false,
				     lang:get(<<"该据点废墟已被攻破 不能继续挑战"/utf8>>)}
			      end;
			  WarRole = #guild_war_role{status = 0, power = Power}
			      when Flag == 0 ->
			      guild_war_db:update_ets(guild_war_sign,
						      G#guild_war_sign{defense =
									   lists:keyreplace(Pos,
											    #guild_war_role.pos,
											    Def,
											    WarRole#guild_war_role{status
														       =
														       1})}),
			      {ok, Gid2, Power, GName, AllHp};
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
				{__Pidguild_war_zone97, _,
				 {__Levelguild_war_zone97,
				  __Tracesguild_war_zone97}}
				    when __Levelguild_war_zone97 band 8 /= 0
					   orelse
					   __Tracesguild_war_zone97 /= [] ->
				    lager:do_log(error,
						 [{module, guild_war_zone},
						  {function, handle_call},
						  {line, 97},
						  {pid, pid_to_list(self())},
						  {node, node()}
						  | lager:md()],
						 io_lib:format("联盟战进战斗数据匹配异常:~w",
							       [{Pos, Gid, Hp,
								 Flag}]),
						 none, 4096, 8,
						 __Levelguild_war_zone97,
						 __Tracesguild_war_zone97,
						 lager_event,
						 __Pidguild_war_zone97);
				_ -> ok
			      end,
			      {false, lang:get(<<"参数错误, 找不到该防守阵容"/utf8>>)}
			end;
		    _ -> {false, lang:get(<<"本轮公会战未匹配到对手"/utf8>>)}
		  end
	    end,
    {reply, Reply, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({combat_over, Flag, Gid, Id = {_, Sid1},
	     Result, Gid2 = {_, Sid2}, Pos, Hp, ReplayInfo, Power,
	     LogData, WarLog1 = #guild_war_log{int_args = Arg1},
	     WarLog2},
	    State) ->
    AddHp = util:if_true(Result == 1, Hp, 0),
    AddScore = if Result == 1, Flag == 0 ->
		      WarScores = guild_war_data:get_warscores(Pos),
		      list_util:keyfind(Hp, WarScores, 0);
		  Result == 1, Flag == 1 ->
		      guild_war_data:get_const(win_ruins_record);
		  true ->
		      util:if_true(Flag == 0,
				   guild_war_data:get_const(lose_guard_record),
				   guild_war_data:get_const(lose_ruins_record))
	       end,
    {NewHp, LogBuffLev} = case guild_war_db:get_sign(Gid) of
			    {ok,
			     G = #guild_war_sign{hp = NowHp, defense = Def,
						 buff_lev = BuffLev}} ->
				case lists:keyfind(Id, #guild_war_role.id, Def)
				    of
				  WarRole = #guild_war_role{star = Star,
							    war_score =
								Score} ->
				      NewBuffLev = util:if_true(BuffLev <
								  lists:max(guild_war_data:get_buff_list())
								  andalso
								  Result == 1
								    andalso
								    Flag == 1,
								BuffLev + 1,
								BuffLev),
				      NewWarRole = WarRole#guild_war_role{star =
									      Star
										+
										AddHp,
									  war_score
									      =
									      Score
										+
										AddScore},
				      NewG = case AddHp > 0 of
					       true ->
						   G#guild_war_sign{buff_lev =
									NewBuffLev,
								    hp =
									NowHp +
									  AddHp,
								    star_time =
									date:unixtime(),
								    defense =
									lists:keyreplace(Id,
											 #guild_war_role.id,
											 Def,
											 NewWarRole)};
					       _ ->
						   G#guild_war_sign{buff_lev =
									NewBuffLev,
								    hp =
									NowHp +
									  AddHp,
								    defense =
									lists:keyreplace(Id,
											 #guild_war_role.id,
											 Def,
											 NewWarRole)}
					     end,
				      guild_war_db:update_ets(guild_war_sign,
							      NewG),
				      guild:apply(async, Gid,
						  {guild_war, push_ref_hp, []}),
				      {NowHp + AddHp, NewBuffLev};
				  _ -> {NowHp, BuffLev}
				end;
			    _ -> {0, 0}
			  end,
    Args = [{1, AddHp}, {2, AddScore}, {4, LogBuffLev},
	    {5, Result}, {6, NewHp}],
    DoAddWarLog1 = WarLog1#guild_war_log{int_args =
					     Arg1 ++ Args},
    self() ! {add_log2, Gid, DoAddWarLog1},
    DoAddWarLog2 = WarLog2#guild_war_log{int_args =
					     [{3, NewHp}, {5, Result} | Args]},
    ReplayId1 = list_util:keyfind(Sid1, ReplayInfo, 0),
    self() !
      {add_log, Gid, Gid2, Pos,
       LogData#guild_war_role_log{repaly_id = ReplayId1},
       AddHp, Flag},
    case sys_lib:is_local(Sid2) of
      true ->
	  cluster_lib:cast(Sid2, guild_war_zone, info,
			   [Gid2, {add_log2, Gid2, DoAddWarLog2}]),
	  guild:apply(async, Gid2, {guild_war, push_ref_hp, []});
      _ ->
	  ReplayId2 = list_util:keyfind(Sid2, ReplayInfo, 0),
	  cluster_lib:cast(Sid2, guild_war_zone, info,
			   [Gid2,
			    {add_log, Gid2, Gid2, Pos,
			     LogData#guild_war_role_log{repaly_id = ReplayId2},
			     AddHp, Flag}]),
	  cluster_lib:cast(Sid2, guild_war_zone, info,
			   [Gid2, {add_log2, Gid2, DoAddWarLog2}]),
	  case Result == 1 of
	    true ->
		cluster_lib:cast(Sid2, guild_war_zone, info,
				 [Gid2,
				  {add_hp, Gid2, Gid, Id, AddHp, AddScore}]);
	    _ -> ok
	  end
    end,
    {noreply, State};
handle_info({combat_over, Gid = {_, Sid}, Result, Id,
	     WarLog1, WarLog2},
	    State) ->
    AddScore = case Result of
		 1 -> guild_war_data:get_const(win_strongholds_record);
		 _ -> guild_war_data:get_const(lose_strongholds_record)
	       end,
    NewBuffLev2 = case guild_war_db:get_sign(Gid) of
		    {ok,
		     G = #guild_war_sign{buff_lev = BuffLev,
					 defense = Def}} ->
			case lists:keyfind(Id, #guild_war_role.id, Def) of
			  WarRole = #guild_war_role{war_score = Score} ->
			      NewBuffLev = util:if_true(BuffLev <
							  lists:max(guild_war_data:get_buff_list())
							  andalso Result == 1,
							BuffLev + 1, BuffLev),
			      NewG = G#guild_war_sign{buff_lev = NewBuffLev,
						      defense =
							  lists:keyreplace(Id,
									   #guild_war_role.id,
									   Def,
									   WarRole#guild_war_role{war_score
												      =
												      Score
													+
													AddScore})},
			      guild_war_db:update_ets(guild_war_sign, NewG),
			      guild:apply(async, Gid,
					  {guild_war, push_ref_hp, []}),
			      NewBuffLev;
			  _ -> BuffLev
			end;
		    _ -> 0
		  end,
    case Result == 1 of
      true ->
	  Args = [{2, AddScore}, {4, NewBuffLev2}],
	  DoAddWarLog1 = WarLog1#guild_war_log{int_args = Args},
	  self() ! {add_log2, Gid, DoAddWarLog1},
	  DoAddWarLog2 = WarLog2#guild_war_log{int_args = Args},
	  case guild_war_db:get_match_info(Gid) of
	    Gid2 = {_, Sid} ->
		case sys_lib:is_local(Sid) of
		  true -> ok;
		  _ ->
		      cluster_lib:cast(Sid, guild_war_zone, info,
				       [Gid2,
					{add_hp, Gid2, Gid, Id, 0, AddScore}])
		end,
		cluster_lib:cast(Sid, guild_war_zone, info,
				 [Gid2, {add_log2, Gid2, DoAddWarLog2}]);
	    _ -> ok
	  end;
      _ -> ok
    end,
    {noreply, State};
handle_info({add_log, PushGid, Gid = {_, Sid2}, Pos,
	     LogData, DelHp, CombatFlag},
	    State) ->
    case guild_war_db:get_sign(Gid) of
      {ok, G = #guild_war_sign{defense = Def}} ->
	  case lists:keyfind(Pos, #guild_war_role.pos, Def) of
	    WarRole = #guild_war_role{def_log = DefLog, hp = Hp,
				      def_count = DefCount,
				      relic_def_count = OldRelicCount} ->
		combat_replay_mgr:acc_replay_reference(LogData#guild_war_role_log.repaly_id),
		{NewLogs, DelLogs} = list_util:split(20,
						     [LogData | DefLog]),
		[combat_replay_mgr:dec_replay_reference(ReplayId)
		 || #guild_war_role_log{repaly_id = ReplayId}
			<- DelLogs],
		NewRelicCount = util:if_true(CombatFlag == 0,
					     OldRelicCount, OldRelicCount + 1),
		NewDefCount =
		    util:if_true(LogData#guild_war_role_log.result == 1,
				 DefCount + 1, DefCount),
		NewWarRole = WarRole#guild_war_role{status = 0,
						    hp = max(0, Hp - DelHp),
						    relic_def_count =
							NewRelicCount,
						    def_log = NewLogs,
						    def_count = NewDefCount},
		NewG = G#guild_war_sign{defense =
					    lists:keyreplace(Pos,
							     #guild_war_role.pos,
							     Def, NewWarRole)},
		Flag = sys_lib:is_local(Sid2),
		if PushGid == Gid ->
		       guild:apply(async, PushGid,
				   {guild_war, push_ref_status,
				    [1, [NewWarRole]]});
		   Flag ->
		       guild:apply(async, Gid,
				   {guild_war, push_ref_status,
				    [1, [NewWarRole]]}),
		       guild:apply(async, PushGid,
				   {guild_war, push_ref_status,
				    [0, [NewWarRole]]});
		   true ->
		       guild:apply(async, PushGid,
				   {guild_war, push_ref_status,
				    [0, [NewWarRole]]})
		end,
		guild_war_db:update_ets(guild_war_sign, NewG);
	    _ -> ok
	  end;
      _ -> ok
    end,
    {noreply, State};
handle_info({add_log2, Gid, DoAddWarLog2}, State) ->
    case guild_war_db:get_sign(Gid) of
      {ok, G = #guild_war_sign{war_log = OldLog}} ->
	  NewG2 = G#guild_war_sign{war_log =
				       [DoAddWarLog2 | OldLog]},
	  guild:apply(async, Gid, {guild_war, push_add_log, []}),
	  guild_war_db:update_ets(guild_war_sign, NewG2);
      _ -> ok
    end,
    {noreply, State};
handle_info({add_hp, PushGid, Gid, Id, AddHp, AddScore},
	    State) ->
    case guild_war_db:get_sign(Gid) of
      {ok, G = #guild_war_sign{hp = NowHp, defense = Defs}} ->
	  NewDefs = case lists:keyfind(Id, #guild_war_role.id,
				       Defs)
			of
		      GRole = #guild_war_role{star = Star,
					      war_score = Score} ->
			  lists:keyreplace(Id, #guild_war_role.id, Defs,
					   GRole#guild_war_role{star =
								    Star +
								      AddHp,
								war_score =
								    Score +
								      AddScore});
		      _ -> Defs
		    end,
	  NewG = G#guild_war_sign{hp = NowHp + AddHp,
				  defense = NewDefs},
	  guild_war_db:update_ets(guild_war_sign, NewG);
      _ -> ok
    end,
    guild:apply(async, PushGid,
		{guild_war, push_ref_hp, []}),
    {noreply, State};
handle_info({not_combat, Pos, Gid}, State) ->
    case guild_war_db:get_sign(Gid) of
      {ok, G = #guild_war_sign{defense = Def}} ->
	  case lists:keyfind(Pos, #guild_war_role.pos, Def) of
	    WarRole = #guild_war_role{} ->
		guild_war_db:update_ets(guild_war_sign,
					G#guild_war_sign{defense =
							     lists:keyreplace(Pos,
									      #guild_war_role.pos,
									      Def,
									      WarRole#guild_war_role{status
													 =
													 0})});
	    _ -> ok
	  end;
      _ -> ok
    end,
    {noreply, State};
handle_info({join_combat, Id, Gid}, State) ->
    case guild_war_db:get_sign(Gid) of
      {ok, G = #guild_war_sign{defense = Def}} ->
	  case lists:keyfind(Id, #guild_war_role.id, Def) of
	    WarRole = #guild_war_role{count = Count} ->
		guild_war_db:update_ets(guild_war_sign,
					G#guild_war_sign{defense =
							     lists:keyreplace(Id,
									      #guild_war_role.id,
									      Def,
									      WarRole#guild_war_role{count
													 =
													 Count
													   +
													   1})}),
		true;
	    _ -> ok
	  end;
      _ -> ok
    end,
    {noreply, State};
handle_info({stop, Reason}, State) ->
    {stop, Reason, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_war_zone318, _,
       {__Levelguild_war_zone318, __Tracesguild_war_zone318}}
	  when __Levelguild_war_zone318 band 64 /= 0 orelse
		 __Tracesguild_war_zone318 /= [] ->
	  lager:do_log(info,
		       [{module, guild_war_zone}, {function, terminate},
			{line, 318}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelguild_war_zone318,
		       __Tracesguild_war_zone318, lager_event,
		       __Pidguild_war_zone318);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.


