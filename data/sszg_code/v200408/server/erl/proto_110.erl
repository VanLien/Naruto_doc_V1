-file("src/proto/proto_110.erl", 1).

-module(proto_110).

-lager_records([{item_make_args,
		 [base_id, bind, quantity, step, flag]},
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
		{m_star, [ver, star_list, fetter_list, all_attr]},
		{star_tower_replay, [tower, replays]},
		{tower_replay_data,
		 [type, rid, sid, name, face_id, time, power, repaly_id,
		  face_update_time, face_file]},
		{m_star_divination,
		 [ver, luck, quality, all_count, flag, ref_count,
		  day_gold_count, day_hun_count]},
		{m_star_tower, [ver, max_tower, award_list]},
		{star,
		 [ver, set_id, break_lev, lev, natals, add_attr,
		  fetter_attr, set_skill_id, power]},
		{group_attr, [atk, hp_max, def, speed]},
		{partner_base_p,
		 [partner_id, bid, lev, star, star_step, quality,
		  break_lev, power, skills, add_star, is_lock, use_skin,
		  end_time, resonate_lev, resonate_break_lev]},
		{partner_lev_data,
		 [add_hp, add_atk, add_def, add_speed]},
		{partner_base_data,
		 [bid, name, type, rare_type, init_star, show_star,
		  init_lev, pos_type, camp_type, break_lev, recruit_type,
		  skills, addition_skill, addition_skill2, skill_order,
		  ai, awake_items, awake_attr, awake_skill, init_power,
		  add_power, leader_skill, chips_num, chips_id,
		  hidden_skills, init_star5_num, hook_skills,
		  compose_expend, can_use_direct_item, awaken_info,
		  break_id, other_skills, item_id]},
		{partner_comment_p,
		 [comment_id, name, msg, like_num, no_like_num,
		  is_like]},
		{partner_comment,
		 [comment_id, partner_id, account, rid, sid, name,
		  post_time, msg, like_num, no_like_num]},
		{partner_bag,
		 [ver, type, num, buy_num, partner_list, partner_had,
		  comment_likes, partner_field, partner_star_lev,
		  max_star, partner_decomposes, partner_skins]},
		{partner_field, [lev, fields]},
		{partner_gemstone, [ver, type, gemstones]},
		{gemstone, [ver, pos, bid]},
		{partner_skin, [ver, id, end_time, ext]},
		{partner,
		 [ver, id, bid, type, career, is_lock, pos_type,
		  camp_type, rare_type, lev, quality, exp, name, star,
		  star_step, step_attr, break_lev, break_attr, power,
		  base_attr, group_attr, all_attr, skills, break_skills,
		  set_skills, eqm, hidden_skills, artifacts, fetter,
		  fetter_attr, fetter_power, score_lists, gemstones,
		  awaken_count, awaken_skills, add_star, dower_skill,
		  holy_eqm, use_skin, end_time, resonate_lev,
		  resonate_break_lev]},
		{package,
		 [type, next_id, volume, open_times, free_cell, items]},
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/partner.hrl", 1).

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

-file("inc/partner.hrl", 11).

-file("inc/package.hrl", 1).

-record(package,
	{type = 1  :: integer(), next_id = 1  :: pos_integer(),
	 volume = 0  :: non_neg_integer(),
	 open_times = 0  :: non_neg_integer(),
	 free_cell = []  :: list(), items = []  :: [tuple()]}).

-file("inc/partner.hrl", 12).

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

-file("inc/partner.hrl", 13).

-record(partner,
	{ver = 7  :: non_neg_integer(),
	 id = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer(),
	 type = 0  :: non_neg_integer(), career = 0,
	 is_lock = []  :: list(),
	 pos_type = 0  :: non_neg_integer(),
	 camp_type = 0  :: non_neg_integer(),
	 rare_type = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 quality = 0  :: non_neg_integer(),
	 exp = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 star = 1  :: non_neg_integer(),
	 star_step = 0  :: non_neg_integer(), step_attr = [],
	 break_lev = 0  :: non_neg_integer(),
	 break_attr = []  :: list(),
	 power = 0  :: non_neg_integer(), base_attr  :: #attr{},
	 group_attr = [], all_attr  :: #attr{},
	 skills = []  :: [non_neg_integer()],
	 break_skills = []  ::
	     [{non_neg_integer(), non_neg_integer()}],
	 set_skills = []  :: [non_neg_integer()], eqm = [],
	 hidden_skills = [], artifacts = [], fetter = [],
	 fetter_attr = [], fetter_power = 0, score_lists = [],
	 gemstones = [], awaken_count = 0, awaken_skills = [],
	 add_star = 0, dower_skill = [], holy_eqm = [],
	 use_skin = 0, end_time = 0, resonate_lev = 0,
	 resonate_break_lev = 0}).

-record(partner_skin,
	{ver = 1, id = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 ext = []  :: list()}).

-record(gemstone,
	{ver = 1, pos = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer()}).

-record(partner_gemstone,
	{ver = 1, type = 0  :: non_neg_integer(),
	 gemstones = []  :: [#gemstone{}]}).

-record(partner_field,
	{lev = 1  :: non_neg_integer(),
	 fields = []  ::
	     [{non_neg_integer(), non_neg_integer()}]}).

-record(partner_bag,
	{ver = -1  :: non_neg_integer(),
	 type = 0  :: non_neg_integer(),
	 num = 0  :: non_neg_integer(),
	 buy_num = 0  :: non_neg_integer(),
	 partner_list = []  :: [#partner{}],
	 partner_had = []  ::
	     [{non_neg_integer(), non_neg_integer(),
	       non_neg_integer()}],
	 comment_likes = []  ::
	     [{non_neg_integer(), non_neg_integer()}],
	 partner_field = []  :: #partner_field{},
	 partner_star_lev = 0  :: non_neg_integer(),
	 max_star = 0  :: non_neg_integer(),
	 partner_decomposes = []  :: non_neg_integer(),
	 partner_skins = []  :: list()}).

-record(partner_comment,
	{comment_id = 0, partner_id = 0, account = <<>>,
	 rid = 0, sid = <<>>, name = <<>>, post_time = 0,
	 msg = <<>>, like_num = 0, no_like_num = 0}).

-record(partner_comment_p,
	{comment_id = 0, name = <<>>, msg = <<>>, like_num = 0,
	 no_like_num = 0, is_like = 0}).

-record(partner_base_data,
	{bid, name, type, rare_type, init_star = 0,
	 show_star = 0, init_lev = 1, pos_type = 0,
	 camp_type = 0, break_lev = 0, recruit_type = 0,
	 skills = [], addition_skill = 0, addition_skill2 = 0,
	 skill_order = [], ai = 0, awake_items = [],
	 awake_attr = [], awake_skill = none, init_power = 0,
	 add_power = 0, leader_skill = 0, chips_num = 0,
	 chips_id = 0, hidden_skills = [], init_star5_num = 0,
	 hook_skills = [], compose_expend = [],
	 can_use_direct_item = 0, awaken_info = [], break_id = 0,
	 other_skills = [], item_id = 0}).

-record(partner_lev_data,
	{add_hp = 1000, add_atk = 1000, add_def = 1000,
	 add_speed = 1000}).

-record(partner_base_p,
	{partner_id, bid, lev, star, star_step, quality,
	 break_lev, power, skills, add_star, is_lock,
	 use_skin = 0, end_time = 0, resonate_lev = 0,
	 resonate_break_lev = 0}).

-record(group_attr,
	{atk = 0, hp_max = 0, def = 0, speed = 0}).

-file("src/proto/proto_110.erl", 16).

-file("inc/attr.hrl", 1).

-file("src/proto/proto_110.erl", 17).

-file("inc/star.hrl", 1).

-record(star,
	{ver = 1  :: non_neg_integer(),
	 set_id = 0  :: non_neg_integer(),
	 break_lev = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(), natals = []  :: list(),
	 add_attr = []  :: list(), fetter_attr = []  :: list(),
	 set_skill_id = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer()}).

-record(m_star_tower,
	{ver = 1  :: non_neg_integer(),
	 max_tower = 0  :: non_neg_integer(),
	 award_list = []  :: list()}).

-record(m_star_divination,
	{ver = 1  :: non_neg_integer(),
	 luck = 1  :: non_neg_integer(),
	 quality = 1  :: non_neg_integer(),
	 all_count = 0  :: non_neg_integer(),
	 flag = 0  :: non_neg_integer(),
	 ref_count = 0  :: non_neg_integer(),
	 day_gold_count = 0  :: non_neg_integer(),
	 day_hun_count = 0  :: non_neg_integer()}).

-record(tower_replay_data,
	{type = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(), sid = 0  :: binary(),
	 name = <<>>  :: binary(),
	 face_id = 0  :: non_neg_integer(),
	 time = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 repaly_id = 0  :: non_neg_integer(),
	 face_update_time = 0, face_file = <<>>}).

-record(star_tower_replay,
	{tower = 0  :: non_neg_integer(),
	 replays = []  :: [#tower_replay_data{}]}).

-record(m_star,
	{ver = 1  :: non_neg_integer(),
	 star_list = []  :: [#star{}],
	 fetter_list = []  :: list(), all_attr = []  :: list()}).

-file("src/proto/proto_110.erl", 18).

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

-file("src/proto/proto_110.erl", 19).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(11000, cli, {}) -> {ok, <<2:32, 11000:16>>};
pack(11000, srv,
     {V0_sort_type, V0_num, V0_buy_num, V0_partners}) ->
    D_a_t_a = <<V0_sort_type:8, V0_num:32, V0_buy_num:8,
		(length(V0_partners)):16,
		(list_to_binary([<<V1_partner_id:32, V1_bid:32,
				   V1_lev:16, V1_star:8, (length(V1_skills)):16,
				   (list_to_binary([<<V2_pos:8,
						      V2_skill_bid:32>>
						    || {V2_pos, V2_skill_bid}
							   <- V1_skills]))/binary,
				   V1_break_lev:8, V1_power:32,
				   (length(V1_is_lock)):16,
				   (list_to_binary([<<V2_lock_type:32,
						      V2_is_lock:8>>
						    || {V2_lock_type,
							V2_is_lock}
							   <- V1_is_lock]))/binary,
				   V1_use_skin:32, V1_end_time:32,
				   V1_resonate_lev:32, V1_resonate_break_lev:32,
				   V1_atk:32, V1_def_p:32, V1_def_s:32,
				   V1_hp:32, V1_speed:32, V1_hit_rate:32,
				   V1_dodge_rate:32, V1_crit_rate:32,
				   V1_crit_ratio:32, V1_hit_magic:32,
				   V1_dodge_magic:32, V1_def:32, V1_atk2:32,
				   V1_hp2:32, V1_def2:32, V1_speed2:32,
				   (length(V1_eqms)):16,
				   (list_to_binary([<<V2_id:32, V2_base_id:32,
						      V2_type:32>>
						    || #item{id = V2_id,
							     base_id =
								 V2_base_id,
							     type = V2_type}
							   <- V1_eqms]))/binary,
				   (length(V1_artifacts)):16,
				   (list_to_binary([<<V2_artifact_pos:8,
						      V2_id:32, V2_base_id:32,
						      V2_enchant:32,
						      (length(V2_attr)):16,
						      (list_to_binary([<<V3_attr_id:32,
									 V3_attr_val:32>>
								       || {V3_attr_id,
									   V3_attr_val}
									      <- V2_attr]))/binary,
						      (length(V2_extra_attr)):16,
						      (list_to_binary([<<V3_attr_id:32,
									 V3_attr_val:32>>
								       || {V3_attr_id,
									   V3_attr_val}
									      <- V2_extra_attr]))/binary,
						      (length(V2_extra)):16,
						      (list_to_binary([<<V3_extra_k:32,
									 V3_extra_v:32>>
								       || {V3_extra_k,
									   V3_extra_v}
									      <- V2_extra]))/binary>>
						    || {V2_artifact_pos,
							#item{id = V2_id,
							      base_id =
								  V2_base_id,
							      enchant =
								  V2_enchant,
							      attr = V2_attr,
							      extra_attr =
								  V2_extra_attr,
							      extra = V2_extra}}
							   <- V1_artifacts]))/binary,
				   (length(V1_dower_skill)):16,
				   (list_to_binary([<<V2_pos:8, V2_skill_id:32>>
						    || {V2_pos, V2_skill_id}
							   <- V1_dower_skill]))/binary>>
				 || {#partner_base_p{partner_id = V1_partner_id,
						     bid = V1_bid, lev = V1_lev,
						     star = V1_star,
						     skills = V1_skills,
						     break_lev = V1_break_lev,
						     power = V1_power,
						     is_lock = V1_is_lock,
						     use_skin = V1_use_skin,
						     end_time = V1_end_time,
						     resonate_lev =
							 V1_resonate_lev,
						     resonate_break_lev =
							 V1_resonate_break_lev},
				     #attr{atk = V1_atk, def_p = V1_def_p,
					   def_s = V1_def_s, hp_max = V1_hp,
					   speed = V1_speed,
					   hit_rate = V1_hit_rate,
					   dodge_rate = V1_dodge_rate,
					   crit_rate = V1_crit_rate,
					   crit_ratio = V1_crit_ratio,
					   hit_magic = V1_hit_magic,
					   dodge_magic = V1_dodge_magic,
					   def = V1_def},
				     #group_attr{atk = V1_atk2, hp_max = V1_hp2,
						 def = V1_def2,
						 speed = V1_speed2},
				     V1_eqms, V1_artifacts, V1_dower_skill}
					<- V0_partners]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11000:16,
       D_a_t_a/binary>>};
pack(11001, cli, {}) -> {ok, <<2:32, 11001:16>>};
pack(11001, srv, {V0_partners}) ->
    D_a_t_a = <<(length(V0_partners)):16,
		(list_to_binary([<<V1_partner_id:32, V1_bid:32,
				   V1_lev:16, V1_star:8, (length(V1_skills)):16,
				   (list_to_binary([<<V2_pos:8,
						      V2_skill_bid:32>>
						    || {V2_pos, V2_skill_bid}
							   <- V1_skills]))/binary,
				   V1_break_lev:8, V1_power:32,
				   (length(V1_is_lock)):16,
				   (list_to_binary([<<V2_lock_type:32,
						      V2_is_lock:8>>
						    || {V2_lock_type,
							V2_is_lock}
							   <- V1_is_lock]))/binary,
				   V1_use_skin:32, V1_end_time:32,
				   V1_resonate_lev:32, V1_resonate_break_lev:32,
				   V1_atk:32, V1_def_p:32, V1_def_s:32,
				   V1_hp:32, V1_speed:32, V1_hit_rate:32,
				   V1_dodge_rate:32, V1_crit_rate:32,
				   V1_crit_ratio:32, V1_hit_magic:32,
				   V1_dodge_magic:32, V1_def:32, V1_atk2:32,
				   V1_hp2:32, V1_def2:32, V1_speed2:32,
				   (length(V1_eqms)):16,
				   (list_to_binary([<<V2_id:32, V2_base_id:32,
						      V2_type:32>>
						    || #item{id = V2_id,
							     base_id =
								 V2_base_id,
							     type = V2_type}
							   <- V1_eqms]))/binary,
				   (length(V1_artifacts)):16,
				   (list_to_binary([<<V2_artifact_pos:8,
						      V2_id:32, V2_base_id:32,
						      V2_enchant:32,
						      (length(V2_attr)):16,
						      (list_to_binary([<<V3_attr_id:32,
									 V3_attr_val:32>>
								       || {V3_attr_id,
									   V3_attr_val}
									      <- V2_attr]))/binary,
						      (length(V2_extra_attr)):16,
						      (list_to_binary([<<V3_attr_id:32,
									 V3_attr_val:32>>
								       || {V3_attr_id,
									   V3_attr_val}
									      <- V2_extra_attr]))/binary,
						      (length(V2_extra)):16,
						      (list_to_binary([<<V3_extra_k:32,
									 V3_extra_v:32>>
								       || {V3_extra_k,
									   V3_extra_v}
									      <- V2_extra]))/binary>>
						    || {V2_artifact_pos,
							#item{id = V2_id,
							      base_id =
								  V2_base_id,
							      enchant =
								  V2_enchant,
							      attr = V2_attr,
							      extra_attr =
								  V2_extra_attr,
							      extra = V2_extra}}
							   <- V1_artifacts]))/binary,
				   (length(V1_dower_skill)):16,
				   (list_to_binary([<<V2_pos:8, V2_skill_id:32>>
						    || {V2_pos, V2_skill_id}
							   <- V1_dower_skill]))/binary>>
				 || {#partner_base_p{partner_id = V1_partner_id,
						     bid = V1_bid, lev = V1_lev,
						     star = V1_star,
						     skills = V1_skills,
						     break_lev = V1_break_lev,
						     power = V1_power,
						     is_lock = V1_is_lock,
						     use_skin = V1_use_skin,
						     end_time = V1_end_time,
						     resonate_lev =
							 V1_resonate_lev,
						     resonate_break_lev =
							 V1_resonate_break_lev},
				     #attr{atk = V1_atk, def_p = V1_def_p,
					   def_s = V1_def_s, hp_max = V1_hp,
					   speed = V1_speed,
					   hit_rate = V1_hit_rate,
					   dodge_rate = V1_dodge_rate,
					   crit_rate = V1_crit_rate,
					   crit_ratio = V1_crit_ratio,
					   hit_magic = V1_hit_magic,
					   dodge_magic = V1_dodge_magic,
					   def = V1_def},
				     #group_attr{atk = V1_atk2, hp_max = V1_hp2,
						 def = V1_def2,
						 speed = V1_speed2},
				     V1_eqms, V1_artifacts, V1_dower_skill}
					<- V0_partners]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11001:16,
       D_a_t_a/binary>>};
pack(11002, cli, {}) -> {ok, <<2:32, 11002:16>>};
pack(11002, srv,
     {#partner_base_p{partner_id = V0_partner_id,
		      bid = V0_bid, lev = V0_lev, star = V0_star,
		      skills = V0_skills, break_lev = V0_break_lev,
		      power = V0_power, is_lock = V0_is_lock,
		      use_skin = V0_use_skin, end_time = V0_end_time,
		      resonate_lev = V0_resonate_lev,
		      resonate_break_lev = V0_resonate_break_lev},
      #attr{atk = V0_atk, def_p = V0_def_p, def_s = V0_def_s,
	    hp_max = V0_hp, speed = V0_speed,
	    hit_rate = V0_hit_rate, dodge_rate = V0_dodge_rate,
	    crit_rate = V0_crit_rate, crit_ratio = V0_crit_ratio,
	    hit_magic = V0_hit_magic, dodge_magic = V0_dodge_magic,
	    def = V0_def},
      #group_attr{atk = V0_atk2, hp_max = V0_hp2,
		  def = V0_def2, speed = V0_speed2}}) ->
    D_a_t_a = <<V0_partner_id:32, V0_bid:32, V0_lev:16,
		V0_star:8, (length(V0_skills)):16,
		(list_to_binary([<<V1_pos:8, V1_skill_bid:32>>
				 || {V1_pos, V1_skill_bid}
					<- V0_skills]))/binary,
		V0_break_lev:8, V0_power:32, (length(V0_is_lock)):16,
		(list_to_binary([<<V1_lock_type:32, V1_is_lock:8>>
				 || {V1_lock_type, V1_is_lock}
					<- V0_is_lock]))/binary,
		V0_use_skin:32, V0_end_time:32, V0_resonate_lev:32,
		V0_resonate_break_lev:32, V0_atk:32, V0_def_p:32,
		V0_def_s:32, V0_hp:32, V0_speed:32, V0_hit_rate:32,
		V0_dodge_rate:32, V0_crit_rate:32, V0_crit_ratio:32,
		V0_hit_magic:32, V0_dodge_magic:32, V0_def:32,
		V0_atk2:32, V0_hp2:32, V0_def2:32, V0_speed2:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11002:16,
       D_a_t_a/binary>>};
pack(11003, cli, {V0_partner_id}) ->
    D_a_t_a = <<V0_partner_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11003:16,
       D_a_t_a/binary>>};
pack(11003, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11003:16,
       D_a_t_a/binary>>};
pack(11004, cli, {V0_partner_id}) ->
    D_a_t_a = <<V0_partner_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11004:16,
       D_a_t_a/binary>>};
pack(11004, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11004:16,
       D_a_t_a/binary>>};
pack(11005, cli,
     {V0_partner_id, V0_expend1, V0_expend2,
      V0_item_expend}) ->
    D_a_t_a = <<V0_partner_id:32, (length(V0_expend1)):16,
		(list_to_binary([<<V1_partner_id:32>>
				 || V1_partner_id <- V0_expend1]))/binary,
		(length(V0_expend2)):16,
		(list_to_binary([<<V1_partner_id:32>>
				 || V1_partner_id <- V0_expend2]))/binary,
		(length(V0_item_expend)):16,
		(list_to_binary([<<V1_item_id:32, V1_num:32>>
				 || {V1_item_id, V1_num}
					<- V0_item_expend]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11005:16,
       D_a_t_a/binary>>};
pack(11005, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11005:16,
       D_a_t_a/binary>>};
pack(11006, cli, {}) -> {ok, <<2:32, 11006:16>>};
pack(11006, srv, {V0_expend2}) ->
    D_a_t_a = <<(length(V0_expend2)):16,
		(list_to_binary([<<V1_partner_id:32>>
				 || V1_partner_id <- V0_expend2]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11006:16,
       D_a_t_a/binary>>};
pack(11007, cli, {}) -> {ok, <<2:32, 11007:16>>};
pack(11007, srv, {V0_ref_partners}) ->
    D_a_t_a = <<(length(V0_ref_partners)):16,
		(list_to_binary([<<V1_partner_id:32, V1_power:32,
				   V1_atk:32, V1_def_p:32, V1_def_s:32,
				   V1_hp:32, V1_speed:32, V1_hit_rate:32,
				   V1_dodge_rate:32, V1_crit_rate:32,
				   V1_crit_ratio:32, V1_hit_magic:32,
				   V1_dodge_magic:32, V1_def:32>>
				 || {V1_partner_id, V1_power,
				     #attr{atk = V1_atk, def_p = V1_def_p,
					   def_s = V1_def_s, hp_max = V1_hp,
					   speed = V1_speed,
					   hit_rate = V1_hit_rate,
					   dodge_rate = V1_dodge_rate,
					   crit_rate = V1_crit_rate,
					   crit_ratio = V1_crit_ratio,
					   hit_magic = V1_hit_magic,
					   dodge_magic = V1_dodge_magic,
					   def = V1_def}}
					<- V0_ref_partners]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11007:16,
       D_a_t_a/binary>>};
pack(11008, cli, {V0_bid, V0_num}) ->
    D_a_t_a = <<V0_bid:32, V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11008:16,
       D_a_t_a/binary>>};
pack(11008, srv, {V0_result, V0_msg, V0_partners}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_partners)):16,
		(list_to_binary([<<V1_partner_bid:32>>
				 || V1_partner_bid <- V0_partners]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11008:16,
       D_a_t_a/binary>>};
pack(11009, cli, {}) -> {ok, <<2:32, 11009:16>>};
pack(11009, srv,
     {V0_result, V0_msg, V0_num, V0_buy_num}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_num:32,
		V0_buy_num:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11009:16,
       D_a_t_a/binary>>};
pack(11010, cli, {V0_partner_id, V0_item_id}) ->
    D_a_t_a = <<V0_partner_id:32, V0_item_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11010:16,
       D_a_t_a/binary>>};
pack(11010, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11010:16,
       D_a_t_a/binary>>};
pack(11011, cli, {V0_partner_id, V0_pos_id}) ->
    D_a_t_a = <<V0_partner_id:32, V0_pos_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11011:16,
       D_a_t_a/binary>>};
pack(11011, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11011:16,
       D_a_t_a/binary>>};
pack(11012, cli, {}) -> {ok, <<2:32, 11012:16>>};
pack(11012, srv,
     {V0_partner_id, V0_power,
      #attr{atk = V0_atk, def_p = V0_def_p, def_s = V0_def_s,
	    hp_max = V0_hp, speed = V0_speed,
	    hit_rate = V0_hit_rate, dodge_rate = V0_dodge_rate,
	    crit_rate = V0_crit_rate, crit_ratio = V0_crit_ratio,
	    hit_magic = V0_hit_magic, dodge_magic = V0_dodge_magic,
	    def = V0_def},
      V0_eqms}) ->
    D_a_t_a = <<V0_partner_id:32, V0_power:32, V0_atk:32,
		V0_def_p:32, V0_def_s:32, V0_hp:32, V0_speed:32,
		V0_hit_rate:32, V0_dodge_rate:32, V0_crit_rate:32,
		V0_crit_ratio:32, V0_hit_magic:32, V0_dodge_magic:32,
		V0_def:32, (length(V0_eqms)):16,
		(list_to_binary([<<V1_id:32, V1_base_id:32, V1_type:32>>
				 || #item{id = V1_id, base_id = V1_base_id,
					  type = V1_type}
					<- V0_eqms]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11012:16,
       D_a_t_a/binary>>};
pack(11015, cli, {V0_partner_id, V0_type}) ->
    D_a_t_a = <<V0_partner_id:32, V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11015:16,
       D_a_t_a/binary>>};
pack(11015, srv,
     {V0_result, V0_msg, V0_partner_id, V0_type}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_partner_id:32, V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11015:16,
       D_a_t_a/binary>>};
pack(11016, cli, {V0_partner_id}) ->
    D_a_t_a = <<V0_partner_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11016:16,
       D_a_t_a/binary>>};
pack(11016, srv,
     {#attr{atk = V0_atk, def_p = V0_def_p, def_s = V0_def_s,
	    hp_max = V0_hp, speed = V0_speed,
	    hit_rate = V0_hit_rate, dodge_rate = V0_dodge_rate,
	    crit_rate = V0_crit_rate, crit_ratio = V0_crit_ratio,
	    hit_magic = V0_hit_magic, dodge_magic = V0_dodge_magic,
	    def = V0_def}}) ->
    D_a_t_a = <<V0_atk:32, V0_def_p:32, V0_def_s:32,
		V0_hp:32, V0_speed:32, V0_hit_rate:32, V0_dodge_rate:32,
		V0_crit_rate:32, V0_crit_ratio:32, V0_hit_magic:32,
		V0_dodge_magic:32, V0_def:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11016:16,
       D_a_t_a/binary>>};
pack(11017, cli, {}) -> {ok, <<2:32, 11017:16>>};
pack(11017, srv, {V0_num}) ->
    D_a_t_a = <<V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11017:16,
       D_a_t_a/binary>>};
pack(11019, cli, {V0_partner_id, V0_skin_id}) ->
    D_a_t_a = <<V0_partner_id:32, V0_skin_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11019:16,
       D_a_t_a/binary>>};
pack(11019, srv, {V0_result, V0_msg, V0_partner_id}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_partner_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11019:16,
       D_a_t_a/binary>>};
pack(11020, cli, {}) -> {ok, <<2:32, 11020:16>>};
pack(11020, srv, {V0_partner_skins}) ->
    D_a_t_a = <<(length(V0_partner_skins)):16,
		(list_to_binary([<<V1_id:32, V1_end_time:32>>
				 || #partner_skin{id = V1_id,
						  end_time = V1_end_time}
					<- V0_partner_skins]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11020:16,
       D_a_t_a/binary>>};
pack(11025, cli, {}) -> {ok, <<2:32, 11025:16>>};
pack(11025, srv,
     {V0_sort_type, V0_num, V0_buy_num, V0_partners}) ->
    D_a_t_a = <<V0_sort_type:8, V0_num:32, V0_buy_num:8,
		(length(V0_partners)):16,
		(list_to_binary([<<V1_partner_id:32, V1_bid:32,
				   V1_lev:16, V1_star:8, (length(V1_skills)):16,
				   (list_to_binary([<<V2_pos:8,
						      V2_skill_bid:32>>
						    || {V2_pos, V2_skill_bid}
							   <- V1_skills]))/binary,
				   V1_break_lev:8, V1_power:32,
				   (length(V1_is_lock)):16,
				   (list_to_binary([<<V2_lock_type:32,
						      V2_is_lock:8>>
						    || {V2_lock_type,
							V2_is_lock}
							   <- V1_is_lock]))/binary,
				   V1_use_skin:32, V1_end_time:32,
				   V1_resonate_lev:32,
				   V1_resonate_break_lev:32>>
				 || #partner_base_p{partner_id = V1_partner_id,
						    bid = V1_bid, lev = V1_lev,
						    star = V1_star,
						    skills = V1_skills,
						    break_lev = V1_break_lev,
						    power = V1_power,
						    is_lock = V1_is_lock,
						    use_skin = V1_use_skin,
						    end_time = V1_end_time,
						    resonate_lev =
							V1_resonate_lev,
						    resonate_break_lev =
							V1_resonate_break_lev}
					<- V0_partners]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11025:16,
       D_a_t_a/binary>>};
pack(11026, cli, {V0_partner_ids}) ->
    D_a_t_a = <<(length(V0_partner_ids)):16,
		(list_to_binary([<<V1_partner_id:32>>
				 || V1_partner_id <- V0_partner_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11026:16,
       D_a_t_a/binary>>};
pack(11026, srv, {V0_partners}) ->
    D_a_t_a = <<(length(V0_partners)):16,
		(list_to_binary([<<V1_partner_id:32, V1_atk:32,
				   V1_def_p:32, V1_def_s:32, V1_hp:32,
				   V1_speed:32, V1_hit_rate:32,
				   V1_dodge_rate:32, V1_crit_rate:32,
				   V1_crit_ratio:32, V1_hit_magic:32,
				   V1_dodge_magic:32, V1_def:32,
				   (length(V1_eqms)):16,
				   (list_to_binary([<<V2_id:32, V2_base_id:32,
						      V2_type:32>>
						    || #item{id = V2_id,
							     base_id =
								 V2_base_id,
							     type = V2_type}
							   <- V1_eqms]))/binary,
				   (length(V1_artifacts)):16,
				   (list_to_binary([<<V2_artifact_pos:8,
						      V2_id:32, V2_base_id:32,
						      V2_enchant:32,
						      (length(V2_attr)):16,
						      (list_to_binary([<<V3_attr_id:32,
									 V3_attr_val:32>>
								       || {V3_attr_id,
									   V3_attr_val}
									      <- V2_attr]))/binary,
						      (length(V2_extra_attr)):16,
						      (list_to_binary([<<V3_attr_id:32,
									 V3_attr_val:32>>
								       || {V3_attr_id,
									   V3_attr_val}
									      <- V2_extra_attr]))/binary,
						      (length(V2_extra)):16,
						      (list_to_binary([<<V3_extra_k:32,
									 V3_extra_v:32>>
								       || {V3_extra_k,
									   V3_extra_v}
									      <- V2_extra]))/binary>>
						    || {V2_artifact_pos,
							#item{id = V2_id,
							      base_id =
								  V2_base_id,
							      enchant =
								  V2_enchant,
							      attr = V2_attr,
							      extra_attr =
								  V2_extra_attr,
							      extra = V2_extra}}
							   <- V1_artifacts]))/binary>>
				 || {V1_partner_id,
				     #attr{atk = V1_atk, def_p = V1_def_p,
					   def_s = V1_def_s, hp_max = V1_hp,
					   speed = V1_speed,
					   hit_rate = V1_hit_rate,
					   dodge_rate = V1_dodge_rate,
					   crit_rate = V1_crit_rate,
					   crit_ratio = V1_crit_ratio,
					   hit_magic = V1_hit_magic,
					   dodge_magic = V1_dodge_magic,
					   def = V1_def},
				     V1_eqms, V1_artifacts}
					<- V0_partners]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11026:16,
       D_a_t_a/binary>>};
pack(11030, cli,
     {V0_partner_id, V0_pos_id, V0_artifact_id, V0_type}) ->
    D_a_t_a = <<V0_partner_id:32, V0_pos_id:8,
		V0_artifact_id:32, V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11030:16,
       D_a_t_a/binary>>};
pack(11030, srv, {V0_result, V0_msg, V0_partner_id}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_partner_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11030:16,
       D_a_t_a/binary>>};
pack(11031, cli, {}) -> {ok, <<2:32, 11031:16>>};
pack(11031, srv,
     {V0_partner_id, V0_power,
      #attr{atk = V0_atk, def_p = V0_def_p, def_s = V0_def_s,
	    hp_max = V0_hp, speed = V0_speed,
	    hit_rate = V0_hit_rate, dodge_rate = V0_dodge_rate,
	    crit_rate = V0_crit_rate, crit_ratio = V0_crit_ratio,
	    hit_magic = V0_hit_magic, dodge_magic = V0_dodge_magic,
	    def = V0_def},
      V0_artifacts}) ->
    D_a_t_a = <<V0_partner_id:32, V0_power:32, V0_atk:32,
		V0_def_p:32, V0_def_s:32, V0_hp:32, V0_speed:32,
		V0_hit_rate:32, V0_dodge_rate:32, V0_crit_rate:32,
		V0_crit_ratio:32, V0_hit_magic:32, V0_dodge_magic:32,
		V0_def:32, (length(V0_artifacts)):16,
		(list_to_binary([<<V1_artifact_pos:8, V1_id:32,
				   V1_base_id:32, V1_enchant:32,
				   (length(V1_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_attr]))/binary,
				   (length(V1_extra_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_extra_attr]))/binary,
				   (length(V1_extra)):16,
				   (list_to_binary([<<V2_extra_k:32,
						      V2_extra_v:32>>
						    || {V2_extra_k, V2_extra_v}
							   <- V1_extra]))/binary>>
				 || {V1_artifact_pos,
				     #item{id = V1_id, base_id = V1_base_id,
					   enchant = V1_enchant, attr = V1_attr,
					   extra_attr = V1_extra_attr,
					   extra = V1_extra}}
					<- V0_artifacts]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11031:16,
       D_a_t_a/binary>>};
pack(11032, cli,
     {V0_partner_id, V0_artifact_id, V0_expends}) ->
    D_a_t_a = <<V0_partner_id:32, V0_artifact_id:32,
		(length(V0_expends)):16,
		(list_to_binary([<<V1_artifact_id:32>>
				 || V1_artifact_id <- V0_expends]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11032:16,
       D_a_t_a/binary>>};
pack(11032, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11032:16,
       D_a_t_a/binary>>};
pack(11033, cli,
     {V0_partner_id, V0_artifact_id, V0_skills,
      V0_luck_item}) ->
    D_a_t_a = <<V0_partner_id:32, V0_artifact_id:32,
		(length(V0_skills)):16,
		(list_to_binary([<<V1_skill_id:32>>
				 || V1_skill_id <- V0_skills]))/binary,
		V0_luck_item:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11033:16,
       D_a_t_a/binary>>};
pack(11033, srv, {V0_result, V0_msg, V0_luck_item}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_luck_item:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11033:16,
       D_a_t_a/binary>>};
pack(11034, cli,
     {V0_partner_id, V0_artifact_id, V0_type}) ->
    D_a_t_a = <<V0_partner_id:32, V0_artifact_id:32,
		V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11034:16,
       D_a_t_a/binary>>};
pack(11034, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11034:16,
       D_a_t_a/binary>>};
pack(11035, cli, {V0_artifact_id}) ->
    D_a_t_a = <<V0_artifact_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11035:16,
       D_a_t_a/binary>>};
pack(11035, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11035:16,
       D_a_t_a/binary>>};
pack(11036, cli, {V0_item_id, V0_expends}) ->
    D_a_t_a = <<V0_item_id:32, (length(V0_expends)):16,
		(list_to_binary([<<V1_artifact_id:32>>
				 || V1_artifact_id <- V0_expends]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11036:16,
       D_a_t_a/binary>>};
pack(11036, srv, {V0_result, V0_msg, V0_flag}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11036:16,
       D_a_t_a/binary>>};
pack(11037, cli, {}) -> {ok, <<2:32, 11037:16>>};
pack(11037, srv, {V0_lucky}) ->
    D_a_t_a = <<V0_lucky:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11037:16,
       D_a_t_a/binary>>};
pack(11038, cli, {}) -> {ok, <<2:32, 11038:16>>};
pack(11038, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11038:16,
       D_a_t_a/binary>>};
pack(11040, cli, {}) -> {ok, <<2:32, 11040:16>>};
pack(11040, srv,
     {V0_partners, V0_all_star, V0_lev,
      V0_decompose_partners}) ->
    D_a_t_a = <<(length(V0_partners)):16,
		(list_to_binary([<<V1_partner_id:32, V1_max_star:8>>
				 || {V1_partner_id, V1_max_star}
					<- V0_partners]))/binary,
		V0_all_star:32, V0_lev:32,
		(length(V0_decompose_partners)):16,
		(list_to_binary([<<V1_partner_id:32>>
				 || V1_partner_id
					<- V0_decompose_partners]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11040:16,
       D_a_t_a/binary>>};
pack(11041, cli, {V0_partner_id, V0_start, V0_num}) ->
    D_a_t_a = <<V0_partner_id:32, V0_start:8, V0_num:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11041:16,
       D_a_t_a/binary>>};
pack(11041, srv,
     {V0_like, V0_like_num, V0_partner_comments}) ->
    D_a_t_a = <<V0_like:8, V0_like_num:32,
		(length(V0_partner_comments)):16,
		(list_to_binary([<<V1_comment_id:32,
				   (protocol:pack(string, V1_name))/binary,
				   (protocol:pack(string, V1_msg))/binary,
				   V1_like_num:32, V1_no_like_num:32,
				   V1_is_like:8>>
				 || #partner_comment_p{comment_id =
							   V1_comment_id,
						       name = V1_name,
						       msg = V1_msg,
						       like_num = V1_like_num,
						       no_like_num =
							   V1_no_like_num,
						       is_like = V1_is_like}
					<- V0_partner_comments]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11041:16,
       D_a_t_a/binary>>};
pack(11042, cli, {V0_partner_id}) ->
    D_a_t_a = <<V0_partner_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11042:16,
       D_a_t_a/binary>>};
pack(11042, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11042:16,
       D_a_t_a/binary>>};
pack(11043, cli, {V0_partner_id, V0_msg}) ->
    D_a_t_a = <<V0_partner_id:32,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11043:16,
       D_a_t_a/binary>>};
pack(11043, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11043:16,
       D_a_t_a/binary>>};
pack(11044, cli,
     {V0_partner_id, V0_comment_id, V0_type}) ->
    D_a_t_a = <<V0_partner_id:32, V0_comment_id:32,
		V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11044:16,
       D_a_t_a/binary>>};
pack(11044, srv, {V0_result, V0_msg, V0_type}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11044:16,
       D_a_t_a/binary>>};
pack(11045, cli, {V0_partner_id}) ->
    D_a_t_a = <<V0_partner_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11045:16,
       D_a_t_a/binary>>};
pack(11045, srv, {V0_result, V0_msg, V0_partner_id}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_partner_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11045:16,
       D_a_t_a/binary>>};
pack(11046, cli, {}) -> {ok, <<2:32, 11046:16>>};
pack(11046, srv, {V0_old_star, V0_new_star}) ->
    D_a_t_a = <<V0_old_star:32, V0_new_star:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11046:16,
       D_a_t_a/binary>>};
pack(11047, cli, {}) -> {ok, <<2:32, 11047:16>>};
pack(11047, srv, {V0_result, V0_msg, V0_lev}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_lev:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11047:16,
       D_a_t_a/binary>>};
pack(11048, cli, {}) -> {ok, <<2:32, 11048:16>>};
pack(11048, srv, {V0_artifact_ref_count}) ->
    D_a_t_a = <<(length(V0_artifact_ref_count)):16,
		(list_to_binary([<<V1_type:8, V1_current:32,
				   V1_limit:32>>
				 || {V1_type, V1_current, V1_limit}
					<- V0_artifact_ref_count]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11048:16,
       D_a_t_a/binary>>};
pack(11050, cli, {}) -> {ok, <<2:32, 11050:16>>};
pack(11050, srv,
     {V0_result, V0_msg, V0_lev, V0_fields}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_lev:32,
		(length(V0_fields)):16,
		(list_to_binary([<<V1_pos:32, V1_partner_id:32>>
				 || {V1_pos, V1_partner_id}
					<- V0_fields]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11050:16,
       D_a_t_a/binary>>};
pack(11051, cli, {V0_fields}) ->
    D_a_t_a = <<(length(V0_fields)):16,
		(list_to_binary([<<V1_pos:32, V1_partner_id:32>>
				 || {V1_pos, V1_partner_id}
					<- V0_fields]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11051:16,
       D_a_t_a/binary>>};
pack(11051, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11051:16,
       D_a_t_a/binary>>};
pack(11052, cli, {}) -> {ok, <<2:32, 11052:16>>};
pack(11052, srv, {V0_result, V0_msg, V0_lev}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_lev:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11052:16,
       D_a_t_a/binary>>};
pack(11053, cli, {V0_pos}) ->
    D_a_t_a = <<V0_pos:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11053:16,
       D_a_t_a/binary>>};
pack(11053, srv, {V0_result, V0_msg, V0_pos}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_pos:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11053:16,
       D_a_t_a/binary>>};
pack(11055, cli, {V0_is_point}) ->
    D_a_t_a = <<V0_is_point:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11055:16,
       D_a_t_a/binary>>};
pack(11055, srv, {}) -> {ok, <<2:32, 11055:16>>};
pack(11056, cli, {}) -> {ok, <<2:32, 11056:16>>};
pack(11056, srv, {V0_is_point}) ->
    D_a_t_a = <<V0_is_point:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11056:16,
       D_a_t_a/binary>>};
pack(11060, cli, {V0_partner_id, V0_channel}) ->
    D_a_t_a = <<V0_partner_id:32, V0_channel:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11060:16,
       D_a_t_a/binary>>};
pack(11060, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11060:16,
       D_a_t_a/binary>>};
pack(11061, cli,
     {{V0_r_rid, V0_r_srvid}, V0_partner_id}) ->
    D_a_t_a = <<V0_r_rid:32,
		(protocol:pack(string, V0_r_srvid))/binary,
		V0_partner_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11061:16,
       D_a_t_a/binary>>};
pack(11061, srv,
     {#partner_base_p{partner_id = V0_partner_id,
		      bid = V0_bid, lev = V0_lev, star = V0_star,
		      skills = V0_skills, break_lev = V0_break_lev,
		      power = V0_power, is_lock = V0_is_lock,
		      use_skin = V0_use_skin, end_time = V0_end_time,
		      resonate_lev = V0_resonate_lev,
		      resonate_break_lev = V0_resonate_break_lev},
      #attr{atk = V0_atk, def_p = V0_def_p, def_s = V0_def_s,
	    hp_max = V0_hp, speed = V0_speed,
	    hit_rate = V0_hit_rate, dodge_rate = V0_dodge_rate,
	    crit_rate = V0_crit_rate, crit_ratio = V0_crit_ratio,
	    hit_magic = V0_hit_magic, dodge_magic = V0_dodge_magic,
	    dam = V0_dam, res = V0_res, cure = V0_cure,
	    be_cure = V0_be_cure, tenacity = V0_tenacity,
	    def = V0_def, dam_p = V0_dam_p, dam_s = V0_dam_s,
	    res_p = V0_res_p, res_s = V0_res_s},
      #group_attr{atk = V0_atk2, hp_max = V0_hp2,
		  def = V0_def2, speed = V0_speed2},
      V0_eqms, V0_artifacts, V0_dower_skill, V0_ext_data,
      V0_holy_eqm, {V0_r_rid, V0_r_srvid}}) ->
    D_a_t_a = <<V0_partner_id:32, V0_bid:32, V0_lev:16,
		V0_star:8, (length(V0_skills)):16,
		(list_to_binary([<<V1_pos:8, V1_skill_bid:32>>
				 || {V1_pos, V1_skill_bid}
					<- V0_skills]))/binary,
		V0_break_lev:8, V0_power:32, (length(V0_is_lock)):16,
		(list_to_binary([<<V1_lock_type:32, V1_is_lock:8>>
				 || {V1_lock_type, V1_is_lock}
					<- V0_is_lock]))/binary,
		V0_use_skin:32, V0_end_time:32, V0_resonate_lev:32,
		V0_resonate_break_lev:32, V0_atk:32, V0_def_p:32,
		V0_def_s:32, V0_hp:32, V0_speed:32, V0_hit_rate:32,
		V0_dodge_rate:32, V0_crit_rate:32, V0_crit_ratio:32,
		V0_hit_magic:32, V0_dodge_magic:32, V0_dam:32,
		V0_res:32, V0_cure:32, V0_be_cure:32, V0_tenacity:32,
		V0_def:32, V0_dam_p:32, V0_dam_s:32, V0_res_p:32,
		V0_res_s:32, V0_atk2:32, V0_hp2:32, V0_def2:32,
		V0_speed2:32, (length(V0_eqms)):16,
		(list_to_binary([<<V1_id:32, V1_base_id:32, V1_type:32>>
				 || #item{id = V1_id, base_id = V1_base_id,
					  type = V1_type}
					<- V0_eqms]))/binary,
		(length(V0_artifacts)):16,
		(list_to_binary([<<V1_artifact_pos:8, V1_id:32,
				   V1_base_id:32, V1_enchant:32,
				   (length(V1_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_attr]))/binary,
				   (length(V1_extra_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_extra_attr]))/binary,
				   (length(V1_extra)):16,
				   (list_to_binary([<<V2_extra_k:32,
						      V2_extra_v:32>>
						    || {V2_extra_k, V2_extra_v}
							   <- V1_extra]))/binary>>
				 || {V1_artifact_pos,
				     #item{id = V1_id, base_id = V1_base_id,
					   enchant = V1_enchant, attr = V1_attr,
					   extra_attr = V1_extra_attr,
					   extra = V1_extra}}
					<- V0_artifacts]))/binary,
		(length(V0_dower_skill)):16,
		(list_to_binary([<<V1_pos:8, V1_skill_id:32>>
				 || {V1_pos, V1_skill_id}
					<- V0_dower_skill]))/binary,
		(length(V0_ext_data)):16,
		(list_to_binary([<<V1_id:32, V1_val:32>>
				 || {V1_id, V1_val} <- V0_ext_data]))/binary,
		(length(V0_holy_eqm)):16,
		(list_to_binary([<<V1_id:32, V1_base_id:32,
				   (length(V1_main_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_main_attr]))/binary,
				   (length(V1_holy_eqm_attr)):16,
				   (list_to_binary([<<V2_pos:8, V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_pos, V2_attr_id,
							V2_attr_val}
							   <- V1_holy_eqm_attr]))/binary>>
				 || #item{id = V1_id, base_id = V1_base_id,
					  main_attr = V1_main_attr,
					  holy_eqm_attr = V1_holy_eqm_attr}
					<- V0_holy_eqm]))/binary,
		V0_r_rid:32,
		(protocol:pack(string, V0_r_srvid))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11061:16,
       D_a_t_a/binary>>};
pack(11062, cli, {V0_id, V0_srv_id}) ->
    D_a_t_a = <<V0_id:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11062:16,
       D_a_t_a/binary>>};
pack(11062, srv,
     {#partner_base_p{partner_id = V0_partner_id,
		      bid = V0_bid, lev = V0_lev, star = V0_star,
		      skills = V0_skills, break_lev = V0_break_lev,
		      power = V0_power, is_lock = V0_is_lock,
		      use_skin = V0_use_skin, end_time = V0_end_time,
		      resonate_lev = V0_resonate_lev,
		      resonate_break_lev = V0_resonate_break_lev},
      #attr{atk = V0_atk, def_p = V0_def_p, def_s = V0_def_s,
	    hp_max = V0_hp, speed = V0_speed,
	    hit_rate = V0_hit_rate, dodge_rate = V0_dodge_rate,
	    crit_rate = V0_crit_rate, crit_ratio = V0_crit_ratio,
	    hit_magic = V0_hit_magic, dodge_magic = V0_dodge_magic,
	    dam = V0_dam, res = V0_res, cure = V0_cure,
	    be_cure = V0_be_cure, tenacity = V0_tenacity,
	    def = V0_def, dam_p = V0_dam_p, dam_s = V0_dam_s,
	    res_p = V0_res_p, res_s = V0_res_s},
      #group_attr{atk = V0_atk2, hp_max = V0_hp2,
		  def = V0_def2, speed = V0_speed2},
      V0_eqms, V0_artifacts, V0_dower_skill, V0_ext_data,
      V0_holy_eqm, {V0_r_rid, V0_r_srvid}}) ->
    D_a_t_a = <<V0_partner_id:32, V0_bid:32, V0_lev:16,
		V0_star:8, (length(V0_skills)):16,
		(list_to_binary([<<V1_pos:8, V1_skill_bid:32>>
				 || {V1_pos, V1_skill_bid}
					<- V0_skills]))/binary,
		V0_break_lev:8, V0_power:32, (length(V0_is_lock)):16,
		(list_to_binary([<<V1_lock_type:32, V1_is_lock:8>>
				 || {V1_lock_type, V1_is_lock}
					<- V0_is_lock]))/binary,
		V0_use_skin:32, V0_end_time:32, V0_resonate_lev:32,
		V0_resonate_break_lev:32, V0_atk:32, V0_def_p:32,
		V0_def_s:32, V0_hp:32, V0_speed:32, V0_hit_rate:32,
		V0_dodge_rate:32, V0_crit_rate:32, V0_crit_ratio:32,
		V0_hit_magic:32, V0_dodge_magic:32, V0_dam:32,
		V0_res:32, V0_cure:32, V0_be_cure:32, V0_tenacity:32,
		V0_def:32, V0_dam_p:32, V0_dam_s:32, V0_res_p:32,
		V0_res_s:32, V0_atk2:32, V0_hp2:32, V0_def2:32,
		V0_speed2:32, (length(V0_eqms)):16,
		(list_to_binary([<<V1_id:32, V1_base_id:32, V1_type:32>>
				 || #item{id = V1_id, base_id = V1_base_id,
					  type = V1_type}
					<- V0_eqms]))/binary,
		(length(V0_artifacts)):16,
		(list_to_binary([<<V1_artifact_pos:8, V1_id:32,
				   V1_base_id:32, V1_enchant:32,
				   (length(V1_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_attr]))/binary,
				   (length(V1_extra_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_extra_attr]))/binary,
				   (length(V1_extra)):16,
				   (list_to_binary([<<V2_extra_k:32,
						      V2_extra_v:32>>
						    || {V2_extra_k, V2_extra_v}
							   <- V1_extra]))/binary>>
				 || {V1_artifact_pos,
				     #item{id = V1_id, base_id = V1_base_id,
					   enchant = V1_enchant, attr = V1_attr,
					   extra_attr = V1_extra_attr,
					   extra = V1_extra}}
					<- V0_artifacts]))/binary,
		(length(V0_dower_skill)):16,
		(list_to_binary([<<V1_pos:8, V1_skill_id:32>>
				 || {V1_pos, V1_skill_id}
					<- V0_dower_skill]))/binary,
		(length(V0_ext_data)):16,
		(list_to_binary([<<V1_id:32, V1_val:32>>
				 || {V1_id, V1_val} <- V0_ext_data]))/binary,
		(length(V0_holy_eqm)):16,
		(list_to_binary([<<V1_id:32, V1_base_id:32,
				   (length(V1_main_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_main_attr]))/binary,
				   (length(V1_holy_eqm_attr)):16,
				   (list_to_binary([<<V2_pos:8, V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_pos, V2_attr_id,
							V2_attr_val}
							   <- V1_holy_eqm_attr]))/binary>>
				 || #item{id = V1_id, base_id = V1_base_id,
					  main_attr = V1_main_attr,
					  holy_eqm_attr = V1_holy_eqm_attr}
					<- V0_holy_eqm]))/binary,
		V0_r_rid:32,
		(protocol:pack(string, V0_r_srvid))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11062:16,
       D_a_t_a/binary>>};
pack(11063, cli, {V0_partner_id}) ->
    D_a_t_a = <<V0_partner_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11063:16,
       D_a_t_a/binary>>};
pack(11063, srv,
     {V0_partner_id,
      #attr{atk = V0_atk, def_p = V0_def_p, def_s = V0_def_s,
	    hp_max = V0_hp, speed = V0_speed,
	    hit_rate = V0_hit_rate, dodge_rate = V0_dodge_rate,
	    crit_rate = V0_crit_rate, crit_ratio = V0_crit_ratio,
	    hit_magic = V0_hit_magic, dodge_magic = V0_dodge_magic,
	    dam = V0_dam, res = V0_res, cure = V0_cure,
	    be_cure = V0_be_cure, tenacity = V0_tenacity,
	    def = V0_def, dam_p = V0_dam_p, dam_s = V0_dam_s,
	    res_p = V0_res_p, res_s = V0_res_s},
      V0_ext_data}) ->
    D_a_t_a = <<V0_partner_id:32, V0_atk:32, V0_def_p:32,
		V0_def_s:32, V0_hp:32, V0_speed:32, V0_hit_rate:32,
		V0_dodge_rate:32, V0_crit_rate:32, V0_crit_ratio:32,
		V0_hit_magic:32, V0_dodge_magic:32, V0_dam:32,
		V0_res:32, V0_cure:32, V0_be_cure:32, V0_tenacity:32,
		V0_def:32, V0_dam_p:32, V0_dam_s:32, V0_res_p:32,
		V0_res_s:32, (length(V0_ext_data)):16,
		(list_to_binary([<<V1_id:32, V1_val:32>>
				 || {V1_id, V1_val} <- V0_ext_data]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11063:16,
       D_a_t_a/binary>>};
pack(11065, cli, {V0_partner_id}) ->
    D_a_t_a = <<V0_partner_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11065:16,
       D_a_t_a/binary>>};
pack(11065, srv,
     {V0_result, V0_msg, V0_list, V0_partner_id}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_list)):16,
		(list_to_binary([<<V1_is_partner:8, V1_id:32, V1_num:32,
				   V1_star:32, V1_lev:32>>
				 || {V1_is_partner, V1_id, V1_num, V1_star,
				     V1_lev}
					<- V0_list]))/binary,
		V0_partner_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11065:16,
       D_a_t_a/binary>>};
pack(11066, cli, {V0_partner_id}) ->
    D_a_t_a = <<V0_partner_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11066:16,
       D_a_t_a/binary>>};
pack(11066, srv, {V0_code, V0_msg, V0_list}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_list)):16,
		(list_to_binary([<<V1_is_partner:8, V1_id:32, V1_num:32,
				   V1_star:32, V1_lev:32>>
				 || {V1_is_partner, V1_id, V1_num, V1_star,
				     V1_lev}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11066:16,
       D_a_t_a/binary>>};
pack(11067, cli, {V0_partner_id}) ->
    D_a_t_a = <<V0_partner_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11067:16,
       D_a_t_a/binary>>};
pack(11067, srv,
     {V0_partner_id, V0_end_time, V0_day_num}) ->
    D_a_t_a = <<V0_partner_id:32, V0_end_time:32,
		V0_day_num:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11067:16,
       D_a_t_a/binary>>};
pack(11068, cli, {V0_partner_id}) ->
    D_a_t_a = <<V0_partner_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11068:16,
       D_a_t_a/binary>>};
pack(11068, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11068:16,
       D_a_t_a/binary>>};
pack(11070, cli, {V0_partner_bid}) ->
    D_a_t_a = <<V0_partner_bid:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11070:16,
       D_a_t_a/binary>>};
pack(11070, srv,
     {V0_partner_bid, V0_partner_score,
      V0_stronger_partner_score}) ->
    D_a_t_a = <<V0_partner_bid:32,
		(length(V0_partner_score)):16,
		(list_to_binary([<<V1_id_2:8, V1_val:32>>
				 || {V1_id_2, V1_val}
					<- V0_partner_score]))/binary,
		(length(V0_stronger_partner_score)):16,
		(list_to_binary([<<V1_id_2:8, V1_val:32>>
				 || {V1_id_2, V1_val}
					<- V0_stronger_partner_score]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11070:16,
       D_a_t_a/binary>>};
pack(11071, cli, {V0_partner_id}) ->
    D_a_t_a = <<V0_partner_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11071:16,
       D_a_t_a/binary>>};
pack(11071, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11071:16,
       D_a_t_a/binary>>};
pack(11072, cli, {V0_partner_id}) ->
    D_a_t_a = <<V0_partner_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11072:16,
       D_a_t_a/binary>>};
pack(11072, srv, {V0_code, V0_msg, V0_list}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_num:32>>
				 || {V1_id, V1_num} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11072:16,
       D_a_t_a/binary>>};
pack(11073, cli, {}) -> {ok, <<2:32, 11073:16>>};
pack(11073, srv, {V0_partners}) ->
    D_a_t_a = <<(length(V0_partners)):16,
		(list_to_binary([<<V1_partner_id:32, V1_bid:32,
				   V1_lev:16, V1_star:8, (length(V1_skills)):16,
				   (list_to_binary([<<V2_pos:8,
						      V2_skill_bid:32>>
						    || {V2_pos, V2_skill_bid}
							   <- V1_skills]))/binary,
				   V1_break_lev:8, V1_power:32,
				   (length(V1_is_lock)):16,
				   (list_to_binary([<<V2_lock_type:32,
						      V2_is_lock:8>>
						    || {V2_lock_type,
							V2_is_lock}
							   <- V1_is_lock]))/binary,
				   V1_use_skin:32, V1_end_time:32,
				   V1_resonate_lev:32, V1_resonate_break_lev:32,
				   V1_atk:32, V1_def_p:32, V1_def_s:32,
				   V1_hp:32, V1_speed:32, V1_hit_rate:32,
				   V1_dodge_rate:32, V1_crit_rate:32,
				   V1_crit_ratio:32, V1_hit_magic:32,
				   V1_dodge_magic:32, V1_def:32, V1_atk2:32,
				   V1_hp2:32, V1_def2:32, V1_speed2:32,
				   (length(V1_eqms)):16,
				   (list_to_binary([<<V2_id:32, V2_base_id:32,
						      V2_type:32>>
						    || #item{id = V2_id,
							     base_id =
								 V2_base_id,
							     type = V2_type}
							   <- V1_eqms]))/binary,
				   (length(V1_artifacts)):16,
				   (list_to_binary([<<V2_artifact_pos:8,
						      V2_id:32, V2_base_id:32,
						      V2_enchant:32,
						      (length(V2_attr)):16,
						      (list_to_binary([<<V3_attr_id:32,
									 V3_attr_val:32>>
								       || {V3_attr_id,
									   V3_attr_val}
									      <- V2_attr]))/binary,
						      (length(V2_extra_attr)):16,
						      (list_to_binary([<<V3_attr_id:32,
									 V3_attr_val:32>>
								       || {V3_attr_id,
									   V3_attr_val}
									      <- V2_extra_attr]))/binary,
						      (length(V2_extra)):16,
						      (list_to_binary([<<V3_extra_k:32,
									 V3_extra_v:32>>
								       || {V3_extra_k,
									   V3_extra_v}
									      <- V2_extra]))/binary>>
						    || {V2_artifact_pos,
							#item{id = V2_id,
							      base_id =
								  V2_base_id,
							      enchant =
								  V2_enchant,
							      attr = V2_attr,
							      extra_attr =
								  V2_extra_attr,
							      extra = V2_extra}}
							   <- V1_artifacts]))/binary,
				   (length(V1_dower_skill)):16,
				   (list_to_binary([<<V2_pos:8, V2_skill_id:32>>
						    || {V2_pos, V2_skill_id}
							   <- V1_dower_skill]))/binary>>
				 || {#partner_base_p{partner_id = V1_partner_id,
						     bid = V1_bid, lev = V1_lev,
						     star = V1_star,
						     skills = V1_skills,
						     break_lev = V1_break_lev,
						     power = V1_power,
						     is_lock = V1_is_lock,
						     use_skin = V1_use_skin,
						     end_time = V1_end_time,
						     resonate_lev =
							 V1_resonate_lev,
						     resonate_break_lev =
							 V1_resonate_break_lev},
				     #attr{atk = V1_atk, def_p = V1_def_p,
					   def_s = V1_def_s, hp_max = V1_hp,
					   speed = V1_speed,
					   hit_rate = V1_hit_rate,
					   dodge_rate = V1_dodge_rate,
					   crit_rate = V1_crit_rate,
					   crit_ratio = V1_crit_ratio,
					   hit_magic = V1_hit_magic,
					   dodge_magic = V1_dodge_magic,
					   def = V1_def},
				     #group_attr{atk = V1_atk2, hp_max = V1_hp2,
						 def = V1_def2,
						 speed = V1_speed2},
				     V1_eqms, V1_artifacts, V1_dower_skill}
					<- V0_partners]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11073:16,
       D_a_t_a/binary>>};
pack(11074, cli, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_skin_ids:32>>
				 || V1_skin_ids <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11074:16,
       D_a_t_a/binary>>};
pack(11074, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11074:16,
       D_a_t_a/binary>>};
pack(11075, cli, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_partner_id:32>>
				 || V1_partner_id <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11075:16,
       D_a_t_a/binary>>};
pack(11075, srv, {V0_code, V0_msg, V0_list}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_num:32>>
				 || {V1_id, V1_num} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11075:16,
       D_a_t_a/binary>>};
pack(11076, cli, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_partner_id:32>>
				 || V1_partner_id <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11076:16,
       D_a_t_a/binary>>};
pack(11076, srv, {V0_code, V0_msg, V0_list}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_list)):16,
		(list_to_binary([<<V1_partner_id:32>>
				 || V1_partner_id <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11076:16,
       D_a_t_a/binary>>};
pack(11077, cli, {V0_partner_bid}) ->
    D_a_t_a = <<V0_partner_bid:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11077:16,
       D_a_t_a/binary>>};
pack(11077, srv, {V0_result, V0_msg, V0_partner_bid}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_partner_bid:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11077:16,
       D_a_t_a/binary>>};
pack(11078, cli, {V0_id, V0_flag}) ->
    D_a_t_a = <<V0_id:32, V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11078:16,
       D_a_t_a/binary>>};
pack(11078, srv, {V0_result, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11078:16,
       D_a_t_a/binary>>};
pack(11079, cli, {V0_base_id, V0_num}) ->
    D_a_t_a = <<V0_base_id:32, V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11079:16,
       D_a_t_a/binary>>};
pack(11079, srv, {V0_type, V0_coin, V0_list}) ->
    D_a_t_a = <<V0_type:8, V0_coin:32, (length(V0_list)):16,
		(list_to_binary([<<V1_bid:32, V1_num:16>>
				 || {V1_bid, V1_num} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11079:16,
       D_a_t_a/binary>>};
pack(11080, cli, {V0_base_id, V0_num}) ->
    D_a_t_a = <<V0_base_id:32, V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11080:16,
       D_a_t_a/binary>>};
pack(11080, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11080:16,
       D_a_t_a/binary>>};
pack(11081, cli, {V0_base_id, V0_num}) ->
    D_a_t_a = <<V0_base_id:32, V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11081:16,
       D_a_t_a/binary>>};
pack(11081, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11081:16,
       D_a_t_a/binary>>};
pack(11082, cli, {}) -> {ok, <<2:32, 11082:16>>};
pack(11082, srv, {V0_logs}) ->
    D_a_t_a = <<(length(V0_logs)):16,
		(list_to_binary([<<(length(V1_items)):16,
				   (list_to_binary([<<V2_bid:32, V2_num:16>>
						    || {V2_bid, V2_num}
							   <- V1_items]))/binary,
				   V1_time:32, V1_coin:32>>
				 || {V1_items, V1_time, V1_coin}
					<- V0_logs]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11082:16,
       D_a_t_a/binary>>};
pack(11083, cli, {V0_partner_id, V0_item_id}) ->
    D_a_t_a = <<V0_partner_id:32, V0_item_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11083:16,
       D_a_t_a/binary>>};
pack(11083, srv,
     {V0_result, V0_msg, V0_partner_id, V0_item_id}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_partner_id:32, V0_item_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11083:16,
       D_a_t_a/binary>>};
pack(11085, cli, {}) -> {ok, <<2:32, 11085:16>>};
pack(11085, srv,
     {V0_partner_id, V0_old_star, V0_new_star}) ->
    D_a_t_a = <<V0_partner_id:32, V0_old_star:32,
		V0_new_star:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11085:16,
       D_a_t_a/binary>>};
pack(11086, cli, {V0_partner_id}) ->
    D_a_t_a = <<V0_partner_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11086:16,
       D_a_t_a/binary>>};
pack(11086, srv,
     {V0_partner_id, V0_power,
      #attr{atk = V0_atk, def_p = V0_def_p, def_s = V0_def_s,
	    hp_max = V0_hp, speed = V0_speed,
	    hit_rate = V0_hit_rate, dodge_rate = V0_dodge_rate,
	    crit_rate = V0_crit_rate, crit_ratio = V0_crit_ratio,
	    hit_magic = V0_hit_magic, dodge_magic = V0_dodge_magic,
	    dam = V0_dam, res = V0_res, cure = V0_cure,
	    be_cure = V0_be_cure, tenacity = V0_tenacity,
	    def = V0_def, dam_p = V0_dam_p, dam_s = V0_dam_s,
	    res_p = V0_res_p, res_s = V0_res_s}}) ->
    D_a_t_a = <<V0_partner_id:32, V0_power:32, V0_atk:32,
		V0_def_p:32, V0_def_s:32, V0_hp:32, V0_speed:32,
		V0_hit_rate:32, V0_dodge_rate:32, V0_crit_rate:32,
		V0_crit_ratio:32, V0_hit_magic:32, V0_dodge_magic:32,
		V0_dam:32, V0_res:32, V0_cure:32, V0_be_cure:32,
		V0_tenacity:32, V0_def:32, V0_dam_p:32, V0_dam_s:32,
		V0_res_p:32, V0_res_s:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11086:16,
       D_a_t_a/binary>>};
pack(11087, cli, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_partner_id:32>>
				 || V1_partner_id <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11087:16,
       D_a_t_a/binary>>};
pack(11087, srv, {V0_code, V0_msg, V0_list}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_num:32>>
				 || {V1_id, V1_num} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11087:16,
       D_a_t_a/binary>>};
pack(11088, cli, {V0_item_ids}) ->
    D_a_t_a = <<(length(V0_item_ids)):16,
		(list_to_binary([<<V1_item_id:32>>
				 || V1_item_id <- V0_item_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11088:16,
       D_a_t_a/binary>>};
pack(11088, srv, {V0_code, V0_msg, V0_list}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_num:32>>
				 || {V1_id, V1_num} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11088:16,
       D_a_t_a/binary>>};
pack(11089, cli, {V0_item_ids}) ->
    D_a_t_a = <<(length(V0_item_ids)):16,
		(list_to_binary([<<V1_item_id:32>>
				 || V1_item_id <- V0_item_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11089:16,
       D_a_t_a/binary>>};
pack(11089, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11089:16,
       D_a_t_a/binary>>};
pack(11090, cli,
     {V0_partner_id, V0_holy_eqm_id, V0_type}) ->
    D_a_t_a = <<V0_partner_id:32, V0_holy_eqm_id:32,
		V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11090:16,
       D_a_t_a/binary>>};
pack(11090, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11090:16,
       D_a_t_a/binary>>};
pack(11091, cli, {}) -> {ok, <<2:32, 11091:16>>};
pack(11091, srv,
     {V0_partner_id, V0_power,
      #attr{atk = V0_atk, def_p = V0_def_p, def_s = V0_def_s,
	    hp_max = V0_hp, speed = V0_speed,
	    hit_rate = V0_hit_rate, dodge_rate = V0_dodge_rate,
	    crit_rate = V0_crit_rate, crit_ratio = V0_crit_ratio,
	    hit_magic = V0_hit_magic, dodge_magic = V0_dodge_magic,
	    dam = V0_dam, res = V0_res, cure = V0_cure,
	    be_cure = V0_be_cure, tenacity = V0_tenacity,
	    def = V0_def, dam_p = V0_dam_p, dam_s = V0_dam_s,
	    res_p = V0_res_p, res_s = V0_res_s},
      V0_holy_eqm}) ->
    D_a_t_a = <<V0_partner_id:32, V0_power:32, V0_atk:32,
		V0_def_p:32, V0_def_s:32, V0_hp:32, V0_speed:32,
		V0_hit_rate:32, V0_dodge_rate:32, V0_crit_rate:32,
		V0_crit_ratio:32, V0_hit_magic:32, V0_dodge_magic:32,
		V0_dam:32, V0_res:32, V0_cure:32, V0_be_cure:32,
		V0_tenacity:32, V0_def:32, V0_dam_p:32, V0_dam_s:32,
		V0_res_p:32, V0_res_s:32, (length(V0_holy_eqm)):16,
		(list_to_binary([<<V1_id:32, V1_base_id:32,
				   (length(V1_main_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_main_attr]))/binary,
				   (length(V1_holy_eqm_attr)):16,
				   (list_to_binary([<<V2_pos:8, V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_pos, V2_attr_id,
							V2_attr_val}
							   <- V1_holy_eqm_attr]))/binary,
				   (length(V1_extra)):16,
				   (list_to_binary([<<V2_extra_k:32,
						      V2_extra_v:32>>
						    || {V2_extra_k, V2_extra_v}
							   <- V1_extra]))/binary>>
				 || #item{id = V1_id, base_id = V1_base_id,
					  main_attr = V1_main_attr,
					  holy_eqm_attr = V1_holy_eqm_attr,
					  extra = V1_extra}
					<- V0_holy_eqm]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11091:16,
       D_a_t_a/binary>>};
pack(11092, cli, {V0_partner_ids}) ->
    D_a_t_a = <<(length(V0_partner_ids)):16,
		(list_to_binary([<<V1_partner_id:32>>
				 || V1_partner_id <- V0_partner_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11092:16,
       D_a_t_a/binary>>};
pack(11092, srv, {V0_partner_ids}) ->
    D_a_t_a = <<(length(V0_partner_ids)):16,
		(list_to_binary([<<V1_partner_id:32,
				   (length(V1_holy_eqm)):16,
				   (list_to_binary([<<V2_id:32, V2_base_id:32,
						      (length(V2_main_attr)):16,
						      (list_to_binary([<<V3_attr_id:32,
									 V3_attr_val:32>>
								       || {V3_attr_id,
									   V3_attr_val}
									      <- V2_main_attr]))/binary,
						      (length(V2_holy_eqm_attr)):16,
						      (list_to_binary([<<V3_pos:8,
									 V3_attr_id:32,
									 V3_attr_val:32>>
								       || {V3_pos,
									   V3_attr_id,
									   V3_attr_val}
									      <- V2_holy_eqm_attr]))/binary,
						      (length(V2_extra)):16,
						      (list_to_binary([<<V3_extra_k:32,
									 V3_extra_v:32>>
								       || {V3_extra_k,
									   V3_extra_v}
									      <- V2_extra]))/binary>>
						    || #item{id = V2_id,
							     base_id =
								 V2_base_id,
							     main_attr =
								 V2_main_attr,
							     holy_eqm_attr =
								 V2_holy_eqm_attr,
							     extra = V2_extra}
							   <- V1_holy_eqm]))/binary>>
				 || {V1_partner_id, V1_holy_eqm}
					<- V0_partner_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11092:16,
       D_a_t_a/binary>>};
pack(11093, cli,
     {V0_partner_id, V0_holy_eqm_id, V0_type}) ->
    D_a_t_a = <<V0_partner_id:32, V0_holy_eqm_id:32,
		V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11093:16,
       D_a_t_a/binary>>};
pack(11093, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11093:16,
       D_a_t_a/binary>>};
pack(11094, cli,
     {V0_partner_id, V0_holy_eqm_id, V0_pos}) ->
    D_a_t_a = <<V0_partner_id:32, V0_holy_eqm_id:32,
		(length(V0_pos)):16,
		(list_to_binary([<<V1_pos:8>>
				 || V1_pos <- V0_pos]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11094:16,
       D_a_t_a/binary>>};
pack(11094, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11094:16,
       D_a_t_a/binary>>};
pack(11095, cli, {}) -> {ok, <<2:32, 11095:16>>};
pack(11095, srv,
     {V0_partner_bid, V0_is_chips, V0_init_star,
      V0_status}) ->
    D_a_t_a = <<V0_partner_bid:32, V0_is_chips:8,
		V0_init_star:8, V0_status:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11095:16,
       D_a_t_a/binary>>};
pack(11096, cli,
     {V0_partner_id, V0_pos, V0_skill_id}) ->
    D_a_t_a = <<V0_partner_id:32, V0_pos:8,
		V0_skill_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11096:16,
       D_a_t_a/binary>>};
pack(11096, srv,
     {V0_partner_id, V0_result, V0_msg, V0_dower_skill}) ->
    D_a_t_a = <<V0_partner_id:32, V0_result:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_dower_skill)):16,
		(list_to_binary([<<V1_pos:8, V1_skill_id:32>>
				 || {V1_pos, V1_skill_id}
					<- V0_dower_skill]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11096:16,
       D_a_t_a/binary>>};
pack(11097, cli, {V0_partner_id, V0_pos}) ->
    D_a_t_a = <<V0_partner_id:32, V0_pos:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11097:16,
       D_a_t_a/binary>>};
pack(11097, srv,
     {V0_partner_id, V0_result, V0_msg, V0_dower_skill}) ->
    D_a_t_a = <<V0_partner_id:32, V0_result:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_dower_skill)):16,
		(list_to_binary([<<V1_pos:8, V1_skill_id:32>>
				 || {V1_pos, V1_skill_id}
					<- V0_dower_skill]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11097:16,
       D_a_t_a/binary>>};
pack(11098, cli, {V0_partner_id, V0_pos}) ->
    D_a_t_a = <<V0_partner_id:32, V0_pos:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11098:16,
       D_a_t_a/binary>>};
pack(11098, srv,
     {V0_partner_id, V0_result, V0_msg, V0_dower_skill}) ->
    D_a_t_a = <<V0_partner_id:32, V0_result:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_dower_skill)):16,
		(list_to_binary([<<V1_pos:8, V1_skill_id:32>>
				 || {V1_pos, V1_skill_id}
					<- V0_dower_skill]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11098:16,
       D_a_t_a/binary>>};
pack(11099, cli, {V0_partner_ids}) ->
    D_a_t_a = <<(length(V0_partner_ids)):16,
		(list_to_binary([<<V1_partner_id:32>>
				 || V1_partner_id <- V0_partner_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11099:16,
       D_a_t_a/binary>>};
pack(11099, srv, {V0_partner_ids}) ->
    D_a_t_a = <<(length(V0_partner_ids)):16,
		(list_to_binary([<<V1_partner_id:32,
				   (length(V1_dower_skill)):16,
				   (list_to_binary([<<V2_pos:8, V2_skill_id:32>>
						    || {V2_pos, V2_skill_id}
							   <- V1_dower_skill]))/binary>>
				 || {V1_partner_id, V1_dower_skill}
					<- V0_partner_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11099:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(11000, srv, _B0) -> {ok, {}};
unpack(11000, cli, _B0) ->
    {V1_sort_type, _B1} = protocol:uint8(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {V1_buy_num, _B3} = protocol:uint8(_B2),
    {V1_partners, _B75} = protocol:array(_B3,
					 fun (_B4) ->
						 {V2_partner_id, _B5} =
						     protocol:uint32(_B4),
						 {V2_bid, _B6} =
						     protocol:uint32(_B5),
						 {V2_lev, _B7} =
						     protocol:uint16(_B6),
						 {V2_star, _B8} =
						     protocol:uint8(_B7),
						 {V2_skills, _B13} =
						     protocol:array(_B8,
								    fun (_B9) ->
									    {V3_pos,
									     _B10} =
										protocol:uint8(_B9),
									    {V3_skill_bid,
									     _B11} =
										protocol:uint32(_B10),
									    {{V3_pos,
									      V3_skill_bid},
									     _B11}
								    end),
						 {V2_break_lev, _B14} =
						     protocol:uint8(_B13),
						 {V2_power, _B15} =
						     protocol:uint32(_B14),
						 {V2_is_lock, _B20} =
						     protocol:array(_B15,
								    fun
								      (_B16) ->
									  {V3_lock_type,
									   _B17} =
									      protocol:uint32(_B16),
									  {V3_is_lock,
									   _B18} =
									      protocol:uint8(_B17),
									  {{V3_lock_type,
									    V3_is_lock},
									   _B18}
								    end),
						 {V2_use_skin, _B21} =
						     protocol:uint32(_B20),
						 {V2_end_time, _B22} =
						     protocol:uint32(_B21),
						 {V2_resonate_lev, _B23} =
						     protocol:uint32(_B22),
						 {V2_resonate_break_lev, _B24} =
						     protocol:uint32(_B23),
						 {V2_atk, _B25} =
						     protocol:uint32(_B24),
						 {V2_def_p, _B26} =
						     protocol:uint32(_B25),
						 {V2_def_s, _B27} =
						     protocol:uint32(_B26),
						 {V2_hp, _B28} =
						     protocol:uint32(_B27),
						 {V2_speed, _B29} =
						     protocol:uint32(_B28),
						 {V2_hit_rate, _B30} =
						     protocol:uint32(_B29),
						 {V2_dodge_rate, _B31} =
						     protocol:uint32(_B30),
						 {V2_crit_rate, _B32} =
						     protocol:uint32(_B31),
						 {V2_crit_ratio, _B33} =
						     protocol:uint32(_B32),
						 {V2_hit_magic, _B34} =
						     protocol:uint32(_B33),
						 {V2_dodge_magic, _B35} =
						     protocol:uint32(_B34),
						 {V2_def, _B36} =
						     protocol:uint32(_B35),
						 {V2_atk2, _B37} =
						     protocol:uint32(_B36),
						 {V2_hp2, _B38} =
						     protocol:uint32(_B37),
						 {V2_def2, _B39} =
						     protocol:uint32(_B38),
						 {V2_speed2, _B40} =
						     protocol:uint32(_B39),
						 {V2_eqms, _B46} =
						     protocol:array(_B40,
								    fun
								      (_B41) ->
									  {V3_id,
									   _B42} =
									      protocol:uint32(_B41),
									  {V3_base_id,
									   _B43} =
									      protocol:uint32(_B42),
									  {V3_type,
									   _B44} =
									      protocol:uint32(_B43),
									  {{V3_id,
									    V3_base_id,
									    V3_type},
									   _B44}
								    end),
						 {V2_artifacts, _B68} =
						     protocol:array(_B46,
								    fun
								      (_B47) ->
									  {V3_artifact_pos,
									   _B48} =
									      protocol:uint8(_B47),
									  {V3_id,
									   _B49} =
									      protocol:uint32(_B48),
									  {V3_base_id,
									   _B50} =
									      protocol:uint32(_B49),
									  {V3_enchant,
									   _B51} =
									      protocol:uint32(_B50),
									  {V3_attr,
									   _B56} =
									      protocol:array(_B51,
											     fun
											       (_B52) ->
												   {V4_attr_id,
												    _B53} =
												       protocol:uint32(_B52),
												   {V4_attr_val,
												    _B54} =
												       protocol:uint32(_B53),
												   {{V4_attr_id,
												     V4_attr_val},
												    _B54}
											     end),
									  {V3_extra_attr,
									   _B61} =
									      protocol:array(_B56,
											     fun
											       (_B57) ->
												   {V4_attr_id,
												    _B58} =
												       protocol:uint32(_B57),
												   {V4_attr_val,
												    _B59} =
												       protocol:uint32(_B58),
												   {{V4_attr_id,
												     V4_attr_val},
												    _B59}
											     end),
									  {V3_extra,
									   _B66} =
									      protocol:array(_B61,
											     fun
											       (_B62) ->
												   {V4_extra_k,
												    _B63} =
												       protocol:uint32(_B62),
												   {V4_extra_v,
												    _B64} =
												       protocol:uint32(_B63),
												   {{V4_extra_k,
												     V4_extra_v},
												    _B64}
											     end),
									  {{V3_artifact_pos,
									    V3_id,
									    V3_base_id,
									    V3_enchant,
									    V3_attr,
									    V3_extra_attr,
									    V3_extra},
									   _B66}
								    end),
						 {V2_dower_skill, _B73} =
						     protocol:array(_B68,
								    fun
								      (_B69) ->
									  {V3_pos,
									   _B70} =
									      protocol:uint8(_B69),
									  {V3_skill_id,
									   _B71} =
									      protocol:uint32(_B70),
									  {{V3_pos,
									    V3_skill_id},
									   _B71}
								    end),
						 {{V2_partner_id, V2_bid,
						   V2_lev, V2_star, V2_skills,
						   V2_break_lev, V2_power,
						   V2_is_lock, V2_use_skin,
						   V2_end_time, V2_resonate_lev,
						   V2_resonate_break_lev,
						   V2_atk, V2_def_p, V2_def_s,
						   V2_hp, V2_speed, V2_hit_rate,
						   V2_dodge_rate, V2_crit_rate,
						   V2_crit_ratio, V2_hit_magic,
						   V2_dodge_magic, V2_def,
						   V2_atk2, V2_hp2, V2_def2,
						   V2_speed2, V2_eqms,
						   V2_artifacts,
						   V2_dower_skill},
						  _B73}
					 end),
    {ok, {V1_sort_type, V1_num, V1_buy_num, V1_partners}};
unpack(11001, srv, _B0) -> {ok, {}};
unpack(11001, cli, _B0) ->
    {V1_partners, _B72} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_partner_id, _B2} =
						     protocol:uint32(_B1),
						 {V2_bid, _B3} =
						     protocol:uint32(_B2),
						 {V2_lev, _B4} =
						     protocol:uint16(_B3),
						 {V2_star, _B5} =
						     protocol:uint8(_B4),
						 {V2_skills, _B10} =
						     protocol:array(_B5,
								    fun (_B6) ->
									    {V3_pos,
									     _B7} =
										protocol:uint8(_B6),
									    {V3_skill_bid,
									     _B8} =
										protocol:uint32(_B7),
									    {{V3_pos,
									      V3_skill_bid},
									     _B8}
								    end),
						 {V2_break_lev, _B11} =
						     protocol:uint8(_B10),
						 {V2_power, _B12} =
						     protocol:uint32(_B11),
						 {V2_is_lock, _B17} =
						     protocol:array(_B12,
								    fun
								      (_B13) ->
									  {V3_lock_type,
									   _B14} =
									      protocol:uint32(_B13),
									  {V3_is_lock,
									   _B15} =
									      protocol:uint8(_B14),
									  {{V3_lock_type,
									    V3_is_lock},
									   _B15}
								    end),
						 {V2_use_skin, _B18} =
						     protocol:uint32(_B17),
						 {V2_end_time, _B19} =
						     protocol:uint32(_B18),
						 {V2_resonate_lev, _B20} =
						     protocol:uint32(_B19),
						 {V2_resonate_break_lev, _B21} =
						     protocol:uint32(_B20),
						 {V2_atk, _B22} =
						     protocol:uint32(_B21),
						 {V2_def_p, _B23} =
						     protocol:uint32(_B22),
						 {V2_def_s, _B24} =
						     protocol:uint32(_B23),
						 {V2_hp, _B25} =
						     protocol:uint32(_B24),
						 {V2_speed, _B26} =
						     protocol:uint32(_B25),
						 {V2_hit_rate, _B27} =
						     protocol:uint32(_B26),
						 {V2_dodge_rate, _B28} =
						     protocol:uint32(_B27),
						 {V2_crit_rate, _B29} =
						     protocol:uint32(_B28),
						 {V2_crit_ratio, _B30} =
						     protocol:uint32(_B29),
						 {V2_hit_magic, _B31} =
						     protocol:uint32(_B30),
						 {V2_dodge_magic, _B32} =
						     protocol:uint32(_B31),
						 {V2_def, _B33} =
						     protocol:uint32(_B32),
						 {V2_atk2, _B34} =
						     protocol:uint32(_B33),
						 {V2_hp2, _B35} =
						     protocol:uint32(_B34),
						 {V2_def2, _B36} =
						     protocol:uint32(_B35),
						 {V2_speed2, _B37} =
						     protocol:uint32(_B36),
						 {V2_eqms, _B43} =
						     protocol:array(_B37,
								    fun
								      (_B38) ->
									  {V3_id,
									   _B39} =
									      protocol:uint32(_B38),
									  {V3_base_id,
									   _B40} =
									      protocol:uint32(_B39),
									  {V3_type,
									   _B41} =
									      protocol:uint32(_B40),
									  {{V3_id,
									    V3_base_id,
									    V3_type},
									   _B41}
								    end),
						 {V2_artifacts, _B65} =
						     protocol:array(_B43,
								    fun
								      (_B44) ->
									  {V3_artifact_pos,
									   _B45} =
									      protocol:uint8(_B44),
									  {V3_id,
									   _B46} =
									      protocol:uint32(_B45),
									  {V3_base_id,
									   _B47} =
									      protocol:uint32(_B46),
									  {V3_enchant,
									   _B48} =
									      protocol:uint32(_B47),
									  {V3_attr,
									   _B53} =
									      protocol:array(_B48,
											     fun
											       (_B49) ->
												   {V4_attr_id,
												    _B50} =
												       protocol:uint32(_B49),
												   {V4_attr_val,
												    _B51} =
												       protocol:uint32(_B50),
												   {{V4_attr_id,
												     V4_attr_val},
												    _B51}
											     end),
									  {V3_extra_attr,
									   _B58} =
									      protocol:array(_B53,
											     fun
											       (_B54) ->
												   {V4_attr_id,
												    _B55} =
												       protocol:uint32(_B54),
												   {V4_attr_val,
												    _B56} =
												       protocol:uint32(_B55),
												   {{V4_attr_id,
												     V4_attr_val},
												    _B56}
											     end),
									  {V3_extra,
									   _B63} =
									      protocol:array(_B58,
											     fun
											       (_B59) ->
												   {V4_extra_k,
												    _B60} =
												       protocol:uint32(_B59),
												   {V4_extra_v,
												    _B61} =
												       protocol:uint32(_B60),
												   {{V4_extra_k,
												     V4_extra_v},
												    _B61}
											     end),
									  {{V3_artifact_pos,
									    V3_id,
									    V3_base_id,
									    V3_enchant,
									    V3_attr,
									    V3_extra_attr,
									    V3_extra},
									   _B63}
								    end),
						 {V2_dower_skill, _B70} =
						     protocol:array(_B65,
								    fun
								      (_B66) ->
									  {V3_pos,
									   _B67} =
									      protocol:uint8(_B66),
									  {V3_skill_id,
									   _B68} =
									      protocol:uint32(_B67),
									  {{V3_pos,
									    V3_skill_id},
									   _B68}
								    end),
						 {{V2_partner_id, V2_bid,
						   V2_lev, V2_star, V2_skills,
						   V2_break_lev, V2_power,
						   V2_is_lock, V2_use_skin,
						   V2_end_time, V2_resonate_lev,
						   V2_resonate_break_lev,
						   V2_atk, V2_def_p, V2_def_s,
						   V2_hp, V2_speed, V2_hit_rate,
						   V2_dodge_rate, V2_crit_rate,
						   V2_crit_ratio, V2_hit_magic,
						   V2_dodge_magic, V2_def,
						   V2_atk2, V2_hp2, V2_def2,
						   V2_speed2, V2_eqms,
						   V2_artifacts,
						   V2_dower_skill},
						  _B70}
					 end),
    {ok, {V1_partners}};
unpack(11002, srv, _B0) -> {ok, {}};
unpack(11002, cli, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_bid, _B2} = protocol:uint32(_B1),
    {V1_lev, _B3} = protocol:uint16(_B2),
    {V1_star, _B4} = protocol:uint8(_B3),
    {V1_skills, _B9} = protocol:array(_B4,
				      fun (_B5) ->
					      {V2_pos, _B6} =
						  protocol:uint8(_B5),
					      {V2_skill_bid, _B7} =
						  protocol:uint32(_B6),
					      {{V2_pos, V2_skill_bid}, _B7}
				      end),
    {V1_break_lev, _B10} = protocol:uint8(_B9),
    {V1_power, _B11} = protocol:uint32(_B10),
    {V1_is_lock, _B16} = protocol:array(_B11,
					fun (_B12) ->
						{V2_lock_type, _B13} =
						    protocol:uint32(_B12),
						{V2_is_lock, _B14} =
						    protocol:uint8(_B13),
						{{V2_lock_type, V2_is_lock},
						 _B14}
					end),
    {V1_use_skin, _B17} = protocol:uint32(_B16),
    {V1_end_time, _B18} = protocol:uint32(_B17),
    {V1_resonate_lev, _B19} = protocol:uint32(_B18),
    {V1_resonate_break_lev, _B20} = protocol:uint32(_B19),
    {V1_atk, _B21} = protocol:uint32(_B20),
    {V1_def_p, _B22} = protocol:uint32(_B21),
    {V1_def_s, _B23} = protocol:uint32(_B22),
    {V1_hp, _B24} = protocol:uint32(_B23),
    {V1_speed, _B25} = protocol:uint32(_B24),
    {V1_hit_rate, _B26} = protocol:uint32(_B25),
    {V1_dodge_rate, _B27} = protocol:uint32(_B26),
    {V1_crit_rate, _B28} = protocol:uint32(_B27),
    {V1_crit_ratio, _B29} = protocol:uint32(_B28),
    {V1_hit_magic, _B30} = protocol:uint32(_B29),
    {V1_dodge_magic, _B31} = protocol:uint32(_B30),
    {V1_def, _B32} = protocol:uint32(_B31),
    {V1_atk2, _B33} = protocol:uint32(_B32),
    {V1_hp2, _B34} = protocol:uint32(_B33),
    {V1_def2, _B35} = protocol:uint32(_B34),
    {V1_speed2, _B36} = protocol:uint32(_B35),
    {ok,
     {V1_partner_id, V1_bid, V1_lev, V1_star, V1_skills,
      V1_break_lev, V1_power, V1_is_lock, V1_use_skin,
      V1_end_time, V1_resonate_lev, V1_resonate_break_lev,
      V1_atk, V1_def_p, V1_def_s, V1_hp, V1_speed,
      V1_hit_rate, V1_dodge_rate, V1_crit_rate, V1_crit_ratio,
      V1_hit_magic, V1_dodge_magic, V1_def, V1_atk2, V1_hp2,
      V1_def2, V1_speed2}};
unpack(11003, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_partner_id}};
unpack(11003, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11004, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_partner_id}};
unpack(11004, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11005, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_expend1, _B5} = protocol:array(_B1,
				       fun (_B2) ->
					       {V2_partner_id, _B3} =
						   protocol:uint32(_B2),
					       {V2_partner_id, _B3}
				       end),
    {V1_expend2, _B9} = protocol:array(_B5,
				       fun (_B6) ->
					       {V2_partner_id, _B7} =
						   protocol:uint32(_B6),
					       {V2_partner_id, _B7}
				       end),
    {V1_item_expend, _B14} = protocol:array(_B9,
					    fun (_B10) ->
						    {V2_item_id, _B11} =
							protocol:uint32(_B10),
						    {V2_num, _B12} =
							protocol:uint32(_B11),
						    {{V2_item_id, V2_num}, _B12}
					    end),
    {ok,
     {V1_partner_id, V1_expend1, V1_expend2,
      V1_item_expend}};
unpack(11005, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11006, srv, _B0) -> {ok, {}};
unpack(11006, cli, _B0) ->
    {V1_expend2, _B4} = protocol:array(_B0,
				       fun (_B1) ->
					       {V2_partner_id, _B2} =
						   protocol:uint32(_B1),
					       {V2_partner_id, _B2}
				       end),
    {ok, {V1_expend2}};
unpack(11007, srv, _B0) -> {ok, {}};
unpack(11007, cli, _B0) ->
    {V1_ref_partners, _B17} = protocol:array(_B0,
					     fun (_B1) ->
						     {V2_partner_id, _B2} =
							 protocol:uint32(_B1),
						     {V2_power, _B3} =
							 protocol:uint32(_B2),
						     {V2_atk, _B4} =
							 protocol:uint32(_B3),
						     {V2_def_p, _B5} =
							 protocol:uint32(_B4),
						     {V2_def_s, _B6} =
							 protocol:uint32(_B5),
						     {V2_hp, _B7} =
							 protocol:uint32(_B6),
						     {V2_speed, _B8} =
							 protocol:uint32(_B7),
						     {V2_hit_rate, _B9} =
							 protocol:uint32(_B8),
						     {V2_dodge_rate, _B10} =
							 protocol:uint32(_B9),
						     {V2_crit_rate, _B11} =
							 protocol:uint32(_B10),
						     {V2_crit_ratio, _B12} =
							 protocol:uint32(_B11),
						     {V2_hit_magic, _B13} =
							 protocol:uint32(_B12),
						     {V2_dodge_magic, _B14} =
							 protocol:uint32(_B13),
						     {V2_def, _B15} =
							 protocol:uint32(_B14),
						     {{V2_partner_id, V2_power,
						       V2_atk, V2_def_p,
						       V2_def_s, V2_hp,
						       V2_speed, V2_hit_rate,
						       V2_dodge_rate,
						       V2_crit_rate,
						       V2_crit_ratio,
						       V2_hit_magic,
						       V2_dodge_magic, V2_def},
						      _B15}
					     end),
    {ok, {V1_ref_partners}};
unpack(11008, srv, _B0) ->
    {V1_bid, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_bid, V1_num}};
unpack(11008, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_partners, _B6} = protocol:array(_B2,
					fun (_B3) ->
						{V2_partner_bid, _B4} =
						    protocol:uint32(_B3),
						{V2_partner_bid, _B4}
					end),
    {ok, {V1_result, V1_msg, V1_partners}};
unpack(11009, srv, _B0) -> {ok, {}};
unpack(11009, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_num, _B3} = protocol:uint32(_B2),
    {V1_buy_num, _B4} = protocol:uint8(_B3),
    {ok, {V1_result, V1_msg, V1_num, V1_buy_num}};
unpack(11010, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_item_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_partner_id, V1_item_id}};
unpack(11010, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11011, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_pos_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_partner_id, V1_pos_id}};
unpack(11011, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11012, srv, _B0) -> {ok, {}};
unpack(11012, cli, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_power, _B2} = protocol:uint32(_B1),
    {V1_atk, _B3} = protocol:uint32(_B2),
    {V1_def_p, _B4} = protocol:uint32(_B3),
    {V1_def_s, _B5} = protocol:uint32(_B4),
    {V1_hp, _B6} = protocol:uint32(_B5),
    {V1_speed, _B7} = protocol:uint32(_B6),
    {V1_hit_rate, _B8} = protocol:uint32(_B7),
    {V1_dodge_rate, _B9} = protocol:uint32(_B8),
    {V1_crit_rate, _B10} = protocol:uint32(_B9),
    {V1_crit_ratio, _B11} = protocol:uint32(_B10),
    {V1_hit_magic, _B12} = protocol:uint32(_B11),
    {V1_dodge_magic, _B13} = protocol:uint32(_B12),
    {V1_def, _B14} = protocol:uint32(_B13),
    {V1_eqms, _B20} = protocol:array(_B14,
				     fun (_B15) ->
					     {V2_id, _B16} =
						 protocol:uint32(_B15),
					     {V2_base_id, _B17} =
						 protocol:uint32(_B16),
					     {V2_type, _B18} =
						 protocol:uint32(_B17),
					     {{V2_id, V2_base_id, V2_type},
					      _B18}
				     end),
    {ok,
     {V1_partner_id, V1_power, V1_atk, V1_def_p, V1_def_s,
      V1_hp, V1_speed, V1_hit_rate, V1_dodge_rate,
      V1_crit_rate, V1_crit_ratio, V1_hit_magic,
      V1_dodge_magic, V1_def, V1_eqms}};
unpack(11015, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {ok, {V1_partner_id, V1_type}};
unpack(11015, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_partner_id, _B3} = protocol:uint32(_B2),
    {V1_type, _B4} = protocol:uint8(_B3),
    {ok, {V1_result, V1_msg, V1_partner_id, V1_type}};
unpack(11016, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_partner_id}};
unpack(11016, cli, _B0) ->
    {V1_atk, _B1} = protocol:uint32(_B0),
    {V1_def_p, _B2} = protocol:uint32(_B1),
    {V1_def_s, _B3} = protocol:uint32(_B2),
    {V1_hp, _B4} = protocol:uint32(_B3),
    {V1_speed, _B5} = protocol:uint32(_B4),
    {V1_hit_rate, _B6} = protocol:uint32(_B5),
    {V1_dodge_rate, _B7} = protocol:uint32(_B6),
    {V1_crit_rate, _B8} = protocol:uint32(_B7),
    {V1_crit_ratio, _B9} = protocol:uint32(_B8),
    {V1_hit_magic, _B10} = protocol:uint32(_B9),
    {V1_dodge_magic, _B11} = protocol:uint32(_B10),
    {V1_def, _B12} = protocol:uint32(_B11),
    {ok,
     {V1_atk, V1_def_p, V1_def_s, V1_hp, V1_speed,
      V1_hit_rate, V1_dodge_rate, V1_crit_rate, V1_crit_ratio,
      V1_hit_magic, V1_dodge_magic, V1_def}};
unpack(11017, srv, _B0) -> {ok, {}};
unpack(11017, cli, _B0) ->
    {V1_num, _B1} = protocol:uint32(_B0), {ok, {V1_num}};
unpack(11019, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_skin_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_partner_id, V1_skin_id}};
unpack(11019, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_partner_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_partner_id}};
unpack(11020, srv, _B0) -> {ok, {}};
unpack(11020, cli, _B0) ->
    {V1_partner_skins, _B5} = protocol:array(_B0,
					     fun (_B1) ->
						     {V2_id, _B2} =
							 protocol:uint32(_B1),
						     {V2_end_time, _B3} =
							 protocol:uint32(_B2),
						     {{V2_id, V2_end_time}, _B3}
					     end),
    {ok, {V1_partner_skins}};
unpack(11025, srv, _B0) -> {ok, {}};
unpack(11025, cli, _B0) ->
    {V1_sort_type, _B1} = protocol:uint8(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {V1_buy_num, _B3} = protocol:uint8(_B2),
    {V1_partners, _B26} = protocol:array(_B3,
					 fun (_B4) ->
						 {V2_partner_id, _B5} =
						     protocol:uint32(_B4),
						 {V2_bid, _B6} =
						     protocol:uint32(_B5),
						 {V2_lev, _B7} =
						     protocol:uint16(_B6),
						 {V2_star, _B8} =
						     protocol:uint8(_B7),
						 {V2_skills, _B13} =
						     protocol:array(_B8,
								    fun (_B9) ->
									    {V3_pos,
									     _B10} =
										protocol:uint8(_B9),
									    {V3_skill_bid,
									     _B11} =
										protocol:uint32(_B10),
									    {{V3_pos,
									      V3_skill_bid},
									     _B11}
								    end),
						 {V2_break_lev, _B14} =
						     protocol:uint8(_B13),
						 {V2_power, _B15} =
						     protocol:uint32(_B14),
						 {V2_is_lock, _B20} =
						     protocol:array(_B15,
								    fun
								      (_B16) ->
									  {V3_lock_type,
									   _B17} =
									      protocol:uint32(_B16),
									  {V3_is_lock,
									   _B18} =
									      protocol:uint8(_B17),
									  {{V3_lock_type,
									    V3_is_lock},
									   _B18}
								    end),
						 {V2_use_skin, _B21} =
						     protocol:uint32(_B20),
						 {V2_end_time, _B22} =
						     protocol:uint32(_B21),
						 {V2_resonate_lev, _B23} =
						     protocol:uint32(_B22),
						 {V2_resonate_break_lev, _B24} =
						     protocol:uint32(_B23),
						 {{V2_partner_id, V2_bid,
						   V2_lev, V2_star, V2_skills,
						   V2_break_lev, V2_power,
						   V2_is_lock, V2_use_skin,
						   V2_end_time, V2_resonate_lev,
						   V2_resonate_break_lev},
						  _B24}
					 end),
    {ok, {V1_sort_type, V1_num, V1_buy_num, V1_partners}};
unpack(11026, srv, _B0) ->
    {V1_partner_ids, _B4} = protocol:array(_B0,
					   fun (_B1) ->
						   {V2_partner_id, _B2} =
						       protocol:uint32(_B1),
						   {V2_partner_id, _B2}
					   end),
    {ok, {V1_partner_ids}};
unpack(11026, cli, _B0) ->
    {V1_partners, _B44} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_partner_id, _B2} =
						     protocol:uint32(_B1),
						 {V2_atk, _B3} =
						     protocol:uint32(_B2),
						 {V2_def_p, _B4} =
						     protocol:uint32(_B3),
						 {V2_def_s, _B5} =
						     protocol:uint32(_B4),
						 {V2_hp, _B6} =
						     protocol:uint32(_B5),
						 {V2_speed, _B7} =
						     protocol:uint32(_B6),
						 {V2_hit_rate, _B8} =
						     protocol:uint32(_B7),
						 {V2_dodge_rate, _B9} =
						     protocol:uint32(_B8),
						 {V2_crit_rate, _B10} =
						     protocol:uint32(_B9),
						 {V2_crit_ratio, _B11} =
						     protocol:uint32(_B10),
						 {V2_hit_magic, _B12} =
						     protocol:uint32(_B11),
						 {V2_dodge_magic, _B13} =
						     protocol:uint32(_B12),
						 {V2_def, _B14} =
						     protocol:uint32(_B13),
						 {V2_eqms, _B20} =
						     protocol:array(_B14,
								    fun
								      (_B15) ->
									  {V3_id,
									   _B16} =
									      protocol:uint32(_B15),
									  {V3_base_id,
									   _B17} =
									      protocol:uint32(_B16),
									  {V3_type,
									   _B18} =
									      protocol:uint32(_B17),
									  {{V3_id,
									    V3_base_id,
									    V3_type},
									   _B18}
								    end),
						 {V2_artifacts, _B42} =
						     protocol:array(_B20,
								    fun
								      (_B21) ->
									  {V3_artifact_pos,
									   _B22} =
									      protocol:uint8(_B21),
									  {V3_id,
									   _B23} =
									      protocol:uint32(_B22),
									  {V3_base_id,
									   _B24} =
									      protocol:uint32(_B23),
									  {V3_enchant,
									   _B25} =
									      protocol:uint32(_B24),
									  {V3_attr,
									   _B30} =
									      protocol:array(_B25,
											     fun
											       (_B26) ->
												   {V4_attr_id,
												    _B27} =
												       protocol:uint32(_B26),
												   {V4_attr_val,
												    _B28} =
												       protocol:uint32(_B27),
												   {{V4_attr_id,
												     V4_attr_val},
												    _B28}
											     end),
									  {V3_extra_attr,
									   _B35} =
									      protocol:array(_B30,
											     fun
											       (_B31) ->
												   {V4_attr_id,
												    _B32} =
												       protocol:uint32(_B31),
												   {V4_attr_val,
												    _B33} =
												       protocol:uint32(_B32),
												   {{V4_attr_id,
												     V4_attr_val},
												    _B33}
											     end),
									  {V3_extra,
									   _B40} =
									      protocol:array(_B35,
											     fun
											       (_B36) ->
												   {V4_extra_k,
												    _B37} =
												       protocol:uint32(_B36),
												   {V4_extra_v,
												    _B38} =
												       protocol:uint32(_B37),
												   {{V4_extra_k,
												     V4_extra_v},
												    _B38}
											     end),
									  {{V3_artifact_pos,
									    V3_id,
									    V3_base_id,
									    V3_enchant,
									    V3_attr,
									    V3_extra_attr,
									    V3_extra},
									   _B40}
								    end),
						 {{V2_partner_id, V2_atk,
						   V2_def_p, V2_def_s, V2_hp,
						   V2_speed, V2_hit_rate,
						   V2_dodge_rate, V2_crit_rate,
						   V2_crit_ratio, V2_hit_magic,
						   V2_dodge_magic, V2_def,
						   V2_eqms, V2_artifacts},
						  _B42}
					 end),
    {ok, {V1_partners}};
unpack(11030, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_pos_id, _B2} = protocol:uint8(_B1),
    {V1_artifact_id, _B3} = protocol:uint32(_B2),
    {V1_type, _B4} = protocol:uint8(_B3),
    {ok,
     {V1_partner_id, V1_pos_id, V1_artifact_id, V1_type}};
unpack(11030, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_partner_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_partner_id}};
unpack(11031, srv, _B0) -> {ok, {}};
unpack(11031, cli, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_power, _B2} = protocol:uint32(_B1),
    {V1_atk, _B3} = protocol:uint32(_B2),
    {V1_def_p, _B4} = protocol:uint32(_B3),
    {V1_def_s, _B5} = protocol:uint32(_B4),
    {V1_hp, _B6} = protocol:uint32(_B5),
    {V1_speed, _B7} = protocol:uint32(_B6),
    {V1_hit_rate, _B8} = protocol:uint32(_B7),
    {V1_dodge_rate, _B9} = protocol:uint32(_B8),
    {V1_crit_rate, _B10} = protocol:uint32(_B9),
    {V1_crit_ratio, _B11} = protocol:uint32(_B10),
    {V1_hit_magic, _B12} = protocol:uint32(_B11),
    {V1_dodge_magic, _B13} = protocol:uint32(_B12),
    {V1_def, _B14} = protocol:uint32(_B13),
    {V1_artifacts, _B36} = protocol:array(_B14,
					  fun (_B15) ->
						  {V2_artifact_pos, _B16} =
						      protocol:uint8(_B15),
						  {V2_id, _B17} =
						      protocol:uint32(_B16),
						  {V2_base_id, _B18} =
						      protocol:uint32(_B17),
						  {V2_enchant, _B19} =
						      protocol:uint32(_B18),
						  {V2_attr, _B24} =
						      protocol:array(_B19,
								     fun
								       (_B20) ->
									   {V3_attr_id,
									    _B21} =
									       protocol:uint32(_B20),
									   {V3_attr_val,
									    _B22} =
									       protocol:uint32(_B21),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B22}
								     end),
						  {V2_extra_attr, _B29} =
						      protocol:array(_B24,
								     fun
								       (_B25) ->
									   {V3_attr_id,
									    _B26} =
									       protocol:uint32(_B25),
									   {V3_attr_val,
									    _B27} =
									       protocol:uint32(_B26),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B27}
								     end),
						  {V2_extra, _B34} =
						      protocol:array(_B29,
								     fun
								       (_B30) ->
									   {V3_extra_k,
									    _B31} =
									       protocol:uint32(_B30),
									   {V3_extra_v,
									    _B32} =
									       protocol:uint32(_B31),
									   {{V3_extra_k,
									     V3_extra_v},
									    _B32}
								     end),
						  {{V2_artifact_pos, V2_id,
						    V2_base_id, V2_enchant,
						    V2_attr, V2_extra_attr,
						    V2_extra},
						   _B34}
					  end),
    {ok,
     {V1_partner_id, V1_power, V1_atk, V1_def_p, V1_def_s,
      V1_hp, V1_speed, V1_hit_rate, V1_dodge_rate,
      V1_crit_rate, V1_crit_ratio, V1_hit_magic,
      V1_dodge_magic, V1_def, V1_artifacts}};
unpack(11032, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_artifact_id, _B2} = protocol:uint32(_B1),
    {V1_expends, _B6} = protocol:array(_B2,
				       fun (_B3) ->
					       {V2_artifact_id, _B4} =
						   protocol:uint32(_B3),
					       {V2_artifact_id, _B4}
				       end),
    {ok, {V1_partner_id, V1_artifact_id, V1_expends}};
unpack(11032, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11033, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_artifact_id, _B2} = protocol:uint32(_B1),
    {V1_skills, _B6} = protocol:array(_B2,
				      fun (_B3) ->
					      {V2_skill_id, _B4} =
						  protocol:uint32(_B3),
					      {V2_skill_id, _B4}
				      end),
    {V1_luck_item, _B7} = protocol:uint8(_B6),
    {ok,
     {V1_partner_id, V1_artifact_id, V1_skills,
      V1_luck_item}};
unpack(11033, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_luck_item, _B3} = protocol:uint8(_B2),
    {ok, {V1_result, V1_msg, V1_luck_item}};
unpack(11034, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_artifact_id, _B2} = protocol:uint32(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {ok, {V1_partner_id, V1_artifact_id, V1_type}};
unpack(11034, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11035, srv, _B0) ->
    {V1_artifact_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_artifact_id}};
unpack(11035, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11036, srv, _B0) ->
    {V1_item_id, _B1} = protocol:uint32(_B0),
    {V1_expends, _B5} = protocol:array(_B1,
				       fun (_B2) ->
					       {V2_artifact_id, _B3} =
						   protocol:uint32(_B2),
					       {V2_artifact_id, _B3}
				       end),
    {ok, {V1_item_id, V1_expends}};
unpack(11036, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_flag, _B3} = protocol:uint8(_B2),
    {ok, {V1_result, V1_msg, V1_flag}};
unpack(11037, srv, _B0) -> {ok, {}};
unpack(11037, cli, _B0) ->
    {V1_lucky, _B1} = protocol:uint32(_B0),
    {ok, {V1_lucky}};
unpack(11038, srv, _B0) -> {ok, {}};
unpack(11038, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11040, srv, _B0) -> {ok, {}};
unpack(11040, cli, _B0) ->
    {V1_partners, _B5} = protocol:array(_B0,
					fun (_B1) ->
						{V2_partner_id, _B2} =
						    protocol:uint32(_B1),
						{V2_max_star, _B3} =
						    protocol:uint8(_B2),
						{{V2_partner_id, V2_max_star},
						 _B3}
					end),
    {V1_all_star, _B6} = protocol:uint32(_B5),
    {V1_lev, _B7} = protocol:uint32(_B6),
    {V1_decompose_partners, _B11} = protocol:array(_B7,
						   fun (_B8) ->
							   {V2_partner_id,
							    _B9} =
							       protocol:uint32(_B8),
							   {V2_partner_id, _B9}
						   end),
    {ok,
     {V1_partners, V1_all_star, V1_lev,
      V1_decompose_partners}};
unpack(11041, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_start, _B2} = protocol:uint8(_B1),
    {V1_num, _B3} = protocol:uint8(_B2),
    {ok, {V1_partner_id, V1_start, V1_num}};
unpack(11041, cli, _B0) ->
    {V1_like, _B1} = protocol:uint8(_B0),
    {V1_like_num, _B2} = protocol:uint32(_B1),
    {V1_partner_comments, _B11} = protocol:array(_B2,
						 fun (_B3) ->
							 {V2_comment_id, _B4} =
							     protocol:uint32(_B3),
							 {V2_name, _B5} =
							     protocol:string(_B4),
							 {V2_msg, _B6} =
							     protocol:string(_B5),
							 {V2_like_num, _B7} =
							     protocol:uint32(_B6),
							 {V2_no_like_num, _B8} =
							     protocol:uint32(_B7),
							 {V2_is_like, _B9} =
							     protocol:uint8(_B8),
							 {{V2_comment_id,
							   V2_name, V2_msg,
							   V2_like_num,
							   V2_no_like_num,
							   V2_is_like},
							  _B9}
						 end),
    {ok, {V1_like, V1_like_num, V1_partner_comments}};
unpack(11042, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_partner_id}};
unpack(11042, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11043, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_partner_id, V1_msg}};
unpack(11043, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11044, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_comment_id, _B2} = protocol:uint32(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {ok, {V1_partner_id, V1_comment_id, V1_type}};
unpack(11044, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {ok, {V1_result, V1_msg, V1_type}};
unpack(11045, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_partner_id}};
unpack(11045, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_partner_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_partner_id}};
unpack(11046, srv, _B0) -> {ok, {}};
unpack(11046, cli, _B0) ->
    {V1_old_star, _B1} = protocol:uint32(_B0),
    {V1_new_star, _B2} = protocol:uint32(_B1),
    {ok, {V1_old_star, V1_new_star}};
unpack(11047, srv, _B0) -> {ok, {}};
unpack(11047, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_lev, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_lev}};
unpack(11048, srv, _B0) -> {ok, {}};
unpack(11048, cli, _B0) ->
    {V1_artifact_ref_count, _B6} = protocol:array(_B0,
						  fun (_B1) ->
							  {V2_type, _B2} =
							      protocol:uint8(_B1),
							  {V2_current, _B3} =
							      protocol:uint32(_B2),
							  {V2_limit, _B4} =
							      protocol:uint32(_B3),
							  {{V2_type, V2_current,
							    V2_limit},
							   _B4}
						  end),
    {ok, {V1_artifact_ref_count}};
unpack(11050, srv, _B0) -> {ok, {}};
unpack(11050, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_lev, _B3} = protocol:uint32(_B2),
    {V1_fields, _B8} = protocol:array(_B3,
				      fun (_B4) ->
					      {V2_pos, _B5} =
						  protocol:uint32(_B4),
					      {V2_partner_id, _B6} =
						  protocol:uint32(_B5),
					      {{V2_pos, V2_partner_id}, _B6}
				      end),
    {ok, {V1_result, V1_msg, V1_lev, V1_fields}};
unpack(11051, srv, _B0) ->
    {V1_fields, _B5} = protocol:array(_B0,
				      fun (_B1) ->
					      {V2_pos, _B2} =
						  protocol:uint32(_B1),
					      {V2_partner_id, _B3} =
						  protocol:uint32(_B2),
					      {{V2_pos, V2_partner_id}, _B3}
				      end),
    {ok, {V1_fields}};
unpack(11051, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11052, srv, _B0) -> {ok, {}};
unpack(11052, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_lev, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_lev}};
unpack(11053, srv, _B0) ->
    {V1_pos, _B1} = protocol:uint8(_B0), {ok, {V1_pos}};
unpack(11053, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_pos, _B3} = protocol:uint8(_B2),
    {ok, {V1_result, V1_msg, V1_pos}};
unpack(11055, srv, _B0) ->
    {V1_is_point, _B1} = protocol:uint8(_B0),
    {ok, {V1_is_point}};
unpack(11055, cli, _B0) -> {ok, {}};
unpack(11056, srv, _B0) -> {ok, {}};
unpack(11056, cli, _B0) ->
    {V1_is_point, _B1} = protocol:uint8(_B0),
    {ok, {V1_is_point}};
unpack(11060, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_channel, _B2} = protocol:uint16(_B1),
    {ok, {V1_partner_id, V1_channel}};
unpack(11060, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11061, srv, _B0) ->
    {V1_r_rid, _B1} = protocol:uint32(_B0),
    {V1_r_srvid, _B2} = protocol:string(_B1),
    {V1_partner_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_r_rid, V1_r_srvid, V1_partner_id}};
unpack(11061, cli, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_bid, _B2} = protocol:uint32(_B1),
    {V1_lev, _B3} = protocol:uint16(_B2),
    {V1_star, _B4} = protocol:uint8(_B3),
    {V1_skills, _B9} = protocol:array(_B4,
				      fun (_B5) ->
					      {V2_pos, _B6} =
						  protocol:uint8(_B5),
					      {V2_skill_bid, _B7} =
						  protocol:uint32(_B6),
					      {{V2_pos, V2_skill_bid}, _B7}
				      end),
    {V1_break_lev, _B10} = protocol:uint8(_B9),
    {V1_power, _B11} = protocol:uint32(_B10),
    {V1_is_lock, _B16} = protocol:array(_B11,
					fun (_B12) ->
						{V2_lock_type, _B13} =
						    protocol:uint32(_B12),
						{V2_is_lock, _B14} =
						    protocol:uint8(_B13),
						{{V2_lock_type, V2_is_lock},
						 _B14}
					end),
    {V1_use_skin, _B17} = protocol:uint32(_B16),
    {V1_end_time, _B18} = protocol:uint32(_B17),
    {V1_resonate_lev, _B19} = protocol:uint32(_B18),
    {V1_resonate_break_lev, _B20} = protocol:uint32(_B19),
    {V1_atk, _B21} = protocol:uint32(_B20),
    {V1_def_p, _B22} = protocol:uint32(_B21),
    {V1_def_s, _B23} = protocol:uint32(_B22),
    {V1_hp, _B24} = protocol:uint32(_B23),
    {V1_speed, _B25} = protocol:uint32(_B24),
    {V1_hit_rate, _B26} = protocol:uint32(_B25),
    {V1_dodge_rate, _B27} = protocol:uint32(_B26),
    {V1_crit_rate, _B28} = protocol:uint32(_B27),
    {V1_crit_ratio, _B29} = protocol:uint32(_B28),
    {V1_hit_magic, _B30} = protocol:uint32(_B29),
    {V1_dodge_magic, _B31} = protocol:uint32(_B30),
    {V1_dam, _B32} = protocol:uint32(_B31),
    {V1_res, _B33} = protocol:uint32(_B32),
    {V1_cure, _B34} = protocol:uint32(_B33),
    {V1_be_cure, _B35} = protocol:uint32(_B34),
    {V1_tenacity, _B36} = protocol:uint32(_B35),
    {V1_def, _B37} = protocol:uint32(_B36),
    {V1_dam_p, _B38} = protocol:uint32(_B37),
    {V1_dam_s, _B39} = protocol:uint32(_B38),
    {V1_res_p, _B40} = protocol:uint32(_B39),
    {V1_res_s, _B41} = protocol:uint32(_B40),
    {V1_atk2, _B42} = protocol:uint32(_B41),
    {V1_hp2, _B43} = protocol:uint32(_B42),
    {V1_def2, _B44} = protocol:uint32(_B43),
    {V1_speed2, _B45} = protocol:uint32(_B44),
    {V1_eqms, _B51} = protocol:array(_B45,
				     fun (_B46) ->
					     {V2_id, _B47} =
						 protocol:uint32(_B46),
					     {V2_base_id, _B48} =
						 protocol:uint32(_B47),
					     {V2_type, _B49} =
						 protocol:uint32(_B48),
					     {{V2_id, V2_base_id, V2_type},
					      _B49}
				     end),
    {V1_artifacts, _B73} = protocol:array(_B51,
					  fun (_B52) ->
						  {V2_artifact_pos, _B53} =
						      protocol:uint8(_B52),
						  {V2_id, _B54} =
						      protocol:uint32(_B53),
						  {V2_base_id, _B55} =
						      protocol:uint32(_B54),
						  {V2_enchant, _B56} =
						      protocol:uint32(_B55),
						  {V2_attr, _B61} =
						      protocol:array(_B56,
								     fun
								       (_B57) ->
									   {V3_attr_id,
									    _B58} =
									       protocol:uint32(_B57),
									   {V3_attr_val,
									    _B59} =
									       protocol:uint32(_B58),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B59}
								     end),
						  {V2_extra_attr, _B66} =
						      protocol:array(_B61,
								     fun
								       (_B62) ->
									   {V3_attr_id,
									    _B63} =
									       protocol:uint32(_B62),
									   {V3_attr_val,
									    _B64} =
									       protocol:uint32(_B63),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B64}
								     end),
						  {V2_extra, _B71} =
						      protocol:array(_B66,
								     fun
								       (_B67) ->
									   {V3_extra_k,
									    _B68} =
									       protocol:uint32(_B67),
									   {V3_extra_v,
									    _B69} =
									       protocol:uint32(_B68),
									   {{V3_extra_k,
									     V3_extra_v},
									    _B69}
								     end),
						  {{V2_artifact_pos, V2_id,
						    V2_base_id, V2_enchant,
						    V2_attr, V2_extra_attr,
						    V2_extra},
						   _B71}
					  end),
    {V1_dower_skill, _B78} = protocol:array(_B73,
					    fun (_B74) ->
						    {V2_pos, _B75} =
							protocol:uint8(_B74),
						    {V2_skill_id, _B76} =
							protocol:uint32(_B75),
						    {{V2_pos, V2_skill_id},
						     _B76}
					    end),
    {V1_ext_data, _B83} = protocol:array(_B78,
					 fun (_B79) ->
						 {V2_id, _B80} =
						     protocol:uint32(_B79),
						 {V2_val, _B81} =
						     protocol:uint32(_B80),
						 {{V2_id, V2_val}, _B81}
					 end),
    {V1_holy_eqm, _B99} = protocol:array(_B83,
					 fun (_B84) ->
						 {V2_id, _B85} =
						     protocol:uint32(_B84),
						 {V2_base_id, _B86} =
						     protocol:uint32(_B85),
						 {V2_main_attr, _B91} =
						     protocol:array(_B86,
								    fun
								      (_B87) ->
									  {V3_attr_id,
									   _B88} =
									      protocol:uint32(_B87),
									  {V3_attr_val,
									   _B89} =
									      protocol:uint32(_B88),
									  {{V3_attr_id,
									    V3_attr_val},
									   _B89}
								    end),
						 {V2_holy_eqm_attr, _B97} =
						     protocol:array(_B91,
								    fun
								      (_B92) ->
									  {V3_pos,
									   _B93} =
									      protocol:uint8(_B92),
									  {V3_attr_id,
									   _B94} =
									      protocol:uint32(_B93),
									  {V3_attr_val,
									   _B95} =
									      protocol:uint32(_B94),
									  {{V3_pos,
									    V3_attr_id,
									    V3_attr_val},
									   _B95}
								    end),
						 {{V2_id, V2_base_id,
						   V2_main_attr,
						   V2_holy_eqm_attr},
						  _B97}
					 end),
    {V1_r_rid, _B100} = protocol:uint32(_B99),
    {V1_r_srvid, _B101} = protocol:string(_B100),
    {ok,
     {V1_partner_id, V1_bid, V1_lev, V1_star, V1_skills,
      V1_break_lev, V1_power, V1_is_lock, V1_use_skin,
      V1_end_time, V1_resonate_lev, V1_resonate_break_lev,
      V1_atk, V1_def_p, V1_def_s, V1_hp, V1_speed,
      V1_hit_rate, V1_dodge_rate, V1_crit_rate, V1_crit_ratio,
      V1_hit_magic, V1_dodge_magic, V1_dam, V1_res, V1_cure,
      V1_be_cure, V1_tenacity, V1_def, V1_dam_p, V1_dam_s,
      V1_res_p, V1_res_s, V1_atk2, V1_hp2, V1_def2, V1_speed2,
      V1_eqms, V1_artifacts, V1_dower_skill, V1_ext_data,
      V1_holy_eqm, V1_r_rid, V1_r_srvid}};
unpack(11062, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_id, V1_srv_id}};
unpack(11062, cli, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_bid, _B2} = protocol:uint32(_B1),
    {V1_lev, _B3} = protocol:uint16(_B2),
    {V1_star, _B4} = protocol:uint8(_B3),
    {V1_skills, _B9} = protocol:array(_B4,
				      fun (_B5) ->
					      {V2_pos, _B6} =
						  protocol:uint8(_B5),
					      {V2_skill_bid, _B7} =
						  protocol:uint32(_B6),
					      {{V2_pos, V2_skill_bid}, _B7}
				      end),
    {V1_break_lev, _B10} = protocol:uint8(_B9),
    {V1_power, _B11} = protocol:uint32(_B10),
    {V1_is_lock, _B16} = protocol:array(_B11,
					fun (_B12) ->
						{V2_lock_type, _B13} =
						    protocol:uint32(_B12),
						{V2_is_lock, _B14} =
						    protocol:uint8(_B13),
						{{V2_lock_type, V2_is_lock},
						 _B14}
					end),
    {V1_use_skin, _B17} = protocol:uint32(_B16),
    {V1_end_time, _B18} = protocol:uint32(_B17),
    {V1_resonate_lev, _B19} = protocol:uint32(_B18),
    {V1_resonate_break_lev, _B20} = protocol:uint32(_B19),
    {V1_atk, _B21} = protocol:uint32(_B20),
    {V1_def_p, _B22} = protocol:uint32(_B21),
    {V1_def_s, _B23} = protocol:uint32(_B22),
    {V1_hp, _B24} = protocol:uint32(_B23),
    {V1_speed, _B25} = protocol:uint32(_B24),
    {V1_hit_rate, _B26} = protocol:uint32(_B25),
    {V1_dodge_rate, _B27} = protocol:uint32(_B26),
    {V1_crit_rate, _B28} = protocol:uint32(_B27),
    {V1_crit_ratio, _B29} = protocol:uint32(_B28),
    {V1_hit_magic, _B30} = protocol:uint32(_B29),
    {V1_dodge_magic, _B31} = protocol:uint32(_B30),
    {V1_dam, _B32} = protocol:uint32(_B31),
    {V1_res, _B33} = protocol:uint32(_B32),
    {V1_cure, _B34} = protocol:uint32(_B33),
    {V1_be_cure, _B35} = protocol:uint32(_B34),
    {V1_tenacity, _B36} = protocol:uint32(_B35),
    {V1_def, _B37} = protocol:uint32(_B36),
    {V1_dam_p, _B38} = protocol:uint32(_B37),
    {V1_dam_s, _B39} = protocol:uint32(_B38),
    {V1_res_p, _B40} = protocol:uint32(_B39),
    {V1_res_s, _B41} = protocol:uint32(_B40),
    {V1_atk2, _B42} = protocol:uint32(_B41),
    {V1_hp2, _B43} = protocol:uint32(_B42),
    {V1_def2, _B44} = protocol:uint32(_B43),
    {V1_speed2, _B45} = protocol:uint32(_B44),
    {V1_eqms, _B51} = protocol:array(_B45,
				     fun (_B46) ->
					     {V2_id, _B47} =
						 protocol:uint32(_B46),
					     {V2_base_id, _B48} =
						 protocol:uint32(_B47),
					     {V2_type, _B49} =
						 protocol:uint32(_B48),
					     {{V2_id, V2_base_id, V2_type},
					      _B49}
				     end),
    {V1_artifacts, _B73} = protocol:array(_B51,
					  fun (_B52) ->
						  {V2_artifact_pos, _B53} =
						      protocol:uint8(_B52),
						  {V2_id, _B54} =
						      protocol:uint32(_B53),
						  {V2_base_id, _B55} =
						      protocol:uint32(_B54),
						  {V2_enchant, _B56} =
						      protocol:uint32(_B55),
						  {V2_attr, _B61} =
						      protocol:array(_B56,
								     fun
								       (_B57) ->
									   {V3_attr_id,
									    _B58} =
									       protocol:uint32(_B57),
									   {V3_attr_val,
									    _B59} =
									       protocol:uint32(_B58),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B59}
								     end),
						  {V2_extra_attr, _B66} =
						      protocol:array(_B61,
								     fun
								       (_B62) ->
									   {V3_attr_id,
									    _B63} =
									       protocol:uint32(_B62),
									   {V3_attr_val,
									    _B64} =
									       protocol:uint32(_B63),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B64}
								     end),
						  {V2_extra, _B71} =
						      protocol:array(_B66,
								     fun
								       (_B67) ->
									   {V3_extra_k,
									    _B68} =
									       protocol:uint32(_B67),
									   {V3_extra_v,
									    _B69} =
									       protocol:uint32(_B68),
									   {{V3_extra_k,
									     V3_extra_v},
									    _B69}
								     end),
						  {{V2_artifact_pos, V2_id,
						    V2_base_id, V2_enchant,
						    V2_attr, V2_extra_attr,
						    V2_extra},
						   _B71}
					  end),
    {V1_dower_skill, _B78} = protocol:array(_B73,
					    fun (_B74) ->
						    {V2_pos, _B75} =
							protocol:uint8(_B74),
						    {V2_skill_id, _B76} =
							protocol:uint32(_B75),
						    {{V2_pos, V2_skill_id},
						     _B76}
					    end),
    {V1_ext_data, _B83} = protocol:array(_B78,
					 fun (_B79) ->
						 {V2_id, _B80} =
						     protocol:uint32(_B79),
						 {V2_val, _B81} =
						     protocol:uint32(_B80),
						 {{V2_id, V2_val}, _B81}
					 end),
    {V1_holy_eqm, _B99} = protocol:array(_B83,
					 fun (_B84) ->
						 {V2_id, _B85} =
						     protocol:uint32(_B84),
						 {V2_base_id, _B86} =
						     protocol:uint32(_B85),
						 {V2_main_attr, _B91} =
						     protocol:array(_B86,
								    fun
								      (_B87) ->
									  {V3_attr_id,
									   _B88} =
									      protocol:uint32(_B87),
									  {V3_attr_val,
									   _B89} =
									      protocol:uint32(_B88),
									  {{V3_attr_id,
									    V3_attr_val},
									   _B89}
								    end),
						 {V2_holy_eqm_attr, _B97} =
						     protocol:array(_B91,
								    fun
								      (_B92) ->
									  {V3_pos,
									   _B93} =
									      protocol:uint8(_B92),
									  {V3_attr_id,
									   _B94} =
									      protocol:uint32(_B93),
									  {V3_attr_val,
									   _B95} =
									      protocol:uint32(_B94),
									  {{V3_pos,
									    V3_attr_id,
									    V3_attr_val},
									   _B95}
								    end),
						 {{V2_id, V2_base_id,
						   V2_main_attr,
						   V2_holy_eqm_attr},
						  _B97}
					 end),
    {V1_r_rid, _B100} = protocol:uint32(_B99),
    {V1_r_srvid, _B101} = protocol:string(_B100),
    {ok,
     {V1_partner_id, V1_bid, V1_lev, V1_star, V1_skills,
      V1_break_lev, V1_power, V1_is_lock, V1_use_skin,
      V1_end_time, V1_resonate_lev, V1_resonate_break_lev,
      V1_atk, V1_def_p, V1_def_s, V1_hp, V1_speed,
      V1_hit_rate, V1_dodge_rate, V1_crit_rate, V1_crit_ratio,
      V1_hit_magic, V1_dodge_magic, V1_dam, V1_res, V1_cure,
      V1_be_cure, V1_tenacity, V1_def, V1_dam_p, V1_dam_s,
      V1_res_p, V1_res_s, V1_atk2, V1_hp2, V1_def2, V1_speed2,
      V1_eqms, V1_artifacts, V1_dower_skill, V1_ext_data,
      V1_holy_eqm, V1_r_rid, V1_r_srvid}};
unpack(11063, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_partner_id}};
unpack(11063, cli, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_atk, _B2} = protocol:uint32(_B1),
    {V1_def_p, _B3} = protocol:uint32(_B2),
    {V1_def_s, _B4} = protocol:uint32(_B3),
    {V1_hp, _B5} = protocol:uint32(_B4),
    {V1_speed, _B6} = protocol:uint32(_B5),
    {V1_hit_rate, _B7} = protocol:uint32(_B6),
    {V1_dodge_rate, _B8} = protocol:uint32(_B7),
    {V1_crit_rate, _B9} = protocol:uint32(_B8),
    {V1_crit_ratio, _B10} = protocol:uint32(_B9),
    {V1_hit_magic, _B11} = protocol:uint32(_B10),
    {V1_dodge_magic, _B12} = protocol:uint32(_B11),
    {V1_dam, _B13} = protocol:uint32(_B12),
    {V1_res, _B14} = protocol:uint32(_B13),
    {V1_cure, _B15} = protocol:uint32(_B14),
    {V1_be_cure, _B16} = protocol:uint32(_B15),
    {V1_tenacity, _B17} = protocol:uint32(_B16),
    {V1_def, _B18} = protocol:uint32(_B17),
    {V1_dam_p, _B19} = protocol:uint32(_B18),
    {V1_dam_s, _B20} = protocol:uint32(_B19),
    {V1_res_p, _B21} = protocol:uint32(_B20),
    {V1_res_s, _B22} = protocol:uint32(_B21),
    {V1_ext_data, _B27} = protocol:array(_B22,
					 fun (_B23) ->
						 {V2_id, _B24} =
						     protocol:uint32(_B23),
						 {V2_val, _B25} =
						     protocol:uint32(_B24),
						 {{V2_id, V2_val}, _B25}
					 end),
    {ok,
     {V1_partner_id, V1_atk, V1_def_p, V1_def_s, V1_hp,
      V1_speed, V1_hit_rate, V1_dodge_rate, V1_crit_rate,
      V1_crit_ratio, V1_hit_magic, V1_dodge_magic, V1_dam,
      V1_res, V1_cure, V1_be_cure, V1_tenacity, V1_def,
      V1_dam_p, V1_dam_s, V1_res_p, V1_res_s, V1_ext_data}};
unpack(11065, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_partner_id}};
unpack(11065, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_list, _B10} = protocol:array(_B2,
				     fun (_B3) ->
					     {V2_is_partner, _B4} =
						 protocol:uint8(_B3),
					     {V2_id, _B5} =
						 protocol:uint32(_B4),
					     {V2_num, _B6} =
						 protocol:uint32(_B5),
					     {V2_star, _B7} =
						 protocol:uint32(_B6),
					     {V2_lev, _B8} =
						 protocol:uint32(_B7),
					     {{V2_is_partner, V2_id, V2_num,
					       V2_star, V2_lev},
					      _B8}
				     end),
    {V1_partner_id, _B11} = protocol:uint32(_B10),
    {ok, {V1_result, V1_msg, V1_list, V1_partner_id}};
unpack(11066, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_partner_id}};
unpack(11066, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_list, _B10} = protocol:array(_B2,
				     fun (_B3) ->
					     {V2_is_partner, _B4} =
						 protocol:uint8(_B3),
					     {V2_id, _B5} =
						 protocol:uint32(_B4),
					     {V2_num, _B6} =
						 protocol:uint32(_B5),
					     {V2_star, _B7} =
						 protocol:uint32(_B6),
					     {V2_lev, _B8} =
						 protocol:uint32(_B7),
					     {{V2_is_partner, V2_id, V2_num,
					       V2_star, V2_lev},
					      _B8}
				     end),
    {ok, {V1_code, V1_msg, V1_list}};
unpack(11067, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_partner_id}};
unpack(11067, cli, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_end_time, _B2} = protocol:uint32(_B1),
    {V1_day_num, _B3} = protocol:uint8(_B2),
    {ok, {V1_partner_id, V1_end_time, V1_day_num}};
unpack(11068, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_partner_id}};
unpack(11068, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(11070, srv, _B0) ->
    {V1_partner_bid, _B1} = protocol:uint32(_B0),
    {ok, {V1_partner_bid}};
unpack(11070, cli, _B0) ->
    {V1_partner_bid, _B1} = protocol:uint32(_B0),
    {V1_partner_score, _B6} = protocol:array(_B1,
					     fun (_B2) ->
						     {V2_id_2, _B3} =
							 protocol:uint8(_B2),
						     {V2_val, _B4} =
							 protocol:uint32(_B3),
						     {{V2_id_2, V2_val}, _B4}
					     end),
    {V1_stronger_partner_score, _B11} = protocol:array(_B6,
						       fun (_B7) ->
							       {V2_id_2, _B8} =
								   protocol:uint8(_B7),
							       {V2_val, _B9} =
								   protocol:uint32(_B8),
							       {{V2_id_2,
								 V2_val},
								_B9}
						       end),
    {ok,
     {V1_partner_bid, V1_partner_score,
      V1_stronger_partner_score}};
unpack(11071, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_partner_id}};
unpack(11071, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11072, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_partner_id}};
unpack(11072, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_list, _B7} = protocol:array(_B2,
				    fun (_B3) ->
					    {V2_id, _B4} = protocol:uint32(_B3),
					    {V2_num, _B5} =
						protocol:uint32(_B4),
					    {{V2_id, V2_num}, _B5}
				    end),
    {ok, {V1_code, V1_msg, V1_list}};
unpack(11073, srv, _B0) -> {ok, {}};
unpack(11073, cli, _B0) ->
    {V1_partners, _B72} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_partner_id, _B2} =
						     protocol:uint32(_B1),
						 {V2_bid, _B3} =
						     protocol:uint32(_B2),
						 {V2_lev, _B4} =
						     protocol:uint16(_B3),
						 {V2_star, _B5} =
						     protocol:uint8(_B4),
						 {V2_skills, _B10} =
						     protocol:array(_B5,
								    fun (_B6) ->
									    {V3_pos,
									     _B7} =
										protocol:uint8(_B6),
									    {V3_skill_bid,
									     _B8} =
										protocol:uint32(_B7),
									    {{V3_pos,
									      V3_skill_bid},
									     _B8}
								    end),
						 {V2_break_lev, _B11} =
						     protocol:uint8(_B10),
						 {V2_power, _B12} =
						     protocol:uint32(_B11),
						 {V2_is_lock, _B17} =
						     protocol:array(_B12,
								    fun
								      (_B13) ->
									  {V3_lock_type,
									   _B14} =
									      protocol:uint32(_B13),
									  {V3_is_lock,
									   _B15} =
									      protocol:uint8(_B14),
									  {{V3_lock_type,
									    V3_is_lock},
									   _B15}
								    end),
						 {V2_use_skin, _B18} =
						     protocol:uint32(_B17),
						 {V2_end_time, _B19} =
						     protocol:uint32(_B18),
						 {V2_resonate_lev, _B20} =
						     protocol:uint32(_B19),
						 {V2_resonate_break_lev, _B21} =
						     protocol:uint32(_B20),
						 {V2_atk, _B22} =
						     protocol:uint32(_B21),
						 {V2_def_p, _B23} =
						     protocol:uint32(_B22),
						 {V2_def_s, _B24} =
						     protocol:uint32(_B23),
						 {V2_hp, _B25} =
						     protocol:uint32(_B24),
						 {V2_speed, _B26} =
						     protocol:uint32(_B25),
						 {V2_hit_rate, _B27} =
						     protocol:uint32(_B26),
						 {V2_dodge_rate, _B28} =
						     protocol:uint32(_B27),
						 {V2_crit_rate, _B29} =
						     protocol:uint32(_B28),
						 {V2_crit_ratio, _B30} =
						     protocol:uint32(_B29),
						 {V2_hit_magic, _B31} =
						     protocol:uint32(_B30),
						 {V2_dodge_magic, _B32} =
						     protocol:uint32(_B31),
						 {V2_def, _B33} =
						     protocol:uint32(_B32),
						 {V2_atk2, _B34} =
						     protocol:uint32(_B33),
						 {V2_hp2, _B35} =
						     protocol:uint32(_B34),
						 {V2_def2, _B36} =
						     protocol:uint32(_B35),
						 {V2_speed2, _B37} =
						     protocol:uint32(_B36),
						 {V2_eqms, _B43} =
						     protocol:array(_B37,
								    fun
								      (_B38) ->
									  {V3_id,
									   _B39} =
									      protocol:uint32(_B38),
									  {V3_base_id,
									   _B40} =
									      protocol:uint32(_B39),
									  {V3_type,
									   _B41} =
									      protocol:uint32(_B40),
									  {{V3_id,
									    V3_base_id,
									    V3_type},
									   _B41}
								    end),
						 {V2_artifacts, _B65} =
						     protocol:array(_B43,
								    fun
								      (_B44) ->
									  {V3_artifact_pos,
									   _B45} =
									      protocol:uint8(_B44),
									  {V3_id,
									   _B46} =
									      protocol:uint32(_B45),
									  {V3_base_id,
									   _B47} =
									      protocol:uint32(_B46),
									  {V3_enchant,
									   _B48} =
									      protocol:uint32(_B47),
									  {V3_attr,
									   _B53} =
									      protocol:array(_B48,
											     fun
											       (_B49) ->
												   {V4_attr_id,
												    _B50} =
												       protocol:uint32(_B49),
												   {V4_attr_val,
												    _B51} =
												       protocol:uint32(_B50),
												   {{V4_attr_id,
												     V4_attr_val},
												    _B51}
											     end),
									  {V3_extra_attr,
									   _B58} =
									      protocol:array(_B53,
											     fun
											       (_B54) ->
												   {V4_attr_id,
												    _B55} =
												       protocol:uint32(_B54),
												   {V4_attr_val,
												    _B56} =
												       protocol:uint32(_B55),
												   {{V4_attr_id,
												     V4_attr_val},
												    _B56}
											     end),
									  {V3_extra,
									   _B63} =
									      protocol:array(_B58,
											     fun
											       (_B59) ->
												   {V4_extra_k,
												    _B60} =
												       protocol:uint32(_B59),
												   {V4_extra_v,
												    _B61} =
												       protocol:uint32(_B60),
												   {{V4_extra_k,
												     V4_extra_v},
												    _B61}
											     end),
									  {{V3_artifact_pos,
									    V3_id,
									    V3_base_id,
									    V3_enchant,
									    V3_attr,
									    V3_extra_attr,
									    V3_extra},
									   _B63}
								    end),
						 {V2_dower_skill, _B70} =
						     protocol:array(_B65,
								    fun
								      (_B66) ->
									  {V3_pos,
									   _B67} =
									      protocol:uint8(_B66),
									  {V3_skill_id,
									   _B68} =
									      protocol:uint32(_B67),
									  {{V3_pos,
									    V3_skill_id},
									   _B68}
								    end),
						 {{V2_partner_id, V2_bid,
						   V2_lev, V2_star, V2_skills,
						   V2_break_lev, V2_power,
						   V2_is_lock, V2_use_skin,
						   V2_end_time, V2_resonate_lev,
						   V2_resonate_break_lev,
						   V2_atk, V2_def_p, V2_def_s,
						   V2_hp, V2_speed, V2_hit_rate,
						   V2_dodge_rate, V2_crit_rate,
						   V2_crit_ratio, V2_hit_magic,
						   V2_dodge_magic, V2_def,
						   V2_atk2, V2_hp2, V2_def2,
						   V2_speed2, V2_eqms,
						   V2_artifacts,
						   V2_dower_skill},
						  _B70}
					 end),
    {ok, {V1_partners}};
unpack(11074, srv, _B0) ->
    {V1_list, _B4} = protocol:array(_B0,
				    fun (_B1) ->
					    {V2_skin_ids, _B2} =
						protocol:uint32(_B1),
					    {V2_skin_ids, _B2}
				    end),
    {ok, {V1_list}};
unpack(11074, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11075, srv, _B0) ->
    {V1_list, _B4} = protocol:array(_B0,
				    fun (_B1) ->
					    {V2_partner_id, _B2} =
						protocol:uint32(_B1),
					    {V2_partner_id, _B2}
				    end),
    {ok, {V1_list}};
unpack(11075, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_list, _B7} = protocol:array(_B2,
				    fun (_B3) ->
					    {V2_id, _B4} = protocol:uint32(_B3),
					    {V2_num, _B5} =
						protocol:uint32(_B4),
					    {{V2_id, V2_num}, _B5}
				    end),
    {ok, {V1_code, V1_msg, V1_list}};
unpack(11076, srv, _B0) ->
    {V1_list, _B4} = protocol:array(_B0,
				    fun (_B1) ->
					    {V2_partner_id, _B2} =
						protocol:uint32(_B1),
					    {V2_partner_id, _B2}
				    end),
    {ok, {V1_list}};
unpack(11076, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_list, _B6} = protocol:array(_B2,
				    fun (_B3) ->
					    {V2_partner_id, _B4} =
						protocol:uint32(_B3),
					    {V2_partner_id, _B4}
				    end),
    {ok, {V1_code, V1_msg, V1_list}};
unpack(11077, srv, _B0) ->
    {V1_partner_bid, _B1} = protocol:uint32(_B0),
    {ok, {V1_partner_bid}};
unpack(11077, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_partner_bid, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_partner_bid}};
unpack(11078, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_flag}};
unpack(11078, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_id}};
unpack(11079, srv, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_base_id, V1_num}};
unpack(11079, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_coin, _B2} = protocol:uint32(_B1),
    {V1_list, _B7} = protocol:array(_B2,
				    fun (_B3) ->
					    {V2_bid, _B4} =
						protocol:uint32(_B3),
					    {V2_num, _B5} =
						protocol:uint16(_B4),
					    {{V2_bid, V2_num}, _B5}
				    end),
    {ok, {V1_type, V1_coin, V1_list}};
unpack(11080, srv, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_base_id, V1_num}};
unpack(11080, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11081, srv, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_base_id, V1_num}};
unpack(11081, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11082, srv, _B0) -> {ok, {}};
unpack(11082, cli, _B0) ->
    {V1_logs, _B10} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_items, _B6} =
						 protocol:array(_B1,
								fun (_B2) ->
									{V3_bid,
									 _B3} =
									    protocol:uint32(_B2),
									{V3_num,
									 _B4} =
									    protocol:uint16(_B3),
									{{V3_bid,
									  V3_num},
									 _B4}
								end),
					     {V2_time, _B7} =
						 protocol:uint32(_B6),
					     {V2_coin, _B8} =
						 protocol:uint32(_B7),
					     {{V2_items, V2_time, V2_coin}, _B8}
				     end),
    {ok, {V1_logs}};
unpack(11083, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_item_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_partner_id, V1_item_id}};
unpack(11083, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_partner_id, _B3} = protocol:uint32(_B2),
    {V1_item_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_result, V1_msg, V1_partner_id, V1_item_id}};
unpack(11085, srv, _B0) -> {ok, {}};
unpack(11085, cli, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_old_star, _B2} = protocol:uint32(_B1),
    {V1_new_star, _B3} = protocol:uint32(_B2),
    {ok, {V1_partner_id, V1_old_star, V1_new_star}};
unpack(11086, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_partner_id}};
unpack(11086, cli, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_power, _B2} = protocol:uint32(_B1),
    {V1_atk, _B3} = protocol:uint32(_B2),
    {V1_def_p, _B4} = protocol:uint32(_B3),
    {V1_def_s, _B5} = protocol:uint32(_B4),
    {V1_hp, _B6} = protocol:uint32(_B5),
    {V1_speed, _B7} = protocol:uint32(_B6),
    {V1_hit_rate, _B8} = protocol:uint32(_B7),
    {V1_dodge_rate, _B9} = protocol:uint32(_B8),
    {V1_crit_rate, _B10} = protocol:uint32(_B9),
    {V1_crit_ratio, _B11} = protocol:uint32(_B10),
    {V1_hit_magic, _B12} = protocol:uint32(_B11),
    {V1_dodge_magic, _B13} = protocol:uint32(_B12),
    {V1_dam, _B14} = protocol:uint32(_B13),
    {V1_res, _B15} = protocol:uint32(_B14),
    {V1_cure, _B16} = protocol:uint32(_B15),
    {V1_be_cure, _B17} = protocol:uint32(_B16),
    {V1_tenacity, _B18} = protocol:uint32(_B17),
    {V1_def, _B19} = protocol:uint32(_B18),
    {V1_dam_p, _B20} = protocol:uint32(_B19),
    {V1_dam_s, _B21} = protocol:uint32(_B20),
    {V1_res_p, _B22} = protocol:uint32(_B21),
    {V1_res_s, _B23} = protocol:uint32(_B22),
    {ok,
     {V1_partner_id, V1_power, V1_atk, V1_def_p, V1_def_s,
      V1_hp, V1_speed, V1_hit_rate, V1_dodge_rate,
      V1_crit_rate, V1_crit_ratio, V1_hit_magic,
      V1_dodge_magic, V1_dam, V1_res, V1_cure, V1_be_cure,
      V1_tenacity, V1_def, V1_dam_p, V1_dam_s, V1_res_p,
      V1_res_s}};
unpack(11087, srv, _B0) ->
    {V1_list, _B4} = protocol:array(_B0,
				    fun (_B1) ->
					    {V2_partner_id, _B2} =
						protocol:uint32(_B1),
					    {V2_partner_id, _B2}
				    end),
    {ok, {V1_list}};
unpack(11087, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_list, _B7} = protocol:array(_B2,
				    fun (_B3) ->
					    {V2_id, _B4} = protocol:uint32(_B3),
					    {V2_num, _B5} =
						protocol:uint32(_B4),
					    {{V2_id, V2_num}, _B5}
				    end),
    {ok, {V1_code, V1_msg, V1_list}};
unpack(11088, srv, _B0) ->
    {V1_item_ids, _B4} = protocol:array(_B0,
					fun (_B1) ->
						{V2_item_id, _B2} =
						    protocol:uint32(_B1),
						{V2_item_id, _B2}
					end),
    {ok, {V1_item_ids}};
unpack(11088, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_list, _B7} = protocol:array(_B2,
				    fun (_B3) ->
					    {V2_id, _B4} = protocol:uint32(_B3),
					    {V2_num, _B5} =
						protocol:uint32(_B4),
					    {{V2_id, V2_num}, _B5}
				    end),
    {ok, {V1_code, V1_msg, V1_list}};
unpack(11089, srv, _B0) ->
    {V1_item_ids, _B4} = protocol:array(_B0,
					fun (_B1) ->
						{V2_item_id, _B2} =
						    protocol:uint32(_B1),
						{V2_item_id, _B2}
					end),
    {ok, {V1_item_ids}};
unpack(11089, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(11090, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_holy_eqm_id, _B2} = protocol:uint32(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {ok, {V1_partner_id, V1_holy_eqm_id, V1_type}};
unpack(11090, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11091, srv, _B0) -> {ok, {}};
unpack(11091, cli, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_power, _B2} = protocol:uint32(_B1),
    {V1_atk, _B3} = protocol:uint32(_B2),
    {V1_def_p, _B4} = protocol:uint32(_B3),
    {V1_def_s, _B5} = protocol:uint32(_B4),
    {V1_hp, _B6} = protocol:uint32(_B5),
    {V1_speed, _B7} = protocol:uint32(_B6),
    {V1_hit_rate, _B8} = protocol:uint32(_B7),
    {V1_dodge_rate, _B9} = protocol:uint32(_B8),
    {V1_crit_rate, _B10} = protocol:uint32(_B9),
    {V1_crit_ratio, _B11} = protocol:uint32(_B10),
    {V1_hit_magic, _B12} = protocol:uint32(_B11),
    {V1_dodge_magic, _B13} = protocol:uint32(_B12),
    {V1_dam, _B14} = protocol:uint32(_B13),
    {V1_res, _B15} = protocol:uint32(_B14),
    {V1_cure, _B16} = protocol:uint32(_B15),
    {V1_be_cure, _B17} = protocol:uint32(_B16),
    {V1_tenacity, _B18} = protocol:uint32(_B17),
    {V1_def, _B19} = protocol:uint32(_B18),
    {V1_dam_p, _B20} = protocol:uint32(_B19),
    {V1_dam_s, _B21} = protocol:uint32(_B20),
    {V1_res_p, _B22} = protocol:uint32(_B21),
    {V1_res_s, _B23} = protocol:uint32(_B22),
    {V1_holy_eqm, _B44} = protocol:array(_B23,
					 fun (_B24) ->
						 {V2_id, _B25} =
						     protocol:uint32(_B24),
						 {V2_base_id, _B26} =
						     protocol:uint32(_B25),
						 {V2_main_attr, _B31} =
						     protocol:array(_B26,
								    fun
								      (_B27) ->
									  {V3_attr_id,
									   _B28} =
									      protocol:uint32(_B27),
									  {V3_attr_val,
									   _B29} =
									      protocol:uint32(_B28),
									  {{V3_attr_id,
									    V3_attr_val},
									   _B29}
								    end),
						 {V2_holy_eqm_attr, _B37} =
						     protocol:array(_B31,
								    fun
								      (_B32) ->
									  {V3_pos,
									   _B33} =
									      protocol:uint8(_B32),
									  {V3_attr_id,
									   _B34} =
									      protocol:uint32(_B33),
									  {V3_attr_val,
									   _B35} =
									      protocol:uint32(_B34),
									  {{V3_pos,
									    V3_attr_id,
									    V3_attr_val},
									   _B35}
								    end),
						 {V2_extra, _B42} =
						     protocol:array(_B37,
								    fun
								      (_B38) ->
									  {V3_extra_k,
									   _B39} =
									      protocol:uint32(_B38),
									  {V3_extra_v,
									   _B40} =
									      protocol:uint32(_B39),
									  {{V3_extra_k,
									    V3_extra_v},
									   _B40}
								    end),
						 {{V2_id, V2_base_id,
						   V2_main_attr,
						   V2_holy_eqm_attr, V2_extra},
						  _B42}
					 end),
    {ok,
     {V1_partner_id, V1_power, V1_atk, V1_def_p, V1_def_s,
      V1_hp, V1_speed, V1_hit_rate, V1_dodge_rate,
      V1_crit_rate, V1_crit_ratio, V1_hit_magic,
      V1_dodge_magic, V1_dam, V1_res, V1_cure, V1_be_cure,
      V1_tenacity, V1_def, V1_dam_p, V1_dam_s, V1_res_p,
      V1_res_s, V1_holy_eqm}};
unpack(11092, srv, _B0) ->
    {V1_partner_ids, _B4} = protocol:array(_B0,
					   fun (_B1) ->
						   {V2_partner_id, _B2} =
						       protocol:uint32(_B1),
						   {V2_partner_id, _B2}
					   end),
    {ok, {V1_partner_ids}};
unpack(11092, cli, _B0) ->
    {V1_partner_ids, _B25} = protocol:array(_B0,
					    fun (_B1) ->
						    {V2_partner_id, _B2} =
							protocol:uint32(_B1),
						    {V2_holy_eqm, _B23} =
							protocol:array(_B2,
								       fun
									 (_B3) ->
									     {V3_id,
									      _B4} =
										 protocol:uint32(_B3),
									     {V3_base_id,
									      _B5} =
										 protocol:uint32(_B4),
									     {V3_main_attr,
									      _B10} =
										 protocol:array(_B5,
												fun
												  (_B6) ->
												      {V4_attr_id,
												       _B7} =
													  protocol:uint32(_B6),
												      {V4_attr_val,
												       _B8} =
													  protocol:uint32(_B7),
												      {{V4_attr_id,
													V4_attr_val},
												       _B8}
												end),
									     {V3_holy_eqm_attr,
									      _B16} =
										 protocol:array(_B10,
												fun
												  (_B11) ->
												      {V4_pos,
												       _B12} =
													  protocol:uint8(_B11),
												      {V4_attr_id,
												       _B13} =
													  protocol:uint32(_B12),
												      {V4_attr_val,
												       _B14} =
													  protocol:uint32(_B13),
												      {{V4_pos,
													V4_attr_id,
													V4_attr_val},
												       _B14}
												end),
									     {V3_extra,
									      _B21} =
										 protocol:array(_B16,
												fun
												  (_B17) ->
												      {V4_extra_k,
												       _B18} =
													  protocol:uint32(_B17),
												      {V4_extra_v,
												       _B19} =
													  protocol:uint32(_B18),
												      {{V4_extra_k,
													V4_extra_v},
												       _B19}
												end),
									     {{V3_id,
									       V3_base_id,
									       V3_main_attr,
									       V3_holy_eqm_attr,
									       V3_extra},
									      _B21}
								       end),
						    {{V2_partner_id,
						      V2_holy_eqm},
						     _B23}
					    end),
    {ok, {V1_partner_ids}};
unpack(11093, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_holy_eqm_id, _B2} = protocol:uint32(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {ok, {V1_partner_id, V1_holy_eqm_id, V1_type}};
unpack(11093, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11094, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_holy_eqm_id, _B2} = protocol:uint32(_B1),
    {V1_pos, _B6} = protocol:array(_B2,
				   fun (_B3) ->
					   {V2_pos, _B4} = protocol:uint8(_B3),
					   {V2_pos, _B4}
				   end),
    {ok, {V1_partner_id, V1_holy_eqm_id, V1_pos}};
unpack(11094, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11095, srv, _B0) -> {ok, {}};
unpack(11095, cli, _B0) ->
    {V1_partner_bid, _B1} = protocol:uint32(_B0),
    {V1_is_chips, _B2} = protocol:uint8(_B1),
    {V1_init_star, _B3} = protocol:uint8(_B2),
    {V1_status, _B4} = protocol:uint8(_B3),
    {ok,
     {V1_partner_bid, V1_is_chips, V1_init_star, V1_status}};
unpack(11096, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_pos, _B2} = protocol:uint8(_B1),
    {V1_skill_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_partner_id, V1_pos, V1_skill_id}};
unpack(11096, cli, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_result, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {V1_dower_skill, _B8} = protocol:array(_B3,
					   fun (_B4) ->
						   {V2_pos, _B5} =
						       protocol:uint8(_B4),
						   {V2_skill_id, _B6} =
						       protocol:uint32(_B5),
						   {{V2_pos, V2_skill_id}, _B6}
					   end),
    {ok,
     {V1_partner_id, V1_result, V1_msg, V1_dower_skill}};
unpack(11097, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_pos, _B2} = protocol:uint8(_B1),
    {ok, {V1_partner_id, V1_pos}};
unpack(11097, cli, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_result, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {V1_dower_skill, _B8} = protocol:array(_B3,
					   fun (_B4) ->
						   {V2_pos, _B5} =
						       protocol:uint8(_B4),
						   {V2_skill_id, _B6} =
						       protocol:uint32(_B5),
						   {{V2_pos, V2_skill_id}, _B6}
					   end),
    {ok,
     {V1_partner_id, V1_result, V1_msg, V1_dower_skill}};
unpack(11098, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_pos, _B2} = protocol:uint8(_B1),
    {ok, {V1_partner_id, V1_pos}};
unpack(11098, cli, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_result, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {V1_dower_skill, _B8} = protocol:array(_B3,
					   fun (_B4) ->
						   {V2_pos, _B5} =
						       protocol:uint8(_B4),
						   {V2_skill_id, _B6} =
						       protocol:uint32(_B5),
						   {{V2_pos, V2_skill_id}, _B6}
					   end),
    {ok,
     {V1_partner_id, V1_result, V1_msg, V1_dower_skill}};
unpack(11099, srv, _B0) ->
    {V1_partner_ids, _B4} = protocol:array(_B0,
					   fun (_B1) ->
						   {V2_partner_id, _B2} =
						       protocol:uint32(_B1),
						   {V2_partner_id, _B2}
					   end),
    {ok, {V1_partner_ids}};
unpack(11099, cli, _B0) ->
    {V1_partner_ids, _B9} = protocol:array(_B0,
					   fun (_B1) ->
						   {V2_partner_id, _B2} =
						       protocol:uint32(_B1),
						   {V2_dower_skill, _B7} =
						       protocol:array(_B2,
								      fun
									(_B3) ->
									    {V3_pos,
									     _B4} =
										protocol:uint8(_B3),
									    {V3_skill_id,
									     _B5} =
										protocol:uint32(_B4),
									    {{V3_pos,
									      V3_skill_id},
									     _B5}
								      end),
						   {{V2_partner_id,
						     V2_dower_skill},
						    _B7}
					   end),
    {ok, {V1_partner_ids}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


