-file("src/proto/proto_166.erl", 1).

-module(proto_166).

-lager_records([{holiday_predict_info,
		 [type, count, buy_list, rand_lists, flag]},
		{m_holiday_predict, [ver, camp_id, info]},
		{holiday_dial_rand_data,
		 [zid, id, name, award_type, item_id, item_num,
		  gold_rate, pro, limit_lev_min, limit_lev_max,
		  not_hit_in_m, not_hit_in_m_after, hit_when_m_after,
		  notice, notice_rank, limit_count]},
		{rand_data,
		 [rand_id, id, name, item_id, item_num, rare, pro,
		  limit_lev, not_hit_in_m, notice, limit_count,
		  max_count]},
		{dial_info,
		 [type, count, lucky, lucky_award, list, award_list,
		  day_award_list, frist_type, end_time, rand_lists,
		  pos_limit_count, item_limit_count]},
		{m_holiday_dial,
		 [ver, camp_id, award_list, num, count, list, logs, lev,
		  old_data]},
		{m_dial, [ver, info, reset_time]},
		{holiday,
		 [camp_id, total_id, bid, tbid, cli_type, cli_type_name,
		  start_time, end_time, condition, type, title, title2,
		  main_ico, ico, type_ico, top_banner, rule_str, time_str,
		  bottom_alert, sort_val, reward_title, aim_title, reward,
		  item_effect, mail_subject, mail_content, cli_reward,
		  panel_type, open_day, open_day_min, open_day_max,
		  merge_day, process_show_reward, platform_id,
		  platform_exclude_id, hide_srv_ids, channel_ban]},
		{holiday_total,
		 [id, name, icon_id, start_time, end_time, status,
		  open_day, merge_day, is_show, type]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/holiday.hrl", 1).

-record(holiday_total,
	{id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 icon_id = 0  :: non_neg_integer(),
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 open_day = 0  :: non_neg_integer(),
	 merge_day = 0  :: non_neg_integer(),
	 is_show = 0  :: 0..1, type = 0  :: 0..2}).

-record(holiday,
	{camp_id = 0  :: non_neg_integer(),
	 total_id = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer(),
	 tbid = 0  :: non_neg_integer(),
	 cli_type = 0  :: non_neg_integer(),
	 cli_type_name = <<>>  :: binary(),
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(), condition = [],
	 type = 0  :: 0..2, title = <<>>  :: bitstring(),
	 title2 = <<>>  :: bitstring(),
	 main_ico = 0  :: pos_integer() | tuple(),
	 ico = <<>>  :: bitstring(),
	 type_ico = 0  :: non_neg_integer(),
	 top_banner = <<>>  :: bitstring(),
	 rule_str = <<>>  :: bitstring(),
	 time_str = <<>>  :: bitstring(),
	 bottom_alert = <<>>  :: bitstring(),
	 sort_val = 0  :: non_neg_integer(),
	 reward_title = <<>>  :: bitstring(),
	 aim_title = <<>>  :: bitstring(),
	 reward = []  :: list(), item_effect = []  :: list(),
	 mail_subject = <<>>  :: bitstring(),
	 mail_content = <<>>  :: bitstring(),
	 cli_reward = <<>>  :: bitstring(),
	 panel_type = 0  :: non_neg_integer(),
	 open_day = 0  :: non_neg_integer(),
	 open_day_min = 0  :: non_neg_integer(),
	 open_day_max = 0  :: non_neg_integer(),
	 merge_day = 0  :: non_neg_integer(),
	 process_show_reward = 0  :: non_neg_integer(),
	 platform_id = []  :: list(),
	 platform_exclude_id = []  :: list(), hide_srv_ids = [],
	 channel_ban = <<>>  :: bitstring()}).

-file("src/proto/proto_166.erl", 16).

-file("inc/dial.hrl", 1).

-record(m_dial,
	{ver = 2  :: non_neg_integer(), info = [],
	 reset_time = 0}).

-record(m_holiday_dial,
	{ver = 1  :: non_neg_integer(), camp_id = 0,
	 award_list = [], num = 0, count = 0, list = [],
	 logs = [], lev = 0, old_data = []}).

-record(dial_info,
	{type = 0, count = 0, lucky = 0, lucky_award = [],
	 list = [], award_list = [], day_award_list = [],
	 frist_type = 0, end_time = 0, rand_lists = [],
	 pos_limit_count = [], item_limit_count = []}).

-record(rand_data,
	{rand_id = 0, id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 item_id = 0  :: non_neg_integer(),
	 item_num = 0  :: non_neg_integer(), rare = 0,
	 pro = 0  :: non_neg_integer(),
	 limit_lev = 0  :: non_neg_integer(),
	 not_hit_in_m = 0  :: non_neg_integer(),
	 notice = 0  :: non_neg_integer(),
	 limit_count = 0  :: non_neg_integer(),
	 max_count = 0  :: non_neg_integer()}).

-record(holiday_dial_rand_data,
	{zid = 0, id = 110, name = <<>>, award_type = 0,
	 item_id = 0, item_num = 0, gold_rate = 0, pro = 0,
	 limit_lev_min = 0, limit_lev_max = 9999,
	 not_hit_in_m = 0, not_hit_in_m_after = 0,
	 hit_when_m_after = 0, notice = 0, notice_rank = 0,
	 limit_count = 0}).

-file("src/proto/proto_166.erl", 17).

-file("inc/holiday_predict.hrl", 1).

-record(m_holiday_predict,
	{ver = 1  :: non_neg_integer(), camp_id = 0,
	 info = []}).

-record(holiday_predict_info,
	{type = 0, count = 0, buy_list = [], rand_lists = [],
	 flag = 0}).

-file("src/proto/proto_166.erl", 18).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(16601, cli, {}) -> {ok, <<2:32, 16601:16>>};
pack(16601, srv, {V0_holiday_list}) ->
    D_a_t_a = <<(length(V0_holiday_list)):16,
		(list_to_binary([<<V1_camp_id:32, V1_bid:32,
				   (protocol:pack(string, V1_title))/binary,
				   (protocol:pack(string, V1_title2))/binary,
				   (protocol:pack(string, V1_ico))/binary,
				   V1_type_ico:8,
				   (protocol:pack(string,
						  V1_top_banner))/binary,
				   (protocol:pack(string, V1_rule_str))/binary,
				   (protocol:pack(string, V1_time_str))/binary,
				   (protocol:pack(string,
						  V1_bottom_alert))/binary,
				   (protocol:pack(string, V1_aim_title))/binary,
				   V1_panel_type:8,
				   (protocol:pack(string,
						  V1_channel_ban))/binary,
				   V1_sort_val:8,
				   (protocol:pack(string,
						  V1_reward_title))/binary,
				   V1_remain_sec:32, V1_cli_type:32,
				   (protocol:pack(string,
						  V1_cli_type_name))/binary>>
				 || {#holiday{camp_id = V1_camp_id,
					      bid = V1_bid, title = V1_title,
					      title2 = V1_title2, ico = V1_ico,
					      type_ico = V1_type_ico,
					      top_banner = V1_top_banner,
					      rule_str = V1_rule_str,
					      time_str = V1_time_str,
					      bottom_alert = V1_bottom_alert,
					      aim_title = V1_aim_title,
					      panel_type = V1_panel_type,
					      channel_ban = V1_channel_ban,
					      sort_val = V1_sort_val,
					      reward_title = V1_reward_title},
				     V1_remain_sec, V1_cli_type,
				     V1_cli_type_name}
					<- V0_holiday_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16601:16,
       D_a_t_a/binary>>};
pack(16602, cli, {}) -> {ok, <<2:32, 16602:16>>};
pack(16602, srv, {V0_holiday_list}) ->
    D_a_t_a = <<(length(V0_holiday_list)):16,
		(list_to_binary([<<V1_bid:32, V1_can_get_num:8>>
				 || {V1_bid, V1_can_get_num}
					<- V0_holiday_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16602:16,
       D_a_t_a/binary>>};
pack(16603, cli, {V0_bid}) ->
    D_a_t_a = <<V0_bid:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16603:16,
       D_a_t_a/binary>>};
pack(16603, srv,
     {V0_bid, V0_cli_type, V0_remain_sec, V0_finish,
      V0_aim_list, V0_item_effect_list, V0_args,
      V0_client_reward, V0_rank_list}) ->
    D_a_t_a = <<V0_bid:32, V0_cli_type:32, V0_remain_sec:32,
		V0_finish:32, (length(V0_aim_list)):16,
		(list_to_binary([<<V1_aim:32,
				   (protocol:pack(string, V1_aim_str))/binary,
				   V1_status:8, (length(V1_item_list)):16,
				   (list_to_binary([<<V2_bid:32, V2_num:32>>
						    || {V2_bid, V2_num}
							   <- V1_item_list]))/binary,
				   (length(V1_aim_args)):16,
				   (list_to_binary([<<V2_aim_args_key:8,
						      V2_aim_args_val:32,
						      (protocol:pack(string,
								     V2_aim_args_str))/binary>>
						    || {V2_aim_args_key,
							V2_aim_args_val,
							V2_aim_args_str}
							   <- V1_aim_args]))/binary>>
				 || {V1_aim, V1_aim_str, V1_status,
				     V1_item_list, V1_aim_args}
					<- V0_aim_list]))/binary,
		(length(V0_item_effect_list)):16,
		(list_to_binary([<<V1_bid:32, V1_effect_1:8,
				   V1_effect_2:8>>
				 || {V1_bid, V1_effect_1, V1_effect_2}
					<- V0_item_effect_list]))/binary,
		(length(V0_args)):16,
		(list_to_binary([<<V1_args_key:8, V1_args_val:32,
				   (protocol:pack(string, V1_args_str))/binary>>
				 || {V1_args_key, V1_args_val, V1_args_str}
					<- V0_args]))/binary,
		(protocol:pack(string, V0_client_reward))/binary,
		(length(V0_rank_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_sex:8, V1_career:8, V1_lev:8, V1_val:32,
				   (length(V1_rank_args)):16,
				   (list_to_binary([<<V2_rank_args_key:8,
						      V2_rank_args_val:32>>
						    || {V2_rank_args_key,
							V2_rank_args_val}
							   <- V1_rank_args]))/binary>>
				 || {V1_rid, V1_srv_id, V1_name, V1_sex,
				     V1_career, V1_lev, V1_val, V1_rank_args}
					<- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16603:16,
       D_a_t_a/binary>>};
pack(16604, cli, {V0_bid, V0_aim, V0_arg}) ->
    D_a_t_a = <<V0_bid:32, V0_aim:32, V0_arg:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16604:16,
       D_a_t_a/binary>>};
pack(16604, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16604:16,
       D_a_t_a/binary>>};
pack(16605, cli, {V0_bid_list}) ->
    D_a_t_a = <<(length(V0_bid_list)):16,
		(list_to_binary([<<V1_bid:32>>
				 || V1_bid <- V0_bid_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16605:16,
       D_a_t_a/binary>>};
pack(16605, srv, {V0_status}) ->
    D_a_t_a = <<(length(V0_status)):16,
		(list_to_binary([<<V1_bid:32, V1_code:8,
				   V1_end_time:32>>
				 || {V1_bid, V1_code, V1_end_time}
					<- V0_status]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16605:16,
       D_a_t_a/binary>>};
pack(16606, srv, {V0_bid, V0_can_get_num}) ->
    D_a_t_a = <<V0_bid:32, V0_can_get_num:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16606:16,
       D_a_t_a/binary>>};
pack(16607, cli, {}) -> {ok, <<2:32, 16607:16>>};
pack(16607, srv, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16607:16,
       D_a_t_a/binary>>};
pack(16610, srv, {V0_bid, V0_aim, V0_item_bid}) ->
    D_a_t_a = <<V0_bid:32, V0_aim:32, V0_item_bid:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16610:16,
       D_a_t_a/binary>>};
pack(16620, cli, {V0_id_list}) ->
    D_a_t_a = <<(length(V0_id_list)):16,
		(list_to_binary([<<V1_id:32>>
				 || V1_id <- V0_id_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16620:16,
       D_a_t_a/binary>>};
pack(16620, srv, {V0_holiday_list}) ->
    D_a_t_a = <<(length(V0_holiday_list)):16,
		(list_to_binary([<<V1_bid:32, V1_cli_type:32,
				   V1_remain_sec:32, V1_finish:32,
				   (length(V1_aim_list)):16,
				   (list_to_binary([<<V2_aim:32,
						      (protocol:pack(string,
								     V2_aim_str))/binary,
						      V2_status:8,
						      (length(V2_item_list)):16,
						      (list_to_binary([<<V3_bid:32,
									 V3_num:32>>
								       || {V3_bid,
									   V3_num}
									      <- V2_item_list]))/binary,
						      (length(V2_aim_args)):16,
						      (list_to_binary([<<V3_aim_args_key:8,
									 V3_aim_args_val:32,
									 (protocol:pack(string,
											V3_aim_args_str))/binary>>
								       || {V3_aim_args_key,
									   V3_aim_args_val,
									   V3_aim_args_str}
									      <- V2_aim_args]))/binary>>
						    || {V2_aim, V2_aim_str,
							V2_status, V2_item_list,
							V2_aim_args}
							   <- V1_aim_list]))/binary,
				   (length(V1_item_effect_list)):16,
				   (list_to_binary([<<V2_bid:32, V2_effect_1:8,
						      V2_effect_2:8>>
						    || {V2_bid, V2_effect_1,
							V2_effect_2}
							   <- V1_item_effect_list]))/binary,
				   (length(V1_args)):16,
				   (list_to_binary([<<V2_args_key:8,
						      V2_args_val:32,
						      (protocol:pack(string,
								     V2_args_str))/binary>>
						    || {V2_args_key,
							V2_args_val,
							V2_args_str}
							   <- V1_args]))/binary,
				   (protocol:pack(string,
						  V1_client_reward))/binary,
				   (length(V1_rank_list)):16,
				   (list_to_binary([<<V2_rid:32,
						      (protocol:pack(string,
								     V2_srv_id))/binary,
						      (protocol:pack(string,
								     V2_name))/binary,
						      V2_sex:8, V2_career:8,
						      V2_lev:8, V2_val:32,
						      (length(V2_rank_args)):16,
						      (list_to_binary([<<V3_rank_args_key:8,
									 V3_rank_args_val:32>>
								       || {V3_rank_args_key,
									   V3_rank_args_val}
									      <- V2_rank_args]))/binary>>
						    || {V2_rid, V2_srv_id,
							V2_name, V2_sex,
							V2_career, V2_lev,
							V2_val, V2_rank_args}
							   <- V1_rank_list]))/binary>>
				 || {V1_bid, V1_cli_type, V1_remain_sec,
				     V1_finish, V1_aim_list,
				     V1_item_effect_list, V1_args,
				     V1_client_reward, V1_rank_list}
					<- V0_holiday_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16620:16,
       D_a_t_a/binary>>};
pack(16630, cli, {}) -> {ok, <<2:32, 16630:16>>};
pack(16630, srv, {V0_code, V0_items}) ->
    D_a_t_a = <<V0_code:8, (length(V0_items)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_items]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16630:16,
       D_a_t_a/binary>>};
pack(16631, cli, {}) -> {ok, <<2:32, 16631:16>>};
pack(16631, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16631:16,
       D_a_t_a/binary>>};
pack(16633, cli, {}) -> {ok, <<2:32, 16633:16>>};
pack(16633, srv, {V0_code, V0_items}) ->
    D_a_t_a = <<V0_code:8, (length(V0_items)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_items]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16633:16,
       D_a_t_a/binary>>};
pack(16634, cli, {}) -> {ok, <<2:32, 16634:16>>};
pack(16634, srv, {}) -> {ok, <<2:32, 16634:16>>};
pack(16635, cli, {}) -> {ok, <<2:32, 16635:16>>};
pack(16635, srv, {V0_code, V0_items}) ->
    D_a_t_a = <<V0_code:8, (length(V0_items)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_items]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16635:16,
       D_a_t_a/binary>>};
pack(16636, cli, {V0_number, V0_code}) ->
    D_a_t_a = <<(protocol:pack(string, V0_number))/binary,
		(protocol:pack(string, V0_code))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16636:16,
       D_a_t_a/binary>>};
pack(16636, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16636:16,
       D_a_t_a/binary>>};
pack(16637, cli, {}) -> {ok, <<2:32, 16637:16>>};
pack(16637, srv, {V0_dial_data}) ->
    D_a_t_a = <<(length(V0_dial_data)):16,
		(list_to_binary([<<V1_type:32, V1_count:32, V1_lucky:32,
				   V1_frist_type:32,
				   (length(V1_lucky_award)):16,
				   (list_to_binary([<<V2_lucky:32>>
						    || V2_lucky
							   <- V1_lucky_award]))/binary,
				   V1_end_time:32, (length(V1_rand_lists)):16,
				   (list_to_binary([<<V2_pos:8, V2_id:32,
						      V2_status:8>>
						    || {V2_pos, V2_id,
							V2_status}
							   <- V1_rand_lists]))/binary,
				   (length(V1_log_list)):16,
				   (list_to_binary([<<(protocol:pack(string,
								     V2_role_name))/binary,
						      V2_bid:32, V2_num:32>>
						    || {V2_role_name, V2_bid,
							V2_num}
							   <- V1_log_list]))/binary>>
				 || {#dial_info{type = V1_type,
						count = V1_count,
						lucky = V1_lucky,
						frist_type = V1_frist_type,
						lucky_award = V1_lucky_award,
						end_time = V1_end_time,
						rand_lists = V1_rand_lists},
				     V1_log_list}
					<- V0_dial_data]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16637:16,
       D_a_t_a/binary>>};
pack(16638, cli, {V0_type, V0_type2}) ->
    D_a_t_a = <<V0_type:32, V0_type2:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16638:16,
       D_a_t_a/binary>>};
pack(16638, srv,
     {V0_code, V0_msg, V0_frist_awards, V0_awards1,
      V0_awards2, V0_awards3}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_frist_awards)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num}
					<- V0_frist_awards]))/binary,
		(length(V0_awards1)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_awards1]))/binary,
		(length(V0_awards2)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_awards2]))/binary,
		(length(V0_awards3)):16,
		(list_to_binary([<<V1_pos:8>>
				 || V1_pos <- V0_awards3]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16638:16,
       D_a_t_a/binary>>};
pack(16639, cli, {}) -> {ok, <<2:32, 16639:16>>};
pack(16639, srv,
     {#dial_info{type = V0_type, count = V0_count,
		 lucky = V0_lucky, frist_type = V0_frist_type,
		 lucky_award = V0_lucky_award, end_time = V0_end_time,
		 rand_lists = V0_rand_lists}}) ->
    D_a_t_a = <<V0_type:32, V0_count:32, V0_lucky:32,
		V0_frist_type:32, (length(V0_lucky_award)):16,
		(list_to_binary([<<V1_lucky:32>>
				 || V1_lucky <- V0_lucky_award]))/binary,
		V0_end_time:32, (length(V0_rand_lists)):16,
		(list_to_binary([<<V1_pos:8, V1_id:32, V1_status:8>>
				 || {V1_pos, V1_id, V1_status}
					<- V0_rand_lists]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16639:16,
       D_a_t_a/binary>>};
pack(16640, cli, {V0_type, V0_id}) ->
    D_a_t_a = <<V0_type:32, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16640:16,
       D_a_t_a/binary>>};
pack(16640, srv, {V0_code, V0_msg, V0_type}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_type:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16640:16,
       D_a_t_a/binary>>};
pack(16641, cli, {}) -> {ok, <<2:32, 16641:16>>};
pack(16641, srv, {V0_type, V0_log_list}) ->
    D_a_t_a = <<V0_type:32, (length(V0_log_list)):16,
		(list_to_binary([<<(protocol:pack(string,
						  V1_role_name))/binary,
				   V1_bid:32, V1_num:32>>
				 || {V1_role_name, V1_bid, V1_num}
					<- V0_log_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16641:16,
       D_a_t_a/binary>>};
pack(16642, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16642:16,
       D_a_t_a/binary>>};
pack(16642, srv, {V0_code, V0_msg, V0_type}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_type:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16642:16,
       D_a_t_a/binary>>};
pack(16643, cli, {V0_type, V0_type2}) ->
    D_a_t_a = <<V0_type:32, V0_type2:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16643:16,
       D_a_t_a/binary>>};
pack(16643, srv,
     {V0_code, V0_msg, V0_frist_awards, V0_awards1,
      V0_awards2, V0_awards3}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_frist_awards)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num}
					<- V0_frist_awards]))/binary,
		(length(V0_awards1)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_awards1]))/binary,
		(length(V0_awards2)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_awards2]))/binary,
		(length(V0_awards3)):16,
		(list_to_binary([<<V1_pos:8>>
				 || V1_pos <- V0_awards3]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16643:16,
       D_a_t_a/binary>>};
pack(16650, cli, {V0_bid}) ->
    D_a_t_a = <<V0_bid:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16650:16,
       D_a_t_a/binary>>};
pack(16650, srv, {V0_rank, V0_rank_award}) ->
    D_a_t_a = <<V0_rank:32, (length(V0_rank_award)):16,
		(list_to_binary([<<V1_rank1:32, V1_rank2:32,
				   (length(V1_award)):16,
				   (list_to_binary([<<V2_bid:32, V2_num:32>>
						    || {V2_bid, V2_num}
							   <- V1_award]))/binary>>
				 || {V1_rank1, V1_rank2, V1_award}
					<- V0_rank_award]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16650:16,
       D_a_t_a/binary>>};
pack(16651, cli, {}) -> {ok, <<2:32, 16651:16>>};
pack(16651, srv,
     {V0_period, V0_is_buy, V0_end_time, V0_list}) ->
    D_a_t_a = <<V0_period:8, V0_is_buy:8, V0_end_time:32,
		(length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_finish:8>>
				 || {V1_id, V1_finish} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16651:16,
       D_a_t_a/binary>>};
pack(16652, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16652:16,
       D_a_t_a/binary>>};
pack(16652, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16652:16,
       D_a_t_a/binary>>};
pack(16653, cli, {}) -> {ok, <<2:32, 16653:16>>};
pack(16653, srv,
     {V0_is_buy, V0_end_time, V0_charge_id,
      V0_award_list}) ->
    D_a_t_a = <<V0_is_buy:8, V0_end_time:32,
		V0_charge_id:32, (length(V0_award_list)):16,
		(list_to_binary([<<V1_id:32, V1_acv_id:32, V1_finish:8,
				   V1_award_time:32, (length(V1_award)):16,
				   (list_to_binary([<<V2_bid:32, V2_num:32>>
						    || {V2_bid, V2_num}
							   <- V1_award]))/binary>>
				 || {V1_id, V1_acv_id, V1_finish, V1_award_time,
				     V1_award}
					<- V0_award_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16653:16,
       D_a_t_a/binary>>};
pack(16654, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16654:16,
       D_a_t_a/binary>>};
pack(16654, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16654:16,
       D_a_t_a/binary>>};
pack(16660, cli, {}) -> {ok, <<2:32, 16660:16>>};
pack(16660, srv, {V0_holiday_exchanges}) ->
    D_a_t_a = <<(length(V0_holiday_exchanges)):16,
		(list_to_binary([<<V1_bid:32, V1_end_time:32,
				   (protocol:pack(string,
						  V1_exchange_name))/binary,
				   V1_need_id:32, (length(V1_exchange_list)):16,
				   (list_to_binary([<<V2_aim:32,
						      (protocol:pack(string,
								     V2_aim_str))/binary,
						      V2_buy_count:32,
						      V2_limit_buy:32,
						      V2_lable:32,
						      V2_expend_id:32,
						      V2_expend_num:32,
						      (length(V2_item_list)):16,
						      (list_to_binary([<<V3_bid:32,
									 V3_num:32>>
								       || {V3_bid,
									   V3_num}
									      <- V2_item_list]))/binary,
						      (length(V2_aim_args)):16,
						      (list_to_binary([<<V3_aim_args_key:8,
									 V3_aim_args_val:32,
									 (protocol:pack(string,
											V3_aim_args_str))/binary>>
								       || {V3_aim_args_key,
									   V3_aim_args_val,
									   V3_aim_args_str}
									      <- V2_aim_args]))/binary>>
						    || {V2_aim, V2_aim_str,
							V2_buy_count,
							V2_limit_buy, V2_lable,
							V2_expend_id,
							V2_expend_num,
							V2_item_list,
							V2_aim_args}
							   <- V1_exchange_list]))/binary>>
				 || {V1_bid, V1_end_time, V1_exchange_name,
				     V1_need_id, V1_exchange_list}
					<- V0_holiday_exchanges]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16660:16,
       D_a_t_a/binary>>};
pack(16661, cli, {V0_bid, V0_aim, V0_num}) ->
    D_a_t_a = <<V0_bid:32, V0_aim:32, V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16661:16,
       D_a_t_a/binary>>};
pack(16661, srv,
     {V0_code, V0_msg, V0_bid, V0_aim, V0_buy_count}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_bid:32,
		V0_aim:32, V0_buy_count:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16661:16,
       D_a_t_a/binary>>};
pack(16665, cli, {V0_bid, V0_ids}) ->
    D_a_t_a = <<V0_bid:32, (length(V0_ids)):16,
		(list_to_binary([<<V1_id:32, V1_num:32>>
				 || {V1_id, V1_num} <- V0_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16665:16,
       D_a_t_a/binary>>};
pack(16665, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16665:16,
       D_a_t_a/binary>>};
pack(16666, cli, {V0_bid}) ->
    D_a_t_a = <<V0_bid:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16666:16,
       D_a_t_a/binary>>};
pack(16666, srv, {}) -> {ok, <<2:32, 16666:16>>};
pack(16670, cli, {}) -> {ok, <<2:32, 16670:16>>};
pack(16670, srv,
     {V0_num, V0_gold, V0_is_free, V0_holiday_lev,
      V0_award_list}) ->
    D_a_t_a = <<V0_num:32, V0_gold:32, V0_is_free:8,
		V0_holiday_lev:32, (length(V0_award_list)):16,
		(list_to_binary([<<V1_id:32, V1_status:32>>
				 || {V1_id, V1_status}
					<- V0_award_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16670:16,
       D_a_t_a/binary>>};
pack(16671, cli, {V0_count, V0_flag}) ->
    D_a_t_a = <<V0_count:8, V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16671:16,
       D_a_t_a/binary>>};
pack(16671, srv, {V0_result, V0_msg, V0_id, V0_flag}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:8,
		V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16671:16,
       D_a_t_a/binary>>};
pack(16672, cli, {}) -> {ok, <<2:32, 16672:16>>};
pack(16672, srv, {V0_count, V0_awards2}) ->
    D_a_t_a = <<V0_count:8, (length(V0_awards2)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_awards2]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16672:16,
       D_a_t_a/binary>>};
pack(16673, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16673:16,
       D_a_t_a/binary>>};
pack(16673, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16673:16,
       D_a_t_a/binary>>};
pack(16674, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16674:16,
       D_a_t_a/binary>>};
pack(16674, srv, {V0_type, V0_log_list}) ->
    D_a_t_a = <<V0_type:8, (length(V0_log_list)):16,
		(list_to_binary([<<(protocol:pack(string,
						  V1_role_name))/binary,
				   V1_bid:32, V1_num:32>>
				 || {V1_role_name, V1_bid, V1_num}
					<- V0_log_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16674:16,
       D_a_t_a/binary>>};
pack(16675, cli, {V0_num}) ->
    D_a_t_a = <<V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16675:16,
       D_a_t_a/binary>>};
pack(16675, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16675:16,
       D_a_t_a/binary>>};
pack(16676, cli, {}) -> {ok, <<2:32, 16676:16>>};
pack(16676, srv, {V0_gold}) ->
    D_a_t_a = <<V0_gold:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16676:16,
       D_a_t_a/binary>>};
pack(16680, cli, {}) -> {ok, <<2:32, 16680:16>>};
pack(16680, srv,
     {V0_lucky, V0_free_num, V0_endtime, V0_egg_status}) ->
    D_a_t_a = <<V0_lucky:32, V0_free_num:8, V0_endtime:32,
		(length(V0_egg_status)):16,
		(list_to_binary([<<V1_pos:8, V1_type:8, V1_status:8,
				   (length(V1_show_reward)):16,
				   (list_to_binary([<<V2_item_id:32, V2_num:32>>
						    || {V2_item_id, V2_num}
							   <- V1_show_reward]))/binary>>
				 || {V1_pos, V1_type, V1_status, V1_show_reward}
					<- V0_egg_status]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16680:16,
       D_a_t_a/binary>>};
pack(16681, cli, {}) -> {ok, <<2:32, 16681:16>>};
pack(16681, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16681:16,
       D_a_t_a/binary>>};
pack(16682, cli, {V0_pos}) ->
    D_a_t_a = <<V0_pos:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16682:16,
       D_a_t_a/binary>>};
pack(16682, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16682:16,
       D_a_t_a/binary>>};
pack(16683, cli, {}) -> {ok, <<2:32, 16683:16>>};
pack(16683, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16683:16,
       D_a_t_a/binary>>};
pack(16684, cli, {V0_num}) ->
    D_a_t_a = <<V0_num:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16684:16,
       D_a_t_a/binary>>};
pack(16684, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16684:16,
       D_a_t_a/binary>>};
pack(16685, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16685:16,
       D_a_t_a/binary>>};
pack(16685, srv, {V0_type, V0_log_list}) ->
    D_a_t_a = <<V0_type:8, (length(V0_log_list)):16,
		(list_to_binary([<<(protocol:pack(string,
						  V1_role_name))/binary,
				   V1_bid:32, V1_num:32>>
				 || {V1_role_name, V1_bid, V1_num}
					<- V0_log_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16685:16,
       D_a_t_a/binary>>};
pack(16686, cli,
     {V0_partner_id, V0_partner_bid, V0_expend}) ->
    D_a_t_a = <<V0_partner_id:32, V0_partner_bid:32,
		(length(V0_expend)):16,
		(list_to_binary([<<V1_partner_id:32>>
				 || V1_partner_id <- V0_expend]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16686:16,
       D_a_t_a/binary>>};
pack(16686, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16686:16,
       D_a_t_a/binary>>};
pack(16687, cli, {V0_bid}) ->
    D_a_t_a = <<V0_bid:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16687:16,
       D_a_t_a/binary>>};
pack(16687, srv, {V0_bid, V0_code}) ->
    D_a_t_a = <<V0_bid:32, V0_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16687:16,
       D_a_t_a/binary>>};
pack(16688, cli, {}) -> {ok, <<2:32, 16688:16>>};
pack(16688, srv, {V0_buy_info}) ->
    D_a_t_a = <<(length(V0_buy_info)):16,
		(list_to_binary([<<V1_id:8, V1_day_num:32,
				   V1_all_num:32, V1_s_day_num:32,
				   V1_s_all_num:32>>
				 || {V1_id, V1_day_num, V1_all_num,
				     V1_s_day_num, V1_s_all_num}
					<- V0_buy_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16688:16,
       D_a_t_a/binary>>};
pack(16689, cli, {V0_id, V0_num}) ->
    D_a_t_a = <<V0_id:32, V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16689:16,
       D_a_t_a/binary>>};
pack(16689, srv, {V0_code, V0_msg, V0_id, V0_num}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32,
		V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16689:16,
       D_a_t_a/binary>>};
pack(16690, cli, {}) -> {ok, <<2:32, 16690:16>>};
pack(16690, srv,
     {V0_predict_data, V0_time, V0_ref_1, V0_ref_2, V0_buy_1,
      V0_buy_2, V0_status_1, V0_status_2}) ->
    D_a_t_a = <<(length(V0_predict_data)):16,
		(list_to_binary([<<V1_type:32, V1_count:32,
				   (length(V1_rand_lists)):16,
				   (list_to_binary([<<V2_pos:8, V2_id:32>>
						    || {V2_pos, V2_id}
							   <- V1_rand_lists]))/binary,
				   V1_flag:32>>
				 || #holiday_predict_info{type = V1_type,
							  count = V1_count,
							  rand_lists =
							      V1_rand_lists,
							  flag = V1_flag}
					<- V0_predict_data]))/binary,
		V0_time:32, V0_ref_1:32, V0_ref_2:32, V0_buy_1:32,
		V0_buy_2:32, V0_status_1:32, V0_status_2:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16690:16,
       D_a_t_a/binary>>};
pack(16691, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16691:16,
       D_a_t_a/binary>>};
pack(16691, srv,
     {V0_code, V0_msg, V0_type1,
      #holiday_predict_info{type = V0_type, count = V0_count,
			    rand_lists = V0_rand_lists, flag = V0_flag},
      V0_ref_count}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_type1:32,
		V0_type:32, V0_count:32, (length(V0_rand_lists)):16,
		(list_to_binary([<<V1_pos:8, V1_id:32>>
				 || {V1_pos, V1_id} <- V0_rand_lists]))/binary,
		V0_flag:32, V0_ref_count:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16691:16,
       D_a_t_a/binary>>};
pack(16692, cli, {V0_num}) ->
    D_a_t_a = <<V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16692:16,
       D_a_t_a/binary>>};
pack(16692, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16692:16,
       D_a_t_a/binary>>};
pack(16693, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16693:16,
       D_a_t_a/binary>>};
pack(16693, srv,
     {V0_code, V0_msg, V0_type1, V0_ref_count,
      #holiday_predict_info{type = V0_type, count = V0_count,
			    rand_lists = V0_rand_lists, flag = V0_flag}}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_type1:32,
		V0_ref_count:32, V0_type:32, V0_count:32,
		(length(V0_rand_lists)):16,
		(list_to_binary([<<V1_pos:8, V1_id:32>>
				 || {V1_pos, V1_id} <- V0_rand_lists]))/binary,
		V0_flag:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16693:16,
       D_a_t_a/binary>>};
pack(16694, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16694:16,
       D_a_t_a/binary>>};
pack(16694, srv, {V0_code, V0_msg, V0_type}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_type:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16694:16,
       D_a_t_a/binary>>};
pack(16695, cli, {V0_card_id}) ->
    D_a_t_a = <<(protocol:pack(string,
			       V0_card_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16695:16,
       D_a_t_a/binary>>};
pack(16695, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16695:16,
       D_a_t_a/binary>>};
pack(16696, cli, {}) -> {ok, <<2:32, 16696:16>>};
pack(16696, srv, {V0_code}) ->
    D_a_t_a = <<V0_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16696:16,
       D_a_t_a/binary>>};
pack(16697, cli, {}) -> {ok, <<2:32, 16697:16>>};
pack(16697, srv,
     {V0_code, V0_msg, V0_camp_id, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_camp_id:32,
		V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16697:16,
       D_a_t_a/binary>>};
pack(16698, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16698:16,
       D_a_t_a/binary>>};
pack(16698, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16698:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(16601, srv, _B0) -> {ok, {}};
unpack(16601, cli, _B0) ->
    {V1_holiday_list, _B21} = protocol:array(_B0,
					     fun (_B1) ->
						     {V2_camp_id, _B2} =
							 protocol:uint32(_B1),
						     {V2_bid, _B3} =
							 protocol:uint32(_B2),
						     {V2_title, _B4} =
							 protocol:string(_B3),
						     {V2_title2, _B5} =
							 protocol:string(_B4),
						     {V2_ico, _B6} =
							 protocol:string(_B5),
						     {V2_type_ico, _B7} =
							 protocol:uint8(_B6),
						     {V2_top_banner, _B8} =
							 protocol:string(_B7),
						     {V2_rule_str, _B9} =
							 protocol:string(_B8),
						     {V2_time_str, _B10} =
							 protocol:string(_B9),
						     {V2_bottom_alert, _B11} =
							 protocol:string(_B10),
						     {V2_aim_title, _B12} =
							 protocol:string(_B11),
						     {V2_panel_type, _B13} =
							 protocol:uint8(_B12),
						     {V2_channel_ban, _B14} =
							 protocol:string(_B13),
						     {V2_sort_val, _B15} =
							 protocol:uint8(_B14),
						     {V2_reward_title, _B16} =
							 protocol:string(_B15),
						     {V2_remain_sec, _B17} =
							 protocol:uint32(_B16),
						     {V2_cli_type, _B18} =
							 protocol:uint32(_B17),
						     {V2_cli_type_name, _B19} =
							 protocol:string(_B18),
						     {{V2_camp_id, V2_bid,
						       V2_title, V2_title2,
						       V2_ico, V2_type_ico,
						       V2_top_banner,
						       V2_rule_str, V2_time_str,
						       V2_bottom_alert,
						       V2_aim_title,
						       V2_panel_type,
						       V2_channel_ban,
						       V2_sort_val,
						       V2_reward_title,
						       V2_remain_sec,
						       V2_cli_type,
						       V2_cli_type_name},
						      _B19}
					     end),
    {ok, {V1_holiday_list}};
unpack(16602, srv, _B0) -> {ok, {}};
unpack(16602, cli, _B0) ->
    {V1_holiday_list, _B5} = protocol:array(_B0,
					    fun (_B1) ->
						    {V2_bid, _B2} =
							protocol:uint32(_B1),
						    {V2_can_get_num, _B3} =
							protocol:uint8(_B2),
						    {{V2_bid, V2_can_get_num},
						     _B3}
					    end),
    {ok, {V1_holiday_list}};
unpack(16603, srv, _B0) ->
    {V1_bid, _B1} = protocol:uint32(_B0), {ok, {V1_bid}};
unpack(16603, cli, _B0) ->
    {V1_bid, _B1} = protocol:uint32(_B0),
    {V1_cli_type, _B2} = protocol:uint32(_B1),
    {V1_remain_sec, _B3} = protocol:uint32(_B2),
    {V1_finish, _B4} = protocol:uint32(_B3),
    {V1_aim_list, _B21} = protocol:array(_B4,
					 fun (_B5) ->
						 {V2_aim, _B6} =
						     protocol:uint32(_B5),
						 {V2_aim_str, _B7} =
						     protocol:string(_B6),
						 {V2_status, _B8} =
						     protocol:uint8(_B7),
						 {V2_item_list, _B13} =
						     protocol:array(_B8,
								    fun (_B9) ->
									    {V3_bid,
									     _B10} =
										protocol:uint32(_B9),
									    {V3_num,
									     _B11} =
										protocol:uint32(_B10),
									    {{V3_bid,
									      V3_num},
									     _B11}
								    end),
						 {V2_aim_args, _B19} =
						     protocol:array(_B13,
								    fun
								      (_B14) ->
									  {V3_aim_args_key,
									   _B15} =
									      protocol:uint8(_B14),
									  {V3_aim_args_val,
									   _B16} =
									      protocol:uint32(_B15),
									  {V3_aim_args_str,
									   _B17} =
									      protocol:string(_B16),
									  {{V3_aim_args_key,
									    V3_aim_args_val,
									    V3_aim_args_str},
									   _B17}
								    end),
						 {{V2_aim, V2_aim_str,
						   V2_status, V2_item_list,
						   V2_aim_args},
						  _B19}
					 end),
    {V1_item_effect_list, _B27} = protocol:array(_B21,
						 fun (_B22) ->
							 {V2_bid, _B23} =
							     protocol:uint32(_B22),
							 {V2_effect_1, _B24} =
							     protocol:uint8(_B23),
							 {V2_effect_2, _B25} =
							     protocol:uint8(_B24),
							 {{V2_bid, V2_effect_1,
							   V2_effect_2},
							  _B25}
						 end),
    {V1_args, _B33} = protocol:array(_B27,
				     fun (_B28) ->
					     {V2_args_key, _B29} =
						 protocol:uint8(_B28),
					     {V2_args_val, _B30} =
						 protocol:uint32(_B29),
					     {V2_args_str, _B31} =
						 protocol:string(_B30),
					     {{V2_args_key, V2_args_val,
					       V2_args_str},
					      _B31}
				     end),
    {V1_client_reward, _B34} = protocol:string(_B33),
    {V1_rank_list, _B49} = protocol:array(_B34,
					  fun (_B35) ->
						  {V2_rid, _B36} =
						      protocol:uint32(_B35),
						  {V2_srv_id, _B37} =
						      protocol:string(_B36),
						  {V2_name, _B38} =
						      protocol:string(_B37),
						  {V2_sex, _B39} =
						      protocol:uint8(_B38),
						  {V2_career, _B40} =
						      protocol:uint8(_B39),
						  {V2_lev, _B41} =
						      protocol:uint8(_B40),
						  {V2_val, _B42} =
						      protocol:uint32(_B41),
						  {V2_rank_args, _B47} =
						      protocol:array(_B42,
								     fun
								       (_B43) ->
									   {V3_rank_args_key,
									    _B44} =
									       protocol:uint8(_B43),
									   {V3_rank_args_val,
									    _B45} =
									       protocol:uint32(_B44),
									   {{V3_rank_args_key,
									     V3_rank_args_val},
									    _B45}
								     end),
						  {{V2_rid, V2_srv_id, V2_name,
						    V2_sex, V2_career, V2_lev,
						    V2_val, V2_rank_args},
						   _B47}
					  end),
    {ok,
     {V1_bid, V1_cli_type, V1_remain_sec, V1_finish,
      V1_aim_list, V1_item_effect_list, V1_args,
      V1_client_reward, V1_rank_list}};
unpack(16604, srv, _B0) ->
    {V1_bid, _B1} = protocol:uint32(_B0),
    {V1_aim, _B2} = protocol:uint32(_B1),
    {V1_arg, _B3} = protocol:uint32(_B2),
    {ok, {V1_bid, V1_aim, V1_arg}};
unpack(16604, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(16605, srv, _B0) ->
    {V1_bid_list, _B4} = protocol:array(_B0,
					fun (_B1) ->
						{V2_bid, _B2} =
						    protocol:uint32(_B1),
						{V2_bid, _B2}
					end),
    {ok, {V1_bid_list}};
unpack(16605, cli, _B0) ->
    {V1_status, _B6} = protocol:array(_B0,
				      fun (_B1) ->
					      {V2_bid, _B2} =
						  protocol:uint32(_B1),
					      {V2_code, _B3} =
						  protocol:uint8(_B2),
					      {V2_end_time, _B4} =
						  protocol:uint32(_B3),
					      {{V2_bid, V2_code, V2_end_time},
					       _B4}
				      end),
    {ok, {V1_status}};
unpack(16606, cli, _B0) ->
    {V1_bid, _B1} = protocol:uint32(_B0),
    {V1_can_get_num, _B2} = protocol:uint8(_B1),
    {ok, {V1_bid, V1_can_get_num}};
unpack(16607, srv, _B0) -> {ok, {}};
unpack(16607, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(16610, cli, _B0) ->
    {V1_bid, _B1} = protocol:uint32(_B0),
    {V1_aim, _B2} = protocol:uint32(_B1),
    {V1_item_bid, _B3} = protocol:uint32(_B2),
    {ok, {V1_bid, V1_aim, V1_item_bid}};
unpack(16620, srv, _B0) ->
    {V1_id_list, _B4} = protocol:array(_B0,
				       fun (_B1) ->
					       {V2_id, _B2} =
						   protocol:uint32(_B1),
					       {V2_id, _B2}
				       end),
    {ok, {V1_id_list}};
unpack(16620, cli, _B0) ->
    {V1_holiday_list, _B52} = protocol:array(_B0,
					     fun (_B1) ->
						     {V2_bid, _B2} =
							 protocol:uint32(_B1),
						     {V2_cli_type, _B3} =
							 protocol:uint32(_B2),
						     {V2_remain_sec, _B4} =
							 protocol:uint32(_B3),
						     {V2_finish, _B5} =
							 protocol:uint32(_B4),
						     {V2_aim_list, _B22} =
							 protocol:array(_B5,
									fun
									  (_B6) ->
									      {V3_aim,
									       _B7} =
										  protocol:uint32(_B6),
									      {V3_aim_str,
									       _B8} =
										  protocol:string(_B7),
									      {V3_status,
									       _B9} =
										  protocol:uint8(_B8),
									      {V3_item_list,
									       _B14} =
										  protocol:array(_B9,
												 fun
												   (_B10) ->
												       {V4_bid,
													_B11} =
													   protocol:uint32(_B10),
												       {V4_num,
													_B12} =
													   protocol:uint32(_B11),
												       {{V4_bid,
													 V4_num},
													_B12}
												 end),
									      {V3_aim_args,
									       _B20} =
										  protocol:array(_B14,
												 fun
												   (_B15) ->
												       {V4_aim_args_key,
													_B16} =
													   protocol:uint8(_B15),
												       {V4_aim_args_val,
													_B17} =
													   protocol:uint32(_B16),
												       {V4_aim_args_str,
													_B18} =
													   protocol:string(_B17),
												       {{V4_aim_args_key,
													 V4_aim_args_val,
													 V4_aim_args_str},
													_B18}
												 end),
									      {{V3_aim,
										V3_aim_str,
										V3_status,
										V3_item_list,
										V3_aim_args},
									       _B20}
									end),
						     {V2_item_effect_list,
						      _B28} =
							 protocol:array(_B22,
									fun
									  (_B23) ->
									      {V3_bid,
									       _B24} =
										  protocol:uint32(_B23),
									      {V3_effect_1,
									       _B25} =
										  protocol:uint8(_B24),
									      {V3_effect_2,
									       _B26} =
										  protocol:uint8(_B25),
									      {{V3_bid,
										V3_effect_1,
										V3_effect_2},
									       _B26}
									end),
						     {V2_args, _B34} =
							 protocol:array(_B28,
									fun
									  (_B29) ->
									      {V3_args_key,
									       _B30} =
										  protocol:uint8(_B29),
									      {V3_args_val,
									       _B31} =
										  protocol:uint32(_B30),
									      {V3_args_str,
									       _B32} =
										  protocol:string(_B31),
									      {{V3_args_key,
										V3_args_val,
										V3_args_str},
									       _B32}
									end),
						     {V2_client_reward, _B35} =
							 protocol:string(_B34),
						     {V2_rank_list, _B50} =
							 protocol:array(_B35,
									fun
									  (_B36) ->
									      {V3_rid,
									       _B37} =
										  protocol:uint32(_B36),
									      {V3_srv_id,
									       _B38} =
										  protocol:string(_B37),
									      {V3_name,
									       _B39} =
										  protocol:string(_B38),
									      {V3_sex,
									       _B40} =
										  protocol:uint8(_B39),
									      {V3_career,
									       _B41} =
										  protocol:uint8(_B40),
									      {V3_lev,
									       _B42} =
										  protocol:uint8(_B41),
									      {V3_val,
									       _B43} =
										  protocol:uint32(_B42),
									      {V3_rank_args,
									       _B48} =
										  protocol:array(_B43,
												 fun
												   (_B44) ->
												       {V4_rank_args_key,
													_B45} =
													   protocol:uint8(_B44),
												       {V4_rank_args_val,
													_B46} =
													   protocol:uint32(_B45),
												       {{V4_rank_args_key,
													 V4_rank_args_val},
													_B46}
												 end),
									      {{V3_rid,
										V3_srv_id,
										V3_name,
										V3_sex,
										V3_career,
										V3_lev,
										V3_val,
										V3_rank_args},
									       _B48}
									end),
						     {{V2_bid, V2_cli_type,
						       V2_remain_sec, V2_finish,
						       V2_aim_list,
						       V2_item_effect_list,
						       V2_args,
						       V2_client_reward,
						       V2_rank_list},
						      _B50}
					     end),
    {ok, {V1_holiday_list}};
unpack(16630, srv, _B0) -> {ok, {}};
unpack(16630, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_items, _B6} = protocol:array(_B1,
				     fun (_B2) ->
					     {V2_bid, _B3} =
						 protocol:uint32(_B2),
					     {V2_num, _B4} =
						 protocol:uint32(_B3),
					     {{V2_bid, V2_num}, _B4}
				     end),
    {ok, {V1_code, V1_items}};
unpack(16631, srv, _B0) -> {ok, {}};
unpack(16631, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(16633, srv, _B0) -> {ok, {}};
unpack(16633, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_items, _B6} = protocol:array(_B1,
				     fun (_B2) ->
					     {V2_bid, _B3} =
						 protocol:uint32(_B2),
					     {V2_num, _B4} =
						 protocol:uint32(_B3),
					     {{V2_bid, V2_num}, _B4}
				     end),
    {ok, {V1_code, V1_items}};
unpack(16634, srv, _B0) -> {ok, {}};
unpack(16634, cli, _B0) -> {ok, {}};
unpack(16635, srv, _B0) -> {ok, {}};
unpack(16635, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_items, _B6} = protocol:array(_B1,
				     fun (_B2) ->
					     {V2_bid, _B3} =
						 protocol:uint32(_B2),
					     {V2_num, _B4} =
						 protocol:uint32(_B3),
					     {{V2_bid, V2_num}, _B4}
				     end),
    {ok, {V1_code, V1_items}};
unpack(16636, srv, _B0) ->
    {V1_number, _B1} = protocol:string(_B0),
    {V1_code, _B2} = protocol:string(_B1),
    {ok, {V1_number, V1_code}};
unpack(16636, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(16637, srv, _B0) -> {ok, {}};
unpack(16637, cli, _B0) ->
    {V1_dial_data, _B24} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_type, _B2} =
						      protocol:uint32(_B1),
						  {V2_count, _B3} =
						      protocol:uint32(_B2),
						  {V2_lucky, _B4} =
						      protocol:uint32(_B3),
						  {V2_frist_type, _B5} =
						      protocol:uint32(_B4),
						  {V2_lucky_award, _B9} =
						      protocol:array(_B5,
								     fun
								       (_B6) ->
									   {V3_lucky,
									    _B7} =
									       protocol:uint32(_B6),
									   {V3_lucky,
									    _B7}
								     end),
						  {V2_end_time, _B10} =
						      protocol:uint32(_B9),
						  {V2_rand_lists, _B16} =
						      protocol:array(_B10,
								     fun
								       (_B11) ->
									   {V3_pos,
									    _B12} =
									       protocol:uint8(_B11),
									   {V3_id,
									    _B13} =
									       protocol:uint32(_B12),
									   {V3_status,
									    _B14} =
									       protocol:uint8(_B13),
									   {{V3_pos,
									     V3_id,
									     V3_status},
									    _B14}
								     end),
						  {V2_log_list, _B22} =
						      protocol:array(_B16,
								     fun
								       (_B17) ->
									   {V3_role_name,
									    _B18} =
									       protocol:string(_B17),
									   {V3_bid,
									    _B19} =
									       protocol:uint32(_B18),
									   {V3_num,
									    _B20} =
									       protocol:uint32(_B19),
									   {{V3_role_name,
									     V3_bid,
									     V3_num},
									    _B20}
								     end),
						  {{V2_type, V2_count, V2_lucky,
						    V2_frist_type,
						    V2_lucky_award, V2_end_time,
						    V2_rand_lists, V2_log_list},
						   _B22}
					  end),
    {ok, {V1_dial_data}};
unpack(16638, srv, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_type2, _B2} = protocol:uint32(_B1),
    {ok, {V1_type, V1_type2}};
unpack(16638, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_frist_awards, _B7} = protocol:array(_B2,
					    fun (_B3) ->
						    {V2_bid, _B4} =
							protocol:uint32(_B3),
						    {V2_num, _B5} =
							protocol:uint32(_B4),
						    {{V2_bid, V2_num}, _B5}
					    end),
    {V1_awards1, _B12} = protocol:array(_B7,
					fun (_B8) ->
						{V2_bid, _B9} =
						    protocol:uint32(_B8),
						{V2_num, _B10} =
						    protocol:uint32(_B9),
						{{V2_bid, V2_num}, _B10}
					end),
    {V1_awards2, _B17} = protocol:array(_B12,
					fun (_B13) ->
						{V2_bid, _B14} =
						    protocol:uint32(_B13),
						{V2_num, _B15} =
						    protocol:uint32(_B14),
						{{V2_bid, V2_num}, _B15}
					end),
    {V1_awards3, _B21} = protocol:array(_B17,
					fun (_B18) ->
						{V2_pos, _B19} =
						    protocol:uint8(_B18),
						{V2_pos, _B19}
					end),
    {ok,
     {V1_code, V1_msg, V1_frist_awards, V1_awards1,
      V1_awards2, V1_awards3}};
unpack(16639, srv, _B0) -> {ok, {}};
unpack(16639, cli, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_count, _B2} = protocol:uint32(_B1),
    {V1_lucky, _B3} = protocol:uint32(_B2),
    {V1_frist_type, _B4} = protocol:uint32(_B3),
    {V1_lucky_award, _B8} = protocol:array(_B4,
					   fun (_B5) ->
						   {V2_lucky, _B6} =
						       protocol:uint32(_B5),
						   {V2_lucky, _B6}
					   end),
    {V1_end_time, _B9} = protocol:uint32(_B8),
    {V1_rand_lists, _B15} = protocol:array(_B9,
					   fun (_B10) ->
						   {V2_pos, _B11} =
						       protocol:uint8(_B10),
						   {V2_id, _B12} =
						       protocol:uint32(_B11),
						   {V2_status, _B13} =
						       protocol:uint8(_B12),
						   {{V2_pos, V2_id, V2_status},
						    _B13}
					   end),
    {ok,
     {V1_type, V1_count, V1_lucky, V1_frist_type,
      V1_lucky_award, V1_end_time, V1_rand_lists}};
unpack(16640, srv, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_type, V1_id}};
unpack(16640, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_type, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_type}};
unpack(16641, srv, _B0) -> {ok, {}};
unpack(16641, cli, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_log_list, _B7} = protocol:array(_B1,
					fun (_B2) ->
						{V2_role_name, _B3} =
						    protocol:string(_B2),
						{V2_bid, _B4} =
						    protocol:uint32(_B3),
						{V2_num, _B5} =
						    protocol:uint32(_B4),
						{{V2_role_name, V2_bid, V2_num},
						 _B5}
					end),
    {ok, {V1_type, V1_log_list}};
unpack(16642, srv, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0), {ok, {V1_type}};
unpack(16642, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_type, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_type}};
unpack(16643, srv, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_type2, _B2} = protocol:uint32(_B1),
    {ok, {V1_type, V1_type2}};
unpack(16643, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_frist_awards, _B7} = protocol:array(_B2,
					    fun (_B3) ->
						    {V2_bid, _B4} =
							protocol:uint32(_B3),
						    {V2_num, _B5} =
							protocol:uint32(_B4),
						    {{V2_bid, V2_num}, _B5}
					    end),
    {V1_awards1, _B12} = protocol:array(_B7,
					fun (_B8) ->
						{V2_bid, _B9} =
						    protocol:uint32(_B8),
						{V2_num, _B10} =
						    protocol:uint32(_B9),
						{{V2_bid, V2_num}, _B10}
					end),
    {V1_awards2, _B17} = protocol:array(_B12,
					fun (_B13) ->
						{V2_bid, _B14} =
						    protocol:uint32(_B13),
						{V2_num, _B15} =
						    protocol:uint32(_B14),
						{{V2_bid, V2_num}, _B15}
					end),
    {V1_awards3, _B21} = protocol:array(_B17,
					fun (_B18) ->
						{V2_pos, _B19} =
						    protocol:uint8(_B18),
						{V2_pos, _B19}
					end),
    {ok,
     {V1_code, V1_msg, V1_frist_awards, V1_awards1,
      V1_awards2, V1_awards3}};
unpack(16650, srv, _B0) ->
    {V1_bid, _B1} = protocol:uint32(_B0), {ok, {V1_bid}};
unpack(16650, cli, _B0) ->
    {V1_rank, _B1} = protocol:uint32(_B0),
    {V1_rank_award, _B11} = protocol:array(_B1,
					   fun (_B2) ->
						   {V2_rank1, _B3} =
						       protocol:uint32(_B2),
						   {V2_rank2, _B4} =
						       protocol:uint32(_B3),
						   {V2_award, _B9} =
						       protocol:array(_B4,
								      fun
									(_B5) ->
									    {V3_bid,
									     _B6} =
										protocol:uint32(_B5),
									    {V3_num,
									     _B7} =
										protocol:uint32(_B6),
									    {{V3_bid,
									      V3_num},
									     _B7}
								      end),
						   {{V2_rank1, V2_rank2,
						     V2_award},
						    _B9}
					   end),
    {ok, {V1_rank, V1_rank_award}};
unpack(16651, srv, _B0) -> {ok, {}};
unpack(16651, cli, _B0) ->
    {V1_period, _B1} = protocol:uint8(_B0),
    {V1_is_buy, _B2} = protocol:uint8(_B1),
    {V1_end_time, _B3} = protocol:uint32(_B2),
    {V1_list, _B8} = protocol:array(_B3,
				    fun (_B4) ->
					    {V2_id, _B5} = protocol:uint32(_B4),
					    {V2_finish, _B6} =
						protocol:uint8(_B5),
					    {{V2_id, V2_finish}, _B6}
				    end),
    {ok, {V1_period, V1_is_buy, V1_end_time, V1_list}};
unpack(16652, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(16652, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(16653, srv, _B0) -> {ok, {}};
unpack(16653, cli, _B0) ->
    {V1_is_buy, _B1} = protocol:uint8(_B0),
    {V1_end_time, _B2} = protocol:uint32(_B1),
    {V1_charge_id, _B3} = protocol:uint32(_B2),
    {V1_award_list, _B15} = protocol:array(_B3,
					   fun (_B4) ->
						   {V2_id, _B5} =
						       protocol:uint32(_B4),
						   {V2_acv_id, _B6} =
						       protocol:uint32(_B5),
						   {V2_finish, _B7} =
						       protocol:uint8(_B6),
						   {V2_award_time, _B8} =
						       protocol:uint32(_B7),
						   {V2_award, _B13} =
						       protocol:array(_B8,
								      fun
									(_B9) ->
									    {V3_bid,
									     _B10} =
										protocol:uint32(_B9),
									    {V3_num,
									     _B11} =
										protocol:uint32(_B10),
									    {{V3_bid,
									      V3_num},
									     _B11}
								      end),
						   {{V2_id, V2_acv_id,
						     V2_finish, V2_award_time,
						     V2_award},
						    _B13}
					   end),
    {ok,
     {V1_is_buy, V1_end_time, V1_charge_id, V1_award_list}};
unpack(16654, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(16654, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(16660, srv, _B0) -> {ok, {}};
unpack(16660, cli, _B0) ->
    {V1_holiday_exchanges, _B28} = protocol:array(_B0,
						  fun (_B1) ->
							  {V2_bid, _B2} =
							      protocol:uint32(_B1),
							  {V2_end_time, _B3} =
							      protocol:uint32(_B2),
							  {V2_exchange_name,
							   _B4} =
							      protocol:string(_B3),
							  {V2_need_id, _B5} =
							      protocol:uint32(_B4),
							  {V2_exchange_list,
							   _B26} =
							      protocol:array(_B5,
									     fun
									       (_B6) ->
										   {V3_aim,
										    _B7} =
										       protocol:uint32(_B6),
										   {V3_aim_str,
										    _B8} =
										       protocol:string(_B7),
										   {V3_buy_count,
										    _B9} =
										       protocol:uint32(_B8),
										   {V3_limit_buy,
										    _B10} =
										       protocol:uint32(_B9),
										   {V3_lable,
										    _B11} =
										       protocol:uint32(_B10),
										   {V3_expend_id,
										    _B12} =
										       protocol:uint32(_B11),
										   {V3_expend_num,
										    _B13} =
										       protocol:uint32(_B12),
										   {V3_item_list,
										    _B18} =
										       protocol:array(_B13,
												      fun
													(_B14) ->
													    {V4_bid,
													     _B15} =
														protocol:uint32(_B14),
													    {V4_num,
													     _B16} =
														protocol:uint32(_B15),
													    {{V4_bid,
													      V4_num},
													     _B16}
												      end),
										   {V3_aim_args,
										    _B24} =
										       protocol:array(_B18,
												      fun
													(_B19) ->
													    {V4_aim_args_key,
													     _B20} =
														protocol:uint8(_B19),
													    {V4_aim_args_val,
													     _B21} =
														protocol:uint32(_B20),
													    {V4_aim_args_str,
													     _B22} =
														protocol:string(_B21),
													    {{V4_aim_args_key,
													      V4_aim_args_val,
													      V4_aim_args_str},
													     _B22}
												      end),
										   {{V3_aim,
										     V3_aim_str,
										     V3_buy_count,
										     V3_limit_buy,
										     V3_lable,
										     V3_expend_id,
										     V3_expend_num,
										     V3_item_list,
										     V3_aim_args},
										    _B24}
									     end),
							  {{V2_bid, V2_end_time,
							    V2_exchange_name,
							    V2_need_id,
							    V2_exchange_list},
							   _B26}
						  end),
    {ok, {V1_holiday_exchanges}};
unpack(16661, srv, _B0) ->
    {V1_bid, _B1} = protocol:uint32(_B0),
    {V1_aim, _B2} = protocol:uint32(_B1),
    {V1_num, _B3} = protocol:uint32(_B2),
    {ok, {V1_bid, V1_aim, V1_num}};
unpack(16661, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_bid, _B3} = protocol:uint32(_B2),
    {V1_aim, _B4} = protocol:uint32(_B3),
    {V1_buy_count, _B5} = protocol:uint32(_B4),
    {ok, {V1_code, V1_msg, V1_bid, V1_aim, V1_buy_count}};
unpack(16665, srv, _B0) ->
    {V1_bid, _B1} = protocol:uint32(_B0),
    {V1_ids, _B6} = protocol:array(_B1,
				   fun (_B2) ->
					   {V2_id, _B3} = protocol:uint32(_B2),
					   {V2_num, _B4} = protocol:uint32(_B3),
					   {{V2_id, V2_num}, _B4}
				   end),
    {ok, {V1_bid, V1_ids}};
unpack(16665, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(16666, srv, _B0) ->
    {V1_bid, _B1} = protocol:uint32(_B0), {ok, {V1_bid}};
unpack(16666, cli, _B0) -> {ok, {}};
unpack(16670, srv, _B0) -> {ok, {}};
unpack(16670, cli, _B0) ->
    {V1_num, _B1} = protocol:uint32(_B0),
    {V1_gold, _B2} = protocol:uint32(_B1),
    {V1_is_free, _B3} = protocol:uint8(_B2),
    {V1_holiday_lev, _B4} = protocol:uint32(_B3),
    {V1_award_list, _B9} = protocol:array(_B4,
					  fun (_B5) ->
						  {V2_id, _B6} =
						      protocol:uint32(_B5),
						  {V2_status, _B7} =
						      protocol:uint32(_B6),
						  {{V2_id, V2_status}, _B7}
					  end),
    {ok,
     {V1_num, V1_gold, V1_is_free, V1_holiday_lev,
      V1_award_list}};
unpack(16671, srv, _B0) ->
    {V1_count, _B1} = protocol:uint8(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {ok, {V1_count, V1_flag}};
unpack(16671, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint8(_B2),
    {V1_flag, _B4} = protocol:uint8(_B3),
    {ok, {V1_result, V1_msg, V1_id, V1_flag}};
unpack(16672, srv, _B0) -> {ok, {}};
unpack(16672, cli, _B0) ->
    {V1_count, _B1} = protocol:uint8(_B0),
    {V1_awards2, _B6} = protocol:array(_B1,
				       fun (_B2) ->
					       {V2_bid, _B3} =
						   protocol:uint32(_B2),
					       {V2_num, _B4} =
						   protocol:uint32(_B3),
					       {{V2_bid, V2_num}, _B4}
				       end),
    {ok, {V1_count, V1_awards2}};
unpack(16673, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0), {ok, {V1_id}};
unpack(16673, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(16674, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(16674, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_log_list, _B7} = protocol:array(_B1,
					fun (_B2) ->
						{V2_role_name, _B3} =
						    protocol:string(_B2),
						{V2_bid, _B4} =
						    protocol:uint32(_B3),
						{V2_num, _B5} =
						    protocol:uint32(_B4),
						{{V2_role_name, V2_bid, V2_num},
						 _B5}
					end),
    {ok, {V1_type, V1_log_list}};
unpack(16675, srv, _B0) ->
    {V1_num, _B1} = protocol:uint32(_B0), {ok, {V1_num}};
unpack(16675, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(16676, srv, _B0) -> {ok, {}};
unpack(16676, cli, _B0) ->
    {V1_gold, _B1} = protocol:uint32(_B0), {ok, {V1_gold}};
unpack(16680, srv, _B0) -> {ok, {}};
unpack(16680, cli, _B0) ->
    {V1_lucky, _B1} = protocol:uint32(_B0),
    {V1_free_num, _B2} = protocol:uint8(_B1),
    {V1_endtime, _B3} = protocol:uint32(_B2),
    {V1_egg_status, _B14} = protocol:array(_B3,
					   fun (_B4) ->
						   {V2_pos, _B5} =
						       protocol:uint8(_B4),
						   {V2_type, _B6} =
						       protocol:uint8(_B5),
						   {V2_status, _B7} =
						       protocol:uint8(_B6),
						   {V2_show_reward, _B12} =
						       protocol:array(_B7,
								      fun
									(_B8) ->
									    {V3_item_id,
									     _B9} =
										protocol:uint32(_B8),
									    {V3_num,
									     _B10} =
										protocol:uint32(_B9),
									    {{V3_item_id,
									      V3_num},
									     _B10}
								      end),
						   {{V2_pos, V2_type, V2_status,
						     V2_show_reward},
						    _B12}
					   end),
    {ok,
     {V1_lucky, V1_free_num, V1_endtime, V1_egg_status}};
unpack(16681, srv, _B0) -> {ok, {}};
unpack(16681, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(16682, srv, _B0) ->
    {V1_pos, _B1} = protocol:uint8(_B0), {ok, {V1_pos}};
unpack(16682, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(16683, srv, _B0) -> {ok, {}};
unpack(16683, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(16684, srv, _B0) ->
    {V1_num, _B1} = protocol:uint16(_B0), {ok, {V1_num}};
unpack(16684, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(16685, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(16685, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_log_list, _B7} = protocol:array(_B1,
					fun (_B2) ->
						{V2_role_name, _B3} =
						    protocol:string(_B2),
						{V2_bid, _B4} =
						    protocol:uint32(_B3),
						{V2_num, _B5} =
						    protocol:uint32(_B4),
						{{V2_role_name, V2_bid, V2_num},
						 _B5}
					end),
    {ok, {V1_type, V1_log_list}};
unpack(16686, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_partner_bid, _B2} = protocol:uint32(_B1),
    {V1_expend, _B6} = protocol:array(_B2,
				      fun (_B3) ->
					      {V2_partner_id, _B4} =
						  protocol:uint32(_B3),
					      {V2_partner_id, _B4}
				      end),
    {ok, {V1_partner_id, V1_partner_bid, V1_expend}};
unpack(16686, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(16687, srv, _B0) ->
    {V1_bid, _B1} = protocol:uint32(_B0), {ok, {V1_bid}};
unpack(16687, cli, _B0) ->
    {V1_bid, _B1} = protocol:uint32(_B0),
    {V1_code, _B2} = protocol:uint8(_B1),
    {ok, {V1_bid, V1_code}};
unpack(16688, srv, _B0) -> {ok, {}};
unpack(16688, cli, _B0) ->
    {V1_buy_info, _B8} = protocol:array(_B0,
					fun (_B1) ->
						{V2_id, _B2} =
						    protocol:uint8(_B1),
						{V2_day_num, _B3} =
						    protocol:uint32(_B2),
						{V2_all_num, _B4} =
						    protocol:uint32(_B3),
						{V2_s_day_num, _B5} =
						    protocol:uint32(_B4),
						{V2_s_all_num, _B6} =
						    protocol:uint32(_B5),
						{{V2_id, V2_day_num, V2_all_num,
						  V2_s_day_num, V2_s_all_num},
						 _B6}
					end),
    {ok, {V1_buy_info}};
unpack(16689, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_num}};
unpack(16689, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_num, _B4} = protocol:uint32(_B3),
    {ok, {V1_code, V1_msg, V1_id, V1_num}};
unpack(16690, srv, _B0) -> {ok, {}};
unpack(16690, cli, _B0) ->
    {V1_predict_data, _B11} = protocol:array(_B0,
					     fun (_B1) ->
						     {V2_type, _B2} =
							 protocol:uint32(_B1),
						     {V2_count, _B3} =
							 protocol:uint32(_B2),
						     {V2_rand_lists, _B8} =
							 protocol:array(_B3,
									fun
									  (_B4) ->
									      {V3_pos,
									       _B5} =
										  protocol:uint8(_B4),
									      {V3_id,
									       _B6} =
										  protocol:uint32(_B5),
									      {{V3_pos,
										V3_id},
									       _B6}
									end),
						     {V2_flag, _B9} =
							 protocol:uint32(_B8),
						     {{V2_type, V2_count,
						       V2_rand_lists, V2_flag},
						      _B9}
					     end),
    {V1_time, _B12} = protocol:uint32(_B11),
    {V1_ref_1, _B13} = protocol:uint32(_B12),
    {V1_ref_2, _B14} = protocol:uint32(_B13),
    {V1_buy_1, _B15} = protocol:uint32(_B14),
    {V1_buy_2, _B16} = protocol:uint32(_B15),
    {V1_status_1, _B17} = protocol:uint32(_B16),
    {V1_status_2, _B18} = protocol:uint32(_B17),
    {ok,
     {V1_predict_data, V1_time, V1_ref_1, V1_ref_2, V1_buy_1,
      V1_buy_2, V1_status_1, V1_status_2}};
unpack(16691, srv, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0), {ok, {V1_type}};
unpack(16691, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_type1, _B3} = protocol:uint32(_B2),
    {V1_type, _B4} = protocol:uint32(_B3),
    {V1_count, _B5} = protocol:uint32(_B4),
    {V1_rand_lists, _B10} = protocol:array(_B5,
					   fun (_B6) ->
						   {V2_pos, _B7} =
						       protocol:uint8(_B6),
						   {V2_id, _B8} =
						       protocol:uint32(_B7),
						   {{V2_pos, V2_id}, _B8}
					   end),
    {V1_flag, _B11} = protocol:uint32(_B10),
    {V1_ref_count, _B12} = protocol:uint32(_B11),
    {ok,
     {V1_code, V1_msg, V1_type1, V1_type, V1_count,
      V1_rand_lists, V1_flag, V1_ref_count}};
unpack(16692, srv, _B0) ->
    {V1_num, _B1} = protocol:uint32(_B0), {ok, {V1_num}};
unpack(16692, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(16693, srv, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0), {ok, {V1_type}};
unpack(16693, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_type1, _B3} = protocol:uint32(_B2),
    {V1_ref_count, _B4} = protocol:uint32(_B3),
    {V1_type, _B5} = protocol:uint32(_B4),
    {V1_count, _B6} = protocol:uint32(_B5),
    {V1_rand_lists, _B11} = protocol:array(_B6,
					   fun (_B7) ->
						   {V2_pos, _B8} =
						       protocol:uint8(_B7),
						   {V2_id, _B9} =
						       protocol:uint32(_B8),
						   {{V2_pos, V2_id}, _B9}
					   end),
    {V1_flag, _B12} = protocol:uint32(_B11),
    {ok,
     {V1_code, V1_msg, V1_type1, V1_ref_count, V1_type,
      V1_count, V1_rand_lists, V1_flag}};
unpack(16694, srv, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0), {ok, {V1_type}};
unpack(16694, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_type, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_type}};
unpack(16695, srv, _B0) ->
    {V1_card_id, _B1} = protocol:string(_B0),
    {ok, {V1_card_id}};
unpack(16695, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(16696, srv, _B0) -> {ok, {}};
unpack(16696, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0), {ok, {V1_code}};
unpack(16697, srv, _B0) -> {ok, {}};
unpack(16697, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_camp_id, _B3} = protocol:uint32(_B2),
    {V1_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_code, V1_msg, V1_camp_id, V1_id}};
unpack(16698, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(16698, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


