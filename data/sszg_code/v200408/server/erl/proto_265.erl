-file("src/proto/proto_265.erl", 1).

-module(proto_265).

-lager_records([{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
		{sprite_plan, [ver, id, name, plan_sprites]},
		{team_sprite, [ver, team, plan_id, team_sprites]},
		{formation_sprite, [ver, type, team_list]},
		{m_sprite_tree,
		 [ver, lev, break_lev, all_attr, sprites, power,
		  max_power, formation_list, plan_list]},
		{sprite_hatch,
		 [ver, id, is_open, lev, do_id, need_point, do_point,
		  state, end_time, all_end_time]},
		{m_sprite_hatch,
		 [ver, list, day_privilege_mail, day_buy_list, handbook,
		  baodi_info]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/sprite.hrl", 1).

-record(m_sprite_hatch,
	{ver = 5, list = [], day_privilege_mail = 0,
	 day_buy_list = [], handbook = [], baodi_info = []}).

-record(sprite_hatch,
	{ver = 2, id = 0, is_open = 0, lev = 0, do_id = 0,
	 need_point = 0, do_point = 0, state = 0, end_time = 0,
	 all_end_time = 0}).

-record(m_sprite_tree,
	{ver = 3, lev = 1, break_lev = 0, all_attr,
	 sprites = [], power = 0, max_power = 0,
	 formation_list = []  :: list(),
	 plan_list = []  :: list()}).

-record(formation_sprite,
	{ver = 1  :: pos_integer(), type = 0  :: pos_integer(),
	 team_list = []  :: list()}).

-record(team_sprite,
	{ver = 1  :: pos_integer(), team = 1  :: pos_integer(),
	 plan_id = 0  :: pos_integer(),
	 team_sprites = []  :: list()}).

-record(sprite_plan,
	{ver = 1  :: pos_integer(), id = 1  :: pos_integer(),
	 name = <<>>  :: string(),
	 plan_sprites = []  :: list()}).

-file("src/proto/proto_265.erl", 16).

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

-file("src/proto/proto_265.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(26500, cli, {}) -> {ok, <<2:32, 26500:16>>};
pack(26500, srv, {V0_sprite_hatchs, V0_info}) ->
    D_a_t_a = <<(length(V0_sprite_hatchs)):16,
		(list_to_binary([<<V1_id:8, V1_is_open:8, V1_state:8,
				   V1_do_id:32, V1_all_end_time:32>>
				 || #sprite_hatch{id = V1_id,
						  is_open = V1_is_open,
						  state = V1_state,
						  do_id = V1_do_id,
						  all_end_time =
						      V1_all_end_time}
					<- V0_sprite_hatchs]))/binary,
		(length(V0_info)):16,
		(list_to_binary([<<V1_item_bid:32, V1_buy_num:32>>
				 || {V1_item_bid, V1_buy_num}
					<- V0_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26500:16,
       D_a_t_a/binary>>};
pack(26501, cli, {}) -> {ok, <<2:32, 26501:16>>};
pack(26501, srv, {V0_sprite_hatch}) ->
    D_a_t_a = <<(length(V0_sprite_hatch)):16,
		(list_to_binary([<<V1_id:8, V1_is_open:8, V1_state:8,
				   V1_do_id:32, V1_all_end_time:32>>
				 || #sprite_hatch{id = V1_id,
						  is_open = V1_is_open,
						  state = V1_state,
						  do_id = V1_do_id,
						  all_end_time =
						      V1_all_end_time}
					<- V0_sprite_hatch]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26501:16,
       D_a_t_a/binary>>};
pack(26502, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26502:16,
       D_a_t_a/binary>>};
pack(26502, srv, {V0_result, V0_msg, V0_id, V0_lev}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:8,
		V0_lev:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26502:16,
       D_a_t_a/binary>>};
pack(26503, cli, {V0_id, V0_item_bid}) ->
    D_a_t_a = <<V0_id:8, V0_item_bid:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26503:16,
       D_a_t_a/binary>>};
pack(26503, srv, {V0_result, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26503:16,
       D_a_t_a/binary>>};
pack(26504, cli,
     {V0_id, V0_item_bid, V0_item_num, V0_type}) ->
    D_a_t_a = <<V0_id:8, V0_item_bid:32, V0_item_num:32,
		V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26504:16,
       D_a_t_a/binary>>};
pack(26504, srv, {V0_result, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26504:16,
       D_a_t_a/binary>>};
pack(26505, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26505:16,
       D_a_t_a/binary>>};
pack(26505, srv, {V0_result, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26505:16,
       D_a_t_a/binary>>};
pack(26506, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26506:16,
       D_a_t_a/binary>>};
pack(26506, srv,
     {V0_result, V0_msg, V0_id, V0_awards}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:8,
		(length(V0_awards)):16,
		(list_to_binary([<<V1_item_bid:32, V1_item_num:32>>
				 || {V1_item_bid, V1_item_num}
					<- V0_awards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26506:16,
       D_a_t_a/binary>>};
pack(26507, cli, {V0_type, V0_item_id, V0_num}) ->
    D_a_t_a = <<V0_type:8, V0_item_id:32, V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26507:16,
       D_a_t_a/binary>>};
pack(26507, srv,
     {V0_result, V0_msg, V0_item_id, V0_count}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_item_id:32,
		V0_count:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26507:16,
       D_a_t_a/binary>>};
pack(26508, cli, {V0_item_bid, V0_num, V0_pos}) ->
    D_a_t_a = <<V0_item_bid:32, V0_num:32, V0_pos:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26508:16,
       D_a_t_a/binary>>};
pack(26508, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26508:16,
       D_a_t_a/binary>>};
pack(26509, cli, {}) -> {ok, <<2:32, 26509:16>>};
pack(26509, srv, {V0_awards}) ->
    D_a_t_a = <<(length(V0_awards)):16,
		(list_to_binary([<<V1_item_bid:32>>
				 || V1_item_bid <- V0_awards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26509:16,
       D_a_t_a/binary>>};
pack(26510, cli, {}) -> {ok, <<2:32, 26510:16>>};
pack(26510, srv,
     {V0_lev, V0_break_lev,
      #attr{atk = V0_atk, def_p = V0_def_p, def_s = V0_def_s,
	    hp_max = V0_hp_max, speed = V0_speed,
	    hit_rate = V0_hit_rate, dodge_rate = V0_dodge_rate,
	    crit_rate = V0_crit_rate, crit_ratio = V0_crit_ratio,
	    hit_magic = V0_hit_magic, dodge_magic = V0_dodge_magic,
	    def = V0_def},
      V0_sprites, V0_power}) ->
    D_a_t_a = <<V0_lev:16, V0_break_lev:16, V0_atk:32,
		V0_def_p:32, V0_def_s:32, V0_hp_max:32, V0_speed:32,
		V0_hit_rate:32, V0_dodge_rate:32, V0_crit_rate:32,
		V0_crit_ratio:32, V0_hit_magic:32, V0_dodge_magic:32,
		V0_def:32, (length(V0_sprites)):16,
		(list_to_binary([<<V1_pos:8, V1_item_bid:32>>
				 || {V1_pos, V1_item_bid}
					<- V0_sprites]))/binary,
		V0_power:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26510:16,
       D_a_t_a/binary>>};
pack(26511, cli, {}) -> {ok, <<2:32, 26511:16>>};
pack(26511, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26511:16,
       D_a_t_a/binary>>};
pack(26512, cli, {}) -> {ok, <<2:32, 26512:16>>};
pack(26512, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26512:16,
       D_a_t_a/binary>>};
pack(26513, cli, {V0_pos, V0_item_bid}) ->
    D_a_t_a = <<V0_pos:8, V0_item_bid:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26513:16,
       D_a_t_a/binary>>};
pack(26513, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26513:16,
       D_a_t_a/binary>>};
pack(26514, cli, {V0_sprites}) ->
    D_a_t_a = <<(length(V0_sprites)):16,
		(list_to_binary([<<V1_pos:8, V1_item_bid:32>>
				 || {V1_pos, V1_item_bid}
					<- V0_sprites]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26514:16,
       D_a_t_a/binary>>};
pack(26514, srv, {V0_result, V0_msg, V0_sprites}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_sprites)):16,
		(list_to_binary([<<V1_pos:8, V1_item_bid:32>>
				 || {V1_pos, V1_item_bid}
					<- V0_sprites]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26514:16,
       D_a_t_a/binary>>};
pack(26520, cli, {}) -> {ok, <<2:32, 26520:16>>};
pack(26520, srv, {V0_awards}) ->
    D_a_t_a = <<(length(V0_awards)):16,
		(list_to_binary([<<V1_item_bid:32>>
				 || V1_item_bid <- V0_awards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26520:16,
       D_a_t_a/binary>>};
pack(26521, cli, {}) -> {ok, <<2:32, 26521:16>>};
pack(26521, srv,
     {V0_camp_id, V0_free_time, V0_times, V0_start_time,
      V0_end_time, V0_item_id, V0_item_num, V0_must_count,
      V0_reward_list, V0_award_list}) ->
    D_a_t_a = <<V0_camp_id:32, V0_free_time:32, V0_times:32,
		V0_start_time:32, V0_end_time:32, V0_item_id:32,
		V0_item_num:32, V0_must_count:16,
		(length(V0_reward_list)):16,
		(list_to_binary([<<V1_id:16>>
				 || V1_id <- V0_reward_list]))/binary,
		(length(V0_award_list)):16,
		(list_to_binary([<<V1_id:16>>
				 || V1_id <- V0_award_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26521:16,
       D_a_t_a/binary>>};
pack(26522, cli, {V0_times, V0_recruit_type}) ->
    D_a_t_a = <<V0_times:8, V0_recruit_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26522:16,
       D_a_t_a/binary>>};
pack(26522, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26522:16,
       D_a_t_a/binary>>};
pack(26523, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26523:16,
       D_a_t_a/binary>>};
pack(26523, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26523:16,
       D_a_t_a/binary>>};
pack(26525, cli, {}) -> {ok, <<2:32, 26525:16>>};
pack(26525, srv,
     {V0_group_id, V0_times, V0_rewards, V0_sprite_bids}) ->
    D_a_t_a = <<V0_group_id:16, V0_times:8,
		(length(V0_rewards)):16,
		(list_to_binary([<<V1_base_id:32, V1_num:32>>
				 || {V1_base_id, V1_num}
					<- V0_rewards]))/binary,
		(length(V0_sprite_bids)):16,
		(list_to_binary([<<V1_sprite_bid:32, V1_quality:8,
				   V1_jie:16>>
				 || {V1_sprite_bid, V1_quality, V1_jie}
					<- V0_sprite_bids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26525:16,
       D_a_t_a/binary>>};
pack(26530, cli, {V0_item_bid}) ->
    D_a_t_a = <<V0_item_bid:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26530:16,
       D_a_t_a/binary>>};
pack(26530, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26530:16,
       D_a_t_a/binary>>};
pack(26535, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26535:16,
       D_a_t_a/binary>>};
pack(26535, srv, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26535:16,
       D_a_t_a/binary>>};
pack(26550, cli, {}) -> {ok, <<2:32, 26550:16>>};
pack(26550, srv,
     {V0_camp_id, V0_free_time, V0_times, V0_do_awards,
      V0_lucky_ids, V0_day_count}) ->
    D_a_t_a = <<V0_camp_id:32, V0_free_time:32, V0_times:32,
		(length(V0_do_awards)):16,
		(list_to_binary([<<V1_award_id:32>>
				 || V1_award_id <- V0_do_awards]))/binary,
		(length(V0_lucky_ids)):16,
		(list_to_binary([<<V1_lucky_sprites_bid:32>>
				 || V1_lucky_sprites_bid
					<- V0_lucky_ids]))/binary,
		V0_day_count:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26550:16,
       D_a_t_a/binary>>};
pack(26551, cli, {V0_times, V0_recruit_type}) ->
    D_a_t_a = <<V0_times:8, V0_recruit_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26551:16,
       D_a_t_a/binary>>};
pack(26551, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26551:16,
       D_a_t_a/binary>>};
pack(26552, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26552:16,
       D_a_t_a/binary>>};
pack(26552, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26552:16,
       D_a_t_a/binary>>};
pack(26553, cli, {}) -> {ok, <<2:32, 26553:16>>};
pack(26553, srv,
     {V0_group_id, V0_times, V0_rewards, V0_sprite_bids}) ->
    D_a_t_a = <<V0_group_id:16, V0_times:8,
		(length(V0_rewards)):16,
		(list_to_binary([<<V1_base_id:32, V1_num:32>>
				 || {V1_base_id, V1_num}
					<- V0_rewards]))/binary,
		(length(V0_sprite_bids)):16,
		(list_to_binary([<<V1_sprite_bid:32, V1_quality:8,
				   V1_jie:16>>
				 || {V1_sprite_bid, V1_quality, V1_jie}
					<- V0_sprite_bids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26553:16,
       D_a_t_a/binary>>};
pack(26554, cli, {V0_lucky_ids}) ->
    D_a_t_a = <<(length(V0_lucky_ids)):16,
		(list_to_binary([<<V1_lucky_sprites_bid:32>>
				 || V1_lucky_sprites_bid
					<- V0_lucky_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26554:16,
       D_a_t_a/binary>>};
pack(26554, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26554:16,
       D_a_t_a/binary>>};
pack(26555, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26555:16,
       D_a_t_a/binary>>};
pack(26555, srv, {V0_type, V0_team_list}) ->
    D_a_t_a = <<V0_type:32, (length(V0_team_list)):16,
		(list_to_binary([<<V1_team:32, (length(V1_sprites)):16,
				   (list_to_binary([<<V2_pos:8, V2_item_bid:32>>
						    || {V2_pos, V2_item_bid}
							   <- V1_sprites]))/binary,
				   V1_plan_id:8>>
				 || {V1_team, V1_sprites, V1_plan_id}
					<- V0_team_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26555:16,
       D_a_t_a/binary>>};
pack(26556, cli, {}) -> {ok, <<2:32, 26556:16>>};
pack(26556, srv, {V0_plan_list}) ->
    D_a_t_a = <<(length(V0_plan_list)):16,
		(list_to_binary([<<V1_id:8,
				   (protocol:pack(string, V1_name))/binary,
				   (length(V1_plan_sprites)):16,
				   (list_to_binary([<<V2_pos:8, V2_item_bid:32>>
						    || {V2_pos, V2_item_bid}
							   <- V1_plan_sprites]))/binary>>
				 || #sprite_plan{id = V1_id, name = V1_name,
						 plan_sprites = V1_plan_sprites}
					<- V0_plan_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26556:16,
       D_a_t_a/binary>>};
pack(26557, cli,
     {V0_id, V0_sprites, V0_type, V0_team}) ->
    D_a_t_a = <<V0_id:8, (length(V0_sprites)):16,
		(list_to_binary([<<V1_pos:8, V1_item_bid:32>>
				 || {V1_pos, V1_item_bid}
					<- V0_sprites]))/binary,
		V0_type:32, V0_team:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26557:16,
       D_a_t_a/binary>>};
pack(26557, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26557:16,
       D_a_t_a/binary>>};
pack(26558, cli, {V0_id, V0_name}) ->
    D_a_t_a = <<V0_id:8,
		(protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26558:16,
       D_a_t_a/binary>>};
pack(26558, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26558:16,
       D_a_t_a/binary>>};
pack(26559, cli, {}) -> {ok, <<2:32, 26559:16>>};
pack(26559, srv,
     {#sprite_plan{id = V0_id, name = V0_name,
		   plan_sprites = V0_plan_sprites}}) ->
    D_a_t_a = <<V0_id:8,
		(protocol:pack(string, V0_name))/binary,
		(length(V0_plan_sprites)):16,
		(list_to_binary([<<V1_pos:8, V1_item_bid:32>>
				 || {V1_pos, V1_item_bid}
					<- V0_plan_sprites]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26559:16,
       D_a_t_a/binary>>};
pack(26560, cli,
     {V0_type, V0_team, V0_sprites, V0_flag}) ->
    D_a_t_a = <<V0_type:32, V0_team:32,
		(length(V0_sprites)):16,
		(list_to_binary([<<V1_pos:8, V1_item_bid:32>>
				 || {V1_pos, V1_item_bid}
					<- V0_sprites]))/binary,
		V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26560:16,
       D_a_t_a/binary>>};
pack(26560, srv, {V0_flag, V0_msg, V0_type, V0_team}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary, V0_type:32,
		V0_team:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26560:16,
       D_a_t_a/binary>>};
pack(26561, cli, {V0_type, V0_team, V0_id}) ->
    D_a_t_a = <<V0_type:32, V0_team:32, V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26561:16,
       D_a_t_a/binary>>};
pack(26561, srv, {V0_flag, V0_msg, V0_type, V0_team}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary, V0_type:32,
		V0_team:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26561:16,
       D_a_t_a/binary>>};
pack(26562, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26562:16,
       D_a_t_a/binary>>};
pack(26562, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26562:16,
       D_a_t_a/binary>>};
pack(26563, cli, {V0_base_id, V0_num}) ->
    D_a_t_a = <<V0_base_id:32, V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26563:16,
       D_a_t_a/binary>>};
pack(26563, srv, {V0_flag, V0_type, V0_id, V0_name}) ->
    D_a_t_a = <<V0_flag:8, V0_type:8, V0_id:32,
		(protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26563:16,
       D_a_t_a/binary>>};
pack(26564, cli, {V0_type, V0_team_list}) ->
    D_a_t_a = <<V0_type:32, (length(V0_team_list)):16,
		(list_to_binary([<<V1_team:32, V1_old_team:32>>
				 || {V1_team, V1_old_team}
					<- V0_team_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26564:16,
       D_a_t_a/binary>>};
pack(26564, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26564:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(26500, srv, _B0) -> {ok, {}};
unpack(26500, cli, _B0) ->
    {V1_sprite_hatchs, _B8} = protocol:array(_B0,
					     fun (_B1) ->
						     {V2_id, _B2} =
							 protocol:uint8(_B1),
						     {V2_is_open, _B3} =
							 protocol:uint8(_B2),
						     {V2_state, _B4} =
							 protocol:uint8(_B3),
						     {V2_do_id, _B5} =
							 protocol:uint32(_B4),
						     {V2_all_end_time, _B6} =
							 protocol:uint32(_B5),
						     {{V2_id, V2_is_open,
						       V2_state, V2_do_id,
						       V2_all_end_time},
						      _B6}
					     end),
    {V1_info, _B13} = protocol:array(_B8,
				     fun (_B9) ->
					     {V2_item_bid, _B10} =
						 protocol:uint32(_B9),
					     {V2_buy_num, _B11} =
						 protocol:uint32(_B10),
					     {{V2_item_bid, V2_buy_num}, _B11}
				     end),
    {ok, {V1_sprite_hatchs, V1_info}};
unpack(26501, srv, _B0) -> {ok, {}};
unpack(26501, cli, _B0) ->
    {V1_sprite_hatch, _B8} = protocol:array(_B0,
					    fun (_B1) ->
						    {V2_id, _B2} =
							protocol:uint8(_B1),
						    {V2_is_open, _B3} =
							protocol:uint8(_B2),
						    {V2_state, _B4} =
							protocol:uint8(_B3),
						    {V2_do_id, _B5} =
							protocol:uint32(_B4),
						    {V2_all_end_time, _B6} =
							protocol:uint32(_B5),
						    {{V2_id, V2_is_open,
						      V2_state, V2_do_id,
						      V2_all_end_time},
						     _B6}
					    end),
    {ok, {V1_sprite_hatch}};
unpack(26502, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0), {ok, {V1_id}};
unpack(26502, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint8(_B2),
    {V1_lev, _B4} = protocol:uint32(_B3),
    {ok, {V1_result, V1_msg, V1_id, V1_lev}};
unpack(26503, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_item_bid, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_item_bid}};
unpack(26503, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint8(_B2),
    {ok, {V1_result, V1_msg, V1_id}};
unpack(26504, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_item_bid, _B2} = protocol:uint32(_B1),
    {V1_item_num, _B3} = protocol:uint32(_B2),
    {V1_type, _B4} = protocol:uint8(_B3),
    {ok, {V1_id, V1_item_bid, V1_item_num, V1_type}};
unpack(26504, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint8(_B2),
    {ok, {V1_result, V1_msg, V1_id}};
unpack(26505, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0), {ok, {V1_id}};
unpack(26505, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint8(_B2),
    {ok, {V1_result, V1_msg, V1_id}};
unpack(26506, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0), {ok, {V1_id}};
unpack(26506, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint8(_B2),
    {V1_awards, _B8} = protocol:array(_B3,
				      fun (_B4) ->
					      {V2_item_bid, _B5} =
						  protocol:uint32(_B4),
					      {V2_item_num, _B6} =
						  protocol:uint32(_B5),
					      {{V2_item_bid, V2_item_num}, _B6}
				      end),
    {ok, {V1_result, V1_msg, V1_id, V1_awards}};
unpack(26507, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_item_id, _B2} = protocol:uint32(_B1),
    {V1_num, _B3} = protocol:uint32(_B2),
    {ok, {V1_type, V1_item_id, V1_num}};
unpack(26507, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_item_id, _B3} = protocol:uint32(_B2),
    {V1_count, _B4} = protocol:uint8(_B3),
    {ok, {V1_result, V1_msg, V1_item_id, V1_count}};
unpack(26508, srv, _B0) ->
    {V1_item_bid, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {V1_pos, _B3} = protocol:uint8(_B2),
    {ok, {V1_item_bid, V1_num, V1_pos}};
unpack(26508, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(26509, srv, _B0) -> {ok, {}};
unpack(26509, cli, _B0) ->
    {V1_awards, _B4} = protocol:array(_B0,
				      fun (_B1) ->
					      {V2_item_bid, _B2} =
						  protocol:uint32(_B1),
					      {V2_item_bid, _B2}
				      end),
    {ok, {V1_awards}};
unpack(26510, srv, _B0) -> {ok, {}};
unpack(26510, cli, _B0) ->
    {V1_lev, _B1} = protocol:uint16(_B0),
    {V1_break_lev, _B2} = protocol:uint16(_B1),
    {V1_atk, _B3} = protocol:uint32(_B2),
    {V1_def_p, _B4} = protocol:uint32(_B3),
    {V1_def_s, _B5} = protocol:uint32(_B4),
    {V1_hp_max, _B6} = protocol:uint32(_B5),
    {V1_speed, _B7} = protocol:uint32(_B6),
    {V1_hit_rate, _B8} = protocol:uint32(_B7),
    {V1_dodge_rate, _B9} = protocol:uint32(_B8),
    {V1_crit_rate, _B10} = protocol:uint32(_B9),
    {V1_crit_ratio, _B11} = protocol:uint32(_B10),
    {V1_hit_magic, _B12} = protocol:uint32(_B11),
    {V1_dodge_magic, _B13} = protocol:uint32(_B12),
    {V1_def, _B14} = protocol:uint32(_B13),
    {V1_sprites, _B19} = protocol:array(_B14,
					fun (_B15) ->
						{V2_pos, _B16} =
						    protocol:uint8(_B15),
						{V2_item_bid, _B17} =
						    protocol:uint32(_B16),
						{{V2_pos, V2_item_bid}, _B17}
					end),
    {V1_power, _B20} = protocol:uint32(_B19),
    {ok,
     {V1_lev, V1_break_lev, V1_atk, V1_def_p, V1_def_s,
      V1_hp_max, V1_speed, V1_hit_rate, V1_dodge_rate,
      V1_crit_rate, V1_crit_ratio, V1_hit_magic,
      V1_dodge_magic, V1_def, V1_sprites, V1_power}};
unpack(26511, srv, _B0) -> {ok, {}};
unpack(26511, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(26512, srv, _B0) -> {ok, {}};
unpack(26512, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(26513, srv, _B0) ->
    {V1_pos, _B1} = protocol:uint8(_B0),
    {V1_item_bid, _B2} = protocol:uint32(_B1),
    {ok, {V1_pos, V1_item_bid}};
unpack(26513, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(26514, srv, _B0) ->
    {V1_sprites, _B5} = protocol:array(_B0,
				       fun (_B1) ->
					       {V2_pos, _B2} =
						   protocol:uint8(_B1),
					       {V2_item_bid, _B3} =
						   protocol:uint32(_B2),
					       {{V2_pos, V2_item_bid}, _B3}
				       end),
    {ok, {V1_sprites}};
unpack(26514, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_sprites, _B7} = protocol:array(_B2,
				       fun (_B3) ->
					       {V2_pos, _B4} =
						   protocol:uint8(_B3),
					       {V2_item_bid, _B5} =
						   protocol:uint32(_B4),
					       {{V2_pos, V2_item_bid}, _B5}
				       end),
    {ok, {V1_result, V1_msg, V1_sprites}};
unpack(26520, srv, _B0) -> {ok, {}};
unpack(26520, cli, _B0) ->
    {V1_awards, _B4} = protocol:array(_B0,
				      fun (_B1) ->
					      {V2_item_bid, _B2} =
						  protocol:uint32(_B1),
					      {V2_item_bid, _B2}
				      end),
    {ok, {V1_awards}};
unpack(26521, srv, _B0) -> {ok, {}};
unpack(26521, cli, _B0) ->
    {V1_camp_id, _B1} = protocol:uint32(_B0),
    {V1_free_time, _B2} = protocol:uint32(_B1),
    {V1_times, _B3} = protocol:uint32(_B2),
    {V1_start_time, _B4} = protocol:uint32(_B3),
    {V1_end_time, _B5} = protocol:uint32(_B4),
    {V1_item_id, _B6} = protocol:uint32(_B5),
    {V1_item_num, _B7} = protocol:uint32(_B6),
    {V1_must_count, _B8} = protocol:uint16(_B7),
    {V1_reward_list, _B12} = protocol:array(_B8,
					    fun (_B9) ->
						    {V2_id, _B10} =
							protocol:uint16(_B9),
						    {V2_id, _B10}
					    end),
    {V1_award_list, _B16} = protocol:array(_B12,
					   fun (_B13) ->
						   {V2_id, _B14} =
						       protocol:uint16(_B13),
						   {V2_id, _B14}
					   end),
    {ok,
     {V1_camp_id, V1_free_time, V1_times, V1_start_time,
      V1_end_time, V1_item_id, V1_item_num, V1_must_count,
      V1_reward_list, V1_award_list}};
unpack(26522, srv, _B0) ->
    {V1_times, _B1} = protocol:uint8(_B0),
    {V1_recruit_type, _B2} = protocol:uint8(_B1),
    {ok, {V1_times, V1_recruit_type}};
unpack(26522, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(26523, srv, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0), {ok, {V1_id}};
unpack(26523, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(26525, srv, _B0) -> {ok, {}};
unpack(26525, cli, _B0) ->
    {V1_group_id, _B1} = protocol:uint16(_B0),
    {V1_times, _B2} = protocol:uint8(_B1),
    {V1_rewards, _B7} = protocol:array(_B2,
				       fun (_B3) ->
					       {V2_base_id, _B4} =
						   protocol:uint32(_B3),
					       {V2_num, _B5} =
						   protocol:uint32(_B4),
					       {{V2_base_id, V2_num}, _B5}
				       end),
    {V1_sprite_bids, _B13} = protocol:array(_B7,
					    fun (_B8) ->
						    {V2_sprite_bid, _B9} =
							protocol:uint32(_B8),
						    {V2_quality, _B10} =
							protocol:uint8(_B9),
						    {V2_jie, _B11} =
							protocol:uint16(_B10),
						    {{V2_sprite_bid, V2_quality,
						      V2_jie},
						     _B11}
					    end),
    {ok,
     {V1_group_id, V1_times, V1_rewards, V1_sprite_bids}};
unpack(26530, srv, _B0) ->
    {V1_item_bid, _B1} = protocol:uint32(_B0),
    {ok, {V1_item_bid}};
unpack(26530, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(26535, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(26535, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(26550, srv, _B0) -> {ok, {}};
unpack(26550, cli, _B0) ->
    {V1_camp_id, _B1} = protocol:uint32(_B0),
    {V1_free_time, _B2} = protocol:uint32(_B1),
    {V1_times, _B3} = protocol:uint32(_B2),
    {V1_do_awards, _B7} = protocol:array(_B3,
					 fun (_B4) ->
						 {V2_award_id, _B5} =
						     protocol:uint32(_B4),
						 {V2_award_id, _B5}
					 end),
    {V1_lucky_ids, _B11} = protocol:array(_B7,
					  fun (_B8) ->
						  {V2_lucky_sprites_bid, _B9} =
						      protocol:uint32(_B8),
						  {V2_lucky_sprites_bid, _B9}
					  end),
    {V1_day_count, _B12} = protocol:uint32(_B11),
    {ok,
     {V1_camp_id, V1_free_time, V1_times, V1_do_awards,
      V1_lucky_ids, V1_day_count}};
unpack(26551, srv, _B0) ->
    {V1_times, _B1} = protocol:uint8(_B0),
    {V1_recruit_type, _B2} = protocol:uint8(_B1),
    {ok, {V1_times, V1_recruit_type}};
unpack(26551, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(26552, srv, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0), {ok, {V1_id}};
unpack(26552, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(26553, srv, _B0) -> {ok, {}};
unpack(26553, cli, _B0) ->
    {V1_group_id, _B1} = protocol:uint16(_B0),
    {V1_times, _B2} = protocol:uint8(_B1),
    {V1_rewards, _B7} = protocol:array(_B2,
				       fun (_B3) ->
					       {V2_base_id, _B4} =
						   protocol:uint32(_B3),
					       {V2_num, _B5} =
						   protocol:uint32(_B4),
					       {{V2_base_id, V2_num}, _B5}
				       end),
    {V1_sprite_bids, _B13} = protocol:array(_B7,
					    fun (_B8) ->
						    {V2_sprite_bid, _B9} =
							protocol:uint32(_B8),
						    {V2_quality, _B10} =
							protocol:uint8(_B9),
						    {V2_jie, _B11} =
							protocol:uint16(_B10),
						    {{V2_sprite_bid, V2_quality,
						      V2_jie},
						     _B11}
					    end),
    {ok,
     {V1_group_id, V1_times, V1_rewards, V1_sprite_bids}};
unpack(26554, srv, _B0) ->
    {V1_lucky_ids, _B4} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_lucky_sprites_bid, _B2} =
						     protocol:uint32(_B1),
						 {V2_lucky_sprites_bid, _B2}
					 end),
    {ok, {V1_lucky_ids}};
unpack(26554, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(26555, srv, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0), {ok, {V1_type}};
unpack(26555, cli, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_team_list, _B11} = protocol:array(_B1,
					  fun (_B2) ->
						  {V2_team, _B3} =
						      protocol:uint32(_B2),
						  {V2_sprites, _B8} =
						      protocol:array(_B3,
								     fun
								       (_B4) ->
									   {V3_pos,
									    _B5} =
									       protocol:uint8(_B4),
									   {V3_item_bid,
									    _B6} =
									       protocol:uint32(_B5),
									   {{V3_pos,
									     V3_item_bid},
									    _B6}
								     end),
						  {V2_plan_id, _B9} =
						      protocol:uint8(_B8),
						  {{V2_team, V2_sprites,
						    V2_plan_id},
						   _B9}
					  end),
    {ok, {V1_type, V1_team_list}};
unpack(26556, srv, _B0) -> {ok, {}};
unpack(26556, cli, _B0) ->
    {V1_plan_list, _B10} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_id, _B2} =
						      protocol:uint8(_B1),
						  {V2_name, _B3} =
						      protocol:string(_B2),
						  {V2_plan_sprites, _B8} =
						      protocol:array(_B3,
								     fun
								       (_B4) ->
									   {V3_pos,
									    _B5} =
									       protocol:uint8(_B4),
									   {V3_item_bid,
									    _B6} =
									       protocol:uint32(_B5),
									   {{V3_pos,
									     V3_item_bid},
									    _B6}
								     end),
						  {{V2_id, V2_name,
						    V2_plan_sprites},
						   _B8}
					  end),
    {ok, {V1_plan_list}};
unpack(26557, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_sprites, _B6} = protocol:array(_B1,
				       fun (_B2) ->
					       {V2_pos, _B3} =
						   protocol:uint8(_B2),
					       {V2_item_bid, _B4} =
						   protocol:uint32(_B3),
					       {{V2_pos, V2_item_bid}, _B4}
				       end),
    {V1_type, _B7} = protocol:uint32(_B6),
    {V1_team, _B8} = protocol:uint32(_B7),
    {ok, {V1_id, V1_sprites, V1_type, V1_team}};
unpack(26557, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(26558, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_name, _B2} = protocol:string(_B1),
    {ok, {V1_id, V1_name}};
unpack(26558, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(26559, srv, _B0) -> {ok, {}};
unpack(26559, cli, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_name, _B2} = protocol:string(_B1),
    {V1_plan_sprites, _B7} = protocol:array(_B2,
					    fun (_B3) ->
						    {V2_pos, _B4} =
							protocol:uint8(_B3),
						    {V2_item_bid, _B5} =
							protocol:uint32(_B4),
						    {{V2_pos, V2_item_bid}, _B5}
					    end),
    {ok, {V1_id, V1_name, V1_plan_sprites}};
unpack(26560, srv, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_team, _B2} = protocol:uint32(_B1),
    {V1_sprites, _B7} = protocol:array(_B2,
				       fun (_B3) ->
					       {V2_pos, _B4} =
						   protocol:uint8(_B3),
					       {V2_item_bid, _B5} =
						   protocol:uint32(_B4),
					       {{V2_pos, V2_item_bid}, _B5}
				       end),
    {V1_flag, _B8} = protocol:uint8(_B7),
    {ok, {V1_type, V1_team, V1_sprites, V1_flag}};
unpack(26560, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_type, _B3} = protocol:uint32(_B2),
    {V1_team, _B4} = protocol:uint32(_B3),
    {ok, {V1_flag, V1_msg, V1_type, V1_team}};
unpack(26561, srv, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_team, _B2} = protocol:uint32(_B1),
    {V1_id, _B3} = protocol:uint8(_B2),
    {ok, {V1_type, V1_team, V1_id}};
unpack(26561, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_type, _B3} = protocol:uint32(_B2),
    {V1_team, _B4} = protocol:uint32(_B3),
    {ok, {V1_flag, V1_msg, V1_type, V1_team}};
unpack(26562, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0), {ok, {V1_id}};
unpack(26562, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(26563, srv, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_base_id, V1_num}};
unpack(26563, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {ok, {V1_flag, V1_type, V1_id, V1_name}};
unpack(26564, srv, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_team_list, _B6} = protocol:array(_B1,
					 fun (_B2) ->
						 {V2_team, _B3} =
						     protocol:uint32(_B2),
						 {V2_old_team, _B4} =
						     protocol:uint32(_B3),
						 {{V2_team, V2_old_team}, _B4}
					 end),
    {ok, {V1_type, V1_team_list}};
unpack(26564, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


