-file("src/mod/combat/combat_statistics.erl", 1).

-module(combat_statistics).

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
		  res_p, dam_s, res_s, tenacity]}]).

-export([add_hurt/3, add_curt/3, get_statistics/0,
	 add_group_hurt/2, get_partner_hurt_statistics/1,
	 get_partner_curt_statistics/1, get_total_hurt/1, sync/1,
	 dead_partner_when_end/0, get_stat_info/1,
	 get_all_partner_statistics/0, acc_fire_buff_num/3,
	 is_balance/0]).

-file("inc/combat.hrl", 1).

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

-file("src/mod/combat/combat_statistics.erl", 22).

-spec get_partner_curt_statistics(1 |
				  2) -> [{PartnerId :: integer(),
					  Hurt :: integer()}].

get_partner_curt_statistics(Group) ->
    PosList = case Group of
		1 -> combat_dict:all_a();
		2 -> combat_dict:all_b()
	      end,
    AllObjects = [combat_dict:object(Pos)
		  || Pos <- PosList],
    [{PartnerId, combat_dict:get_curt(Pos)}
     || #fight_object{object_id = PartnerId, pos = Pos}
	    <- AllObjects].

-spec get_partner_hurt_statistics(1 |
				  2) -> [{PartnerId :: integer(),
					  Hurt :: integer()}].

get_partner_hurt_statistics(Group) ->
    PosList = case Group of
		1 -> combat_dict:all_a();
		2 -> combat_dict:all_b()
	      end,
    AllObjects = [combat_dict:object(Pos)
		  || Pos <- PosList],
    [{PartnerId, combat_dict:get_hurt(Pos)}
     || #fight_object{object_id = PartnerId, pos = Pos}
	    <- AllObjects].

get_total_hurt(Group) ->
    lists:sum([Hurt
	       || {_, Hurt} <- get_partner_hurt_statistics(Group)]).

-spec get_all_partner_statistics() -> [{PartnerId ::
					    integer(),
					Hurt :: integer()}].

get_all_partner_statistics() ->
    do_get_all_partner_statistics([1, 2], []).

do_get_all_partner_statistics([], L) -> L;
do_get_all_partner_statistics([Group | Other], L) ->
    PosList = case Group of
		1 -> combat_dict:all_a();
		2 -> combat_dict:all_b()
	      end,
    AllObjects = [combat_dict:object(Pos)
		  || Pos <- PosList],
    List = [to_partner_hurt(FO) || FO <- AllObjects],
    do_get_all_partner_statistics(Other,
				  [{Group, List} | L]).

to_partner_hurt(#fight_object{extra_data = ExtraData,
			      master_id = MasterId, object_id = Id,
			      object_bid = PartnerBId, star = Star, lev = Lev,
			      camp_type = CampType, pos = Pos}) ->
    #partner_hurt{master_id = MasterId, id = Id,
		  bid = PartnerBId, star = Star, lev = Lev,
		  camp_type = CampType, dps = combat_dict:get_hurt(Pos),
		  cure = combat_dict:get_curt(Pos),
		  ext_data =
		      [{5, list_util:keyfind(5, ExtraData, 0)},
		       {11, list_util:keyfind(11, ExtraData, 0)}],
		  be_hurt = combat_dict:get_be_hurt(Pos)}.

-spec acc_fire_buff_num(pos_integer(), integer(),
			list()) -> [{PartnerId :: integer(),
				     Hurt :: integer()}].

acc_fire_buff_num(Pos, 3, BuffLists) ->
    Fun = fun (#combat_buff{bid = Bid}, Acc) ->
		  case skill_data:get_buff(Bid) of
		    #combat_buff_data{dot_type = 3} -> Acc + 1;
		    _ -> Acc
		  end
	  end,
    Num = lists:foldl(Fun, 0, BuffLists),
    case combat_target:is_a(Pos) of
      true -> combat_dict:put_a_fire_buff_num(Num);
      _ -> combat_dict:put_b_fire_buff_num(Num)
    end;
acc_fire_buff_num(_Pos, _Type, _BuffLists) -> ok.

add_hurt(Pos, TPos, Hurt) ->
    case need_to_save() of
      true ->
	  OriHurt = combat_dict:get_hurt(Pos),
	  combat_dict:save_hurt(Pos, OriHurt + Hurt),
	  BeHurt = combat_dict:get_be_hurt(TPos),
	  combat_dict:save_be_hurt(TPos, BeHurt + Hurt);
      false -> pass
    end.

add_curt(Pos, _TPos, Curt) ->
    case need_to_save() of
      true ->
	  OriCurt = combat_dict:get_curt(Pos),
	  combat_dict:save_curt(Pos, OriCurt + Curt);
      false -> pass
    end.

add_group_hurt(Pos, Hurt) when Hurt < 0 ->
    case combat_target:is_b(Pos) of
      true ->
	  add_a_group_boss_hurt(Pos, -Hurt),
	  combat_dict:save_a_group_hurt(-Hurt);
      false -> pass
    end;
add_group_hurt(_Pos, _Hurt) -> ok.

add_a_group_boss_hurt(Pos, Hurt) ->
    case combat_target:is_boss(Pos) of
      true -> combat_dict:save_a_group_boss_hurt(Hurt);
      _ -> pass
    end.

-spec get_statistics() -> [{Pos :: integer(),
			    Group :: integer(), Hurt :: integer(),
			    Curt :: integer()}].

get_statistics() ->
    case need_to_save() of
      true ->
	  A = [{Pos, 1, combat_dict:get_hurt(Pos),
		combat_dict:get_curt(Pos)}
	       || Pos <- combat_dict:all_a()],
	  B = [{Pos, 2, combat_dict:get_hurt(Pos),
		combat_dict:get_curt(Pos)}
	       || Pos <- combat_dict:all_b()],
	  A ++ B;
      false -> []
    end.

dead_partner_when_end() ->
    Fun = fun (Pos) ->
		  case combat_dict:object(Pos) of
		    #fight_object{object_id = ObjectId,
				  master_id = MasterId, owner_id = OwnerId,
				  hp = Hp}
			when Hp =< 0 andalso MasterId =:= OwnerId ->
			{true, ObjectId};
		    _ -> false
		  end
	  end,
    lists:filtermap(Fun, combat_dict:all_a()).

get_stat_info(Group) ->
    Fun = fun (Pos) ->
		  case combat_dict:object(Pos) of
		    #fight_object{master_id = MasterId,
				  extra_data = ExtraData, star = Star,
				  buff_list = BuffList, power = Power,
				  lev = Lev, object_name = ObjName,
				  object_type = ObjectType,
				  object_id = ObjectId, object_bid = ObjectBid,
				  hp = Hp, hp_max = HpMax, is_boss = IsBoss} ->
			{true,
			 #{pos => Pos, extra_data => ExtraData,
			   object_name => ObjName, buff_list => BuffList,
			   master_id => MasterId, star => Star, power => Power,
			   lev => Lev, object_id => ObjectId,
			   object_bid => ObjectBid, object_type => ObjectType,
			   hp => Hp, hp_max => HpMax,
			   hurt => combat_dict:get_hurt(Pos),
			   curt => combat_dict:get_curt(Pos),
			   be_hurt => combat_dict:get_be_hurt(Pos),
			   is_boss => IsBoss}};
		    _ -> false
		  end
	  end,
    PosList = util:if_true(Group =:= 1, combat_dict:all_a(),
			   combat_dict:all_b()),
    lists:filtermap(Fun, PosList).

sync(#combat{type = 5,
	     combat_roles = [#combat_role{pid = RolePid}]}) ->
    role:apply(async, RolePid,
	       {world_boss, apply_sync_hurt,
		[{self(), combat_dict:a_group_boss_hurt()}]});
sync(_Combat) -> ok.

is_balance() ->
    CombatType = combat_dict:combat_type(),
    case combat_type_data:is_use_balance_mode(CombatType) of
      0 -> 0;
      Type ->
	  ActionCount = combat_dict:action_count(),
	  case combat_type_data:get_balance_attr({Type,
						  ActionCount})
	      of
	    [_ | _] -> 1;
	    _ -> 0
	  end
    end.

need_to_save() ->
    CombatType = combat_dict:combat_type(),
    need_to_save(CombatType).

need_to_save(_CombatType) -> true.


