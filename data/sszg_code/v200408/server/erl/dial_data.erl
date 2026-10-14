-file("data/dial_data.erl", 1).

-module(dial_data).

-export([list/0, get_limit_open/1, get_expend_item/1,
	 get_expend_gold/1, get_add_item/1, get_add_lucky/1,
	 get_rand_id/1, get_count/1, get_rand_list/1,
	 get_item_must_no_count/1, get_award_by_id/1,
	 get_rand_pos/1, get_pos_must_no_count/1,
	 get_lucky_award/1, get_lucky_list/1, get_del_lucky/1,
	 get_const/1]).

-file("../server/inc/common.hrl", 1).

-file("../server/inc/lib_log.hrl", 1).

-file("../server/inc/common.hrl", 112).

-type p() :: string().

-type z() :: non_neg_integer().

-type srv_id() :: bitstring().

-type role_id() :: {pos_integer(), srv_id()}.

-type guild_id() :: {pos_integer(), srv_id()}.

-type unit_id() :: {pos_integer(), pos_integer()}.

-type pos() :: {pos_integer(), non_neg_integer(),
		non_neg_integer()}.

-file("data/dial_data.erl", 26).

-file("../server/inc/dial.hrl", 1).

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

-file("data/dial_data.erl", 27).

list() -> [1, 1, 2, 2].

get_limit_open({1, 1}) -> [{lev, 10}];
get_limit_open({1, 2}) -> [{lev, 10}, {vip_lev, 2}];
get_limit_open({2, 1}) -> [{lev, 30}];
get_limit_open({2, 2}) -> [{lev, 30}];
get_limit_open(_Info) ->
    lager:error(io_lib:format("get_limit_open_data_not_exist===>~w",
			      [_Info])),
    undefined.

get_expend_item({1, 1}) -> [{37001, 1}];
get_expend_item({1, 2}) -> [{37001, 12}];
get_expend_item({2, 1}) -> [{37002, 1}];
get_expend_item({2, 2}) -> [{37002, 10}];
get_expend_item(_Info) ->
    lager:error(io_lib:format("get_expend_item_data_not_exist===>~w",
			      [_Info])),
    undefined.

get_expend_gold(_) -> [].

get_add_item({1, 1}) -> [{18, 10}];
get_add_item({1, 2}) -> [{18, 150}];
get_add_item({2, 1}) -> [{18, 10}];
get_add_item({2, 2}) -> [{18, 100}];
get_add_item(_) -> [].

get_add_lucky({1, 1}) -> 10;
get_add_lucky({1, 2}) -> 150;
get_add_lucky({2, 1}) -> 10;
get_add_lucky({2, 2}) -> 100;
get_add_lucky(_) -> 0.

get_rand_id({1, 1}) -> 2;
get_rand_id({1, 2}) -> 2;
get_rand_id({2, 1}) -> 4;
get_rand_id({2, 2}) -> 4;
get_rand_id(_Info) ->
    lager:error(io_lib:format("get_rand_id_data_not_exist===>~w",
			      [_Info])),
    undefined.

get_count({1, 1}) -> 1;
get_count({1, 2}) -> 15;
get_count({2, 1}) -> 1;
get_count({2, 2}) -> 10;
get_count(_Info) ->
    lager:error(io_lib:format("get_count_data_not_exist===>~w",
			      [_Info])),
    undefined.

get_rand_list({2, 8}) ->
    [{264, 1, 50, 200, 999999}, {265, 1, 50, 200, 999999},
     {266, 1, 50, 200, 999999}, {267, 1, 50, 200, 999999},
     {268, 1, 50, 200, 999999}, {306, 50, 999, 200, 999999},
     {307, 50, 999, 200, 999999},
     {308, 50, 999, 200, 999999},
     {309, 50, 999, 200, 999999},
     {310, 50, 999, 200, 999999}];
get_rand_list({2, 7}) ->
    [{259, 1, 50, 260, 1}, {260, 1, 50, 260, 1},
     {261, 1, 50, 40, 1}, {262, 1, 50, 220, 1},
     {263, 1, 50, 220, 1}, {301, 50, 999, 400, 1},
     {302, 50, 999, 400, 1}, {303, 50, 999, 100, 1},
     {304, 50, 999, 50, 1}, {305, 50, 999, 50, 1}];
get_rand_list({2, 6}) ->
    [{254, 1, 50, 400, 999999}, {255, 1, 50, 300, 999999},
     {256, 1, 50, 150, 999999}, {257, 1, 50, 100, 999999},
     {258, 1, 50, 50, 999999}, {296, 50, 999, 400, 999999},
     {297, 50, 999, 300, 999999},
     {298, 50, 999, 150, 999999},
     {299, 50, 999, 100, 999999},
     {300, 50, 999, 50, 999999}];
get_rand_list({2, 5}) ->
    [{249, 1, 50, 240, 1}, {250, 1, 50, 240, 1},
     {251, 1, 50, 240, 1}, {252, 1, 50, 240, 1},
     {253, 1, 50, 40, 1}, {291, 50, 999, 240, 1},
     {292, 50, 999, 240, 1}, {293, 50, 999, 240, 1},
     {294, 50, 999, 240, 1}, {295, 50, 999, 40, 1}];
get_rand_list({2, 4}) ->
    [{244, 1, 50, 300, 999999}, {245, 1, 50, 250, 999999},
     {246, 1, 50, 200, 999999}, {247, 1, 50, 150, 999999},
     {248, 1, 50, 100, 999999}, {286, 50, 999, 300, 999999},
     {287, 50, 999, 250, 999999},
     {288, 50, 999, 200, 999999},
     {289, 50, 999, 150, 999999},
     {290, 50, 999, 100, 999999}];
get_rand_list({2, 3}) ->
    [{239, 1, 50, 240, 1}, {240, 1, 50, 240, 1},
     {241, 1, 50, 200, 1}, {242, 1, 50, 200, 1},
     {243, 1, 50, 120, 1}, {281, 50, 999, 270, 1},
     {282, 50, 999, 270, 1}, {283, 50, 999, 270, 1},
     {284, 50, 999, 95, 1}, {285, 50, 999, 95, 1}];
get_rand_list({2, 2}) ->
    [{234, 1, 50, 75, 999999}, {235, 1, 50, 150, 999999},
     {236, 1, 50, 275, 999999}, {237, 1, 50, 250, 999999},
     {238, 1, 50, 250, 999999}, {276, 50, 999, 75, 999999},
     {277, 50, 999, 150, 999999},
     {278, 50, 999, 275, 999999},
     {279, 50, 999, 250, 999999},
     {280, 50, 999, 250, 999999}];
get_rand_list({2, 1}) ->
    [{227, 1, 50, 330, 1}, {228, 1, 50, 120, 1},
     {229, 1, 50, 120, 1}, {230, 1, 50, 110, 1},
     {231, 1, 50, 110, 1}, {232, 1, 50, 110, 1},
     {233, 1, 50, 100, 1}, {269, 50, 999, 35, 1},
     {270, 50, 999, 150, 1}, {271, 50, 999, 150, 1},
     {272, 50, 999, 210, 1}, {273, 50, 999, 210, 1},
     {274, 50, 999, 210, 1}, {275, 50, 999, 35, 1}];
get_rand_list({1, 8}) ->
    [{138, 1, 30, 200, 999999}, {139, 1, 30, 200, 999999},
     {140, 1, 30, 200, 999999}, {141, 1, 30, 200, 999999},
     {142, 1, 30, 200, 999999}, {180, 30, 50, 200, 999999},
     {181, 30, 50, 200, 999999}, {182, 30, 50, 200, 999999},
     {183, 30, 50, 200, 999999}, {184, 30, 50, 200, 999999},
     {222, 50, 999, 200, 999999},
     {223, 50, 999, 200, 999999},
     {224, 50, 999, 200, 999999},
     {225, 50, 999, 200, 999999},
     {226, 50, 999, 200, 999999}];
get_rand_list({1, 7}) ->
    [{133, 1, 30, 200, 1}, {134, 1, 30, 250, 1},
     {135, 1, 30, 250, 1}, {136, 1, 30, 50, 1},
     {137, 1, 30, 250, 1}, {175, 30, 50, 80, 1},
     {176, 30, 50, 210, 1}, {177, 30, 50, 250, 1},
     {178, 30, 50, 250, 1}, {179, 30, 50, 210, 1},
     {217, 50, 999, 100, 1}, {218, 50, 999, 225, 1},
     {219, 50, 999, 225, 1}, {220, 50, 999, 225, 1},
     {221, 50, 999, 225, 1}];
get_rand_list({1, 6}) ->
    [{128, 1, 30, 260, 999999}, {129, 1, 30, 230, 999999},
     {130, 1, 30, 200, 999999}, {131, 1, 30, 170, 999999},
     {132, 1, 30, 140, 999999}, {170, 30, 50, 260, 999999},
     {171, 30, 50, 230, 999999}, {172, 30, 50, 200, 999999},
     {173, 30, 50, 170, 999999}, {174, 30, 50, 140, 999999},
     {212, 50, 999, 300, 999999},
     {213, 50, 999, 280, 999999},
     {214, 50, 999, 250, 999999},
     {215, 50, 999, 100, 999999},
     {216, 50, 999, 70, 999999}];
get_rand_list({1, 5}) ->
    [{123, 1, 30, 230, 1}, {124, 1, 30, 230, 1},
     {125, 1, 30, 230, 1}, {126, 1, 30, 155, 1},
     {127, 1, 30, 155, 1}, {165, 30, 50, 245, 1},
     {166, 30, 50, 245, 1}, {167, 30, 50, 170, 1},
     {168, 30, 50, 170, 1}, {169, 30, 50, 170, 1},
     {207, 50, 999, 245, 1}, {208, 50, 999, 245, 1},
     {209, 50, 999, 245, 1}, {210, 50, 999, 245, 1},
     {211, 50, 999, 20, 1}];
get_rand_list({1, 4}) ->
    [{118, 1, 30, 260, 999999}, {119, 1, 30, 230, 999999},
     {120, 1, 30, 200, 999999}, {121, 1, 30, 170, 999999},
     {122, 1, 30, 140, 999999}, {160, 30, 50, 260, 999999},
     {161, 30, 50, 230, 999999}, {162, 30, 50, 200, 999999},
     {163, 30, 50, 170, 999999}, {164, 30, 50, 140, 999999},
     {202, 50, 999, 260, 999999},
     {203, 50, 999, 230, 999999},
     {204, 50, 999, 200, 999999},
     {205, 50, 999, 170, 999999},
     {206, 50, 999, 140, 999999}];
get_rand_list({1, 3}) ->
    [{113, 1, 30, 230, 1}, {114, 1, 30, 230, 1},
     {115, 1, 30, 230, 1}, {116, 1, 30, 230, 1},
     {117, 1, 30, 80, 1}, {155, 30, 50, 300, 1},
     {156, 30, 50, 100, 1}, {157, 30, 50, 100, 1},
     {158, 30, 50, 250, 1}, {159, 30, 50, 250, 1},
     {197, 50, 999, 320, 1}, {198, 50, 999, 320, 1},
     {199, 50, 999, 60, 1}, {200, 50, 999, 150, 1},
     {201, 50, 999, 150, 1}];
get_rand_list({1, 2}) ->
    [{108, 1, 30, 300, 999999}, {109, 1, 30, 160, 999999},
     {110, 1, 30, 280, 999999}, {111, 1, 30, 160, 999999},
     {112, 1, 30, 100, 999999}, {150, 30, 50, 300, 999999},
     {151, 30, 50, 160, 999999}, {152, 30, 50, 280, 999999},
     {153, 30, 50, 160, 999999}, {154, 30, 50, 100, 999999},
     {192, 50, 999, 300, 999999},
     {193, 50, 999, 160, 999999},
     {194, 50, 999, 280, 999999},
     {195, 50, 999, 160, 999999},
     {196, 50, 999, 100, 999999}];
get_rand_list({1, 1}) ->
    [{101, 1, 30, 300, 1}, {102, 1, 30, 110, 1},
     {103, 1, 30, 110, 1}, {104, 1, 30, 140, 1},
     {105, 1, 30, 140, 1}, {106, 1, 30, 140, 1},
     {107, 1, 30, 60, 1}, {143, 30, 50, 200, 1},
     {144, 30, 50, 205, 1}, {145, 30, 50, 205, 1},
     {146, 30, 50, 110, 1}, {147, 30, 50, 110, 1},
     {148, 30, 50, 110, 1}, {149, 30, 50, 60, 1},
     {185, 50, 999, 510, 1}, {186, 50, 999, 180, 1},
     {187, 50, 999, 180, 1}, {188, 50, 999, 40, 1},
     {189, 50, 999, 30, 1}, {190, 50, 999, 30, 1},
     {191, 50, 999, 30, 1}];
get_rand_list(_) -> [].

get_item_must_no_count({1, 101}) -> 0;
get_item_must_no_count({1, 102}) -> 0;
get_item_must_no_count({1, 103}) -> 0;
get_item_must_no_count({1, 104}) -> 0;
get_item_must_no_count({1, 105}) -> 0;
get_item_must_no_count({1, 106}) -> 0;
get_item_must_no_count({1, 107}) -> 15;
get_item_must_no_count({1, 108}) -> 0;
get_item_must_no_count({1, 109}) -> 0;
get_item_must_no_count({1, 110}) -> 0;
get_item_must_no_count({1, 111}) -> 0;
get_item_must_no_count({1, 112}) -> 0;
get_item_must_no_count({1, 113}) -> 0;
get_item_must_no_count({1, 114}) -> 0;
get_item_must_no_count({1, 115}) -> 0;
get_item_must_no_count({1, 116}) -> 0;
get_item_must_no_count({1, 117}) -> 0;
get_item_must_no_count({1, 118}) -> 0;
get_item_must_no_count({1, 119}) -> 0;
get_item_must_no_count({1, 120}) -> 0;
get_item_must_no_count({1, 121}) -> 0;
get_item_must_no_count({1, 122}) -> 0;
get_item_must_no_count({1, 123}) -> 0;
get_item_must_no_count({1, 124}) -> 0;
get_item_must_no_count({1, 125}) -> 0;
get_item_must_no_count({1, 126}) -> 0;
get_item_must_no_count({1, 127}) -> 0;
get_item_must_no_count({1, 128}) -> 0;
get_item_must_no_count({1, 129}) -> 0;
get_item_must_no_count({1, 130}) -> 0;
get_item_must_no_count({1, 131}) -> 0;
get_item_must_no_count({1, 132}) -> 0;
get_item_must_no_count({1, 133}) -> 0;
get_item_must_no_count({1, 134}) -> 0;
get_item_must_no_count({1, 135}) -> 0;
get_item_must_no_count({1, 136}) -> 0;
get_item_must_no_count({1, 137}) -> 0;
get_item_must_no_count({1, 138}) -> 0;
get_item_must_no_count({1, 139}) -> 0;
get_item_must_no_count({1, 140}) -> 0;
get_item_must_no_count({1, 141}) -> 0;
get_item_must_no_count({1, 142}) -> 0;
get_item_must_no_count({1, 143}) -> 0;
get_item_must_no_count({1, 144}) -> 0;
get_item_must_no_count({1, 145}) -> 0;
get_item_must_no_count({1, 146}) -> 0;
get_item_must_no_count({1, 147}) -> 0;
get_item_must_no_count({1, 148}) -> 0;
get_item_must_no_count({1, 149}) -> 10;
get_item_must_no_count({1, 150}) -> 0;
get_item_must_no_count({1, 151}) -> 0;
get_item_must_no_count({1, 152}) -> 0;
get_item_must_no_count({1, 153}) -> 0;
get_item_must_no_count({1, 154}) -> 0;
get_item_must_no_count({1, 155}) -> 0;
get_item_must_no_count({1, 156}) -> 0;
get_item_must_no_count({1, 157}) -> 0;
get_item_must_no_count({1, 158}) -> 0;
get_item_must_no_count({1, 159}) -> 0;
get_item_must_no_count({1, 160}) -> 0;
get_item_must_no_count({1, 161}) -> 0;
get_item_must_no_count({1, 162}) -> 0;
get_item_must_no_count({1, 163}) -> 0;
get_item_must_no_count({1, 164}) -> 0;
get_item_must_no_count({1, 165}) -> 0;
get_item_must_no_count({1, 166}) -> 0;
get_item_must_no_count({1, 167}) -> 0;
get_item_must_no_count({1, 168}) -> 0;
get_item_must_no_count({1, 169}) -> 0;
get_item_must_no_count({1, 170}) -> 0;
get_item_must_no_count({1, 171}) -> 0;
get_item_must_no_count({1, 172}) -> 0;
get_item_must_no_count({1, 173}) -> 0;
get_item_must_no_count({1, 174}) -> 0;
get_item_must_no_count({1, 175}) -> 10;
get_item_must_no_count({1, 176}) -> 0;
get_item_must_no_count({1, 177}) -> 0;
get_item_must_no_count({1, 178}) -> 0;
get_item_must_no_count({1, 179}) -> 0;
get_item_must_no_count({1, 180}) -> 0;
get_item_must_no_count({1, 181}) -> 0;
get_item_must_no_count({1, 182}) -> 0;
get_item_must_no_count({1, 183}) -> 0;
get_item_must_no_count({1, 184}) -> 0;
get_item_must_no_count({1, 185}) -> 0;
get_item_must_no_count({1, 186}) -> 0;
get_item_must_no_count({1, 187}) -> 0;
get_item_must_no_count({1, 188}) -> 15;
get_item_must_no_count({1, 189}) -> 20;
get_item_must_no_count({1, 190}) -> 20;
get_item_must_no_count({1, 191}) -> 20;
get_item_must_no_count({1, 192}) -> 0;
get_item_must_no_count({1, 193}) -> 0;
get_item_must_no_count({1, 194}) -> 0;
get_item_must_no_count({1, 195}) -> 0;
get_item_must_no_count({1, 196}) -> 0;
get_item_must_no_count({1, 197}) -> 0;
get_item_must_no_count({1, 198}) -> 0;
get_item_must_no_count({1, 199}) -> 0;
get_item_must_no_count({1, 200}) -> 0;
get_item_must_no_count({1, 201}) -> 0;
get_item_must_no_count({1, 202}) -> 0;
get_item_must_no_count({1, 203}) -> 0;
get_item_must_no_count({1, 204}) -> 0;
get_item_must_no_count({1, 205}) -> 0;
get_item_must_no_count({1, 206}) -> 0;
get_item_must_no_count({1, 207}) -> 0;
get_item_must_no_count({1, 208}) -> 0;
get_item_must_no_count({1, 209}) -> 0;
get_item_must_no_count({1, 210}) -> 0;
get_item_must_no_count({1, 211}) -> 0;
get_item_must_no_count({1, 212}) -> 0;
get_item_must_no_count({1, 213}) -> 0;
get_item_must_no_count({1, 214}) -> 0;
get_item_must_no_count({1, 215}) -> 0;
get_item_must_no_count({1, 216}) -> 0;
get_item_must_no_count({1, 217}) -> 5;
get_item_must_no_count({1, 218}) -> 0;
get_item_must_no_count({1, 219}) -> 0;
get_item_must_no_count({1, 220}) -> 0;
get_item_must_no_count({1, 221}) -> 0;
get_item_must_no_count({1, 222}) -> 0;
get_item_must_no_count({1, 223}) -> 0;
get_item_must_no_count({1, 224}) -> 0;
get_item_must_no_count({1, 225}) -> 0;
get_item_must_no_count({1, 226}) -> 0;
get_item_must_no_count({2, 227}) -> 0;
get_item_must_no_count({2, 228}) -> 0;
get_item_must_no_count({2, 229}) -> 0;
get_item_must_no_count({2, 230}) -> 15;
get_item_must_no_count({2, 231}) -> 15;
get_item_must_no_count({2, 232}) -> 15;
get_item_must_no_count({2, 233}) -> 15;
get_item_must_no_count({2, 234}) -> 0;
get_item_must_no_count({2, 235}) -> 0;
get_item_must_no_count({2, 236}) -> 0;
get_item_must_no_count({2, 237}) -> 0;
get_item_must_no_count({2, 238}) -> 0;
get_item_must_no_count({2, 239}) -> 0;
get_item_must_no_count({2, 240}) -> 0;
get_item_must_no_count({2, 241}) -> 0;
get_item_must_no_count({2, 242}) -> 0;
get_item_must_no_count({2, 243}) -> 0;
get_item_must_no_count({2, 244}) -> 0;
get_item_must_no_count({2, 245}) -> 0;
get_item_must_no_count({2, 246}) -> 0;
get_item_must_no_count({2, 247}) -> 0;
get_item_must_no_count({2, 248}) -> 0;
get_item_must_no_count({2, 249}) -> 0;
get_item_must_no_count({2, 250}) -> 0;
get_item_must_no_count({2, 251}) -> 0;
get_item_must_no_count({2, 252}) -> 0;
get_item_must_no_count({2, 253}) -> 0;
get_item_must_no_count({2, 254}) -> 0;
get_item_must_no_count({2, 255}) -> 0;
get_item_must_no_count({2, 256}) -> 0;
get_item_must_no_count({2, 257}) -> 0;
get_item_must_no_count({2, 258}) -> 0;
get_item_must_no_count({2, 259}) -> 0;
get_item_must_no_count({2, 260}) -> 0;
get_item_must_no_count({2, 261}) -> 0;
get_item_must_no_count({2, 262}) -> 0;
get_item_must_no_count({2, 263}) -> 0;
get_item_must_no_count({2, 264}) -> 0;
get_item_must_no_count({2, 265}) -> 0;
get_item_must_no_count({2, 266}) -> 0;
get_item_must_no_count({2, 267}) -> 0;
get_item_must_no_count({2, 268}) -> 0;
get_item_must_no_count({2, 269}) -> 10;
get_item_must_no_count({2, 270}) -> 0;
get_item_must_no_count({2, 271}) -> 0;
get_item_must_no_count({2, 272}) -> 5;
get_item_must_no_count({2, 273}) -> 5;
get_item_must_no_count({2, 274}) -> 5;
get_item_must_no_count({2, 275}) -> 10;
get_item_must_no_count({2, 276}) -> 0;
get_item_must_no_count({2, 277}) -> 0;
get_item_must_no_count({2, 278}) -> 0;
get_item_must_no_count({2, 279}) -> 0;
get_item_must_no_count({2, 280}) -> 0;
get_item_must_no_count({2, 281}) -> 0;
get_item_must_no_count({2, 282}) -> 0;
get_item_must_no_count({2, 283}) -> 0;
get_item_must_no_count({2, 284}) -> 0;
get_item_must_no_count({2, 285}) -> 0;
get_item_must_no_count({2, 286}) -> 0;
get_item_must_no_count({2, 287}) -> 0;
get_item_must_no_count({2, 288}) -> 0;
get_item_must_no_count({2, 289}) -> 0;
get_item_must_no_count({2, 290}) -> 0;
get_item_must_no_count({2, 291}) -> 0;
get_item_must_no_count({2, 292}) -> 0;
get_item_must_no_count({2, 293}) -> 0;
get_item_must_no_count({2, 294}) -> 0;
get_item_must_no_count({2, 295}) -> 0;
get_item_must_no_count({2, 296}) -> 0;
get_item_must_no_count({2, 297}) -> 0;
get_item_must_no_count({2, 298}) -> 0;
get_item_must_no_count({2, 299}) -> 0;
get_item_must_no_count({2, 300}) -> 0;
get_item_must_no_count({2, 301}) -> 0;
get_item_must_no_count({2, 302}) -> 0;
get_item_must_no_count({2, 303}) -> 5;
get_item_must_no_count({2, 304}) -> 10;
get_item_must_no_count({2, 305}) -> 10;
get_item_must_no_count({2, 306}) -> 0;
get_item_must_no_count({2, 307}) -> 0;
get_item_must_no_count({2, 308}) -> 0;
get_item_must_no_count({2, 309}) -> 0;
get_item_must_no_count({2, 310}) -> 0;
get_item_must_no_count(_Info) ->
    lager:error(io_lib:format("get_item_must_no_count_data_not_exist===>~w",
			      [_Info])),
    undefined.

get_award_by_id(101) -> {10001, 30, 1};
get_award_by_id(102) -> {10090, 1, 1};
get_award_by_id(103) -> {10091, 1, 1};
get_award_by_id(104) -> {39052, 5, 1};
get_award_by_id(105) -> {39053, 5, 1};
get_award_by_id(106) -> {3, 30, 1};
get_award_by_id(107) -> {91000, 1, 1};
get_award_by_id(108) -> {14002, 5, 0};
get_award_by_id(109) -> {14002, 5, 0};
get_award_by_id(110) -> {10401, 2, 0};
get_award_by_id(111) -> {10401, 2, 0};
get_award_by_id(112) -> {10401, 2, 0};
get_award_by_id(113) -> {14002, 10, 0};
get_award_by_id(114) -> {14002, 10, 1};
get_award_by_id(115) -> {14002, 10, 1};
get_award_by_id(116) -> {14002, 10, val_not_exist};
get_award_by_id(117) -> {40305, 1, val_not_exist};
get_award_by_id(118) -> {1, 80000, 0};
get_award_by_id(119) -> {1, 80000, 0};
get_award_by_id(120) -> {1, 100000, 0};
get_award_by_id(121) -> {1, 120000, 0};
get_award_by_id(122) -> {1, 160000, 0};
get_award_by_id(123) -> {40316, 1, 1};
get_award_by_id(124) -> {40316, 1, 1};
get_award_by_id(125) -> {40216, 1, 1};
get_award_by_id(126) -> {40416, 1, 1};
get_award_by_id(127) -> {40116, 1, 1};
get_award_by_id(128) -> {22, 20000, 0};
get_award_by_id(129) -> {22, 20000, 0};
get_award_by_id(130) -> {22, 27000, 0};
get_award_by_id(131) -> {22, 35000, 0};
get_award_by_id(132) -> {22, 50000, 0};
get_award_by_id(133) -> {39081, 1, 0};
get_award_by_id(134) -> {90900, 1, 1};
get_award_by_id(135) -> {10, 10, 1};
get_award_by_id(136) -> {40206, 1, 1};
get_award_by_id(137) -> {10001, 50, 1};
get_award_by_id(138) -> {72001, 2, 0};
get_award_by_id(139) -> {72001, 2, 0};
get_award_by_id(140) -> {10450, 25, 0};
get_award_by_id(141) -> {10450, 25, 0};
get_award_by_id(142) -> {10450, 25, 0};
get_award_by_id(143) -> {10001, 30, 1};
get_award_by_id(144) -> {10090, 1, 1};
get_award_by_id(145) -> {10091, 1, 1};
get_award_by_id(146) -> {39052, 5, 1};
get_award_by_id(147) -> {39053, 5, 1};
get_award_by_id(148) -> {3, 30, 1};
get_award_by_id(149) -> {91000, 1, 1};
get_award_by_id(150) -> {14002, 5, 0};
get_award_by_id(151) -> {14002, 5, 0};
get_award_by_id(152) -> {10401, 2, 0};
get_award_by_id(153) -> {10401, 2, 0};
get_award_by_id(154) -> {10401, 2, 0};
get_award_by_id(155) -> {10453, 1, 0};
get_award_by_id(156) -> {10453, 1, 1};
get_award_by_id(157) -> {10450, 100, 1};
get_award_by_id(158) -> {10450, 100, val_not_exist};
get_award_by_id(159) -> {10450, 100, val_not_exist};
get_award_by_id(160) -> {1, 80000, 0};
get_award_by_id(161) -> {1, 100000, 0};
get_award_by_id(162) -> {1, 120000, 0};
get_award_by_id(163) -> {1, 160000, 0};
get_award_by_id(164) -> {1, 200000, 0};
get_award_by_id(165) -> {40316, 1, 1};
get_award_by_id(166) -> {40316, 1, 1};
get_award_by_id(167) -> {40416, 1, 1};
get_award_by_id(168) -> {40416, 1, 1};
get_award_by_id(169) -> {40116, 1, 1};
get_award_by_id(170) -> {22, 20000, 0};
get_award_by_id(171) -> {22, 25000, 0};
get_award_by_id(172) -> {22, 30000, 0};
get_award_by_id(173) -> {22, 35000, 0};
get_award_by_id(174) -> {22, 40000, 0};
get_award_by_id(175) -> {10001, 30, 0};
get_award_by_id(176) -> {40106, 1, 1};
get_award_by_id(177) -> {10, 10, 1};
get_award_by_id(178) -> {10001, 50, 1};
get_award_by_id(179) -> {40206, 1, 1};
get_award_by_id(180) -> {72001, 2, 0};
get_award_by_id(181) -> {72001, 2, 0};
get_award_by_id(182) -> {10450, 25, 0};
get_award_by_id(183) -> {10450, 25, 0};
get_award_by_id(184) -> {10450, 25, 0};
get_award_by_id(185) -> {10001, 30, 1};
get_award_by_id(186) -> {10090, 1, 1};
get_award_by_id(187) -> {10091, 1, 1};
get_award_by_id(188) -> {91000, 1, 1};
get_award_by_id(189) -> {10001, 34, 1};
get_award_by_id(190) -> {10001, 35, 1};
get_award_by_id(191) -> {10001, 36, 1};
get_award_by_id(192) -> {14002, 5, 0};
get_award_by_id(193) -> {14002, 5, 0};
get_award_by_id(194) -> {10401, 2, 0};
get_award_by_id(195) -> {10401, 2, 0};
get_award_by_id(196) -> {10401, 2, 0};
get_award_by_id(197) -> {10453, 1, 1};
get_award_by_id(198) -> {10453, 1, 1};
get_award_by_id(199) -> {10450, 100, 1};
get_award_by_id(200) -> {10450, 100, 1};
get_award_by_id(201) -> {10450, 100, 1};
get_award_by_id(202) -> {1, 80000, 0};
get_award_by_id(203) -> {1, 100000, 0};
get_award_by_id(204) -> {1, 120000, 0};
get_award_by_id(205) -> {1, 160000, 0};
get_award_by_id(206) -> {1, 100000, 0};
get_award_by_id(207) -> {40416, 1, 1};
get_award_by_id(208) -> {40308, 1, 1};
get_award_by_id(209) -> {40116, 1, 1};
get_award_by_id(210) -> {40208, 1, 1};
get_award_by_id(211) -> {40109, 1, 1};
get_award_by_id(212) -> {22, 50000, 0};
get_award_by_id(213) -> {22, 25000, 0};
get_award_by_id(214) -> {22, 30000, 0};
get_award_by_id(215) -> {22, 40000, 0};
get_award_by_id(216) -> {22, 50000, 0};
get_award_by_id(217) -> {10001, 30, 1};
get_award_by_id(218) -> {40406, 1, 1};
get_award_by_id(219) -> {40106, 1, 1};
get_award_by_id(220) -> {40206, 1, 1};
get_award_by_id(221) -> {40306, 1, 1};
get_award_by_id(222) -> {72001, 2, 0};
get_award_by_id(223) -> {72001, 2, 0};
get_award_by_id(224) -> {10450, 30, 0};
get_award_by_id(225) -> {10450, 30, 0};
get_award_by_id(226) -> {10450, 30, 0};
get_award_by_id(227) -> {91000, 1, 1};
get_award_by_id(228) -> {40123, 1, 1};
get_award_by_id(229) -> {40123, 1, 1};
get_award_by_id(230) -> {24902, 50, 1};
get_award_by_id(231) -> {25901, 50, 1};
get_award_by_id(232) -> {26905, 50, 1};
get_award_by_id(233) -> {28903, 50, 1};
get_award_by_id(234) -> {72003, 1, 0};
get_award_by_id(235) -> {72003, 1, 0};
get_award_by_id(236) -> {72002, 5, 0};
get_award_by_id(237) -> {72002, 5, 0};
get_award_by_id(238) -> {72002, 5, 0};
get_award_by_id(239) -> {40212, 1, 1};
get_award_by_id(240) -> {40412, 1, 1};
get_award_by_id(241) -> {40112, 1, 1};
get_award_by_id(242) -> {40312, 1, 1};
get_award_by_id(243) -> {40213, 1, 1};
get_award_by_id(244) -> {10454, 1, 0};
get_award_by_id(245) -> {10454, 1, 0};
get_award_by_id(246) -> {10454, 1, 0};
get_award_by_id(247) -> {10454, 1, 0};
get_award_by_id(248) -> {10454, 1, 0};
get_award_by_id(249) -> {40110, 1, 1};
get_award_by_id(250) -> {40421, 1, 1};
get_award_by_id(251) -> {40321, 1, 1};
get_award_by_id(252) -> {40221, 1, 1};
get_award_by_id(253) -> {40121, 1, 1};
get_award_by_id(254) -> {1, 1000000, 0};
get_award_by_id(255) -> {1, 1200000, 0};
get_award_by_id(256) -> {1, 1500000, 0};
get_award_by_id(257) -> {1, 2000000, 0};
get_award_by_id(258) -> {1, 3000000, 0};
get_award_by_id(259) -> {10090, 1, 1};
get_award_by_id(260) -> {10091, 1, 1};
get_award_by_id(261) -> {91000, 1, 1};
get_award_by_id(262) -> {10001, 30, 1};
get_award_by_id(263) -> {10001, 30, 1};
get_award_by_id(264) -> {14001, 2, 1};
get_award_by_id(265) -> {14001, 2, 1};
get_award_by_id(266) -> {14001, 2, 1};
get_award_by_id(267) -> {14001, 2, 1};
get_award_by_id(268) -> {14001, 2, 1};
get_award_by_id(269) -> {40123, 1, 1};
get_award_by_id(270) -> {40123, 1, 1};
get_award_by_id(271) -> {40123, 1, 1};
get_award_by_id(272) -> {40123, 1, 1};
get_award_by_id(273) -> {40123, 1, 1};
get_award_by_id(274) -> {40123, 1, 1};
get_award_by_id(275) -> {40123, 1, 1};
get_award_by_id(276) -> {72003, 1, 0};
get_award_by_id(277) -> {72003, 1, 0};
get_award_by_id(278) -> {72002, 5, 0};
get_award_by_id(279) -> {72002, 5, 0};
get_award_by_id(280) -> {72002, 5, 0};
get_award_by_id(281) -> {40212, 1, 1};
get_award_by_id(282) -> {40412, 1, 1};
get_award_by_id(283) -> {40112, 1, 1};
get_award_by_id(284) -> {40313, 1, 1};
get_award_by_id(285) -> {40213, 1, 1};
get_award_by_id(286) -> {10454, 1, 0};
get_award_by_id(287) -> {10454, 1, 0};
get_award_by_id(288) -> {10454, 1, 0};
get_award_by_id(289) -> {10454, 1, 0};
get_award_by_id(290) -> {10454, 1, 0};
get_award_by_id(291) -> {40110, 1, 1};
get_award_by_id(292) -> {40421, 1, 1};
get_award_by_id(293) -> {40321, 1, 1};
get_award_by_id(294) -> {40221, 1, 1};
get_award_by_id(295) -> {40121, 1, 1};
get_award_by_id(296) -> {1, 1500000, 0};
get_award_by_id(297) -> {1, 1700000, 0};
get_award_by_id(298) -> {1, 2000000, 0};
get_award_by_id(299) -> {1, 3000000, 0};
get_award_by_id(300) -> {1, 4000000, 0};
get_award_by_id(301) -> {10090, 1, 1};
get_award_by_id(302) -> {10091, 1, 1};
get_award_by_id(303) -> {91000, 1, 1};
get_award_by_id(304) -> {10001, 500, 1};
get_award_by_id(305) -> {10001, 500, 1};
get_award_by_id(306) -> {14001, 2, 1};
get_award_by_id(307) -> {14001, 2, 1};
get_award_by_id(308) -> {14001, 2, 1};
get_award_by_id(309) -> {14001, 2, 1};
get_award_by_id(310) -> {14001, 2, 1};
get_award_by_id(_Info) ->
    lager:error(io_lib:format("get_award_by_id_data_not_exist===>~w",
			      [_Info])),
    undefined.

get_rand_pos(2) ->
    [{1, 20}, {2, 200}, {3, 35}, {4, 125}, {5, 110},
     {6, 370}, {7, 90}, {8, 50}];
get_rand_pos(1) ->
    [{1, 10}, {2, 100}, {3, 55}, {4, 285}, {5, 30},
     {6, 280}, {7, 90}, {8, 150}];
get_rand_pos(_) -> [].

get_pos_must_no_count({1, 1}) -> 90;
get_pos_must_no_count({1, 2}) -> 0;
get_pos_must_no_count({1, 3}) -> 10;
get_pos_must_no_count({1, 4}) -> 0;
get_pos_must_no_count({1, 5}) -> 35;
get_pos_must_no_count({1, 6}) -> 0;
get_pos_must_no_count({1, 7}) -> 25;
get_pos_must_no_count({1, 8}) -> 0;
get_pos_must_no_count({2, 1}) -> 20;
get_pos_must_no_count({2, 2}) -> 0;
get_pos_must_no_count({2, 3}) -> 12;
get_pos_must_no_count({2, 4}) -> 0;
get_pos_must_no_count({2, 5}) -> 0;
get_pos_must_no_count({2, 6}) -> 0;
get_pos_must_no_count({2, 7}) -> 11;
get_pos_must_no_count({2, 8}) -> 10;
get_pos_must_no_count(_Info) ->
    lager:error(io_lib:format("get_pos_must_no_count_data_not_exist===>~w",
			      [_Info])),
    undefined.

get_lucky_award(2) ->
    [{2, 6, 100, [{10001, 50000}]},
     {2, 7, 300, [{10091, 50}]}, {2, 8, 500, [{39052, 300}]},
     {2, 9, 700, [{39053, 300}]},
     {2, 10, 1000, [{39039, 10}]}];
get_lucky_award(1) ->
    [{1, 1, 100, [{10001, 100000}]},
     {1, 2, 300, [{10001, 200000}]},
     {1, 3, 500, [{10001, 200000}]},
     {1, 4, 700, [{10001, 200000}]},
     {1, 5, 1000, [{10001, 500000}]}];
get_lucky_award(_) -> [].

get_lucky_list(2) -> [6, 7, 8, 9, 10];
get_lucky_list(1) -> [1, 2, 3, 4, 5];
get_lucky_list(_) -> [].

get_del_lucky({1, 1}) -> 100;
get_del_lucky({1, 2}) -> 300;
get_del_lucky({1, 3}) -> 500;
get_del_lucky({1, 4}) -> 700;
get_del_lucky({1, 5}) -> 1000;
get_del_lucky({2, 6}) -> 100;
get_del_lucky({2, 7}) -> 300;
get_del_lucky({2, 8}) -> 500;
get_del_lucky({2, 9}) -> 700;
get_del_lucky({2, 10}) -> 1000;
get_del_lucky(_Info) ->
    lager:error(io_lib:format("get_del_lucky_data_not_exist===>~w",
			      [_Info])),
    undefined.

get_const(vip_start) -> 2;
get_const(treasure_num) -> [{1, 15}, {1, 10}];
get_const(refreash) -> [{3, 30}];
get_const(changliang) -> 1;
get_const(checkmore1) ->
    [{1, 29,
      [{1, 1.8}, {22, 1.1e-1}, {10450, 1.1e-1},
       {10401, 1.4e-1}, {14002, 1.4e-1},
       {29104, 2.9999999999999999e-1}, {29204, 1.4e-1},
       {29304, 5.9999999999999998e-2}, {29404, 2.85e+1},
       {29504, 9}, {29903, 4.65e-1}, {29904, 4.65e-1},
       {29905, 6}, {40105, 2.25}, {40108, 2.25},
       {40205, 4.4e-1}, {40206, 2.25}, {40207, 5.4},
       {40305, 6.8999999999999995e-1},
       {40307, 6.8999999999999995e-1},
       {40405, 6.8999999999999995e-1}, {40407, 4.5e-1},
       {40408, 9.66}, {72001, 28}]},
     {30, 49,
      [{1, 2.85e+1}, {22, 28}, {10450, 9}, {10401, 5.4},
       {14002, 3.2999999999999998}, {29104, 2.2},
       {29204, 4.5999999999999996}, {29304, 1.1e-1},
       {29404, 1.1e-1}, {29504, 1.1e-1},
       {29903, 2.0499999999999999e-1},
       {29904, 2.0499999999999999e-1}, {29905, 9.2e-1},
       {40105, 5.9999999999999998e-2}, {40108, 2.25},
       {40205, 1.8899999999999999}, {40206, 5.1e-1},
       {40207, 2.25}, {40305, 1.8899999999999999},
       {40307, 7.3499999999999999e-1},
       {40405, 7.3499999999999999e-1}, {40407, 1.02},
       {40408, 6}]},
     {50, 999,
      [{1, 2.85e+1}, {22, 28}, {10450, 9}, {10401, 5.4},
       {14002, 1.98}, {29104, 3.52},
       {29204, 4.5999999999999996},
       {29304, 2.9999999999999999e-2},
       {29404, 2.9999999999999999e-2},
       {29504, 2.9999999999999999e-2},
       {29903, 1.7999999999999999e-1},
       {29904, 1.7999999999999999e-1},
       {29905, 1.4099999999999999}, {40105, 4.0e-2},
       {40108, 2.0249999999999999},
       {40205, 7.3499999999999999e-1},
       {40206, 5.9999999999999998e-2},
       {40207, 2.0249999999999999},
       {40305, 7.3499999999999999e-1},
       {40307, 2.0249999999999999},
       {40405, 7.3499999999999999e-1},
       {40407, 2.0249999999999999},
       {40408, 7.3499999999999999e-1}, {72001, 6}]}];
get_const(checkmore2) ->
    [{1, 49,
      [{1, 28}, {10452, 2.85e+1}, {14001, 15},
       {24902, 1.1e-1}, {25901, 1.1e-1}, {26905, 1.1e-1},
       {28903, 1.0e-1}, {29404, 2.3399999999999999},
       {29405, 1.2e-1}, {29504, 2.3399999999999999},
       {29505, 1.2e-1}, {29904, 3.96},
       {29905, 6.8999999999999995e-1},
       {40110, 7.1999999999999997e-1}, {40111, 1.2e-1},
       {40112, 1.1}, {40210, 7.1999999999999997e-1},
       {40212, 1.32}, {40213, 6.6e-1},
       {40310, 7.1999999999999997e-1}, {40312, 1.1},
       {40410, 7.1999999999999997e-1}, {40412, 1.32},
       {72002, 7.75}, {72003, 2.25}]},
     {50, 999,
      [{1, 28}, {10452, 2.85e+1}, {14001, 15},
       {24902, 2.0999999999999999e-1}, {25901, 4.5e-1},
       {26905, 2.0999999999999999e-1},
       {28903, 2.0999999999999999e-1}, {29404, 3.5e-2},
       {29405, 4.5e-1}, {29504, 3.5e-2}, {29505, 3.6},
       {29904, 1.4999999999999999e-1}, {29905, 3.6},
       {40110, 1.4999999999999999e-1}, {40111, 9.0e-1},
       {40112, 7.1999999999999997e-1}, {40210, 1.2e-1},
       {40212, 1.485}, {40213, 7.1999999999999997e-1},
       {40310, 1.485}, {40312, 5.2249999999999996e-1},
       {40410, 7.1999999999999997e-1},
       {40412, 5.2249999999999996e-1},
       {72002, 7.1999999999999997e-1}, {72003, 1.485},
       {72004, 7.75}, {72005, 2.25}]}];
get_const(game_rule1) -> 1;
get_const(game_rule2) -> 2;
get_const(num_1) -> 8;
get_const(num_2) -> 8;
get_const(free_time) -> 10800;
get_const(_) -> undefined.


