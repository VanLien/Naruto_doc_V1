-file("src/mod/data/holiday_personal_gift_data.erl", 1).

-module(holiday_personal_gift_data).

-lager_records([{holiday_dial_rand_data,
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
		{m_dial, [ver, info, reset_time]}]).

-export([get_const/1, period_list/0, get_holiday_day/1,
	 get_price/1, get_award/1, get_award1/1, list/0,
	 lev_range/1, partner_star_list/0, eqm_list/0,
	 holy_eqm_list/0, aftifact_list/0, skill_list/0,
	 hallow_lev_list/0, hallow_refine_list/0, halidom_list/0,
	 guild_skill_list/0, partner_star_lable/1, eqm_lable/1,
	 holy_eqm_lable/1, aftifact_lable/1, skill_lable/1,
	 hallow_lev_lable/1, hallow_refine_lable/1,
	 halidom_lable/1, guild_skill_lable/1, partner_score/1,
	 eqm_score/1, holy_eqm_score/1, holy_eqm_one_score/1,
	 aftifact_score/1, skill_score/1, hallow_lev_score/1,
	 hallow_refine_score/1, halidom_score/1,
	 guild_skill_score/1, vip_range/0, vip_list/0, vip_id/1,
	 award/1]).

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

-file("src/mod/data/holiday_personal_gift_data.erl",
      49).

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

-file("src/mod/data/holiday_personal_gift_data.erl",
      50).

get_const(_Info) ->
    logger:data_error("get_const_data_not_exist===>~w",
		      [_Info], holiday_personal_gift_data, 52),
    undefined.

period_list() ->
    [{5, {2021, 10, 27, 0, 0, 0},
      {2021, 10, 30, 23, 59, 59}, [{open_day, 1}]},
     {4, {2021, 11, 1, 0, 0, 0}, {2021, 11, 7, 23, 59, 59},
      [{open_day, 1}]},
     {3, {2021, 11, 8, 0, 0, 0}, {2021, 11, 16, 23, 59, 59},
      [{open_day, 1}]},
     {2, {2021, 11, 17, 0, 0, 0}, {2021, 11, 22, 23, 59, 59},
      [{open_day, 1}]},
     {1, {2021, 11, 23, 0, 0, 0}, {2021, 11, 30, 23, 59, 59},
      [{open_day, 1}]}].

get_holiday_day(1) -> 1;
get_holiday_day(2) -> 1;
get_holiday_day(3) -> 1;
get_holiday_day(4) -> 1;
get_holiday_day(5) -> 1;
get_holiday_day(_Info) ->
    logger:data_error("get_holiday_day_data_not_exist===>~w",
		      [_Info], holiday_personal_gift_data, 61),
    undefined.

get_price(1201) -> 6;
get_price(1202) -> 30;
get_price(1203) -> 68;
get_price(1204) -> 128;
get_price(1205) -> 328;
get_price(1206) -> 648;
get_price(_Info) ->
    logger:data_error("get_price_data_not_exist===>~w",
		      [_Info], holiday_personal_gift_data, 69),
    undefined.

get_award({1, 648}) -> {[{3, 6480}, {10, 105300}], 1};
get_award({2, 648}) -> {[{3, 6480}, {28, 4200}], 1};
get_award({3, 648}) -> {[{3, 6480}, {10450, 42100}], 1};
get_award({4, 648}) -> {[{3, 6480}, {72001, 2800}], 1};
get_award({5, 648}) -> {[{3, 6480}, {32, 2106000}], 1};
get_award({6, 648}) -> {[{3, 6480}, {17009, 2100}], 1};
get_award(_Info) ->
    logger:data_error("get_award_data_not_exist===>~w",
		      [_Info], holiday_personal_gift_data, 77),
    undefined.

get_award1(1) -> {[{3, 6480}, {10, 105300}], 1};
get_award1(2) -> {[{3, 6480}, {28, 4200}], 1};
get_award1(3) -> {[{3, 6480}, {10450, 42100}], 1};
get_award1(4) -> {[{3, 6480}, {72001, 2800}], 1};
get_award1(5) -> {[{3, 6480}, {32, 2106000}], 1};
get_award1(6) -> {[{3, 6480}, {17009, 2100}], 1};
get_award1(_Info) ->
    logger:data_error("get_award1_data_not_exist===>~w",
		      [_Info], holiday_personal_gift_data, 85),
    undefined.

list() -> [1, 3, 4, 5, 6, 7, 8, 9, 2].

lev_range(1) -> [{5, 5}];
lev_range(3) -> [{5, 5}];
lev_range(4) -> [{5, 5}];
lev_range(5) -> [{5, 5}];
lev_range(6) -> [{5, 5}];
lev_range(7) -> [{5, 5}];
lev_range(8) -> [{5, 5}];
lev_range(9) -> [{5, 5}];
lev_range(2) -> [{5, 5}];
lev_range(_Info) ->
    logger:data_error("lev_range_data_not_exist===>~w",
		      [_Info], holiday_personal_gift_data, 98),
    undefined.

partner_star_list() ->
    [val_not_exist, val_not_exist, val_not_exist,
     val_not_exist, val_not_exist, val_not_exist,
     val_not_exist, val_not_exist, {10, 40}].

eqm_list() ->
    [val_not_exist, val_not_exist, val_not_exist,
     val_not_exist, val_not_exist, val_not_exist,
     val_not_exist, {10, 40}, val_not_exist].

holy_eqm_list() ->
    [val_not_exist, val_not_exist, val_not_exist,
     val_not_exist, val_not_exist, val_not_exist, {2, 40},
     val_not_exist, val_not_exist].

aftifact_list() ->
    [val_not_exist, val_not_exist, val_not_exist,
     val_not_exist, val_not_exist, {2, 40}, val_not_exist,
     val_not_exist, val_not_exist].

skill_list() ->
    [val_not_exist, val_not_exist, val_not_exist,
     val_not_exist, {2, 40}, val_not_exist, val_not_exist,
     val_not_exist, val_not_exist].

hallow_lev_list() ->
    [val_not_exist, val_not_exist, val_not_exist, {8, 40},
     val_not_exist, val_not_exist, val_not_exist,
     val_not_exist, val_not_exist].

hallow_refine_list() ->
    [val_not_exist, val_not_exist, {6, 40}, val_not_exist,
     val_not_exist, val_not_exist, val_not_exist,
     val_not_exist, val_not_exist].

halidom_list() ->
    [val_not_exist, {15, 40}, val_not_exist, val_not_exist,
     val_not_exist, val_not_exist, val_not_exist,
     val_not_exist, val_not_exist].

guild_skill_list() ->
    [{10, 40}, val_not_exist, val_not_exist, val_not_exist,
     val_not_exist, val_not_exist, val_not_exist,
     val_not_exist, val_not_exist].

partner_star_lable({10, 40}) ->
    {1001, lang:get(<<"Anh hùng"/utf8>>)};
partner_star_lable(_Info) ->
    logger:data_error("partner_star_lable_data_not_exist===>~w",
		      [_Info], holiday_personal_gift_data, 119),
    undefined.

eqm_lable({10, 40}) ->
    {2001, lang:get(<<"Trang bị"/utf8>>)};
eqm_lable(_Info) ->
    logger:data_error("eqm_lable_data_not_exist===>~w",
		      [_Info], holiday_personal_gift_data, 122),
    undefined.

holy_eqm_lable({2, 40}) ->
    {3001, lang:get(<<"Thần trang"/utf8>>)};
holy_eqm_lable(_Info) ->
    logger:data_error("holy_eqm_lable_data_not_exist===>~w",
		      [_Info], holiday_personal_gift_data, 125),
    undefined.

aftifact_lable({2, 40}) ->
    {4001, lang:get(<<"Phù văn"/utf8>>)};
aftifact_lable(_Info) ->
    logger:data_error("aftifact_lable_data_not_exist===>~w",
		      [_Info], holiday_personal_gift_data, 128),
    undefined.

skill_lable({2, 40}) ->
    {5001, lang:get(<<"Kĩ năng thiên phú"/utf8>>)};
skill_lable(_Info) ->
    logger:data_error("skill_lable_data_not_exist===>~w",
		      [_Info], holiday_personal_gift_data, 131),
    undefined.

hallow_lev_lable({8, 40}) ->
    {6001, lang:get(<<"Thần khí đẳng cấp"/utf8>>)};
hallow_lev_lable(_Info) ->
    logger:data_error("hallow_lev_lable_data_not_exist===>~w",
		      [_Info], holiday_personal_gift_data, 134),
    undefined.

hallow_refine_lable({6, 40}) ->
    {7001, lang:get(<<"Thần khí tinh luyện"/utf8>>)};
hallow_refine_lable(_Info) ->
    logger:data_error("hallow_refine_lable_data_not_exist===>~w",
		      [_Info], holiday_personal_gift_data, 137),
    undefined.

halidom_lable({15, 40}) ->
    {8001, lang:get(<<"Thánh vật"/utf8>>)};
halidom_lable(_Info) ->
    logger:data_error("halidom_lable_data_not_exist===>~w",
		      [_Info], holiday_personal_gift_data, 140),
    undefined.

guild_skill_lable({10, 40}) ->
    {9001, lang:get(<<"Công hội kỹ năng"/utf8>>)};
guild_skill_lable(_Info) ->
    logger:data_error("guild_skill_lable_data_not_exist===>~w",
		      [_Info], holiday_personal_gift_data, 143),
    undefined.

partner_score({10101, 1}) -> 0;
partner_score({10201, 2}) -> 9;
partner_score({10202, 2}) -> 9;
partner_score({10301, 3}) -> 18;
partner_score({10302, 3}) -> 18;
partner_score({10303, 3}) -> 18;
partner_score({10304, 3}) -> 18;
partner_score({10305, 3}) -> 18;
partner_score({10401, 4}) -> 27;
partner_score({10401, 5}) -> 36;
partner_score({10402, 4}) -> 27;
partner_score({10402, 5}) -> 36;
partner_score({10403, 4}) -> 27;
partner_score({10403, 5}) -> 36;
partner_score({10404, 4}) -> 27;
partner_score({10404, 5}) -> 36;
partner_score({10405, 4}) -> 27;
partner_score({10405, 5}) -> 36;
partner_score({10501, 5}) -> 36;
partner_score({10501, 6}) -> 45;
partner_score({10501, 7}) -> 55;
partner_score({10501, 8}) -> 64;
partner_score({10501, 9}) -> 73;
partner_score({10501, 10}) -> 82;
partner_score({10501, 11}) -> 91;
partner_score({10501, 12}) -> 100;
partner_score({10502, 5}) -> 36;
partner_score({10502, 6}) -> 45;
partner_score({10502, 7}) -> 55;
partner_score({10502, 8}) -> 64;
partner_score({10502, 9}) -> 73;
partner_score({10502, 10}) -> 82;
partner_score({10502, 11}) -> 91;
partner_score({10502, 12}) -> 100;
partner_score({10503, 5}) -> 36;
partner_score({10503, 6}) -> 45;
partner_score({10503, 7}) -> 55;
partner_score({10503, 8}) -> 64;
partner_score({10503, 9}) -> 73;
partner_score({10503, 10}) -> 82;
partner_score({10503, 11}) -> 91;
partner_score({10503, 12}) -> 100;
partner_score({10504, 5}) -> 36;
partner_score({10504, 6}) -> 45;
partner_score({10504, 7}) -> 55;
partner_score({10504, 8}) -> 64;
partner_score({10504, 9}) -> 73;
partner_score({10504, 10}) -> 82;
partner_score({10504, 11}) -> 91;
partner_score({10504, 12}) -> 100;
partner_score({10505, 5}) -> 36;
partner_score({10505, 6}) -> 45;
partner_score({10505, 7}) -> 55;
partner_score({10505, 8}) -> 64;
partner_score({10505, 9}) -> 73;
partner_score({10505, 10}) -> 82;
partner_score({10505, 11}) -> 91;
partner_score({10505, 12}) -> 100;
partner_score({10506, 5}) -> 36;
partner_score({10506, 6}) -> 45;
partner_score({10506, 7}) -> 55;
partner_score({10506, 8}) -> 64;
partner_score({10506, 9}) -> 73;
partner_score({10507, 5}) -> 36;
partner_score({10507, 6}) -> 45;
partner_score({10507, 7}) -> 55;
partner_score({10507, 8}) -> 64;
partner_score({10507, 9}) -> 73;
partner_score({10507, 10}) -> 82;
partner_score({10507, 11}) -> 91;
partner_score({10507, 12}) -> 100;
partner_score({10508, 5}) -> 36;
partner_score({10508, 6}) -> 45;
partner_score({10508, 7}) -> 55;
partner_score({10508, 8}) -> 64;
partner_score({10508, 9}) -> 73;
partner_score({10509, 5}) -> 36;
partner_score({10509, 6}) -> 45;
partner_score({10509, 7}) -> 55;
partner_score({10509, 8}) -> 64;
partner_score({10509, 9}) -> 73;
partner_score({10510, 5}) -> 36;
partner_score({10510, 6}) -> 45;
partner_score({10510, 7}) -> 55;
partner_score({10510, 8}) -> 64;
partner_score({10510, 9}) -> 73;
partner_score({10510, 10}) -> 82;
partner_score({10510, 11}) -> 91;
partner_score({10510, 12}) -> 100;
partner_score({10511, 5}) -> 36;
partner_score({10511, 6}) -> 45;
partner_score({10511, 7}) -> 55;
partner_score({10511, 8}) -> 64;
partner_score({10511, 9}) -> 73;
partner_score({10511, 10}) -> 82;
partner_score({10511, 11}) -> 91;
partner_score({10511, 12}) -> 100;
partner_score({20101, 1}) -> 0;
partner_score({20201, 2}) -> 9;
partner_score({20202, 2}) -> 9;
partner_score({20301, 3}) -> 18;
partner_score({20302, 3}) -> 18;
partner_score({20303, 3}) -> 18;
partner_score({20304, 3}) -> 18;
partner_score({20305, 3}) -> 18;
partner_score({20401, 4}) -> 27;
partner_score({20401, 5}) -> 36;
partner_score({20402, 4}) -> 27;
partner_score({20402, 5}) -> 36;
partner_score({20403, 4}) -> 27;
partner_score({20403, 5}) -> 36;
partner_score({20404, 4}) -> 27;
partner_score({20404, 5}) -> 36;
partner_score({20405, 4}) -> 27;
partner_score({20405, 5}) -> 36;
partner_score({20501, 5}) -> 36;
partner_score({20501, 6}) -> 45;
partner_score({20501, 7}) -> 55;
partner_score({20501, 8}) -> 64;
partner_score({20501, 9}) -> 73;
partner_score({20501, 10}) -> 82;
partner_score({20501, 11}) -> 91;
partner_score({20501, 12}) -> 100;
partner_score({20502, 5}) -> 36;
partner_score({20502, 6}) -> 45;
partner_score({20502, 7}) -> 55;
partner_score({20502, 8}) -> 64;
partner_score({20502, 9}) -> 73;
partner_score({20502, 10}) -> 82;
partner_score({20502, 11}) -> 91;
partner_score({20502, 12}) -> 100;
partner_score({20503, 5}) -> 36;
partner_score({20503, 6}) -> 45;
partner_score({20503, 7}) -> 55;
partner_score({20503, 8}) -> 64;
partner_score({20503, 9}) -> 73;
partner_score({20504, 5}) -> 36;
partner_score({20504, 6}) -> 45;
partner_score({20504, 7}) -> 55;
partner_score({20504, 8}) -> 64;
partner_score({20504, 9}) -> 73;
partner_score({20504, 10}) -> 82;
partner_score({20504, 11}) -> 91;
partner_score({20504, 12}) -> 100;
partner_score({20505, 5}) -> 36;
partner_score({20505, 6}) -> 45;
partner_score({20505, 7}) -> 55;
partner_score({20505, 8}) -> 64;
partner_score({20505, 9}) -> 73;
partner_score({20505, 10}) -> 82;
partner_score({20505, 11}) -> 91;
partner_score({20505, 12}) -> 100;
partner_score({20506, 5}) -> 36;
partner_score({20506, 6}) -> 45;
partner_score({20506, 7}) -> 55;
partner_score({20506, 8}) -> 64;
partner_score({20506, 9}) -> 73;
partner_score({20507, 5}) -> 36;
partner_score({20507, 6}) -> 45;
partner_score({20507, 7}) -> 55;
partner_score({20507, 8}) -> 64;
partner_score({20507, 9}) -> 73;
partner_score({20507, 10}) -> 82;
partner_score({20507, 11}) -> 91;
partner_score({20507, 12}) -> 100;
partner_score({20508, 5}) -> 36;
partner_score({20508, 6}) -> 45;
partner_score({20508, 7}) -> 55;
partner_score({20508, 8}) -> 64;
partner_score({20508, 9}) -> 73;
partner_score({20508, 10}) -> 82;
partner_score({20508, 11}) -> 91;
partner_score({20508, 12}) -> 100;
partner_score({20509, 5}) -> 36;
partner_score({20509, 6}) -> 45;
partner_score({20509, 7}) -> 55;
partner_score({20509, 8}) -> 64;
partner_score({20509, 9}) -> 73;
partner_score({20509, 10}) -> 82;
partner_score({20509, 11}) -> 91;
partner_score({20509, 12}) -> 100;
partner_score({20510, 5}) -> 36;
partner_score({20510, 6}) -> 45;
partner_score({20510, 7}) -> 55;
partner_score({20510, 8}) -> 64;
partner_score({20510, 9}) -> 73;
partner_score({20510, 10}) -> 82;
partner_score({20510, 11}) -> 91;
partner_score({20510, 12}) -> 100;
partner_score({30101, 1}) -> 0;
partner_score({30201, 2}) -> 9;
partner_score({30202, 2}) -> 9;
partner_score({30301, 3}) -> 18;
partner_score({30302, 3}) -> 18;
partner_score({30303, 3}) -> 18;
partner_score({30304, 3}) -> 18;
partner_score({30305, 3}) -> 18;
partner_score({30401, 4}) -> 27;
partner_score({30401, 5}) -> 36;
partner_score({30402, 4}) -> 27;
partner_score({30402, 5}) -> 36;
partner_score({30402, 6}) -> 45;
partner_score({30402, 7}) -> 55;
partner_score({30402, 8}) -> 64;
partner_score({30402, 9}) -> 73;
partner_score({30403, 4}) -> 27;
partner_score({30403, 5}) -> 36;
partner_score({30404, 4}) -> 27;
partner_score({30404, 5}) -> 36;
partner_score({30405, 4}) -> 27;
partner_score({30405, 5}) -> 36;
partner_score({30501, 5}) -> 36;
partner_score({30501, 6}) -> 45;
partner_score({30501, 7}) -> 55;
partner_score({30501, 8}) -> 64;
partner_score({30501, 9}) -> 73;
partner_score({30501, 10}) -> 82;
partner_score({30501, 11}) -> 91;
partner_score({30501, 12}) -> 100;
partner_score({30502, 5}) -> 36;
partner_score({30502, 6}) -> 45;
partner_score({30502, 7}) -> 55;
partner_score({30502, 8}) -> 64;
partner_score({30502, 9}) -> 73;
partner_score({30502, 10}) -> 82;
partner_score({30502, 11}) -> 91;
partner_score({30502, 12}) -> 100;
partner_score({30503, 5}) -> 36;
partner_score({30503, 6}) -> 45;
partner_score({30503, 7}) -> 55;
partner_score({30503, 8}) -> 64;
partner_score({30503, 9}) -> 73;
partner_score({30504, 5}) -> 36;
partner_score({30504, 6}) -> 45;
partner_score({30504, 7}) -> 55;
partner_score({30504, 8}) -> 64;
partner_score({30504, 9}) -> 73;
partner_score({30504, 10}) -> 82;
partner_score({30504, 11}) -> 91;
partner_score({30504, 12}) -> 100;
partner_score({30505, 5}) -> 36;
partner_score({30505, 6}) -> 45;
partner_score({30505, 7}) -> 55;
partner_score({30505, 8}) -> 64;
partner_score({30505, 9}) -> 73;
partner_score({30506, 5}) -> 36;
partner_score({30506, 6}) -> 45;
partner_score({30506, 7}) -> 55;
partner_score({30506, 8}) -> 64;
partner_score({30506, 9}) -> 73;
partner_score({30506, 10}) -> 82;
partner_score({30506, 11}) -> 91;
partner_score({30506, 12}) -> 100;
partner_score({30507, 5}) -> 36;
partner_score({30507, 6}) -> 45;
partner_score({30507, 7}) -> 55;
partner_score({30507, 8}) -> 64;
partner_score({30507, 9}) -> 73;
partner_score({30507, 10}) -> 82;
partner_score({30507, 11}) -> 91;
partner_score({30507, 12}) -> 100;
partner_score({30508, 5}) -> 36;
partner_score({30508, 6}) -> 45;
partner_score({30508, 7}) -> 55;
partner_score({30508, 8}) -> 64;
partner_score({30508, 9}) -> 73;
partner_score({30508, 10}) -> 82;
partner_score({30508, 11}) -> 91;
partner_score({30508, 12}) -> 100;
partner_score({30509, 5}) -> 36;
partner_score({30509, 6}) -> 45;
partner_score({30509, 7}) -> 55;
partner_score({30509, 8}) -> 64;
partner_score({30509, 9}) -> 73;
partner_score({30509, 10}) -> 82;
partner_score({30509, 11}) -> 91;
partner_score({30509, 12}) -> 100;
partner_score({30510, 5}) -> 36;
partner_score({30510, 6}) -> 45;
partner_score({30510, 7}) -> 55;
partner_score({30510, 8}) -> 64;
partner_score({30510, 9}) -> 73;
partner_score({30510, 10}) -> 82;
partner_score({30510, 11}) -> 91;
partner_score({30510, 12}) -> 100;
partner_score({40301, 3}) -> 18;
partner_score({40401, 4}) -> 27;
partner_score({40401, 5}) -> 36;
partner_score({40402, 4}) -> 27;
partner_score({40402, 5}) -> 36;
partner_score({40403, 4}) -> 27;
partner_score({40403, 5}) -> 36;
partner_score({40404, 4}) -> 27;
partner_score({40404, 5}) -> 36;
partner_score({40501, 5}) -> 36;
partner_score({40501, 6}) -> 45;
partner_score({40501, 7}) -> 55;
partner_score({40501, 8}) -> 64;
partner_score({40501, 9}) -> 73;
partner_score({40502, 5}) -> 36;
partner_score({40502, 6}) -> 45;
partner_score({40502, 7}) -> 55;
partner_score({40502, 8}) -> 64;
partner_score({40502, 9}) -> 73;
partner_score({40502, 10}) -> 82;
partner_score({40502, 11}) -> 91;
partner_score({40502, 12}) -> 100;
partner_score({40503, 5}) -> 36;
partner_score({40503, 6}) -> 45;
partner_score({40503, 7}) -> 55;
partner_score({40503, 8}) -> 64;
partner_score({40503, 9}) -> 73;
partner_score({40503, 10}) -> 82;
partner_score({40503, 11}) -> 91;
partner_score({40503, 12}) -> 100;
partner_score({40504, 5}) -> 36;
partner_score({40504, 6}) -> 45;
partner_score({40504, 7}) -> 55;
partner_score({40504, 8}) -> 64;
partner_score({40504, 9}) -> 73;
partner_score({40504, 10}) -> 82;
partner_score({40504, 11}) -> 91;
partner_score({40504, 12}) -> 100;
partner_score({40505, 5}) -> 36;
partner_score({40505, 6}) -> 45;
partner_score({40505, 7}) -> 55;
partner_score({40505, 8}) -> 64;
partner_score({40505, 9}) -> 73;
partner_score({40506, 5}) -> 36;
partner_score({40506, 6}) -> 45;
partner_score({40506, 7}) -> 55;
partner_score({40506, 8}) -> 64;
partner_score({40506, 9}) -> 73;
partner_score({40506, 10}) -> 82;
partner_score({40506, 11}) -> 91;
partner_score({40506, 12}) -> 100;
partner_score({40507, 5}) -> 36;
partner_score({40507, 6}) -> 45;
partner_score({40507, 7}) -> 55;
partner_score({40507, 8}) -> 64;
partner_score({40507, 9}) -> 73;
partner_score({40507, 10}) -> 82;
partner_score({40507, 11}) -> 91;
partner_score({40507, 12}) -> 100;
partner_score({40508, 5}) -> 36;
partner_score({40508, 6}) -> 45;
partner_score({40508, 7}) -> 55;
partner_score({40508, 8}) -> 64;
partner_score({40508, 9}) -> 73;
partner_score({40508, 10}) -> 82;
partner_score({40508, 11}) -> 91;
partner_score({40508, 12}) -> 100;
partner_score({40509, 5}) -> 36;
partner_score({40509, 6}) -> 45;
partner_score({40509, 7}) -> 55;
partner_score({40509, 8}) -> 64;
partner_score({40509, 9}) -> 73;
partner_score({40509, 10}) -> 82;
partner_score({40509, 11}) -> 91;
partner_score({40509, 12}) -> 100;
partner_score({50301, 3}) -> 18;
partner_score({50401, 4}) -> 27;
partner_score({50401, 5}) -> 36;
partner_score({50402, 4}) -> 27;
partner_score({50402, 5}) -> 36;
partner_score({50403, 4}) -> 27;
partner_score({50403, 5}) -> 36;
partner_score({50404, 4}) -> 27;
partner_score({50404, 5}) -> 36;
partner_score({50501, 5}) -> 36;
partner_score({50501, 6}) -> 45;
partner_score({50501, 7}) -> 55;
partner_score({50501, 8}) -> 64;
partner_score({50501, 9}) -> 73;
partner_score({50502, 5}) -> 36;
partner_score({50502, 6}) -> 45;
partner_score({50502, 7}) -> 55;
partner_score({50502, 8}) -> 64;
partner_score({50502, 9}) -> 73;
partner_score({50502, 10}) -> 82;
partner_score({50502, 11}) -> 91;
partner_score({50502, 12}) -> 100;
partner_score({50503, 5}) -> 36;
partner_score({50503, 6}) -> 45;
partner_score({50503, 7}) -> 55;
partner_score({50503, 8}) -> 64;
partner_score({50503, 9}) -> 73;
partner_score({50503, 10}) -> 82;
partner_score({50503, 11}) -> 91;
partner_score({50503, 12}) -> 100;
partner_score({50504, 5}) -> 36;
partner_score({50504, 6}) -> 45;
partner_score({50504, 7}) -> 55;
partner_score({50504, 8}) -> 64;
partner_score({50504, 9}) -> 73;
partner_score({50504, 10}) -> 82;
partner_score({50504, 11}) -> 91;
partner_score({50504, 12}) -> 100;
partner_score({50505, 5}) -> 36;
partner_score({50505, 6}) -> 45;
partner_score({50505, 7}) -> 55;
partner_score({50505, 8}) -> 64;
partner_score({50505, 9}) -> 73;
partner_score({50505, 10}) -> 82;
partner_score({50505, 11}) -> 91;
partner_score({50505, 12}) -> 100;
partner_score({50506, 5}) -> 36;
partner_score({50506, 6}) -> 45;
partner_score({50506, 7}) -> 55;
partner_score({50506, 8}) -> 64;
partner_score({50506, 9}) -> 73;
partner_score({50507, 5}) -> 36;
partner_score({50507, 6}) -> 45;
partner_score({50507, 7}) -> 55;
partner_score({50507, 8}) -> 64;
partner_score({50507, 9}) -> 73;
partner_score({50507, 10}) -> 82;
partner_score({50507, 11}) -> 91;
partner_score({50507, 12}) -> 100;
partner_score({50508, 5}) -> 36;
partner_score({50508, 6}) -> 45;
partner_score({50508, 7}) -> 55;
partner_score({50508, 8}) -> 64;
partner_score({50508, 9}) -> 73;
partner_score({50508, 10}) -> 82;
partner_score({50508, 11}) -> 91;
partner_score({50508, 12}) -> 100;
partner_score(_) -> 0.

eqm_score(40101) -> 0;
eqm_score(40102) -> 6;
eqm_score(40103) -> 13;
eqm_score(40104) -> 19;
eqm_score(40105) -> 25;
eqm_score(40106) -> 31;
eqm_score(40107) -> 38;
eqm_score(40108) -> 44;
eqm_score(40109) -> 50;
eqm_score(40110) -> 56;
eqm_score(40111) -> 63;
eqm_score(40112) -> 69;
eqm_score(40113) -> 75;
eqm_score(40114) -> 81;
eqm_score(40115) -> 88;
eqm_score(40116) -> 94;
eqm_score(40117) -> 100;
eqm_score(40201) -> 0;
eqm_score(40202) -> 6;
eqm_score(40203) -> 13;
eqm_score(40204) -> 19;
eqm_score(40205) -> 25;
eqm_score(40206) -> 31;
eqm_score(40207) -> 38;
eqm_score(40208) -> 44;
eqm_score(40209) -> 50;
eqm_score(40210) -> 56;
eqm_score(40211) -> 63;
eqm_score(40212) -> 69;
eqm_score(40213) -> 75;
eqm_score(40214) -> 81;
eqm_score(40215) -> 88;
eqm_score(40216) -> 94;
eqm_score(40217) -> 100;
eqm_score(40301) -> 0;
eqm_score(40302) -> 6;
eqm_score(40303) -> 13;
eqm_score(40304) -> 19;
eqm_score(40305) -> 25;
eqm_score(40306) -> 31;
eqm_score(40307) -> 38;
eqm_score(40308) -> 44;
eqm_score(40309) -> 50;
eqm_score(40310) -> 56;
eqm_score(40311) -> 63;
eqm_score(40312) -> 69;
eqm_score(40313) -> 75;
eqm_score(40314) -> 81;
eqm_score(40315) -> 88;
eqm_score(40316) -> 94;
eqm_score(40317) -> 100;
eqm_score(40401) -> 0;
eqm_score(40402) -> 6;
eqm_score(40403) -> 13;
eqm_score(40404) -> 19;
eqm_score(40405) -> 25;
eqm_score(40406) -> 31;
eqm_score(40407) -> 38;
eqm_score(40408) -> 44;
eqm_score(40409) -> 50;
eqm_score(40410) -> 56;
eqm_score(40411) -> 63;
eqm_score(40412) -> 69;
eqm_score(40413) -> 75;
eqm_score(40414) -> 81;
eqm_score(40415) -> 88;
eqm_score(40416) -> 94;
eqm_score(40417) -> 100;
eqm_score(_) -> 0.

holy_eqm_score({101, 1, 0}) -> 0;
holy_eqm_score({102, 2, 0}) -> 14;
holy_eqm_score({103, 3, 0}) -> 29;
holy_eqm_score({104, 4, 0}) -> 43;
holy_eqm_score({105, 5, 0}) -> 57;
holy_eqm_score({106, 6, 0}) -> 71;
holy_eqm_score({101, 1, 1}) -> 14;
holy_eqm_score({102, 2, 1}) -> 29;
holy_eqm_score({103, 3, 1}) -> 43;
holy_eqm_score({104, 4, 1}) -> 57;
holy_eqm_score({105, 5, 1}) -> 71;
holy_eqm_score({106, 6, 1}) -> 86;
holy_eqm_score({101, 1, 2}) -> 29;
holy_eqm_score({102, 2, 2}) -> 43;
holy_eqm_score({103, 3, 2}) -> 57;
holy_eqm_score({104, 4, 2}) -> 71;
holy_eqm_score({105, 5, 2}) -> 86;
holy_eqm_score({106, 6, 2}) -> 100;
holy_eqm_score({201, 1, 0}) -> 0;
holy_eqm_score({202, 2, 0}) -> 14;
holy_eqm_score({203, 3, 0}) -> 29;
holy_eqm_score({204, 4, 0}) -> 43;
holy_eqm_score({205, 5, 0}) -> 57;
holy_eqm_score({206, 6, 0}) -> 71;
holy_eqm_score({201, 1, 1}) -> 14;
holy_eqm_score({202, 2, 1}) -> 29;
holy_eqm_score({203, 3, 1}) -> 43;
holy_eqm_score({204, 4, 1}) -> 57;
holy_eqm_score({205, 5, 1}) -> 71;
holy_eqm_score({206, 6, 1}) -> 86;
holy_eqm_score({201, 1, 2}) -> 29;
holy_eqm_score({202, 2, 2}) -> 43;
holy_eqm_score({203, 3, 2}) -> 57;
holy_eqm_score({204, 4, 2}) -> 71;
holy_eqm_score({205, 5, 2}) -> 86;
holy_eqm_score({206, 6, 2}) -> 100;
holy_eqm_score({301, 1, 0}) -> 0;
holy_eqm_score({302, 2, 0}) -> 14;
holy_eqm_score({303, 3, 0}) -> 29;
holy_eqm_score({304, 4, 0}) -> 43;
holy_eqm_score({305, 5, 0}) -> 57;
holy_eqm_score({306, 6, 0}) -> 71;
holy_eqm_score({301, 1, 1}) -> 14;
holy_eqm_score({302, 2, 1}) -> 29;
holy_eqm_score({303, 3, 1}) -> 43;
holy_eqm_score({304, 4, 1}) -> 57;
holy_eqm_score({305, 5, 1}) -> 71;
holy_eqm_score({306, 6, 1}) -> 86;
holy_eqm_score({301, 1, 2}) -> 29;
holy_eqm_score({302, 2, 2}) -> 43;
holy_eqm_score({303, 3, 2}) -> 57;
holy_eqm_score({304, 4, 2}) -> 71;
holy_eqm_score({305, 5, 2}) -> 86;
holy_eqm_score({306, 6, 2}) -> 100;
holy_eqm_score({401, 1, 0}) -> 0;
holy_eqm_score({402, 2, 0}) -> 14;
holy_eqm_score({403, 3, 0}) -> 29;
holy_eqm_score({404, 4, 0}) -> 43;
holy_eqm_score({405, 5, 0}) -> 57;
holy_eqm_score({406, 6, 0}) -> 71;
holy_eqm_score({401, 1, 1}) -> 14;
holy_eqm_score({402, 2, 1}) -> 29;
holy_eqm_score({403, 3, 1}) -> 43;
holy_eqm_score({404, 4, 1}) -> 57;
holy_eqm_score({405, 5, 1}) -> 71;
holy_eqm_score({406, 6, 1}) -> 86;
holy_eqm_score({401, 1, 2}) -> 29;
holy_eqm_score({402, 2, 2}) -> 43;
holy_eqm_score({403, 3, 2}) -> 57;
holy_eqm_score({404, 4, 2}) -> 71;
holy_eqm_score({405, 5, 2}) -> 86;
holy_eqm_score({406, 6, 2}) -> 100;
holy_eqm_score({501, 1, 0}) -> 0;
holy_eqm_score({502, 2, 0}) -> 14;
holy_eqm_score({503, 3, 0}) -> 29;
holy_eqm_score({504, 4, 0}) -> 43;
holy_eqm_score({505, 5, 0}) -> 57;
holy_eqm_score({506, 6, 0}) -> 71;
holy_eqm_score({501, 1, 1}) -> 14;
holy_eqm_score({502, 2, 1}) -> 29;
holy_eqm_score({503, 3, 1}) -> 43;
holy_eqm_score({504, 4, 1}) -> 57;
holy_eqm_score({505, 5, 1}) -> 71;
holy_eqm_score({506, 6, 1}) -> 86;
holy_eqm_score({501, 1, 2}) -> 29;
holy_eqm_score({502, 2, 2}) -> 43;
holy_eqm_score({503, 3, 2}) -> 57;
holy_eqm_score({504, 4, 2}) -> 71;
holy_eqm_score({505, 5, 2}) -> 86;
holy_eqm_score({506, 6, 2}) -> 100;
holy_eqm_score({601, 1, 0}) -> 0;
holy_eqm_score({602, 2, 0}) -> 14;
holy_eqm_score({603, 3, 0}) -> 29;
holy_eqm_score({604, 4, 0}) -> 43;
holy_eqm_score({605, 5, 0}) -> 57;
holy_eqm_score({606, 6, 0}) -> 71;
holy_eqm_score({601, 1, 1}) -> 14;
holy_eqm_score({602, 2, 1}) -> 29;
holy_eqm_score({603, 3, 1}) -> 43;
holy_eqm_score({604, 4, 1}) -> 57;
holy_eqm_score({605, 5, 1}) -> 71;
holy_eqm_score({606, 6, 1}) -> 86;
holy_eqm_score({601, 1, 2}) -> 29;
holy_eqm_score({602, 2, 2}) -> 43;
holy_eqm_score({603, 3, 2}) -> 57;
holy_eqm_score({604, 4, 2}) -> 71;
holy_eqm_score({605, 5, 2}) -> 86;
holy_eqm_score({606, 6, 2}) -> 100;
holy_eqm_score({701, 1, 0}) -> 0;
holy_eqm_score({702, 2, 0}) -> 14;
holy_eqm_score({703, 3, 0}) -> 29;
holy_eqm_score({704, 4, 0}) -> 43;
holy_eqm_score({705, 5, 0}) -> 57;
holy_eqm_score({706, 6, 0}) -> 71;
holy_eqm_score({701, 1, 1}) -> 14;
holy_eqm_score({702, 2, 1}) -> 29;
holy_eqm_score({703, 3, 1}) -> 43;
holy_eqm_score({704, 4, 1}) -> 57;
holy_eqm_score({705, 5, 1}) -> 71;
holy_eqm_score({706, 6, 1}) -> 86;
holy_eqm_score({701, 1, 2}) -> 29;
holy_eqm_score({702, 2, 2}) -> 43;
holy_eqm_score({703, 3, 2}) -> 57;
holy_eqm_score({704, 4, 2}) -> 71;
holy_eqm_score({705, 5, 2}) -> 86;
holy_eqm_score({706, 6, 2}) -> 100;
holy_eqm_score({801, 1, 0}) -> 0;
holy_eqm_score({802, 2, 0}) -> 14;
holy_eqm_score({803, 3, 0}) -> 29;
holy_eqm_score({804, 4, 0}) -> 43;
holy_eqm_score({805, 5, 0}) -> 57;
holy_eqm_score({806, 6, 0}) -> 71;
holy_eqm_score({801, 1, 1}) -> 14;
holy_eqm_score({802, 2, 1}) -> 29;
holy_eqm_score({803, 3, 1}) -> 43;
holy_eqm_score({804, 4, 1}) -> 57;
holy_eqm_score({805, 5, 1}) -> 71;
holy_eqm_score({806, 6, 1}) -> 86;
holy_eqm_score({801, 1, 2}) -> 29;
holy_eqm_score({802, 2, 2}) -> 43;
holy_eqm_score({803, 3, 2}) -> 57;
holy_eqm_score({804, 4, 2}) -> 71;
holy_eqm_score({805, 5, 2}) -> 86;
holy_eqm_score({806, 6, 2}) -> 100;
holy_eqm_score({901, 1, 0}) -> 0;
holy_eqm_score({902, 2, 0}) -> 14;
holy_eqm_score({903, 3, 0}) -> 29;
holy_eqm_score({904, 4, 0}) -> 43;
holy_eqm_score({905, 5, 0}) -> 57;
holy_eqm_score({906, 6, 0}) -> 71;
holy_eqm_score({901, 1, 1}) -> 14;
holy_eqm_score({902, 2, 1}) -> 29;
holy_eqm_score({903, 3, 1}) -> 43;
holy_eqm_score({904, 4, 1}) -> 57;
holy_eqm_score({905, 5, 1}) -> 71;
holy_eqm_score({906, 6, 1}) -> 86;
holy_eqm_score({901, 1, 2}) -> 29;
holy_eqm_score({902, 2, 2}) -> 43;
holy_eqm_score({903, 3, 2}) -> 57;
holy_eqm_score({904, 4, 2}) -> 71;
holy_eqm_score({905, 5, 2}) -> 86;
holy_eqm_score({906, 6, 2}) -> 100;
holy_eqm_score({1001, 1, 0}) -> 0;
holy_eqm_score({1002, 2, 0}) -> 14;
holy_eqm_score({1003, 3, 0}) -> 29;
holy_eqm_score({1004, 4, 0}) -> 43;
holy_eqm_score({1005, 5, 0}) -> 57;
holy_eqm_score({1006, 6, 0}) -> 71;
holy_eqm_score({1001, 1, 1}) -> 14;
holy_eqm_score({1002, 2, 1}) -> 29;
holy_eqm_score({1003, 3, 1}) -> 43;
holy_eqm_score({1004, 4, 1}) -> 57;
holy_eqm_score({1005, 5, 1}) -> 71;
holy_eqm_score({1006, 6, 1}) -> 86;
holy_eqm_score({1001, 1, 2}) -> 29;
holy_eqm_score({1002, 2, 2}) -> 43;
holy_eqm_score({1003, 3, 2}) -> 57;
holy_eqm_score({1004, 4, 2}) -> 71;
holy_eqm_score({1005, 5, 2}) -> 86;
holy_eqm_score({1006, 6, 2}) -> 100;
holy_eqm_score({1101, 1, 0}) -> 0;
holy_eqm_score({1102, 2, 0}) -> 14;
holy_eqm_score({1103, 3, 0}) -> 29;
holy_eqm_score({1104, 4, 0}) -> 43;
holy_eqm_score({1105, 5, 0}) -> 57;
holy_eqm_score({1106, 6, 0}) -> 71;
holy_eqm_score({1101, 1, 1}) -> 14;
holy_eqm_score({1102, 2, 1}) -> 29;
holy_eqm_score({1103, 3, 1}) -> 43;
holy_eqm_score({1104, 4, 1}) -> 57;
holy_eqm_score({1105, 5, 1}) -> 71;
holy_eqm_score({1106, 6, 1}) -> 86;
holy_eqm_score({1101, 1, 2}) -> 29;
holy_eqm_score({1102, 2, 2}) -> 43;
holy_eqm_score({1103, 3, 2}) -> 57;
holy_eqm_score({1104, 4, 2}) -> 71;
holy_eqm_score({1105, 5, 2}) -> 86;
holy_eqm_score({1106, 6, 2}) -> 100;
holy_eqm_score({1201, 1, 0}) -> 0;
holy_eqm_score({1202, 2, 0}) -> 14;
holy_eqm_score({1203, 3, 0}) -> 29;
holy_eqm_score({1204, 4, 0}) -> 43;
holy_eqm_score({1205, 5, 0}) -> 57;
holy_eqm_score({1206, 6, 0}) -> 71;
holy_eqm_score({1201, 1, 1}) -> 14;
holy_eqm_score({1202, 2, 1}) -> 29;
holy_eqm_score({1203, 3, 1}) -> 43;
holy_eqm_score({1204, 4, 1}) -> 57;
holy_eqm_score({1205, 5, 1}) -> 71;
holy_eqm_score({1206, 6, 1}) -> 86;
holy_eqm_score({1201, 1, 2}) -> 29;
holy_eqm_score({1202, 2, 2}) -> 43;
holy_eqm_score({1203, 3, 2}) -> 57;
holy_eqm_score({1204, 4, 2}) -> 71;
holy_eqm_score({1205, 5, 2}) -> 86;
holy_eqm_score({1206, 6, 2}) -> 100;
holy_eqm_score(_) -> 0.

holy_eqm_one_score({101, 1, 0}) -> 110;
holy_eqm_one_score({102, 2, 0}) -> 220;
holy_eqm_one_score({103, 3, 0}) -> 440;
holy_eqm_one_score({104, 4, 0}) -> 660;
holy_eqm_one_score({105, 5, 0}) -> 880;
holy_eqm_one_score({106, 6, 0}) -> 1100;
holy_eqm_one_score({101, 1, 1}) -> 110;
holy_eqm_one_score({102, 2, 1}) -> 220;
holy_eqm_one_score({103, 3, 1}) -> 440;
holy_eqm_one_score({104, 4, 1}) -> 660;
holy_eqm_one_score({105, 5, 1}) -> 880;
holy_eqm_one_score({106, 6, 1}) -> 1100;
holy_eqm_one_score({101, 1, 2}) -> 110;
holy_eqm_one_score({102, 2, 2}) -> 220;
holy_eqm_one_score({103, 3, 2}) -> 440;
holy_eqm_one_score({104, 4, 2}) -> 660;
holy_eqm_one_score({105, 5, 2}) -> 880;
holy_eqm_one_score({106, 6, 2}) -> 1100;
holy_eqm_one_score({201, 1, 0}) -> 110;
holy_eqm_one_score({202, 2, 0}) -> 220;
holy_eqm_one_score({203, 3, 0}) -> 440;
holy_eqm_one_score({204, 4, 0}) -> 660;
holy_eqm_one_score({205, 5, 0}) -> 880;
holy_eqm_one_score({206, 6, 0}) -> 1100;
holy_eqm_one_score({201, 1, 1}) -> 110;
holy_eqm_one_score({202, 2, 1}) -> 220;
holy_eqm_one_score({203, 3, 1}) -> 440;
holy_eqm_one_score({204, 4, 1}) -> 660;
holy_eqm_one_score({205, 5, 1}) -> 880;
holy_eqm_one_score({206, 6, 1}) -> 1100;
holy_eqm_one_score({201, 1, 2}) -> 110;
holy_eqm_one_score({202, 2, 2}) -> 220;
holy_eqm_one_score({203, 3, 2}) -> 440;
holy_eqm_one_score({204, 4, 2}) -> 660;
holy_eqm_one_score({205, 5, 2}) -> 880;
holy_eqm_one_score({206, 6, 2}) -> 1100;
holy_eqm_one_score({301, 1, 0}) -> 110;
holy_eqm_one_score({302, 2, 0}) -> 220;
holy_eqm_one_score({303, 3, 0}) -> 440;
holy_eqm_one_score({304, 4, 0}) -> 660;
holy_eqm_one_score({305, 5, 0}) -> 880;
holy_eqm_one_score({306, 6, 0}) -> 1100;
holy_eqm_one_score({301, 1, 1}) -> 110;
holy_eqm_one_score({302, 2, 1}) -> 220;
holy_eqm_one_score({303, 3, 1}) -> 440;
holy_eqm_one_score({304, 4, 1}) -> 660;
holy_eqm_one_score({305, 5, 1}) -> 880;
holy_eqm_one_score({306, 6, 1}) -> 1100;
holy_eqm_one_score({301, 1, 2}) -> 110;
holy_eqm_one_score({302, 2, 2}) -> 220;
holy_eqm_one_score({303, 3, 2}) -> 440;
holy_eqm_one_score({304, 4, 2}) -> 660;
holy_eqm_one_score({305, 5, 2}) -> 880;
holy_eqm_one_score({306, 6, 2}) -> 1100;
holy_eqm_one_score({401, 1, 0}) -> 110;
holy_eqm_one_score({402, 2, 0}) -> 220;
holy_eqm_one_score({403, 3, 0}) -> 440;
holy_eqm_one_score({404, 4, 0}) -> 660;
holy_eqm_one_score({405, 5, 0}) -> 880;
holy_eqm_one_score({406, 6, 0}) -> 1100;
holy_eqm_one_score({401, 1, 1}) -> 110;
holy_eqm_one_score({402, 2, 1}) -> 220;
holy_eqm_one_score({403, 3, 1}) -> 440;
holy_eqm_one_score({404, 4, 1}) -> 660;
holy_eqm_one_score({405, 5, 1}) -> 880;
holy_eqm_one_score({406, 6, 1}) -> 1100;
holy_eqm_one_score({401, 1, 2}) -> 110;
holy_eqm_one_score({402, 2, 2}) -> 220;
holy_eqm_one_score({403, 3, 2}) -> 440;
holy_eqm_one_score({404, 4, 2}) -> 660;
holy_eqm_one_score({405, 5, 2}) -> 880;
holy_eqm_one_score({406, 6, 2}) -> 1100;
holy_eqm_one_score({501, 1, 0}) -> 110;
holy_eqm_one_score({502, 2, 0}) -> 220;
holy_eqm_one_score({503, 3, 0}) -> 440;
holy_eqm_one_score({504, 4, 0}) -> 660;
holy_eqm_one_score({505, 5, 0}) -> 880;
holy_eqm_one_score({506, 6, 0}) -> 1100;
holy_eqm_one_score({501, 1, 1}) -> 110;
holy_eqm_one_score({502, 2, 1}) -> 220;
holy_eqm_one_score({503, 3, 1}) -> 440;
holy_eqm_one_score({504, 4, 1}) -> 660;
holy_eqm_one_score({505, 5, 1}) -> 880;
holy_eqm_one_score({506, 6, 1}) -> 1100;
holy_eqm_one_score({501, 1, 2}) -> 110;
holy_eqm_one_score({502, 2, 2}) -> 220;
holy_eqm_one_score({503, 3, 2}) -> 440;
holy_eqm_one_score({504, 4, 2}) -> 660;
holy_eqm_one_score({505, 5, 2}) -> 880;
holy_eqm_one_score({506, 6, 2}) -> 1100;
holy_eqm_one_score({601, 1, 0}) -> 110;
holy_eqm_one_score({602, 2, 0}) -> 220;
holy_eqm_one_score({603, 3, 0}) -> 440;
holy_eqm_one_score({604, 4, 0}) -> 660;
holy_eqm_one_score({605, 5, 0}) -> 880;
holy_eqm_one_score({606, 6, 0}) -> 1100;
holy_eqm_one_score({601, 1, 1}) -> 110;
holy_eqm_one_score({602, 2, 1}) -> 220;
holy_eqm_one_score({603, 3, 1}) -> 440;
holy_eqm_one_score({604, 4, 1}) -> 660;
holy_eqm_one_score({605, 5, 1}) -> 880;
holy_eqm_one_score({606, 6, 1}) -> 1100;
holy_eqm_one_score({601, 1, 2}) -> 110;
holy_eqm_one_score({602, 2, 2}) -> 220;
holy_eqm_one_score({603, 3, 2}) -> 440;
holy_eqm_one_score({604, 4, 2}) -> 660;
holy_eqm_one_score({605, 5, 2}) -> 880;
holy_eqm_one_score({606, 6, 2}) -> 1100;
holy_eqm_one_score({701, 1, 0}) -> 110;
holy_eqm_one_score({702, 2, 0}) -> 220;
holy_eqm_one_score({703, 3, 0}) -> 440;
holy_eqm_one_score({704, 4, 0}) -> 660;
holy_eqm_one_score({705, 5, 0}) -> 880;
holy_eqm_one_score({706, 6, 0}) -> 1100;
holy_eqm_one_score({701, 1, 1}) -> 110;
holy_eqm_one_score({702, 2, 1}) -> 220;
holy_eqm_one_score({703, 3, 1}) -> 440;
holy_eqm_one_score({704, 4, 1}) -> 660;
holy_eqm_one_score({705, 5, 1}) -> 880;
holy_eqm_one_score({706, 6, 1}) -> 1100;
holy_eqm_one_score({701, 1, 2}) -> 110;
holy_eqm_one_score({702, 2, 2}) -> 220;
holy_eqm_one_score({703, 3, 2}) -> 440;
holy_eqm_one_score({704, 4, 2}) -> 660;
holy_eqm_one_score({705, 5, 2}) -> 880;
holy_eqm_one_score({706, 6, 2}) -> 1100;
holy_eqm_one_score({801, 1, 0}) -> 110;
holy_eqm_one_score({802, 2, 0}) -> 220;
holy_eqm_one_score({803, 3, 0}) -> 440;
holy_eqm_one_score({804, 4, 0}) -> 660;
holy_eqm_one_score({805, 5, 0}) -> 880;
holy_eqm_one_score({806, 6, 0}) -> 1100;
holy_eqm_one_score({801, 1, 1}) -> 110;
holy_eqm_one_score({802, 2, 1}) -> 220;
holy_eqm_one_score({803, 3, 1}) -> 440;
holy_eqm_one_score({804, 4, 1}) -> 660;
holy_eqm_one_score({805, 5, 1}) -> 880;
holy_eqm_one_score({806, 6, 1}) -> 1100;
holy_eqm_one_score({801, 1, 2}) -> 110;
holy_eqm_one_score({802, 2, 2}) -> 220;
holy_eqm_one_score({803, 3, 2}) -> 440;
holy_eqm_one_score({804, 4, 2}) -> 660;
holy_eqm_one_score({805, 5, 2}) -> 880;
holy_eqm_one_score({806, 6, 2}) -> 1100;
holy_eqm_one_score({901, 1, 0}) -> 110;
holy_eqm_one_score({902, 2, 0}) -> 220;
holy_eqm_one_score({903, 3, 0}) -> 440;
holy_eqm_one_score({904, 4, 0}) -> 660;
holy_eqm_one_score({905, 5, 0}) -> 880;
holy_eqm_one_score({906, 6, 0}) -> 1100;
holy_eqm_one_score({901, 1, 1}) -> 110;
holy_eqm_one_score({902, 2, 1}) -> 220;
holy_eqm_one_score({903, 3, 1}) -> 440;
holy_eqm_one_score({904, 4, 1}) -> 660;
holy_eqm_one_score({905, 5, 1}) -> 880;
holy_eqm_one_score({906, 6, 1}) -> 1100;
holy_eqm_one_score({901, 1, 2}) -> 110;
holy_eqm_one_score({902, 2, 2}) -> 220;
holy_eqm_one_score({903, 3, 2}) -> 440;
holy_eqm_one_score({904, 4, 2}) -> 660;
holy_eqm_one_score({905, 5, 2}) -> 880;
holy_eqm_one_score({906, 6, 2}) -> 1100;
holy_eqm_one_score({1001, 1, 0}) -> 110;
holy_eqm_one_score({1002, 2, 0}) -> 220;
holy_eqm_one_score({1003, 3, 0}) -> 440;
holy_eqm_one_score({1004, 4, 0}) -> 660;
holy_eqm_one_score({1005, 5, 0}) -> 880;
holy_eqm_one_score({1006, 6, 0}) -> 1100;
holy_eqm_one_score({1001, 1, 1}) -> 110;
holy_eqm_one_score({1002, 2, 1}) -> 220;
holy_eqm_one_score({1003, 3, 1}) -> 440;
holy_eqm_one_score({1004, 4, 1}) -> 660;
holy_eqm_one_score({1005, 5, 1}) -> 880;
holy_eqm_one_score({1006, 6, 1}) -> 1100;
holy_eqm_one_score({1001, 1, 2}) -> 110;
holy_eqm_one_score({1002, 2, 2}) -> 220;
holy_eqm_one_score({1003, 3, 2}) -> 440;
holy_eqm_one_score({1004, 4, 2}) -> 660;
holy_eqm_one_score({1005, 5, 2}) -> 880;
holy_eqm_one_score({1006, 6, 2}) -> 1100;
holy_eqm_one_score({1101, 1, 0}) -> 110;
holy_eqm_one_score({1102, 2, 0}) -> 220;
holy_eqm_one_score({1103, 3, 0}) -> 440;
holy_eqm_one_score({1104, 4, 0}) -> 660;
holy_eqm_one_score({1105, 5, 0}) -> 880;
holy_eqm_one_score({1106, 6, 0}) -> 1100;
holy_eqm_one_score({1101, 1, 1}) -> 110;
holy_eqm_one_score({1102, 2, 1}) -> 220;
holy_eqm_one_score({1103, 3, 1}) -> 440;
holy_eqm_one_score({1104, 4, 1}) -> 660;
holy_eqm_one_score({1105, 5, 1}) -> 880;
holy_eqm_one_score({1106, 6, 1}) -> 1100;
holy_eqm_one_score({1101, 1, 2}) -> 110;
holy_eqm_one_score({1102, 2, 2}) -> 220;
holy_eqm_one_score({1103, 3, 2}) -> 440;
holy_eqm_one_score({1104, 4, 2}) -> 660;
holy_eqm_one_score({1105, 5, 2}) -> 880;
holy_eqm_one_score({1106, 6, 2}) -> 1100;
holy_eqm_one_score({1201, 1, 0}) -> 110;
holy_eqm_one_score({1202, 2, 0}) -> 220;
holy_eqm_one_score({1203, 3, 0}) -> 440;
holy_eqm_one_score({1204, 4, 0}) -> 660;
holy_eqm_one_score({1205, 5, 0}) -> 880;
holy_eqm_one_score({1206, 6, 0}) -> 1100;
holy_eqm_one_score({1201, 1, 1}) -> 110;
holy_eqm_one_score({1202, 2, 1}) -> 220;
holy_eqm_one_score({1203, 3, 1}) -> 440;
holy_eqm_one_score({1204, 4, 1}) -> 660;
holy_eqm_one_score({1205, 5, 1}) -> 880;
holy_eqm_one_score({1206, 6, 1}) -> 1100;
holy_eqm_one_score({1201, 1, 2}) -> 110;
holy_eqm_one_score({1202, 2, 2}) -> 220;
holy_eqm_one_score({1203, 3, 2}) -> 440;
holy_eqm_one_score({1204, 4, 2}) -> 660;
holy_eqm_one_score({1205, 5, 2}) -> 880;
holy_eqm_one_score({1206, 6, 2}) -> 1100;
holy_eqm_one_score(_) -> 0.

aftifact_score(10451) -> 0;
aftifact_score(10452) -> 25;
aftifact_score(10453) -> 50;
aftifact_score(10454) -> 75;
aftifact_score(10455) -> 100;
aftifact_score(_) -> 0.

skill_score(700001) -> 0;
skill_score(700011) -> 0;
skill_score(700021) -> 0;
skill_score(700031) -> 0;
skill_score(700041) -> 0;
skill_score(700051) -> 0;
skill_score(700061) -> 0;
skill_score(700071) -> 0;
skill_score(700081) -> 0;
skill_score(700091) -> 0;
skill_score(700101) -> 0;
skill_score(700111) -> 0;
skill_score(700121) -> 0;
skill_score(700131) -> 0;
skill_score(700141) -> 0;
skill_score(700151) -> 0;
skill_score(700161) -> 0;
skill_score(700171) -> 0;
skill_score(700181) -> 0;
skill_score(700191) -> 0;
skill_score(700201) -> 0;
skill_score(700211) -> 0;
skill_score(700221) -> 0;
skill_score(700231) -> 0;
skill_score(700241) -> 0;
skill_score(700251) -> 0;
skill_score(700261) -> 0;
skill_score(700271) -> 0;
skill_score(700291) -> 0;
skill_score(700301) -> 0;
skill_score(700311) -> 0;
skill_score(700321) -> 0;
skill_score(750000) -> 0;
skill_score(750100) -> 0;
skill_score(750200) -> 0;
skill_score(750400) -> 0;
skill_score(700281) -> 0;
skill_score(700361) -> 0;
skill_score(700371) -> 0;
skill_score(700381) -> 0;
skill_score(700391) -> 0;
skill_score(700401) -> 0;
skill_score(700003) -> 50;
skill_score(700013) -> 50;
skill_score(700023) -> 50;
skill_score(700033) -> 50;
skill_score(700043) -> 50;
skill_score(700053) -> 50;
skill_score(700063) -> 50;
skill_score(700073) -> 50;
skill_score(700083) -> 50;
skill_score(700093) -> 50;
skill_score(700103) -> 50;
skill_score(700113) -> 50;
skill_score(700123) -> 50;
skill_score(700133) -> 50;
skill_score(700143) -> 50;
skill_score(700153) -> 50;
skill_score(700163) -> 50;
skill_score(700173) -> 50;
skill_score(700183) -> 50;
skill_score(700193) -> 50;
skill_score(700203) -> 50;
skill_score(700213) -> 50;
skill_score(700223) -> 50;
skill_score(700233) -> 50;
skill_score(700243) -> 50;
skill_score(700253) -> 50;
skill_score(700263) -> 50;
skill_score(700273) -> 50;
skill_score(700293) -> 50;
skill_score(700303) -> 50;
skill_score(700313) -> 50;
skill_score(700323) -> 50;
skill_score(750001) -> 50;
skill_score(750101) -> 50;
skill_score(750201) -> 50;
skill_score(750401) -> 50;
skill_score(700283) -> 50;
skill_score(700363) -> 50;
skill_score(700373) -> 50;
skill_score(700383) -> 50;
skill_score(700393) -> 50;
skill_score(700403) -> 50;
skill_score(700005) -> 100;
skill_score(700015) -> 100;
skill_score(700025) -> 100;
skill_score(700035) -> 100;
skill_score(700045) -> 100;
skill_score(700055) -> 100;
skill_score(700065) -> 100;
skill_score(700075) -> 100;
skill_score(700085) -> 100;
skill_score(700095) -> 100;
skill_score(700105) -> 100;
skill_score(700115) -> 100;
skill_score(700125) -> 100;
skill_score(700135) -> 100;
skill_score(700145) -> 100;
skill_score(700155) -> 100;
skill_score(700165) -> 100;
skill_score(700175) -> 100;
skill_score(700185) -> 100;
skill_score(700195) -> 100;
skill_score(700205) -> 100;
skill_score(700215) -> 100;
skill_score(700225) -> 100;
skill_score(700235) -> 100;
skill_score(700245) -> 100;
skill_score(700255) -> 100;
skill_score(700265) -> 100;
skill_score(700275) -> 100;
skill_score(700295) -> 100;
skill_score(700305) -> 100;
skill_score(700315) -> 100;
skill_score(700325) -> 100;
skill_score(750002) -> 100;
skill_score(750102) -> 100;
skill_score(750202) -> 100;
skill_score(750402) -> 100;
skill_score(700285) -> 100;
skill_score(700365) -> 100;
skill_score(700375) -> 100;
skill_score(700385) -> 100;
skill_score(700395) -> 100;
skill_score(700405) -> 100;
skill_score(_) -> 0.

hallow_lev_score(1) -> 0;
hallow_lev_score(2) -> 5;
hallow_lev_score(3) -> 9;
hallow_lev_score(4) -> 14;
hallow_lev_score(5) -> 18;
hallow_lev_score(6) -> 23;
hallow_lev_score(7) -> 27;
hallow_lev_score(8) -> 32;
hallow_lev_score(9) -> 36;
hallow_lev_score(10) -> 41;
hallow_lev_score(11) -> 45;
hallow_lev_score(12) -> 50;
hallow_lev_score(13) -> 55;
hallow_lev_score(14) -> 59;
hallow_lev_score(15) -> 64;
hallow_lev_score(16) -> 68;
hallow_lev_score(17) -> 73;
hallow_lev_score(18) -> 77;
hallow_lev_score(19) -> 82;
hallow_lev_score(20) -> 86;
hallow_lev_score(21) -> 91;
hallow_lev_score(22) -> 95;
hallow_lev_score(23) -> 100;
hallow_lev_score(_) -> 0.

hallow_refine_score(1) -> 0;
hallow_refine_score(2) -> 1;
hallow_refine_score(3) -> 3;
hallow_refine_score(4) -> 4;
hallow_refine_score(5) -> 6;
hallow_refine_score(6) -> 7;
hallow_refine_score(7) -> 8;
hallow_refine_score(8) -> 10;
hallow_refine_score(9) -> 11;
hallow_refine_score(10) -> 13;
hallow_refine_score(11) -> 14;
hallow_refine_score(12) -> 15;
hallow_refine_score(13) -> 17;
hallow_refine_score(14) -> 18;
hallow_refine_score(15) -> 20;
hallow_refine_score(16) -> 21;
hallow_refine_score(17) -> 23;
hallow_refine_score(18) -> 24;
hallow_refine_score(19) -> 25;
hallow_refine_score(20) -> 27;
hallow_refine_score(21) -> 28;
hallow_refine_score(22) -> 30;
hallow_refine_score(23) -> 31;
hallow_refine_score(24) -> 32;
hallow_refine_score(25) -> 34;
hallow_refine_score(26) -> 35;
hallow_refine_score(27) -> 37;
hallow_refine_score(28) -> 38;
hallow_refine_score(29) -> 39;
hallow_refine_score(30) -> 41;
hallow_refine_score(31) -> 42;
hallow_refine_score(32) -> 44;
hallow_refine_score(33) -> 45;
hallow_refine_score(34) -> 46;
hallow_refine_score(35) -> 48;
hallow_refine_score(36) -> 49;
hallow_refine_score(37) -> 51;
hallow_refine_score(38) -> 52;
hallow_refine_score(39) -> 54;
hallow_refine_score(40) -> 55;
hallow_refine_score(41) -> 56;
hallow_refine_score(42) -> 58;
hallow_refine_score(43) -> 59;
hallow_refine_score(44) -> 61;
hallow_refine_score(45) -> 62;
hallow_refine_score(46) -> 63;
hallow_refine_score(47) -> 65;
hallow_refine_score(48) -> 66;
hallow_refine_score(49) -> 68;
hallow_refine_score(50) -> 69;
hallow_refine_score(51) -> 70;
hallow_refine_score(52) -> 72;
hallow_refine_score(53) -> 73;
hallow_refine_score(54) -> 75;
hallow_refine_score(55) -> 76;
hallow_refine_score(56) -> 77;
hallow_refine_score(57) -> 79;
hallow_refine_score(58) -> 80;
hallow_refine_score(59) -> 82;
hallow_refine_score(60) -> 83;
hallow_refine_score(61) -> 85;
hallow_refine_score(62) -> 86;
hallow_refine_score(63) -> 87;
hallow_refine_score(64) -> 89;
hallow_refine_score(65) -> 90;
hallow_refine_score(66) -> 92;
hallow_refine_score(67) -> 93;
hallow_refine_score(68) -> 94;
hallow_refine_score(69) -> 96;
hallow_refine_score(70) -> 97;
hallow_refine_score(71) -> 99;
hallow_refine_score(72) -> 100;
hallow_refine_score(_) -> 0.

halidom_score(1) -> 0;
halidom_score(2) -> 1;
halidom_score(3) -> 2;
halidom_score(4) -> 3;
halidom_score(5) -> 4;
halidom_score(6) -> 5;
halidom_score(7) -> 6;
halidom_score(8) -> 7;
halidom_score(9) -> 8;
halidom_score(10) -> 9;
halidom_score(11) -> 10;
halidom_score(12) -> 11;
halidom_score(13) -> 12;
halidom_score(14) -> 13;
halidom_score(15) -> 14;
halidom_score(16) -> 15;
halidom_score(17) -> 16;
halidom_score(18) -> 17;
halidom_score(19) -> 18;
halidom_score(20) -> 19;
halidom_score(21) -> 20;
halidom_score(22) -> 21;
halidom_score(23) -> 22;
halidom_score(24) -> 23;
halidom_score(25) -> 24;
halidom_score(26) -> 25;
halidom_score(27) -> 26;
halidom_score(28) -> 27;
halidom_score(29) -> 28;
halidom_score(30) -> 29;
halidom_score(31) -> 30;
halidom_score(32) -> 31;
halidom_score(33) -> 32;
halidom_score(34) -> 33;
halidom_score(35) -> 34;
halidom_score(36) -> 35;
halidom_score(37) -> 36;
halidom_score(38) -> 37;
halidom_score(39) -> 38;
halidom_score(40) -> 39;
halidom_score(41) -> 40;
halidom_score(42) -> 41;
halidom_score(43) -> 42;
halidom_score(44) -> 43;
halidom_score(45) -> 44;
halidom_score(46) -> 45;
halidom_score(47) -> 46;
halidom_score(48) -> 47;
halidom_score(49) -> 48;
halidom_score(50) -> 49;
halidom_score(51) -> 51;
halidom_score(52) -> 52;
halidom_score(53) -> 53;
halidom_score(54) -> 54;
halidom_score(55) -> 55;
halidom_score(56) -> 56;
halidom_score(57) -> 57;
halidom_score(58) -> 58;
halidom_score(59) -> 59;
halidom_score(60) -> 60;
halidom_score(61) -> 61;
halidom_score(62) -> 62;
halidom_score(63) -> 63;
halidom_score(64) -> 64;
halidom_score(65) -> 65;
halidom_score(66) -> 66;
halidom_score(67) -> 67;
halidom_score(68) -> 68;
halidom_score(69) -> 69;
halidom_score(70) -> 70;
halidom_score(71) -> 71;
halidom_score(72) -> 72;
halidom_score(73) -> 73;
halidom_score(74) -> 74;
halidom_score(75) -> 75;
halidom_score(76) -> 76;
halidom_score(77) -> 77;
halidom_score(78) -> 78;
halidom_score(79) -> 79;
halidom_score(80) -> 80;
halidom_score(81) -> 81;
halidom_score(82) -> 82;
halidom_score(83) -> 83;
halidom_score(84) -> 84;
halidom_score(85) -> 85;
halidom_score(86) -> 86;
halidom_score(87) -> 87;
halidom_score(88) -> 88;
halidom_score(89) -> 89;
halidom_score(90) -> 90;
halidom_score(91) -> 91;
halidom_score(92) -> 92;
halidom_score(93) -> 93;
halidom_score(94) -> 94;
halidom_score(95) -> 95;
halidom_score(96) -> 96;
halidom_score(97) -> 97;
halidom_score(98) -> 98;
halidom_score(99) -> 99;
halidom_score(100) -> 100;
halidom_score(_) -> 0.

guild_skill_score({1, 1}) -> 0;
guild_skill_score({2, 1}) -> 0;
guild_skill_score({3, 1}) -> 1;
guild_skill_score({4, 1}) -> 1;
guild_skill_score({5, 1}) -> 2;
guild_skill_score({6, 1}) -> 2;
guild_skill_score({1, 2}) -> 3;
guild_skill_score({2, 2}) -> 3;
guild_skill_score({3, 2}) -> 3;
guild_skill_score({4, 2}) -> 4;
guild_skill_score({5, 2}) -> 4;
guild_skill_score({6, 2}) -> 5;
guild_skill_score({1, 3}) -> 5;
guild_skill_score({2, 3}) -> 5;
guild_skill_score({3, 3}) -> 6;
guild_skill_score({4, 3}) -> 6;
guild_skill_score({5, 3}) -> 7;
guild_skill_score({6, 3}) -> 7;
guild_skill_score({1, 4}) -> 8;
guild_skill_score({2, 4}) -> 8;
guild_skill_score({3, 4}) -> 8;
guild_skill_score({4, 4}) -> 9;
guild_skill_score({5, 4}) -> 9;
guild_skill_score({6, 4}) -> 10;
guild_skill_score({1, 5}) -> 10;
guild_skill_score({2, 5}) -> 10;
guild_skill_score({3, 5}) -> 11;
guild_skill_score({4, 5}) -> 11;
guild_skill_score({5, 5}) -> 12;
guild_skill_score({6, 5}) -> 12;
guild_skill_score({1, 6}) -> 13;
guild_skill_score({2, 6}) -> 13;
guild_skill_score({3, 6}) -> 13;
guild_skill_score({4, 6}) -> 14;
guild_skill_score({5, 6}) -> 14;
guild_skill_score({6, 6}) -> 15;
guild_skill_score({1, 7}) -> 15;
guild_skill_score({2, 7}) -> 15;
guild_skill_score({3, 7}) -> 16;
guild_skill_score({4, 7}) -> 16;
guild_skill_score({5, 7}) -> 17;
guild_skill_score({6, 7}) -> 17;
guild_skill_score({1, 8}) -> 18;
guild_skill_score({2, 8}) -> 18;
guild_skill_score({3, 8}) -> 18;
guild_skill_score({4, 8}) -> 19;
guild_skill_score({5, 8}) -> 19;
guild_skill_score({6, 8}) -> 20;
guild_skill_score({1, 9}) -> 20;
guild_skill_score({2, 9}) -> 21;
guild_skill_score({3, 9}) -> 21;
guild_skill_score({4, 9}) -> 21;
guild_skill_score({5, 9}) -> 22;
guild_skill_score({6, 9}) -> 22;
guild_skill_score({1, 10}) -> 23;
guild_skill_score({2, 10}) -> 23;
guild_skill_score({3, 10}) -> 23;
guild_skill_score({4, 10}) -> 24;
guild_skill_score({5, 10}) -> 24;
guild_skill_score({6, 10}) -> 25;
guild_skill_score({1, 11}) -> 25;
guild_skill_score({2, 11}) -> 26;
guild_skill_score({3, 11}) -> 26;
guild_skill_score({4, 11}) -> 26;
guild_skill_score({5, 11}) -> 27;
guild_skill_score({6, 11}) -> 27;
guild_skill_score({1, 12}) -> 28;
guild_skill_score({2, 12}) -> 28;
guild_skill_score({3, 12}) -> 28;
guild_skill_score({4, 12}) -> 29;
guild_skill_score({5, 12}) -> 29;
guild_skill_score({6, 12}) -> 30;
guild_skill_score({1, 13}) -> 30;
guild_skill_score({2, 13}) -> 31;
guild_skill_score({3, 13}) -> 31;
guild_skill_score({4, 13}) -> 31;
guild_skill_score({5, 13}) -> 32;
guild_skill_score({6, 13}) -> 32;
guild_skill_score({1, 14}) -> 33;
guild_skill_score({2, 14}) -> 33;
guild_skill_score({3, 14}) -> 33;
guild_skill_score({4, 14}) -> 34;
guild_skill_score({5, 14}) -> 34;
guild_skill_score({6, 14}) -> 35;
guild_skill_score({1, 15}) -> 35;
guild_skill_score({2, 15}) -> 36;
guild_skill_score({3, 15}) -> 36;
guild_skill_score({4, 15}) -> 36;
guild_skill_score({5, 15}) -> 37;
guild_skill_score({6, 15}) -> 37;
guild_skill_score({1, 16}) -> 38;
guild_skill_score({2, 16}) -> 38;
guild_skill_score({3, 16}) -> 38;
guild_skill_score({4, 16}) -> 39;
guild_skill_score({5, 16}) -> 39;
guild_skill_score({6, 16}) -> 40;
guild_skill_score({1, 17}) -> 40;
guild_skill_score({2, 17}) -> 41;
guild_skill_score({3, 17}) -> 41;
guild_skill_score({4, 17}) -> 41;
guild_skill_score({5, 17}) -> 42;
guild_skill_score({6, 17}) -> 42;
guild_skill_score({1, 18}) -> 43;
guild_skill_score({2, 18}) -> 43;
guild_skill_score({3, 18}) -> 44;
guild_skill_score({4, 18}) -> 44;
guild_skill_score({5, 18}) -> 44;
guild_skill_score({6, 18}) -> 45;
guild_skill_score({1, 19}) -> 45;
guild_skill_score({2, 19}) -> 46;
guild_skill_score({3, 19}) -> 46;
guild_skill_score({4, 19}) -> 46;
guild_skill_score({5, 19}) -> 47;
guild_skill_score({6, 19}) -> 47;
guild_skill_score({1, 20}) -> 48;
guild_skill_score({2, 20}) -> 48;
guild_skill_score({3, 20}) -> 49;
guild_skill_score({4, 20}) -> 49;
guild_skill_score({5, 20}) -> 49;
guild_skill_score({6, 20}) -> 50;
guild_skill_score({1, 21}) -> 50;
guild_skill_score({2, 21}) -> 51;
guild_skill_score({3, 21}) -> 51;
guild_skill_score({4, 21}) -> 51;
guild_skill_score({5, 21}) -> 52;
guild_skill_score({6, 21}) -> 52;
guild_skill_score({1, 22}) -> 53;
guild_skill_score({2, 22}) -> 53;
guild_skill_score({3, 22}) -> 54;
guild_skill_score({4, 22}) -> 54;
guild_skill_score({5, 22}) -> 54;
guild_skill_score({6, 22}) -> 55;
guild_skill_score({1, 23}) -> 55;
guild_skill_score({2, 23}) -> 56;
guild_skill_score({3, 23}) -> 56;
guild_skill_score({4, 23}) -> 56;
guild_skill_score({5, 23}) -> 57;
guild_skill_score({6, 23}) -> 57;
guild_skill_score({1, 24}) -> 58;
guild_skill_score({2, 24}) -> 58;
guild_skill_score({3, 24}) -> 59;
guild_skill_score({4, 24}) -> 59;
guild_skill_score({5, 24}) -> 59;
guild_skill_score({6, 24}) -> 60;
guild_skill_score({1, 25}) -> 60;
guild_skill_score({2, 25}) -> 61;
guild_skill_score({3, 25}) -> 61;
guild_skill_score({4, 25}) -> 62;
guild_skill_score({5, 25}) -> 62;
guild_skill_score({6, 25}) -> 62;
guild_skill_score({1, 26}) -> 63;
guild_skill_score({2, 26}) -> 63;
guild_skill_score({3, 26}) -> 64;
guild_skill_score({4, 26}) -> 64;
guild_skill_score({5, 26}) -> 64;
guild_skill_score({6, 26}) -> 65;
guild_skill_score({1, 27}) -> 65;
guild_skill_score({2, 27}) -> 66;
guild_skill_score({3, 27}) -> 66;
guild_skill_score({4, 27}) -> 67;
guild_skill_score({5, 27}) -> 67;
guild_skill_score({6, 27}) -> 67;
guild_skill_score({1, 28}) -> 68;
guild_skill_score({2, 28}) -> 68;
guild_skill_score({3, 28}) -> 69;
guild_skill_score({4, 28}) -> 69;
guild_skill_score({5, 28}) -> 69;
guild_skill_score({6, 28}) -> 70;
guild_skill_score({1, 29}) -> 70;
guild_skill_score({2, 29}) -> 71;
guild_skill_score({3, 29}) -> 71;
guild_skill_score({4, 29}) -> 72;
guild_skill_score({5, 29}) -> 72;
guild_skill_score({6, 29}) -> 72;
guild_skill_score({1, 30}) -> 73;
guild_skill_score({2, 30}) -> 73;
guild_skill_score({3, 30}) -> 74;
guild_skill_score({4, 30}) -> 74;
guild_skill_score({5, 30}) -> 74;
guild_skill_score({6, 30}) -> 75;
guild_skill_score({1, 31}) -> 75;
guild_skill_score({2, 31}) -> 76;
guild_skill_score({3, 31}) -> 76;
guild_skill_score({4, 31}) -> 77;
guild_skill_score({5, 31}) -> 77;
guild_skill_score({6, 31}) -> 77;
guild_skill_score({1, 32}) -> 78;
guild_skill_score({2, 32}) -> 78;
guild_skill_score({3, 32}) -> 79;
guild_skill_score({4, 32}) -> 79;
guild_skill_score({5, 32}) -> 79;
guild_skill_score({6, 32}) -> 80;
guild_skill_score({1, 33}) -> 80;
guild_skill_score({2, 33}) -> 81;
guild_skill_score({3, 33}) -> 81;
guild_skill_score({4, 33}) -> 82;
guild_skill_score({5, 33}) -> 82;
guild_skill_score({6, 33}) -> 82;
guild_skill_score({1, 34}) -> 83;
guild_skill_score({2, 34}) -> 83;
guild_skill_score({3, 34}) -> 84;
guild_skill_score({4, 34}) -> 84;
guild_skill_score({5, 34}) -> 85;
guild_skill_score({6, 34}) -> 85;
guild_skill_score({1, 35}) -> 85;
guild_skill_score({2, 35}) -> 86;
guild_skill_score({3, 35}) -> 86;
guild_skill_score({4, 35}) -> 87;
guild_skill_score({5, 35}) -> 87;
guild_skill_score({6, 35}) -> 87;
guild_skill_score({1, 36}) -> 88;
guild_skill_score({2, 36}) -> 88;
guild_skill_score({3, 36}) -> 89;
guild_skill_score({4, 36}) -> 89;
guild_skill_score({5, 36}) -> 90;
guild_skill_score({6, 36}) -> 90;
guild_skill_score({1, 37}) -> 90;
guild_skill_score({2, 37}) -> 91;
guild_skill_score({3, 37}) -> 91;
guild_skill_score({4, 37}) -> 92;
guild_skill_score({5, 37}) -> 92;
guild_skill_score({6, 37}) -> 92;
guild_skill_score({1, 38}) -> 93;
guild_skill_score({2, 38}) -> 93;
guild_skill_score({3, 38}) -> 94;
guild_skill_score({4, 38}) -> 94;
guild_skill_score({5, 38}) -> 95;
guild_skill_score({6, 38}) -> 95;
guild_skill_score({1, 39}) -> 95;
guild_skill_score({2, 39}) -> 96;
guild_skill_score({3, 39}) -> 96;
guild_skill_score({4, 39}) -> 97;
guild_skill_score({5, 39}) -> 97;
guild_skill_score({6, 39}) -> 97;
guild_skill_score({1, 40}) -> 98;
guild_skill_score({2, 40}) -> 98;
guild_skill_score({3, 40}) -> 99;
guild_skill_score({4, 40}) -> 99;
guild_skill_score({5, 40}) -> 100;
guild_skill_score({6, 40}) -> 100;
guild_skill_score(_) -> 0.

vip_range() ->
    [{10, 13}, {8, 9}, {6, 7}, {5, 5}, {4, 4}, {1, 3}].

vip_list() -> [106, 105, 104, 103, 102, 101].

vip_id({1, 3}) -> 101;
vip_id({4, 4}) -> 102;
vip_id({5, 5}) -> 103;
vip_id({6, 7}) -> 104;
vip_id({8, 9}) -> 105;
vip_id({10, 13}) -> 106;
vip_id(_) -> 0.

award({9001, 106}) -> {1, 1, 130, 201};
award({3001, 106}) -> {2, 1, 130, 201};
award({5001, 106}) -> {3, 1, 130, 201};
award({6001, 106}) -> {4, 1, 130, 201};
award({7001, 106}) -> {5, 1, 130, 201};
award({8001, 106}) -> {6, 1, 130, 201};
award(_) -> undefined.


