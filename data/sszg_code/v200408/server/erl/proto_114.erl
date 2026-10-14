-file("src/proto/proto_114.erl", 1).

-module(proto_114).

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
		{formation_attr_data,
		 [type, lev, expend, attr_1, attr_2, attr_3, attr_4,
		  attr_5, attr_6, attr_7, attr_8, attr_9, power]},
		{formation_data,
		 [type, pos, need_lev, name, need_items, restrain_s,
		  restrain_w]},
		{formation_info_p, [id, name, power, pos_info]},
		{pk_formation_info,
		 [id, name, formation, ffor_target, power, is_ready,
		  guild_name, lev, face_id, pid]},
		{formation_fight_info, [pos, fight_pos, id]},
		{formation_base_p,
		 [id, lev, exp, pos_info, formation_list, power,
		  hallows_id, all_lineups]},
		{formation_pos, [pos, id]},
		{formation_lineup,
		 [id, name, power, pos_info, max_power, type,
		  hallows_id]},
		{formation_sys, [id, type, pos_info, hallows_id]},
		{m_formation,
		 [ver, list, use_lineup, all_lineups, sys_formations]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/formation.hrl", 1).

-record(m_formation,
	{ver = 1, list = [], use_lineup = 1, all_lineups = [],
	 sys_formations = []}).

-record(formation_sys,
	{id = 1, type = 1, pos_info = [], hallows_id = 0}).

-record(formation_lineup,
	{id = 1, name = <<>>, power = 0, pos_info = [],
	 max_power = 0, type = 1, hallows_id = 0}).

-record(formation_pos, {pos, id = 0}).

-record(formation_base_p,
	{id, lev, exp, pos_info, formation_list, power,
	 hallows_id = 0, all_lineups}).

-record(formation_fight_info, {pos, fight_pos, id = 0}).

-record(pk_formation_info,
	{id, name, formation, ffor_target, power,
	 is_ready = false, guild_name = <<>>, lev = 0, face_id,
	 pid = none}).

-record(formation_info_p,
	{id = 0, name = <<>>, power = 0, pos_info = []}).

-record(formation_data,
	{type, pos, need_lev, name, need_items = [],
	 restrain_s = [], restrain_w = []}).

-record(formation_attr_data,
	{type, lev, expend = [], attr_1 = [], attr_2 = [],
	 attr_3 = [], attr_4 = [], attr_5 = [], attr_6 = [],
	 attr_7 = [], attr_8 = [], attr_9 = [], power}).

-file("src/proto/proto_114.erl", 16).

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

-file("src/proto/proto_114.erl", 17).

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

-file("src/proto/proto_114.erl", 18).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(11300, cli, {}) -> {ok, <<2:32, 11300:16>>};
pack(11300, srv, {V0_star, V0_fetters}) ->
    D_a_t_a = <<(length(V0_star)):16,
		(list_to_binary([<<V1_set_id:32, V1_lev:32,
				   V1_break_lev:32, (length(V1_add_attr)):16,
				   (list_to_binary([<<V2_career:8,
						      (length(V2_attr)):16,
						      (list_to_binary([<<V3_attr_id:32,
									 V3_attr_val:32>>
								       || {V3_attr_id,
									   V3_attr_val}
									      <- V2_attr]))/binary>>
						    || {V2_career, V2_attr}
							   <- V1_add_attr]))/binary,
				   V1_set_skill_id:32, (length(V1_natals)):16,
				   (list_to_binary([<<V2_id:32, V2_base_id:32,
						      V2_type:32,
						      V2_enchant:32>>
						    || #item{id = V2_id,
							     base_id =
								 V2_base_id,
							     type = V2_type,
							     enchant =
								 V2_enchant}
							   <- V1_natals]))/binary>>
				 || #star{set_id = V1_set_id, lev = V1_lev,
					  break_lev = V1_break_lev,
					  add_attr = V1_add_attr,
					  set_skill_id = V1_set_skill_id,
					  natals = V1_natals}
					<- V0_star]))/binary,
		(length(V0_fetters)):16,
		(list_to_binary([<<V1_set_id:32, V1_pos_id:32,
				   V1_partner_id:32>>
				 || {V1_set_id, V1_pos_id, V1_partner_id}
					<- V0_fetters]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11300:16,
       D_a_t_a/binary>>};
pack(11301, cli, {}) -> {ok, <<2:32, 11301:16>>};
pack(11301, srv,
     {#star{set_id = V0_set_id, lev = V0_lev,
	    break_lev = V0_break_lev, add_attr = V0_add_attr,
	    set_skill_id = V0_set_skill_id, natals = V0_natals}}) ->
    D_a_t_a = <<V0_set_id:32, V0_lev:32, V0_break_lev:32,
		(length(V0_add_attr)):16,
		(list_to_binary([<<V1_career:8, (length(V1_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_attr]))/binary>>
				 || {V1_career, V1_attr}
					<- V0_add_attr]))/binary,
		V0_set_skill_id:32, (length(V0_natals)):16,
		(list_to_binary([<<V1_id:32, V1_base_id:32, V1_type:32,
				   V1_enchant:32>>
				 || #item{id = V1_id, base_id = V1_base_id,
					  type = V1_type, enchant = V1_enchant}
					<- V0_natals]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11301:16,
       D_a_t_a/binary>>};
pack(11302, cli,
     {V0_set_id, V0_pos_id, V0_partner_id}) ->
    D_a_t_a = <<V0_set_id:32, V0_pos_id:32,
		V0_partner_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11302:16,
       D_a_t_a/binary>>};
pack(11302, srv,
     {V0_result, V0_msg, V0_old_set_id, V0_fetter}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_old_set_id:32, (length(V0_fetter)):16,
		(list_to_binary([<<V1_set_id:32, V1_pos_id:32,
				   V1_partner_id:32>>
				 || {V1_set_id, V1_pos_id, V1_partner_id}
					<- V0_fetter]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11302:16,
       D_a_t_a/binary>>};
pack(11303, cli,
     {V0_set_id, V0_pos_id, V0_partner_id}) ->
    D_a_t_a = <<V0_set_id:32, V0_pos_id:32,
		V0_partner_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11303:16,
       D_a_t_a/binary>>};
pack(11303, srv,
     {V0_result, V0_msg, V0_old_set_id, V0_fetter}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_old_set_id:32, (length(V0_fetter)):16,
		(list_to_binary([<<V1_set_id:32, V1_pos_id:32,
				   V1_partner_id:32>>
				 || {V1_set_id, V1_pos_id, V1_partner_id}
					<- V0_fetter]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11303:16,
       D_a_t_a/binary>>};
pack(11304, cli, {V0_set_id, V0_id}) ->
    D_a_t_a = <<V0_set_id:32, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11304:16,
       D_a_t_a/binary>>};
pack(11304, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11304:16,
       D_a_t_a/binary>>};
pack(11305, cli, {V0_set_id, V0_id}) ->
    D_a_t_a = <<V0_set_id:32, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11305:16,
       D_a_t_a/binary>>};
pack(11305, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11305:16,
       D_a_t_a/binary>>};
pack(11306, cli, {V0_id, V0_set_id}) ->
    D_a_t_a = <<V0_id:32, V0_set_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11306:16,
       D_a_t_a/binary>>};
pack(11306, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11306:16,
       D_a_t_a/binary>>};
pack(11307, cli, {V0_set_id}) ->
    D_a_t_a = <<V0_set_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11307:16,
       D_a_t_a/binary>>};
pack(11307, srv, {V0_result, V0_msg, V0_fetter}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_fetter)):16,
		(list_to_binary([<<V1_set_id:32, V1_pos_id:32,
				   V1_partner_id:32>>
				 || {V1_set_id, V1_pos_id, V1_partner_id}
					<- V0_fetter]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11307:16,
       D_a_t_a/binary>>};
pack(11308, cli, {}) -> {ok, <<2:32, 11308:16>>};
pack(11308, srv, {V0_star, V0_fetters}) ->
    D_a_t_a = <<(length(V0_star)):16,
		(list_to_binary([<<V1_set_id:32, V1_lev:32,
				   V1_break_lev:32, (length(V1_add_attr)):16,
				   (list_to_binary([<<V2_career:8,
						      (length(V2_attr)):16,
						      (list_to_binary([<<V3_attr_id:32,
									 V3_attr_val:32>>
								       || {V3_attr_id,
									   V3_attr_val}
									      <- V2_attr]))/binary>>
						    || {V2_career, V2_attr}
							   <- V1_add_attr]))/binary,
				   V1_set_skill_id:32, (length(V1_natals)):16,
				   (list_to_binary([<<V2_id:32, V2_base_id:32,
						      V2_type:32,
						      V2_enchant:32>>
						    || #item{id = V2_id,
							     base_id =
								 V2_base_id,
							     type = V2_type,
							     enchant =
								 V2_enchant}
							   <- V1_natals]))/binary>>
				 || #star{set_id = V1_set_id, lev = V1_lev,
					  break_lev = V1_break_lev,
					  add_attr = V1_add_attr,
					  set_skill_id = V1_set_skill_id,
					  natals = V1_natals}
					<- V0_star]))/binary,
		(length(V0_fetters)):16,
		(list_to_binary([<<V1_set_id:32, V1_pos_id:32,
				   V1_partner_id:32>>
				 || {V1_set_id, V1_pos_id, V1_partner_id}
					<- V0_fetters]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11308:16,
       D_a_t_a/binary>>};
pack(11309, cli, {}) -> {ok, <<2:32, 11309:16>>};
pack(11309, srv, {V0_add_attr}) ->
    D_a_t_a = <<(length(V0_add_attr)):16,
		(list_to_binary([<<V1_career:8, (length(V1_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_attr]))/binary>>
				 || {V1_career, V1_attr}
					<- V0_add_attr]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11309:16,
       D_a_t_a/binary>>};
pack(11310, cli, {V0_set_id}) ->
    D_a_t_a = <<V0_set_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11310:16,
       D_a_t_a/binary>>};
pack(11310, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11310:16,
       D_a_t_a/binary>>};
pack(11311, cli, {V0_set_id}) ->
    D_a_t_a = <<V0_set_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11311:16,
       D_a_t_a/binary>>};
pack(11311, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11311:16,
       D_a_t_a/binary>>};
pack(11320, cli, {}) -> {ok, <<2:32, 11320:16>>};
pack(11320, srv,
     {V0_result, V0_msg, V0_max_tower, V0_count,
      V0_buy_count}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_max_tower:32,
		V0_count:32, V0_buy_count:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11320:16,
       D_a_t_a/binary>>};
pack(11321, cli, {}) -> {ok, <<2:32, 11321:16>>};
pack(11321, srv,
     {V0_result, V0_msg, V0_count, V0_buy_count}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_count:32,
		V0_buy_count:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11321:16,
       D_a_t_a/binary>>};
pack(11322, cli, {V0_tower}) ->
    D_a_t_a = <<V0_tower:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11322:16,
       D_a_t_a/binary>>};
pack(11322, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11322:16,
       D_a_t_a/binary>>};
pack(11323, cli, {}) -> {ok, <<2:32, 11323:16>>};
pack(11323, srv,
     {V0_result, V0_max_tower, V0_tower, V0_timer, V0_count,
      V0_award}) ->
    D_a_t_a = <<V0_result:8, V0_max_tower:32, V0_tower:32,
		V0_timer:32, V0_count:32, (length(V0_award)):16,
		(list_to_binary([<<V1_item_id:32, V1_num:32>>
				 || {V1_item_id, V1_num}
					<- V0_award]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11323:16,
       D_a_t_a/binary>>};
pack(11324, cli, {V0_tower}) ->
    D_a_t_a = <<V0_tower:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11324:16,
       D_a_t_a/binary>>};
pack(11324, srv, {V0_result, V0_msg, V0_count}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_count:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11324:16,
       D_a_t_a/binary>>};
pack(11325, cli, {V0_tower}) ->
    D_a_t_a = <<V0_tower:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11325:16,
       D_a_t_a/binary>>};
pack(11325, srv,
     {V0_tower_replay_data, V0_m_replay_id, V0_my_time}) ->
    D_a_t_a = <<(length(V0_tower_replay_data)):16,
		(list_to_binary([<<V1_type:8, V1_rid:32,
				   (protocol:pack(string, V1_sid))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_face_id:32, V1_power:32, V1_time:32,
				   V1_replay_id:32>>
				 || #tower_replay_data{type = V1_type,
						       rid = V1_rid,
						       sid = V1_sid,
						       name = V1_name,
						       face_id = V1_face_id,
						       power = V1_power,
						       time = V1_time,
						       repaly_id = V1_replay_id}
					<- V0_tower_replay_data]))/binary,
		V0_m_replay_id:32, V0_my_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11325:16,
       D_a_t_a/binary>>};
pack(11326, cli, {}) -> {ok, <<2:32, 11326:16>>};
pack(11326, srv, {V0_tower}) ->
    D_a_t_a = <<V0_tower:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11326:16,
       D_a_t_a/binary>>};
pack(11330, cli, {}) -> {ok, <<2:32, 11330:16>>};
pack(11330, srv,
     {V0_quality, V0_luck, V0_end_count, V0_ref_count,
      V0_day_gold_count, V0_flag}) ->
    D_a_t_a = <<V0_quality:32, V0_luck:32, V0_end_count:32,
		V0_ref_count:32, V0_day_gold_count:32, V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11330:16,
       D_a_t_a/binary>>};
pack(11331, cli, {V0_type, V0_count}) ->
    D_a_t_a = <<V0_type:8, V0_count:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11331:16,
       D_a_t_a/binary>>};
pack(11331, srv,
     {V0_result, V0_msg, V0_end_count, V0_quality,
      V0_day_gold_count, V0_award, V0_award2}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_end_count:32,
		V0_quality:32, V0_day_gold_count:32,
		(length(V0_award)):16,
		(list_to_binary([<<V1_item_id:32, V1_num:32>>
				 || {V1_item_id, V1_num} <- V0_award]))/binary,
		(length(V0_award2)):16,
		(list_to_binary([<<V1_item_id:32, V1_num:32>>
				 || {V1_item_id, V1_num}
					<- V0_award2]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11331:16,
       D_a_t_a/binary>>};
pack(11332, cli, {}) -> {ok, <<2:32, 11332:16>>};
pack(11332, srv,
     {V0_result, V0_msg, V0_luck, V0_ref_count}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_luck:32,
		V0_ref_count:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11332:16,
       D_a_t_a/binary>>};
pack(11333, cli,
     {V0_replay_id, V0_channel, V0_tower}) ->
    D_a_t_a = <<V0_replay_id:32, V0_channel:16,
		V0_tower:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11333:16,
       D_a_t_a/binary>>};
pack(11333, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11333:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(11300, srv, _B0) -> {ok, {}};
unpack(11300, cli, _B0) ->
    {V1_star, _B23} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_set_id, _B2} =
						 protocol:uint32(_B1),
					     {V2_lev, _B3} =
						 protocol:uint32(_B2),
					     {V2_break_lev, _B4} =
						 protocol:uint32(_B3),
					     {V2_add_attr, _B13} =
						 protocol:array(_B4,
								fun (_B5) ->
									{V3_career,
									 _B6} =
									    protocol:uint8(_B5),
									{V3_attr,
									 _B11} =
									    protocol:array(_B6,
											   fun
											     (_B7) ->
												 {V4_attr_id,
												  _B8} =
												     protocol:uint32(_B7),
												 {V4_attr_val,
												  _B9} =
												     protocol:uint32(_B8),
												 {{V4_attr_id,
												   V4_attr_val},
												  _B9}
											   end),
									{{V3_career,
									  V3_attr},
									 _B11}
								end),
					     {V2_set_skill_id, _B14} =
						 protocol:uint32(_B13),
					     {V2_natals, _B21} =
						 protocol:array(_B14,
								fun (_B15) ->
									{V3_id,
									 _B16} =
									    protocol:uint32(_B15),
									{V3_base_id,
									 _B17} =
									    protocol:uint32(_B16),
									{V3_type,
									 _B18} =
									    protocol:uint32(_B17),
									{V3_enchant,
									 _B19} =
									    protocol:uint32(_B18),
									{{V3_id,
									  V3_base_id,
									  V3_type,
									  V3_enchant},
									 _B19}
								end),
					     {{V2_set_id, V2_lev, V2_break_lev,
					       V2_add_attr, V2_set_skill_id,
					       V2_natals},
					      _B21}
				     end),
    {V1_fetters, _B29} = protocol:array(_B23,
					fun (_B24) ->
						{V2_set_id, _B25} =
						    protocol:uint32(_B24),
						{V2_pos_id, _B26} =
						    protocol:uint32(_B25),
						{V2_partner_id, _B27} =
						    protocol:uint32(_B26),
						{{V2_set_id, V2_pos_id,
						  V2_partner_id},
						 _B27}
					end),
    {ok, {V1_star, V1_fetters}};
unpack(11301, srv, _B0) -> {ok, {}};
unpack(11301, cli, _B0) ->
    {V1_set_id, _B1} = protocol:uint32(_B0),
    {V1_lev, _B2} = protocol:uint32(_B1),
    {V1_break_lev, _B3} = protocol:uint32(_B2),
    {V1_add_attr, _B12} = protocol:array(_B3,
					 fun (_B4) ->
						 {V2_career, _B5} =
						     protocol:uint8(_B4),
						 {V2_attr, _B10} =
						     protocol:array(_B5,
								    fun (_B6) ->
									    {V3_attr_id,
									     _B7} =
										protocol:uint32(_B6),
									    {V3_attr_val,
									     _B8} =
										protocol:uint32(_B7),
									    {{V3_attr_id,
									      V3_attr_val},
									     _B8}
								    end),
						 {{V2_career, V2_attr}, _B10}
					 end),
    {V1_set_skill_id, _B13} = protocol:uint32(_B12),
    {V1_natals, _B20} = protocol:array(_B13,
				       fun (_B14) ->
					       {V2_id, _B15} =
						   protocol:uint32(_B14),
					       {V2_base_id, _B16} =
						   protocol:uint32(_B15),
					       {V2_type, _B17} =
						   protocol:uint32(_B16),
					       {V2_enchant, _B18} =
						   protocol:uint32(_B17),
					       {{V2_id, V2_base_id, V2_type,
						 V2_enchant},
						_B18}
				       end),
    {ok,
     {V1_set_id, V1_lev, V1_break_lev, V1_add_attr,
      V1_set_skill_id, V1_natals}};
unpack(11302, srv, _B0) ->
    {V1_set_id, _B1} = protocol:uint32(_B0),
    {V1_pos_id, _B2} = protocol:uint32(_B1),
    {V1_partner_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_set_id, V1_pos_id, V1_partner_id}};
unpack(11302, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_old_set_id, _B3} = protocol:uint32(_B2),
    {V1_fetter, _B9} = protocol:array(_B3,
				      fun (_B4) ->
					      {V2_set_id, _B5} =
						  protocol:uint32(_B4),
					      {V2_pos_id, _B6} =
						  protocol:uint32(_B5),
					      {V2_partner_id, _B7} =
						  protocol:uint32(_B6),
					      {{V2_set_id, V2_pos_id,
						V2_partner_id},
					       _B7}
				      end),
    {ok, {V1_result, V1_msg, V1_old_set_id, V1_fetter}};
unpack(11303, srv, _B0) ->
    {V1_set_id, _B1} = protocol:uint32(_B0),
    {V1_pos_id, _B2} = protocol:uint32(_B1),
    {V1_partner_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_set_id, V1_pos_id, V1_partner_id}};
unpack(11303, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_old_set_id, _B3} = protocol:uint32(_B2),
    {V1_fetter, _B9} = protocol:array(_B3,
				      fun (_B4) ->
					      {V2_set_id, _B5} =
						  protocol:uint32(_B4),
					      {V2_pos_id, _B6} =
						  protocol:uint32(_B5),
					      {V2_partner_id, _B7} =
						  protocol:uint32(_B6),
					      {{V2_set_id, V2_pos_id,
						V2_partner_id},
					       _B7}
				      end),
    {ok, {V1_result, V1_msg, V1_old_set_id, V1_fetter}};
unpack(11304, srv, _B0) ->
    {V1_set_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_set_id, V1_id}};
unpack(11304, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11305, srv, _B0) ->
    {V1_set_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_set_id, V1_id}};
unpack(11305, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11306, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_set_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_set_id}};
unpack(11306, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11307, srv, _B0) ->
    {V1_set_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_set_id}};
unpack(11307, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_fetter, _B8} = protocol:array(_B2,
				      fun (_B3) ->
					      {V2_set_id, _B4} =
						  protocol:uint32(_B3),
					      {V2_pos_id, _B5} =
						  protocol:uint32(_B4),
					      {V2_partner_id, _B6} =
						  protocol:uint32(_B5),
					      {{V2_set_id, V2_pos_id,
						V2_partner_id},
					       _B6}
				      end),
    {ok, {V1_result, V1_msg, V1_fetter}};
unpack(11308, srv, _B0) -> {ok, {}};
unpack(11308, cli, _B0) ->
    {V1_star, _B23} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_set_id, _B2} =
						 protocol:uint32(_B1),
					     {V2_lev, _B3} =
						 protocol:uint32(_B2),
					     {V2_break_lev, _B4} =
						 protocol:uint32(_B3),
					     {V2_add_attr, _B13} =
						 protocol:array(_B4,
								fun (_B5) ->
									{V3_career,
									 _B6} =
									    protocol:uint8(_B5),
									{V3_attr,
									 _B11} =
									    protocol:array(_B6,
											   fun
											     (_B7) ->
												 {V4_attr_id,
												  _B8} =
												     protocol:uint32(_B7),
												 {V4_attr_val,
												  _B9} =
												     protocol:uint32(_B8),
												 {{V4_attr_id,
												   V4_attr_val},
												  _B9}
											   end),
									{{V3_career,
									  V3_attr},
									 _B11}
								end),
					     {V2_set_skill_id, _B14} =
						 protocol:uint32(_B13),
					     {V2_natals, _B21} =
						 protocol:array(_B14,
								fun (_B15) ->
									{V3_id,
									 _B16} =
									    protocol:uint32(_B15),
									{V3_base_id,
									 _B17} =
									    protocol:uint32(_B16),
									{V3_type,
									 _B18} =
									    protocol:uint32(_B17),
									{V3_enchant,
									 _B19} =
									    protocol:uint32(_B18),
									{{V3_id,
									  V3_base_id,
									  V3_type,
									  V3_enchant},
									 _B19}
								end),
					     {{V2_set_id, V2_lev, V2_break_lev,
					       V2_add_attr, V2_set_skill_id,
					       V2_natals},
					      _B21}
				     end),
    {V1_fetters, _B29} = protocol:array(_B23,
					fun (_B24) ->
						{V2_set_id, _B25} =
						    protocol:uint32(_B24),
						{V2_pos_id, _B26} =
						    protocol:uint32(_B25),
						{V2_partner_id, _B27} =
						    protocol:uint32(_B26),
						{{V2_set_id, V2_pos_id,
						  V2_partner_id},
						 _B27}
					end),
    {ok, {V1_star, V1_fetters}};
unpack(11309, srv, _B0) -> {ok, {}};
unpack(11309, cli, _B0) ->
    {V1_add_attr, _B9} = protocol:array(_B0,
					fun (_B1) ->
						{V2_career, _B2} =
						    protocol:uint8(_B1),
						{V2_attr, _B7} =
						    protocol:array(_B2,
								   fun (_B3) ->
									   {V3_attr_id,
									    _B4} =
									       protocol:uint32(_B3),
									   {V3_attr_val,
									    _B5} =
									       protocol:uint32(_B4),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B5}
								   end),
						{{V2_career, V2_attr}, _B7}
					end),
    {ok, {V1_add_attr}};
unpack(11310, srv, _B0) ->
    {V1_set_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_set_id}};
unpack(11310, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11311, srv, _B0) ->
    {V1_set_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_set_id}};
unpack(11311, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11320, srv, _B0) -> {ok, {}};
unpack(11320, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_max_tower, _B3} = protocol:uint32(_B2),
    {V1_count, _B4} = protocol:uint32(_B3),
    {V1_buy_count, _B5} = protocol:uint32(_B4),
    {ok,
     {V1_result, V1_msg, V1_max_tower, V1_count,
      V1_buy_count}};
unpack(11321, srv, _B0) -> {ok, {}};
unpack(11321, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_count, _B3} = protocol:uint32(_B2),
    {V1_buy_count, _B4} = protocol:uint32(_B3),
    {ok, {V1_result, V1_msg, V1_count, V1_buy_count}};
unpack(11322, srv, _B0) ->
    {V1_tower, _B1} = protocol:uint32(_B0),
    {ok, {V1_tower}};
unpack(11322, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11323, srv, _B0) -> {ok, {}};
unpack(11323, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_max_tower, _B2} = protocol:uint32(_B1),
    {V1_tower, _B3} = protocol:uint32(_B2),
    {V1_timer, _B4} = protocol:uint32(_B3),
    {V1_count, _B5} = protocol:uint32(_B4),
    {V1_award, _B10} = protocol:array(_B5,
				      fun (_B6) ->
					      {V2_item_id, _B7} =
						  protocol:uint32(_B6),
					      {V2_num, _B8} =
						  protocol:uint32(_B7),
					      {{V2_item_id, V2_num}, _B8}
				      end),
    {ok,
     {V1_result, V1_max_tower, V1_tower, V1_timer, V1_count,
      V1_award}};
unpack(11324, srv, _B0) ->
    {V1_tower, _B1} = protocol:uint32(_B0),
    {ok, {V1_tower}};
unpack(11324, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_count, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_count}};
unpack(11325, srv, _B0) ->
    {V1_tower, _B1} = protocol:uint32(_B0),
    {ok, {V1_tower}};
unpack(11325, cli, _B0) ->
    {V1_tower_replay_data, _B11} = protocol:array(_B0,
						  fun (_B1) ->
							  {V2_type, _B2} =
							      protocol:uint8(_B1),
							  {V2_rid, _B3} =
							      protocol:uint32(_B2),
							  {V2_sid, _B4} =
							      protocol:string(_B3),
							  {V2_name, _B5} =
							      protocol:string(_B4),
							  {V2_face_id, _B6} =
							      protocol:uint32(_B5),
							  {V2_power, _B7} =
							      protocol:uint32(_B6),
							  {V2_time, _B8} =
							      protocol:uint32(_B7),
							  {V2_replay_id, _B9} =
							      protocol:uint32(_B8),
							  {{V2_type, V2_rid,
							    V2_sid, V2_name,
							    V2_face_id,
							    V2_power, V2_time,
							    V2_replay_id},
							   _B9}
						  end),
    {V1_m_replay_id, _B12} = protocol:uint32(_B11),
    {V1_my_time, _B13} = protocol:uint32(_B12),
    {ok,
     {V1_tower_replay_data, V1_m_replay_id, V1_my_time}};
unpack(11326, srv, _B0) -> {ok, {}};
unpack(11326, cli, _B0) ->
    {V1_tower, _B1} = protocol:uint32(_B0),
    {ok, {V1_tower}};
unpack(11330, srv, _B0) -> {ok, {}};
unpack(11330, cli, _B0) ->
    {V1_quality, _B1} = protocol:uint32(_B0),
    {V1_luck, _B2} = protocol:uint32(_B1),
    {V1_end_count, _B3} = protocol:uint32(_B2),
    {V1_ref_count, _B4} = protocol:uint32(_B3),
    {V1_day_gold_count, _B5} = protocol:uint32(_B4),
    {V1_flag, _B6} = protocol:uint8(_B5),
    {ok,
     {V1_quality, V1_luck, V1_end_count, V1_ref_count,
      V1_day_gold_count, V1_flag}};
unpack(11331, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_count, _B2} = protocol:uint8(_B1),
    {ok, {V1_type, V1_count}};
unpack(11331, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_end_count, _B3} = protocol:uint32(_B2),
    {V1_quality, _B4} = protocol:uint32(_B3),
    {V1_day_gold_count, _B5} = protocol:uint32(_B4),
    {V1_award, _B10} = protocol:array(_B5,
				      fun (_B6) ->
					      {V2_item_id, _B7} =
						  protocol:uint32(_B6),
					      {V2_num, _B8} =
						  protocol:uint32(_B7),
					      {{V2_item_id, V2_num}, _B8}
				      end),
    {V1_award2, _B15} = protocol:array(_B10,
				       fun (_B11) ->
					       {V2_item_id, _B12} =
						   protocol:uint32(_B11),
					       {V2_num, _B13} =
						   protocol:uint32(_B12),
					       {{V2_item_id, V2_num}, _B13}
				       end),
    {ok,
     {V1_result, V1_msg, V1_end_count, V1_quality,
      V1_day_gold_count, V1_award, V1_award2}};
unpack(11332, srv, _B0) -> {ok, {}};
unpack(11332, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_luck, _B3} = protocol:uint32(_B2),
    {V1_ref_count, _B4} = protocol:uint32(_B3),
    {ok, {V1_result, V1_msg, V1_luck, V1_ref_count}};
unpack(11333, srv, _B0) ->
    {V1_replay_id, _B1} = protocol:uint32(_B0),
    {V1_channel, _B2} = protocol:uint16(_B1),
    {V1_tower, _B3} = protocol:uint32(_B2),
    {ok, {V1_replay_id, V1_channel, V1_tower}};
unpack(11333, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


