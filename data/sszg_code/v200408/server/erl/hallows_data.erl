-file("src/mod/data/hallows_data.erl", 1).

-module(hallows_data).

-lager_records([{quest_stats, [type, stats, desc]},
		{quest_progress,
		 [id, label, target, param, finish, trigger, target_val,
		  value, msg, ext_data, dyn_ext_data]},
		{quest,
		 [id, name, type, finish, quality, progress, accept_time,
		  end_time, finish_time, round]},
		{m_quest,
		 [ver, quest, acceptable, finished, daily_finished]},
		{quest_data,
		 [id, type, name, phase, can_giveup, lev, max_lev,
		  career, pre_quest, suffix_quest, start_time, end_time,
		  condition, progress, accept_rewards, commit_rewards,
		  commit_loss, commit_type, times, desc, group, layer,
		  dungeon_id, is_auto_finished_gain, auto_accept,
		  weekdays, white_list, black_list, extra, val_from_prev,
		  hide]},
		{hallows_look_data,
		 [id, name, attr, is_item, time, loss]},
		{hallows_looks, [ver, id, endtime, eqm_hallows]},
		{hallows_quest_data, [id, hid, items, progress]},
		{hallows_data,
		 [id, step, name, attr, loss, max_lucky, clear_limit,
		  clear_time, reward, notice, open_desc, skill_order]},
		{hallows_skill, [ver, pos, lev, skill_bid, attr]},
		{hallows,
		 [ver, id, step, lucky, lucky_endtime, power, base_attr,
		  add_attr, eqm, skill, seal, reward, rebirth_loss,
		  is_notice, look_id, refine_lev]},
		{m_hallows,
		 [ver, hallows_list, all_lv, attr_list, quest_list,
		  look_list, look_quest_list]},
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]}]).

-export([get_const/1, get_type_list/0, get/1,
	 lucky_rate/1, lucky_rand/0, get_skill/1, skill_attr/1,
	 seal_limit/1, career_ratio/1, list_quest/0,
	 type_quest/1, get_quest/1, get_attr/1,
	 look_list_quest/0, look_type_quest/1, get_look_quest/1,
	 get_look/1, get_look_attr/1, skill_look_bid/1,
	 skill_look_order/1]).

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

-file("src/mod/data/hallows_data.erl", 29).

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

-file("src/mod/data/hallows_data.erl", 30).

-file("inc/hallows.hrl", 1).

-record(m_hallows,
	{ver = 3, hallows_list = [], all_lv = 0, attr_list = [],
	 quest_list = [], look_list = [], look_quest_list = []}).

-record(hallows,
	{ver = 4, id = 0, step = 0, lucky = 0,
	 lucky_endtime = 0, power = 0, base_attr = [],
	 add_attr = [], eqm = [], skill = [], seal = 0,
	 reward = [], rebirth_loss = [], is_notice = 0,
	 look_id = 0, refine_lev = 0}).

-record(hallows_skill,
	{ver = 1, pos = 0, lev = 0, skill_bid = 0, attr = []}).

-record(hallows_data,
	{id = 0, step = 0, name = <<>>, attr = [], loss = [],
	 max_lucky = 0, clear_limit = 0, clear_time = 0,
	 reward = [], notice = <<>>, open_desc = <<>>,
	 skill_order = []}).

-record(hallows_quest_data,
	{id = 0, hid = 0, items = [], progress = []}).

-record(hallows_looks,
	{ver = 1, id = 0, endtime = 0, eqm_hallows = 0}).

-record(hallows_look_data,
	{id = 0, name = <<>>, attr = [], is_item = 0, time = 0,
	 loss = []}).

-file("src/mod/data/hallows_data.erl", 31).

-file("inc/quest.hrl", 1).

-record(quest_data,
	{id = 1  :: pos_integer(), type = 1  :: pos_integer(),
	 name = <<>>  :: binary(),
	 phase = 0  :: non_neg_integer(),
	 can_giveup = 0  :: 0..1, lev = 1  :: pos_integer(),
	 max_lev = 0  :: non_neg_integer(), career = 0  :: 0..4,
	 pre_quest  ::
	     undefined | non_neg_integer() | [non_neg_integer()],
	 suffix_quest = 0  :: non_neg_integer(),
	 start_time = 0  ::
	     tuple() | non_neg_integer() | undefined,
	 end_time = 0  ::
	     tuple() | non_neg_integer() | undefined,
	 condition = []  :: [tuple()],
	 progress = []  :: [tuple()],
	 accept_rewards = []  :: [tuple()],
	 commit_rewards = []  :: [tuple()],
	 commit_loss = []  :: [tuple()],
	 commit_type = 1  :: pos_integer(),
	 times = 1  :: non_neg_integer(), desc = <<>>  :: list(),
	 group = 0, layer = 0, dungeon_id = 0,
	 is_auto_finished_gain = 0, auto_accept = 0  :: 0..1,
	 weekdays = []  :: [pos_integer()],
	 white_list = []  :: list(), black_list = []  :: list(),
	 extra = [], val_from_prev = 0  :: 0 | 1,
	 hide = 0  :: 0 | 1}).

-record(m_quest,
	{ver = 1, quest = []  :: list(),
	 acceptable = []  :: list(), finished = []  :: list(),
	 daily_finished = []}).

-record(quest,
	{id = 1  :: pos_integer(), name = <<>>  :: binary(),
	 type = 1  :: pos_integer(), finish = 0  :: 0..2,
	 quality = 0  :: 0..4, progress = []  :: [tuple()],
	 accept_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 finish_time = 0  :: non_neg_integer(),
	 round = 0  :: non_neg_integer()}).

-record(quest_progress,
	{id = 0  :: non_neg_integer(), label  :: atom(),
	 target = 0  :: non_neg_integer(), param = []  :: list(),
	 finish = 0  :: 0..1, trigger  :: undefined | tuple(),
	 target_val = 1  :: pos_integer(),
	 value = 0  :: non_neg_integer(),
	 msg = <<>>  :: bitstring() | string(),
	 ext_data = []  :: [tuple()],
	 dyn_ext_data = []  :: [tuple()]}).

-record(quest_stats, {type = 1, stats = [], desc = []}).

-file("src/mod/data/hallows_data.erl", 32).

get_const(id_advanced_props) -> 72001;
get_const(id_skill_upgrade) -> 72002;
get_const(stone_attribute) ->
    [{hp_max, 500}, {atk, 50}];
get_const(id_stone) -> 72003;
get_const(price_advanced_props) -> {15, 20};
get_const(exchangeid_advanced_props) -> 1020;
get_const(temporary_ratio) -> 800;
get_const(order_max) -> 24;
get_const(skill_show) -> {atk, def, hp_max, speed};
get_const(spirit_show) -> {atk, def, hp_max};
get_const(source_item) -> 71060;
get_const(skill_max) -> 12;
get_const(imprint_lowest) -> 3;
get_const(hallows_open) -> {dun, 10030};
get_const(game_rule) -> 1;
get_const(illusion_open) -> 70;
get_const(_) -> undefined.

get_type_list() ->
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
     1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
     2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3,
     3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4,
     4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
     4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
     5, 5, 5, 5, 5, 5, 5].

get({1, 1}) ->
    #hallows_data{id = 1, step = 1,
		  name = lang:get(<<"埃里克血斧"/utf8>>),
		  attr = [{hp_max, 471}, {atk, 55}],
		  loss = [{72001, 2}, {1, 5000}], max_lucky = 70,
		  clear_limit = 0, clear_time = 0, skill_order = [80100]};
get({1, 2}) ->
    #hallows_data{id = 1, step = 2,
		  name = lang:get(<<"埃里克血斧"/utf8>>),
		  attr = [{hp_max, 1413}, {atk, 167}],
		  loss = [{72001, 4}, {1, 10000}], max_lucky = 140,
		  clear_limit = 0, clear_time = 0, skill_order = [80100]};
get({1, 3}) ->
    #hallows_data{id = 1, step = 3,
		  name = lang:get(<<"埃里克血斧"/utf8>>),
		  attr = [{hp_max, 2826}, {atk, 334}],
		  loss = [{72001, 6}, {1, 18000}], max_lucky = 210,
		  clear_limit = 0, clear_time = 0, skill_order = [80100]};
get({1, 4}) ->
    #hallows_data{id = 1, step = 4,
		  name = lang:get(<<"埃里克血斧"/utf8>>),
		  attr = [{hp_max, 4710}, {atk, 557}],
		  loss = [{72001, 8}, {1, 28000}], max_lucky = 290,
		  clear_limit = 0, clear_time = 0, skill_order = [80100]};
get({1, 5}) ->
    #hallows_data{id = 1, step = 5,
		  name = lang:get(<<"埃里克血斧"/utf8>>),
		  attr = [{hp_max, 7065}, {atk, 836}],
		  loss = [{72001, 10}, {1, 40000}], max_lucky = 360,
		  clear_limit = 0, clear_time = 0, skill_order = [80100]};
get({1, 6}) ->
    #hallows_data{id = 1, step = 6,
		  name = lang:get(<<"埃里克血斧"/utf8>>),
		  attr = [{hp_max, 9892}, {atk, 1170}],
		  loss = [{72001, 13}, {1, 54000}], max_lucky = 430,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将埃里克血斧升级为<div fontcolor=#e28700>6</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80100]};
get({1, 7}) ->
    #hallows_data{id = 1, step = 7,
		  name = lang:get(<<"埃里克血斧"/utf8>>),
		  attr = [{hp_max, 13189}, {atk, 1561}],
		  loss = [{72001, 16}, {1, 70000}], max_lucky = 500,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将埃里克血斧升级为<div fontcolor=#e28700>7</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80100]};
get({1, 8}) ->
    #hallows_data{id = 1, step = 8,
		  name = lang:get(<<"埃里克血斧"/utf8>>),
		  attr = [{hp_max, 16958}, {atk, 2007}],
		  loss = [{72001, 19}, {1, 88000}], max_lucky = 570,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将埃里克血斧升级为<div fontcolor=#e28700>8</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80100]};
get({1, 9}) ->
    #hallows_data{id = 1, step = 9,
		  name = lang:get(<<"埃里克血斧"/utf8>>),
		  attr = [{hp_max, 21197}, {atk, 2509}],
		  loss = [{72001, 22}, {1, 108000}], max_lucky = 640,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将埃里克血斧升级为<div fontcolor=#e28700>9</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80100]};
get({1, 10}) ->
    #hallows_data{id = 1, step = 10,
		  name = lang:get(<<"埃里克血斧"/utf8>>),
		  attr = [{hp_max, 25908}, {atk, 3066}],
		  loss = [{72001, 26}, {1, 130000}], max_lucky = 710,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将埃里克血斧升级为<div fontcolor=#e28700>10</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80100]};
get({1, 11}) ->
    #hallows_data{id = 1, step = 11,
		  name = lang:get(<<"埃里克血斧"/utf8>>),
		  attr = [{hp_max, 31089}, {atk, 3680}],
		  loss = [{72001, 30}, {1, 154000}], max_lucky = 790,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将埃里克血斧升级为<div fontcolor=#e28700>11</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80100]};
get({1, 12}) ->
    #hallows_data{id = 1, step = 12,
		  name = lang:get(<<"埃里克血斧"/utf8>>),
		  attr = [{hp_max, 36742}, {atk, 4349}],
		  loss = [{72001, 34}, {1, 180000}], max_lucky = 860,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将埃里克血斧升级为<div fontcolor=#e28700>12</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80100]};
get({1, 13}) ->
    #hallows_data{id = 1, step = 13,
		  name = lang:get(<<"埃里克血斧"/utf8>>),
		  attr = [{hp_max, 42866}, {atk, 5074}],
		  loss = [{72001, 38}, {1, 208000}], max_lucky = 930,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将埃里克血斧升级为<div fontcolor=#e28700>13</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80100]};
get({1, 14}) ->
    #hallows_data{id = 1, step = 14,
		  name = lang:get(<<"埃里克血斧"/utf8>>),
		  attr = [{hp_max, 49461}, {atk, 5854}],
		  loss = [{72001, 42}, {1, 238000}], max_lucky = 1000,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将埃里克血斧升级为<div fontcolor=#e28700>14</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80100]};
get({1, 15}) ->
    #hallows_data{id = 1, step = 15,
		  name = lang:get(<<"埃里克血斧"/utf8>>),
		  attr = [{hp_max, 56527}, {atk, 6691}],
		  loss = [{72001, 46}, {1, 270000}], max_lucky = 1070,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将埃里克血斧升级为<div fontcolor=#e28700>15</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80100]};
get({1, 16}) ->
    #hallows_data{id = 1, step = 16,
		  name = lang:get(<<"埃里克血斧"/utf8>>),
		  attr = [{hp_max, 64064}, {atk, 7583}],
		  loss = [{72001, 50}, {1, 304000}], max_lucky = 1140,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将埃里克血斧升级为<div fontcolor=#e28700>16</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80100]};
get({1, 17}) ->
    #hallows_data{id = 1, step = 17,
		  name = lang:get(<<"埃里克血斧"/utf8>>),
		  attr = [{hp_max, 72072}, {atk, 8531}],
		  loss = [{72001, 54}, {1, 340000}], max_lucky = 1210,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将埃里克血斧升级为<div fontcolor=#e28700>17</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80100]};
get({1, 18}) ->
    #hallows_data{id = 1, step = 18,
		  name = lang:get(<<"埃里克血斧"/utf8>>),
		  attr = [{hp_max, 80551}, {atk, 9535}],
		  loss = [{72001, 58}, {1, 378000}], max_lucky = 1290,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将埃里克血斧升级为<div fontcolor=#e28700>18</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80100]};
get({1, 19}) ->
    #hallows_data{id = 1, step = 19,
		  name = lang:get(<<"埃里克血斧"/utf8>>),
		  attr = [{hp_max, 89501}, {atk, 10594}],
		  loss = [{72001, 62}, {1, 418000}], max_lucky = 1360,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将埃里克血斧升级为<div fontcolor=#e28700>19</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80100]};
get({1, 20}) ->
    #hallows_data{id = 1, step = 20,
		  name = lang:get(<<"埃里克血斧"/utf8>>),
		  attr = [{hp_max, 98922}, {atk, 11709}],
		  loss = [{72001, 66}, {1, 460000}], max_lucky = 1430,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将埃里克血斧升级为<div fontcolor=#e28700>20</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80100]};
get({1, 21}) ->
    #hallows_data{id = 1, step = 21,
		  name = lang:get(<<"埃里克血斧"/utf8>>),
		  attr = [{hp_max, 108814}, {atk, 12880}],
		  loss = [{72001, 70}, {1, 504000}], max_lucky = 1500,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将埃里克血斧升级为<div fontcolor=#e28700>21</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80100]};
get({1, 22}) ->
    #hallows_data{id = 1, step = 22,
		  name = lang:get(<<"埃里克血斧"/utf8>>),
		  attr = [{hp_max, 119178}, {atk, 14107}],
		  loss = [{72001, 74}, {1, 550000}], max_lucky = 1570,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将埃里克血斧升级为<div fontcolor=#e28700>22</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80100]};
get({1, 23}) ->
    #hallows_data{id = 1, step = 23,
		  name = lang:get(<<"埃里克血斧"/utf8>>),
		  attr = [{hp_max, 130012}, {atk, 15389}],
		  loss = [{72001, 78}, {1, 598000}], max_lucky = 1640,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将埃里克血斧升级为<div fontcolor=#e28700>23</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80100]};
get({1, 24}) ->
    #hallows_data{id = 1, step = 24,
		  name = lang:get(<<"埃里克血斧"/utf8>>),
		  attr = [{hp_max, 141789}, {atk, 16784}],
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将埃里克血斧升级为<div fontcolor=#e28700>24</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80100]};
get({2, 1}) ->
    #hallows_data{id = 2, step = 1,
		  name = lang:get(<<"阿瑞斯战腕"/utf8>>),
		  attr = [{hp_max, 471}, {atk, 55}],
		  loss = [{72001, 2}, {1, 5000}], max_lucky = 70,
		  clear_limit = 0, clear_time = 0, skill_order = [80200]};
get({2, 2}) ->
    #hallows_data{id = 2, step = 2,
		  name = lang:get(<<"阿瑞斯战腕"/utf8>>),
		  attr = [{hp_max, 1413}, {atk, 167}],
		  loss = [{72001, 4}, {1, 10000}], max_lucky = 140,
		  clear_limit = 0, clear_time = 0, skill_order = [80200]};
get({2, 3}) ->
    #hallows_data{id = 2, step = 3,
		  name = lang:get(<<"阿瑞斯战腕"/utf8>>),
		  attr = [{hp_max, 2826}, {atk, 334}],
		  loss = [{72001, 6}, {1, 18000}], max_lucky = 210,
		  clear_limit = 0, clear_time = 0, skill_order = [80200]};
get({2, 4}) ->
    #hallows_data{id = 2, step = 4,
		  name = lang:get(<<"阿瑞斯战腕"/utf8>>),
		  attr = [{hp_max, 4710}, {atk, 557}],
		  loss = [{72001, 8}, {1, 28000}], max_lucky = 290,
		  clear_limit = 0, clear_time = 0, skill_order = [80200]};
get({2, 5}) ->
    #hallows_data{id = 2, step = 5,
		  name = lang:get(<<"阿瑞斯战腕"/utf8>>),
		  attr = [{hp_max, 7065}, {atk, 836}],
		  loss = [{72001, 10}, {1, 40000}], max_lucky = 360,
		  clear_limit = 0, clear_time = 0, skill_order = [80200]};
get({2, 6}) ->
    #hallows_data{id = 2, step = 6,
		  name = lang:get(<<"阿瑞斯战腕"/utf8>>),
		  attr = [{hp_max, 9892}, {atk, 1170}],
		  loss = [{72001, 13}, {1, 54000}], max_lucky = 430,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将阿瑞斯战腕升级为<div fontcolor=#e28700>6</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80200]};
get({2, 7}) ->
    #hallows_data{id = 2, step = 7,
		  name = lang:get(<<"阿瑞斯战腕"/utf8>>),
		  attr = [{hp_max, 13189}, {atk, 1561}],
		  loss = [{72001, 16}, {1, 70000}], max_lucky = 500,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将阿瑞斯战腕升级为<div fontcolor=#e28700>7</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80200]};
get({2, 8}) ->
    #hallows_data{id = 2, step = 8,
		  name = lang:get(<<"阿瑞斯战腕"/utf8>>),
		  attr = [{hp_max, 16958}, {atk, 2007}],
		  loss = [{72001, 19}, {1, 88000}], max_lucky = 570,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将阿瑞斯战腕升级为<div fontcolor=#e28700>8</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80200]};
get({2, 9}) ->
    #hallows_data{id = 2, step = 9,
		  name = lang:get(<<"阿瑞斯战腕"/utf8>>),
		  attr = [{hp_max, 21197}, {atk, 2509}],
		  loss = [{72001, 22}, {1, 108000}], max_lucky = 640,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将阿瑞斯战腕升级为<div fontcolor=#e28700>9</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80200]};
get({2, 10}) ->
    #hallows_data{id = 2, step = 10,
		  name = lang:get(<<"阿瑞斯战腕"/utf8>>),
		  attr = [{hp_max, 25908}, {atk, 3066}],
		  loss = [{72001, 26}, {1, 130000}], max_lucky = 710,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将阿瑞斯战腕升级为<div fontcolor=#e28700>10</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80200]};
get({2, 11}) ->
    #hallows_data{id = 2, step = 11,
		  name = lang:get(<<"阿瑞斯战腕"/utf8>>),
		  attr = [{hp_max, 31089}, {atk, 3680}],
		  loss = [{72001, 30}, {1, 154000}], max_lucky = 790,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将阿瑞斯战腕升级为<div fontcolor=#e28700>11</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80200]};
get({2, 12}) ->
    #hallows_data{id = 2, step = 12,
		  name = lang:get(<<"阿瑞斯战腕"/utf8>>),
		  attr = [{hp_max, 36742}, {atk, 4349}],
		  loss = [{72001, 34}, {1, 180000}], max_lucky = 860,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将阿瑞斯战腕升级为<div fontcolor=#e28700>12</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80200]};
get({2, 13}) ->
    #hallows_data{id = 2, step = 13,
		  name = lang:get(<<"阿瑞斯战腕"/utf8>>),
		  attr = [{hp_max, 42866}, {atk, 5074}],
		  loss = [{72001, 38}, {1, 208000}], max_lucky = 930,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将阿瑞斯战腕升级为<div fontcolor=#e28700>13</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80200]};
get({2, 14}) ->
    #hallows_data{id = 2, step = 14,
		  name = lang:get(<<"阿瑞斯战腕"/utf8>>),
		  attr = [{hp_max, 49461}, {atk, 5854}],
		  loss = [{72001, 42}, {1, 238000}], max_lucky = 1000,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将阿瑞斯战腕升级为<div fontcolor=#e28700>14</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80200]};
get({2, 15}) ->
    #hallows_data{id = 2, step = 15,
		  name = lang:get(<<"阿瑞斯战腕"/utf8>>),
		  attr = [{hp_max, 56527}, {atk, 6691}],
		  loss = [{72001, 46}, {1, 270000}], max_lucky = 1070,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将阿瑞斯战腕升级为<div fontcolor=#e28700>15</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80200]};
get({2, 16}) ->
    #hallows_data{id = 2, step = 16,
		  name = lang:get(<<"阿瑞斯战腕"/utf8>>),
		  attr = [{hp_max, 64064}, {atk, 7583}],
		  loss = [{72001, 50}, {1, 304000}], max_lucky = 1140,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将阿瑞斯战腕升级为<div fontcolor=#e28700>16</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80200]};
get({2, 17}) ->
    #hallows_data{id = 2, step = 17,
		  name = lang:get(<<"阿瑞斯战腕"/utf8>>),
		  attr = [{hp_max, 72072}, {atk, 8531}],
		  loss = [{72001, 54}, {1, 340000}], max_lucky = 1210,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将阿瑞斯战腕升级为<div fontcolor=#e28700>17</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80200]};
get({2, 18}) ->
    #hallows_data{id = 2, step = 18,
		  name = lang:get(<<"阿瑞斯战腕"/utf8>>),
		  attr = [{hp_max, 80551}, {atk, 9535}],
		  loss = [{72001, 58}, {1, 378000}], max_lucky = 1290,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将阿瑞斯战腕升级为<div fontcolor=#e28700>18</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80200]};
get({2, 19}) ->
    #hallows_data{id = 2, step = 19,
		  name = lang:get(<<"阿瑞斯战腕"/utf8>>),
		  attr = [{hp_max, 89501}, {atk, 10594}],
		  loss = [{72001, 62}, {1, 418000}], max_lucky = 1360,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将阿瑞斯战腕升级为<div fontcolor=#e28700>19</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80200]};
get({2, 20}) ->
    #hallows_data{id = 2, step = 20,
		  name = lang:get(<<"阿瑞斯战腕"/utf8>>),
		  attr = [{hp_max, 98922}, {atk, 11709}],
		  loss = [{72001, 66}, {1, 460000}], max_lucky = 1430,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将阿瑞斯战腕升级为<div fontcolor=#e28700>20</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80200]};
get({2, 21}) ->
    #hallows_data{id = 2, step = 21,
		  name = lang:get(<<"阿瑞斯战腕"/utf8>>),
		  attr = [{hp_max, 108814}, {atk, 12880}],
		  loss = [{72001, 70}, {1, 504000}], max_lucky = 1500,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将阿瑞斯战腕升级为<div fontcolor=#e28700>21</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80200]};
get({2, 22}) ->
    #hallows_data{id = 2, step = 22,
		  name = lang:get(<<"阿瑞斯战腕"/utf8>>),
		  attr = [{hp_max, 119178}, {atk, 14107}],
		  loss = [{72001, 74}, {1, 550000}], max_lucky = 1570,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将阿瑞斯战腕升级为<div fontcolor=#e28700>22</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80200]};
get({2, 23}) ->
    #hallows_data{id = 2, step = 23,
		  name = lang:get(<<"阿瑞斯战腕"/utf8>>),
		  attr = [{hp_max, 130012}, {atk, 15389}],
		  loss = [{72001, 78}, {1, 598000}], max_lucky = 1640,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将阿瑞斯战腕升级为<div fontcolor=#e28700>23</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80200]};
get({2, 24}) ->
    #hallows_data{id = 2, step = 24,
		  name = lang:get(<<"阿瑞斯战腕"/utf8>>),
		  attr = [{hp_max, 141789}, {atk, 16784}],
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将阿瑞斯战腕升级为<div fontcolor=#e28700>24</div>级！"
				 "~ts"/utf8>>),
		  skill_order = [80200]};
get({3, 1}) ->
    #hallows_data{id = 3, step = 1,
		  name = lang:get(<<"永恒神枪"/utf8>>),
		  attr = [{hp_max, 471}, {atk, 55}],
		  loss = [{72001, 2}, {1, 5000}], max_lucky = 70,
		  clear_limit = 0, clear_time = 0, skill_order = [80300]};
get({3, 2}) ->
    #hallows_data{id = 3, step = 2,
		  name = lang:get(<<"永恒神枪"/utf8>>),
		  attr = [{hp_max, 1413}, {atk, 167}],
		  loss = [{72001, 4}, {1, 10000}], max_lucky = 140,
		  clear_limit = 0, clear_time = 0, skill_order = [80300]};
get({3, 3}) ->
    #hallows_data{id = 3, step = 3,
		  name = lang:get(<<"永恒神枪"/utf8>>),
		  attr = [{hp_max, 2826}, {atk, 334}],
		  loss = [{72001, 6}, {1, 18000}], max_lucky = 210,
		  clear_limit = 0, clear_time = 0, skill_order = [80300]};
get({3, 4}) ->
    #hallows_data{id = 3, step = 4,
		  name = lang:get(<<"永恒神枪"/utf8>>),
		  attr = [{hp_max, 4710}, {atk, 557}],
		  loss = [{72001, 8}, {1, 28000}], max_lucky = 290,
		  clear_limit = 0, clear_time = 0, skill_order = [80300]};
get({3, 5}) ->
    #hallows_data{id = 3, step = 5,
		  name = lang:get(<<"永恒神枪"/utf8>>),
		  attr = [{hp_max, 7065}, {atk, 836}],
		  loss = [{72001, 10}, {1, 40000}], max_lucky = 360,
		  clear_limit = 0, clear_time = 0, skill_order = [80300]};
get({3, 6}) ->
    #hallows_data{id = 3, step = 6,
		  name = lang:get(<<"永恒神枪"/utf8>>),
		  attr = [{hp_max, 9892}, {atk, 1170}],
		  loss = [{72001, 13}, {1, 54000}], max_lucky = 430,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将永恒神枪升级为<div fontcolor=#e28700>6</div>级！~t"
				 "s"/utf8>>),
		  skill_order = [80300]};
get({3, 7}) ->
    #hallows_data{id = 3, step = 7,
		  name = lang:get(<<"永恒神枪"/utf8>>),
		  attr = [{hp_max, 13189}, {atk, 1561}],
		  loss = [{72001, 16}, {1, 70000}], max_lucky = 500,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将永恒神枪升级为<div fontcolor=#e28700>7</div>级！~t"
				 "s"/utf8>>),
		  skill_order = [80300]};
get({3, 8}) ->
    #hallows_data{id = 3, step = 8,
		  name = lang:get(<<"永恒神枪"/utf8>>),
		  attr = [{hp_max, 16958}, {atk, 2007}],
		  loss = [{72001, 19}, {1, 88000}], max_lucky = 570,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将永恒神枪升级为<div fontcolor=#e28700>8</div>级！~t"
				 "s"/utf8>>),
		  skill_order = [80300]};
get({3, 9}) ->
    #hallows_data{id = 3, step = 9,
		  name = lang:get(<<"永恒神枪"/utf8>>),
		  attr = [{hp_max, 21197}, {atk, 2509}],
		  loss = [{72001, 22}, {1, 108000}], max_lucky = 640,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将永恒神枪升级为<div fontcolor=#e28700>9</div>级！~t"
				 "s"/utf8>>),
		  skill_order = [80300]};
get({3, 10}) ->
    #hallows_data{id = 3, step = 10,
		  name = lang:get(<<"永恒神枪"/utf8>>),
		  attr = [{hp_max, 25908}, {atk, 3066}],
		  loss = [{72001, 26}, {1, 130000}], max_lucky = 710,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将永恒神枪升级为<div fontcolor=#e28700>10</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80300]};
get({3, 11}) ->
    #hallows_data{id = 3, step = 11,
		  name = lang:get(<<"永恒神枪"/utf8>>),
		  attr = [{hp_max, 31089}, {atk, 3680}],
		  loss = [{72001, 30}, {1, 154000}], max_lucky = 790,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将永恒神枪升级为<div fontcolor=#e28700>11</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80300]};
get({3, 12}) ->
    #hallows_data{id = 3, step = 12,
		  name = lang:get(<<"永恒神枪"/utf8>>),
		  attr = [{hp_max, 36742}, {atk, 4349}],
		  loss = [{72001, 34}, {1, 180000}], max_lucky = 860,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将永恒神枪升级为<div fontcolor=#e28700>12</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80300]};
get({3, 13}) ->
    #hallows_data{id = 3, step = 13,
		  name = lang:get(<<"永恒神枪"/utf8>>),
		  attr = [{hp_max, 42866}, {atk, 5074}],
		  loss = [{72001, 38}, {1, 208000}], max_lucky = 930,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将永恒神枪升级为<div fontcolor=#e28700>13</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80300]};
get({3, 14}) ->
    #hallows_data{id = 3, step = 14,
		  name = lang:get(<<"永恒神枪"/utf8>>),
		  attr = [{hp_max, 49461}, {atk, 5854}],
		  loss = [{72001, 42}, {1, 238000}], max_lucky = 1000,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将永恒神枪升级为<div fontcolor=#e28700>14</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80300]};
get({3, 15}) ->
    #hallows_data{id = 3, step = 15,
		  name = lang:get(<<"永恒神枪"/utf8>>),
		  attr = [{hp_max, 56527}, {atk, 6691}],
		  loss = [{72001, 46}, {1, 270000}], max_lucky = 1070,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将永恒神枪升级为<div fontcolor=#e28700>15</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80300]};
get({3, 16}) ->
    #hallows_data{id = 3, step = 16,
		  name = lang:get(<<"永恒神枪"/utf8>>),
		  attr = [{hp_max, 64064}, {atk, 7583}],
		  loss = [{72001, 50}, {1, 304000}], max_lucky = 1140,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将永恒神枪升级为<div fontcolor=#e28700>16</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80300]};
get({3, 17}) ->
    #hallows_data{id = 3, step = 17,
		  name = lang:get(<<"永恒神枪"/utf8>>),
		  attr = [{hp_max, 72072}, {atk, 8531}],
		  loss = [{72001, 54}, {1, 340000}], max_lucky = 1210,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将永恒神枪升级为<div fontcolor=#e28700>17</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80300]};
get({3, 18}) ->
    #hallows_data{id = 3, step = 18,
		  name = lang:get(<<"永恒神枪"/utf8>>),
		  attr = [{hp_max, 80551}, {atk, 9535}],
		  loss = [{72001, 58}, {1, 378000}], max_lucky = 1290,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将永恒神枪升级为<div fontcolor=#e28700>18</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80300]};
get({3, 19}) ->
    #hallows_data{id = 3, step = 19,
		  name = lang:get(<<"永恒神枪"/utf8>>),
		  attr = [{hp_max, 89501}, {atk, 10594}],
		  loss = [{72001, 62}, {1, 418000}], max_lucky = 1360,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将永恒神枪升级为<div fontcolor=#e28700>19</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80300]};
get({3, 20}) ->
    #hallows_data{id = 3, step = 20,
		  name = lang:get(<<"永恒神枪"/utf8>>),
		  attr = [{hp_max, 98922}, {atk, 11709}],
		  loss = [{72001, 66}, {1, 460000}], max_lucky = 1430,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将永恒神枪升级为<div fontcolor=#e28700>20</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80300]};
get({3, 21}) ->
    #hallows_data{id = 3, step = 21,
		  name = lang:get(<<"永恒神枪"/utf8>>),
		  attr = [{hp_max, 108814}, {atk, 12880}],
		  loss = [{72001, 70}, {1, 504000}], max_lucky = 1500,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将永恒神枪升级为<div fontcolor=#e28700>21</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80300]};
get({3, 22}) ->
    #hallows_data{id = 3, step = 22,
		  name = lang:get(<<"永恒神枪"/utf8>>),
		  attr = [{hp_max, 119178}, {atk, 14107}],
		  loss = [{72001, 74}, {1, 550000}], max_lucky = 1570,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将永恒神枪升级为<div fontcolor=#e28700>22</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80300]};
get({3, 23}) ->
    #hallows_data{id = 3, step = 23,
		  name = lang:get(<<"永恒神枪"/utf8>>),
		  attr = [{hp_max, 130012}, {atk, 15389}],
		  loss = [{72001, 78}, {1, 598000}], max_lucky = 1640,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将永恒神枪升级为<div fontcolor=#e28700>23</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80300]};
get({3, 24}) ->
    #hallows_data{id = 3, step = 24,
		  name = lang:get(<<"永恒神枪"/utf8>>),
		  attr = [{hp_max, 141789}, {atk, 16784}],
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将永恒神枪升级为<div fontcolor=#e28700>24</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80300]};
get({4, 1}) ->
    #hallows_data{id = 4, step = 1,
		  name = lang:get(<<"罗睺之弓"/utf8>>),
		  attr = [{hp_max, 471}, {atk, 55}],
		  loss = [{72001, 2}, {1, 5000}], max_lucky = 70,
		  clear_limit = 0, clear_time = 0, skill_order = [80400]};
get({4, 2}) ->
    #hallows_data{id = 4, step = 2,
		  name = lang:get(<<"罗睺之弓"/utf8>>),
		  attr = [{hp_max, 1413}, {atk, 167}],
		  loss = [{72001, 4}, {1, 10000}], max_lucky = 140,
		  clear_limit = 0, clear_time = 0, skill_order = [80400]};
get({4, 3}) ->
    #hallows_data{id = 4, step = 3,
		  name = lang:get(<<"罗睺之弓"/utf8>>),
		  attr = [{hp_max, 2826}, {atk, 334}],
		  loss = [{72001, 6}, {1, 18000}], max_lucky = 210,
		  clear_limit = 0, clear_time = 0, skill_order = [80400]};
get({4, 4}) ->
    #hallows_data{id = 4, step = 4,
		  name = lang:get(<<"罗睺之弓"/utf8>>),
		  attr = [{hp_max, 4710}, {atk, 557}],
		  loss = [{72001, 8}, {1, 28000}], max_lucky = 290,
		  clear_limit = 0, clear_time = 0, skill_order = [80400]};
get({4, 5}) ->
    #hallows_data{id = 4, step = 5,
		  name = lang:get(<<"罗睺之弓"/utf8>>),
		  attr = [{hp_max, 7065}, {atk, 836}],
		  loss = [{72001, 10}, {1, 40000}], max_lucky = 360,
		  clear_limit = 0, clear_time = 0, skill_order = [80400]};
get({4, 6}) ->
    #hallows_data{id = 4, step = 6,
		  name = lang:get(<<"罗睺之弓"/utf8>>),
		  attr = [{hp_max, 9892}, {atk, 1170}],
		  loss = [{72001, 13}, {1, 54000}], max_lucky = 430,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将罗睺之弓升级为<div fontcolor=#e28700>6</div>级！~t"
				 "s"/utf8>>),
		  skill_order = [80400]};
get({4, 7}) ->
    #hallows_data{id = 4, step = 7,
		  name = lang:get(<<"罗睺之弓"/utf8>>),
		  attr = [{hp_max, 13189}, {atk, 1561}],
		  loss = [{72001, 16}, {1, 70000}], max_lucky = 500,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将罗睺之弓升级为<div fontcolor=#e28700>7</div>级！~t"
				 "s"/utf8>>),
		  skill_order = [80400]};
get({4, 8}) ->
    #hallows_data{id = 4, step = 8,
		  name = lang:get(<<"罗睺之弓"/utf8>>),
		  attr = [{hp_max, 16958}, {atk, 2007}],
		  loss = [{72001, 19}, {1, 88000}], max_lucky = 570,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将罗睺之弓升级为<div fontcolor=#e28700>8</div>级！~t"
				 "s"/utf8>>),
		  skill_order = [80400]};
get({4, 9}) ->
    #hallows_data{id = 4, step = 9,
		  name = lang:get(<<"罗睺之弓"/utf8>>),
		  attr = [{hp_max, 21197}, {atk, 2509}],
		  loss = [{72001, 22}, {1, 108000}], max_lucky = 640,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将罗睺之弓升级为<div fontcolor=#e28700>9</div>级！~t"
				 "s"/utf8>>),
		  skill_order = [80400]};
get({4, 10}) ->
    #hallows_data{id = 4, step = 10,
		  name = lang:get(<<"罗睺之弓"/utf8>>),
		  attr = [{hp_max, 25908}, {atk, 3066}],
		  loss = [{72001, 26}, {1, 130000}], max_lucky = 710,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将罗睺之弓升级为<div fontcolor=#e28700>10</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80400]};
get({4, 11}) ->
    #hallows_data{id = 4, step = 11,
		  name = lang:get(<<"罗睺之弓"/utf8>>),
		  attr = [{hp_max, 31089}, {atk, 3680}],
		  loss = [{72001, 30}, {1, 154000}], max_lucky = 790,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将罗睺之弓升级为<div fontcolor=#e28700>11</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80400]};
get({4, 12}) ->
    #hallows_data{id = 4, step = 12,
		  name = lang:get(<<"罗睺之弓"/utf8>>),
		  attr = [{hp_max, 36742}, {atk, 4349}],
		  loss = [{72001, 34}, {1, 180000}], max_lucky = 860,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将罗睺之弓升级为<div fontcolor=#e28700>12</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80400]};
get({4, 13}) ->
    #hallows_data{id = 4, step = 13,
		  name = lang:get(<<"罗睺之弓"/utf8>>),
		  attr = [{hp_max, 42866}, {atk, 5074}],
		  loss = [{72001, 38}, {1, 208000}], max_lucky = 930,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将罗睺之弓升级为<div fontcolor=#e28700>13</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80400]};
get({4, 14}) ->
    #hallows_data{id = 4, step = 14,
		  name = lang:get(<<"罗睺之弓"/utf8>>),
		  attr = [{hp_max, 49461}, {atk, 5854}],
		  loss = [{72001, 42}, {1, 238000}], max_lucky = 1000,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将罗睺之弓升级为<div fontcolor=#e28700>14</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80400]};
get({4, 15}) ->
    #hallows_data{id = 4, step = 15,
		  name = lang:get(<<"罗睺之弓"/utf8>>),
		  attr = [{hp_max, 56527}, {atk, 6691}],
		  loss = [{72001, 46}, {1, 270000}], max_lucky = 1070,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将罗睺之弓升级为<div fontcolor=#e28700>15</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80400]};
get({4, 16}) ->
    #hallows_data{id = 4, step = 16,
		  name = lang:get(<<"罗睺之弓"/utf8>>),
		  attr = [{hp_max, 64064}, {atk, 7583}],
		  loss = [{72001, 50}, {1, 304000}], max_lucky = 1140,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将罗睺之弓升级为<div fontcolor=#e28700>16</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80400]};
get({4, 17}) ->
    #hallows_data{id = 4, step = 17,
		  name = lang:get(<<"罗睺之弓"/utf8>>),
		  attr = [{hp_max, 72072}, {atk, 8531}],
		  loss = [{72001, 54}, {1, 340000}], max_lucky = 1210,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将罗睺之弓升级为<div fontcolor=#e28700>17</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80400]};
get({4, 18}) ->
    #hallows_data{id = 4, step = 18,
		  name = lang:get(<<"罗睺之弓"/utf8>>),
		  attr = [{hp_max, 80551}, {atk, 9535}],
		  loss = [{72001, 58}, {1, 378000}], max_lucky = 1290,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将罗睺之弓升级为<div fontcolor=#e28700>18</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80400]};
get({4, 19}) ->
    #hallows_data{id = 4, step = 19,
		  name = lang:get(<<"罗睺之弓"/utf8>>),
		  attr = [{hp_max, 89501}, {atk, 10594}],
		  loss = [{72001, 62}, {1, 418000}], max_lucky = 1360,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将罗睺之弓升级为<div fontcolor=#e28700>19</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80400]};
get({4, 20}) ->
    #hallows_data{id = 4, step = 20,
		  name = lang:get(<<"罗睺之弓"/utf8>>),
		  attr = [{hp_max, 98922}, {atk, 11709}],
		  loss = [{72001, 66}, {1, 460000}], max_lucky = 1430,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将罗睺之弓升级为<div fontcolor=#e28700>20</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80400]};
get({4, 21}) ->
    #hallows_data{id = 4, step = 21,
		  name = lang:get(<<"罗睺之弓"/utf8>>),
		  attr = [{hp_max, 108814}, {atk, 12880}],
		  loss = [{72001, 70}, {1, 504000}], max_lucky = 1500,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将罗睺之弓升级为<div fontcolor=#e28700>21</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80400]};
get({4, 22}) ->
    #hallows_data{id = 4, step = 22,
		  name = lang:get(<<"罗睺之弓"/utf8>>),
		  attr = [{hp_max, 119178}, {atk, 14107}],
		  loss = [{72001, 74}, {1, 550000}], max_lucky = 1570,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将罗睺之弓升级为<div fontcolor=#e28700>22</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80400]};
get({4, 23}) ->
    #hallows_data{id = 4, step = 23,
		  name = lang:get(<<"罗睺之弓"/utf8>>),
		  attr = [{hp_max, 130012}, {atk, 15389}],
		  loss = [{72001, 78}, {1, 598000}], max_lucky = 1640,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将罗睺之弓升级为<div fontcolor=#e28700>23</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80400]};
get({4, 24}) ->
    #hallows_data{id = 4, step = 24,
		  name = lang:get(<<"罗睺之弓"/utf8>>),
		  attr = [{hp_max, 141789}, {atk, 16784}],
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将罗睺之弓升级为<div fontcolor=#e28700>24</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80400]};
get({5, 1}) ->
    #hallows_data{id = 5, step = 1,
		  name = lang:get(<<"魔神之锤"/utf8>>),
		  attr = [{hp_max, 471}, {atk, 55}],
		  loss = [{72001, 2}, {1, 5000}], max_lucky = 70,
		  clear_limit = 0, clear_time = 0, skill_order = [80500]};
get({5, 2}) ->
    #hallows_data{id = 5, step = 2,
		  name = lang:get(<<"魔神之锤"/utf8>>),
		  attr = [{hp_max, 1413}, {atk, 167}],
		  loss = [{72001, 4}, {1, 10000}], max_lucky = 140,
		  clear_limit = 0, clear_time = 0, skill_order = [80500]};
get({5, 3}) ->
    #hallows_data{id = 5, step = 3,
		  name = lang:get(<<"魔神之锤"/utf8>>),
		  attr = [{hp_max, 2826}, {atk, 334}],
		  loss = [{72001, 6}, {1, 18000}], max_lucky = 210,
		  clear_limit = 0, clear_time = 0, skill_order = [80500]};
get({5, 4}) ->
    #hallows_data{id = 5, step = 4,
		  name = lang:get(<<"魔神之锤"/utf8>>),
		  attr = [{hp_max, 4710}, {atk, 557}],
		  loss = [{72001, 8}, {1, 28000}], max_lucky = 290,
		  clear_limit = 0, clear_time = 0, skill_order = [80500]};
get({5, 5}) ->
    #hallows_data{id = 5, step = 5,
		  name = lang:get(<<"魔神之锤"/utf8>>),
		  attr = [{hp_max, 7065}, {atk, 836}],
		  loss = [{72001, 10}, {1, 40000}], max_lucky = 360,
		  clear_limit = 0, clear_time = 0, skill_order = [80500]};
get({5, 6}) ->
    #hallows_data{id = 5, step = 6,
		  name = lang:get(<<"魔神之锤"/utf8>>),
		  attr = [{hp_max, 9892}, {atk, 1170}],
		  loss = [{72001, 13}, {1, 54000}], max_lucky = 430,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将魔神之锤升级为<div fontcolor=#e28700>6</div>级！~t"
				 "s"/utf8>>),
		  skill_order = [80500]};
get({5, 7}) ->
    #hallows_data{id = 5, step = 7,
		  name = lang:get(<<"魔神之锤"/utf8>>),
		  attr = [{hp_max, 13189}, {atk, 1561}],
		  loss = [{72001, 16}, {1, 70000}], max_lucky = 500,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将魔神之锤升级为<div fontcolor=#e28700>7</div>级！~t"
				 "s"/utf8>>),
		  skill_order = [80500]};
get({5, 8}) ->
    #hallows_data{id = 5, step = 8,
		  name = lang:get(<<"魔神之锤"/utf8>>),
		  attr = [{hp_max, 16958}, {atk, 2007}],
		  loss = [{72001, 19}, {1, 88000}], max_lucky = 570,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将魔神之锤升级为<div fontcolor=#e28700>8</div>级！~t"
				 "s"/utf8>>),
		  skill_order = [80500]};
get({5, 9}) ->
    #hallows_data{id = 5, step = 9,
		  name = lang:get(<<"魔神之锤"/utf8>>),
		  attr = [{hp_max, 21197}, {atk, 2509}],
		  loss = [{72001, 22}, {1, 108000}], max_lucky = 640,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将魔神之锤升级为<div fontcolor=#e28700>9</div>级！~t"
				 "s"/utf8>>),
		  skill_order = [80500]};
get({5, 10}) ->
    #hallows_data{id = 5, step = 10,
		  name = lang:get(<<"魔神之锤"/utf8>>),
		  attr = [{hp_max, 25908}, {atk, 3066}],
		  loss = [{72001, 26}, {1, 130000}], max_lucky = 710,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将魔神之锤升级为<div fontcolor=#e28700>10</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80500]};
get({5, 11}) ->
    #hallows_data{id = 5, step = 11,
		  name = lang:get(<<"魔神之锤"/utf8>>),
		  attr = [{hp_max, 31089}, {atk, 3680}],
		  loss = [{72001, 30}, {1, 154000}], max_lucky = 790,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将魔神之锤升级为<div fontcolor=#e28700>11</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80500]};
get({5, 12}) ->
    #hallows_data{id = 5, step = 12,
		  name = lang:get(<<"魔神之锤"/utf8>>),
		  attr = [{hp_max, 36742}, {atk, 4349}],
		  loss = [{72001, 34}, {1, 180000}], max_lucky = 860,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将魔神之锤升级为<div fontcolor=#e28700>12</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80500]};
get({5, 13}) ->
    #hallows_data{id = 5, step = 13,
		  name = lang:get(<<"魔神之锤"/utf8>>),
		  attr = [{hp_max, 42866}, {atk, 5074}],
		  loss = [{72001, 38}, {1, 208000}], max_lucky = 930,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将魔神之锤升级为<div fontcolor=#e28700>13</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80500]};
get({5, 14}) ->
    #hallows_data{id = 5, step = 14,
		  name = lang:get(<<"魔神之锤"/utf8>>),
		  attr = [{hp_max, 49461}, {atk, 5854}],
		  loss = [{72001, 42}, {1, 238000}], max_lucky = 1000,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将魔神之锤升级为<div fontcolor=#e28700>14</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80500]};
get({5, 15}) ->
    #hallows_data{id = 5, step = 15,
		  name = lang:get(<<"魔神之锤"/utf8>>),
		  attr = [{hp_max, 56527}, {atk, 6691}],
		  loss = [{72001, 46}, {1, 270000}], max_lucky = 1070,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将魔神之锤升级为<div fontcolor=#e28700>15</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80500]};
get({5, 16}) ->
    #hallows_data{id = 5, step = 16,
		  name = lang:get(<<"魔神之锤"/utf8>>),
		  attr = [{hp_max, 64064}, {atk, 7583}],
		  loss = [{72001, 50}, {1, 304000}], max_lucky = 1140,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将魔神之锤升级为<div fontcolor=#e28700>16</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80500]};
get({5, 17}) ->
    #hallows_data{id = 5, step = 17,
		  name = lang:get(<<"魔神之锤"/utf8>>),
		  attr = [{hp_max, 72072}, {atk, 8531}],
		  loss = [{72001, 54}, {1, 340000}], max_lucky = 1210,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将魔神之锤升级为<div fontcolor=#e28700>17</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80500]};
get({5, 18}) ->
    #hallows_data{id = 5, step = 18,
		  name = lang:get(<<"魔神之锤"/utf8>>),
		  attr = [{hp_max, 80551}, {atk, 9535}],
		  loss = [{72001, 58}, {1, 378000}], max_lucky = 1290,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将魔神之锤升级为<div fontcolor=#e28700>18</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80500]};
get({5, 19}) ->
    #hallows_data{id = 5, step = 19,
		  name = lang:get(<<"魔神之锤"/utf8>>),
		  attr = [{hp_max, 89501}, {atk, 10594}],
		  loss = [{72001, 62}, {1, 418000}], max_lucky = 1360,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将魔神之锤升级为<div fontcolor=#e28700>19</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80500]};
get({5, 20}) ->
    #hallows_data{id = 5, step = 20,
		  name = lang:get(<<"魔神之锤"/utf8>>),
		  attr = [{hp_max, 98922}, {atk, 11709}],
		  loss = [{72001, 66}, {1, 460000}], max_lucky = 1430,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将魔神之锤升级为<div fontcolor=#e28700>20</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80500]};
get({5, 21}) ->
    #hallows_data{id = 5, step = 21,
		  name = lang:get(<<"魔神之锤"/utf8>>),
		  attr = [{hp_max, 108814}, {atk, 12880}],
		  loss = [{72001, 70}, {1, 504000}], max_lucky = 1500,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将魔神之锤升级为<div fontcolor=#e28700>21</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80500]};
get({5, 22}) ->
    #hallows_data{id = 5, step = 22,
		  name = lang:get(<<"魔神之锤"/utf8>>),
		  attr = [{hp_max, 119178}, {atk, 14107}],
		  loss = [{72001, 74}, {1, 550000}], max_lucky = 1570,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将魔神之锤升级为<div fontcolor=#e28700>22</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80500]};
get({5, 23}) ->
    #hallows_data{id = 5, step = 23,
		  name = lang:get(<<"魔神之锤"/utf8>>),
		  attr = [{hp_max, 130012}, {atk, 15389}],
		  loss = [{72001, 78}, {1, 598000}], max_lucky = 1640,
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将魔神之锤升级为<div fontcolor=#e28700>23</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80500]};
get({5, 24}) ->
    #hallows_data{id = 5, step = 24,
		  name = lang:get(<<"魔神之锤"/utf8>>),
		  attr = [{hp_max, 141789}, {atk, 16784}],
		  clear_limit = 0, clear_time = 0,
		  notice =
		      lang:get(<<"远处一道圣光冲破天际，冒险者<div fontcolor=#e28700>~ts</div"
				 ">成功将魔神之锤升级为<div fontcolor=#e28700>24</div>级！~"
				 "ts"/utf8>>),
		  skill_order = [80500]};
get(_Info) ->
    logger:data_error("get_data_not_exist===>~w", [_Info],
		      hallows_data, 1578),
    undefined.

lucky_rate({1, Lucky})
    when 0 =< Lucky andalso Lucky =< 50 ->
    0;
lucky_rate({1, Lucky})
    when 51 =< Lucky andalso Lucky =< 70 ->
    1000;
lucky_rate({2, Lucky})
    when 0 =< Lucky andalso Lucky =< 100 ->
    0;
lucky_rate({2, Lucky})
    when 101 =< Lucky andalso Lucky =< 120 ->
    500;
lucky_rate({2, Lucky})
    when 121 =< Lucky andalso Lucky =< 140 ->
    1000;
lucky_rate({3, Lucky})
    when 0 =< Lucky andalso Lucky =< 150 ->
    0;
lucky_rate({3, Lucky})
    when 151 =< Lucky andalso Lucky =< 180 ->
    500;
lucky_rate({3, Lucky})
    when 181 =< Lucky andalso Lucky =< 210 ->
    1000;
lucky_rate({4, Lucky})
    when 0 =< Lucky andalso Lucky =< 200 ->
    0;
lucky_rate({4, Lucky})
    when 201 =< Lucky andalso Lucky =< 240 ->
    500;
lucky_rate({4, Lucky})
    when 241 =< Lucky andalso Lucky =< 290 ->
    1000;
lucky_rate({5, Lucky})
    when 0 =< Lucky andalso Lucky =< 250 ->
    0;
lucky_rate({5, Lucky})
    when 251 =< Lucky andalso Lucky =< 290 ->
    500;
lucky_rate({5, Lucky})
    when 291 =< Lucky andalso Lucky =< 360 ->
    1000;
lucky_rate({6, Lucky})
    when 0 =< Lucky andalso Lucky =< 300 ->
    0;
lucky_rate({6, Lucky})
    when 301 =< Lucky andalso Lucky =< 360 ->
    500;
lucky_rate({6, Lucky})
    when 361 =< Lucky andalso Lucky =< 430 ->
    1000;
lucky_rate({7, Lucky})
    when 0 =< Lucky andalso Lucky =< 350 ->
    0;
lucky_rate({7, Lucky})
    when 351 =< Lucky andalso Lucky =< 420 ->
    500;
lucky_rate({7, Lucky})
    when 421 =< Lucky andalso Lucky =< 500 ->
    1000;
lucky_rate({8, Lucky})
    when 0 =< Lucky andalso Lucky =< 400 ->
    0;
lucky_rate({8, Lucky})
    when 401 =< Lucky andalso Lucky =< 480 ->
    500;
lucky_rate({8, Lucky})
    when 481 =< Lucky andalso Lucky =< 570 ->
    1000;
lucky_rate({9, Lucky})
    when 0 =< Lucky andalso Lucky =< 450 ->
    0;
lucky_rate({9, Lucky})
    when 451 =< Lucky andalso Lucky =< 520 ->
    500;
lucky_rate({9, Lucky})
    when 521 =< Lucky andalso Lucky =< 640 ->
    1000;
lucky_rate({10, Lucky})
    when 0 =< Lucky andalso Lucky =< 500 ->
    0;
lucky_rate({10, Lucky})
    when 501 =< Lucky andalso Lucky =< 580 ->
    500;
lucky_rate({10, Lucky})
    when 581 =< Lucky andalso Lucky =< 710 ->
    1000;
lucky_rate({11, Lucky})
    when 0 =< Lucky andalso Lucky =< 550 ->
    0;
lucky_rate({11, Lucky})
    when 551 =< Lucky andalso Lucky =< 630 ->
    500;
lucky_rate({11, Lucky})
    when 631 =< Lucky andalso Lucky =< 790 ->
    1000;
lucky_rate({12, Lucky})
    when 0 =< Lucky andalso Lucky =< 600 ->
    0;
lucky_rate({12, Lucky})
    when 601 =< Lucky andalso Lucky =< 700 ->
    500;
lucky_rate({12, Lucky})
    when 701 =< Lucky andalso Lucky =< 860 ->
    1000;
lucky_rate({13, Lucky})
    when 0 =< Lucky andalso Lucky =< 650 ->
    0;
lucky_rate({13, Lucky})
    when 651 =< Lucky andalso Lucky =< 750 ->
    500;
lucky_rate({13, Lucky})
    when 751 =< Lucky andalso Lucky =< 930 ->
    1000;
lucky_rate({14, Lucky})
    when 0 =< Lucky andalso Lucky =< 700 ->
    0;
lucky_rate({14, Lucky})
    when 701 =< Lucky andalso Lucky =< 800 ->
    500;
lucky_rate({14, Lucky})
    when 801 =< Lucky andalso Lucky =< 1000 ->
    1000;
lucky_rate({15, Lucky})
    when 0 =< Lucky andalso Lucky =< 750 ->
    0;
lucky_rate({15, Lucky})
    when 751 =< Lucky andalso Lucky =< 880 ->
    500;
lucky_rate({15, Lucky})
    when 881 =< Lucky andalso Lucky =< 1070 ->
    1000;
lucky_rate({16, Lucky})
    when 0 =< Lucky andalso Lucky =< 800 ->
    0;
lucky_rate({16, Lucky})
    when 801 =< Lucky andalso Lucky =< 950 ->
    500;
lucky_rate({16, Lucky})
    when 951 =< Lucky andalso Lucky =< 1140 ->
    1000;
lucky_rate({17, Lucky})
    when 0 =< Lucky andalso Lucky =< 850 ->
    0;
lucky_rate({17, Lucky})
    when 851 =< Lucky andalso Lucky =< 1000 ->
    500;
lucky_rate({17, Lucky})
    when 1001 =< Lucky andalso Lucky =< 1210 ->
    1000;
lucky_rate({18, Lucky})
    when 0 =< Lucky andalso Lucky =< 900 ->
    0;
lucky_rate({18, Lucky})
    when 901 =< Lucky andalso Lucky =< 1030 ->
    500;
lucky_rate({18, Lucky})
    when 1031 =< Lucky andalso Lucky =< 1290 ->
    1000;
lucky_rate({19, Lucky})
    when 0 =< Lucky andalso Lucky =< 950 ->
    0;
lucky_rate({19, Lucky})
    when 951 =< Lucky andalso Lucky =< 1080 ->
    500;
lucky_rate({19, Lucky})
    when 1081 =< Lucky andalso Lucky =< 1360 ->
    1000;
lucky_rate({20, Lucky})
    when 0 =< Lucky andalso Lucky =< 1000 ->
    0;
lucky_rate({20, Lucky})
    when 1001 =< Lucky andalso Lucky =< 1200 ->
    500;
lucky_rate({20, Lucky})
    when 1201 =< Lucky andalso Lucky =< 1430 ->
    1000;
lucky_rate({21, Lucky})
    when 0 =< Lucky andalso Lucky =< 1050 ->
    0;
lucky_rate({21, Lucky})
    when 1051 =< Lucky andalso Lucky =< 1250 ->
    500;
lucky_rate({21, Lucky})
    when 1251 =< Lucky andalso Lucky =< 1500 ->
    1000;
lucky_rate({22, Lucky})
    when 0 =< Lucky andalso Lucky =< 1100 ->
    0;
lucky_rate({22, Lucky})
    when 1101 =< Lucky andalso Lucky =< 1300 ->
    500;
lucky_rate({22, Lucky})
    when 1301 =< Lucky andalso Lucky =< 1570 ->
    1000;
lucky_rate({23, Lucky})
    when 0 =< Lucky andalso Lucky =< 1150 ->
    0;
lucky_rate({23, Lucky})
    when 1151 =< Lucky andalso Lucky =< 1350 ->
    500;
lucky_rate({23, Lucky})
    when 1351 =< Lucky andalso Lucky =< 1640 ->
    1000;
lucky_rate(_) -> 0.

lucky_rand() -> [{12, 100}, {10, 100}, {8, 100}].

get_skill({1, 1}) ->
    {801001, [{72002, 10}, {1, 200000}], 4};
get_skill({1, 2}) ->
    {801002, [{72002, 20}, {1, 400000}], 6};
get_skill({1, 3}) ->
    {801003, [{72002, 30}, {1, 700000}], 8};
get_skill({1, 4}) ->
    {801004, [{72002, 40}, {1, 1100000}], 10};
get_skill({1, 5}) ->
    {801005, [{72002, 60}, {1, 1600000}], 12};
get_skill({1, 6}) ->
    {801006, [{72002, 80}, {1, 2200000}], 14};
get_skill({1, 7}) ->
    {801007, [{72002, 100}, {1, 2900000}], 16};
get_skill({1, 8}) ->
    {801008, [{72002, 120}, {1, 3700000}], 18};
get_skill({1, 9}) ->
    {801009, [{72002, 140}, {1, 4600000}], 20};
get_skill({1, 10}) ->
    {801010, [{72002, 160}, {1, 5600000}], 22};
get_skill({1, 11}) ->
    {801011, [{72002, 180}, {1, 6700000}], 24};
get_skill({1, 12}) -> {801012, [], val_not_exist};
get_skill({2, 1}) ->
    {802001, [{72002, 10}, {1, 200000}], 4};
get_skill({2, 2}) ->
    {802002, [{72002, 20}, {1, 400000}], 6};
get_skill({2, 3}) ->
    {802003, [{72002, 30}, {1, 700000}], 8};
get_skill({2, 4}) ->
    {802004, [{72002, 40}, {1, 1100000}], 10};
get_skill({2, 5}) ->
    {802005, [{72002, 60}, {1, 1600000}], 12};
get_skill({2, 6}) ->
    {802006, [{72002, 80}, {1, 2200000}], 14};
get_skill({2, 7}) ->
    {802007, [{72002, 100}, {1, 2900000}], 16};
get_skill({2, 8}) ->
    {802008, [{72002, 120}, {1, 3700000}], 18};
get_skill({2, 9}) ->
    {802009, [{72002, 140}, {1, 4600000}], 20};
get_skill({2, 10}) ->
    {802010, [{72002, 160}, {1, 5600000}], 22};
get_skill({2, 11}) ->
    {802011, [{72002, 180}, {1, 6700000}], 24};
get_skill({2, 12}) -> {802012, [], val_not_exist};
get_skill({3, 1}) ->
    {803001, [{72002, 10}, {1, 200000}], 4};
get_skill({3, 2}) ->
    {803002, [{72002, 20}, {1, 400000}], 6};
get_skill({3, 3}) ->
    {803003, [{72002, 30}, {1, 700000}], 8};
get_skill({3, 4}) ->
    {803004, [{72002, 40}, {1, 1100000}], 10};
get_skill({3, 5}) ->
    {803005, [{72002, 60}, {1, 1600000}], 12};
get_skill({3, 6}) ->
    {803006, [{72002, 80}, {1, 2200000}], 14};
get_skill({3, 7}) ->
    {803007, [{72002, 100}, {1, 2900000}], 16};
get_skill({3, 8}) ->
    {803008, [{72002, 120}, {1, 3700000}], 18};
get_skill({3, 9}) ->
    {803009, [{72002, 140}, {1, 4600000}], 20};
get_skill({3, 10}) ->
    {803010, [{72002, 160}, {1, 5600000}], 22};
get_skill({3, 11}) ->
    {803011, [{72002, 180}, {1, 6700000}], 24};
get_skill({3, 12}) -> {803012, [], val_not_exist};
get_skill({4, 1}) ->
    {805001, [{72002, 10}, {1, 200000}], 4};
get_skill({4, 2}) ->
    {805002, [{72002, 20}, {1, 400000}], 6};
get_skill({4, 3}) ->
    {805003, [{72002, 30}, {1, 700000}], 8};
get_skill({4, 4}) ->
    {805004, [{72002, 40}, {1, 1100000}], 10};
get_skill({4, 5}) ->
    {805005, [{72002, 60}, {1, 1600000}], 12};
get_skill({4, 6}) ->
    {805006, [{72002, 80}, {1, 2200000}], 14};
get_skill({4, 7}) ->
    {805007, [{72002, 100}, {1, 2900000}], 16};
get_skill({4, 8}) ->
    {805008, [{72002, 120}, {1, 3700000}], 18};
get_skill({4, 9}) ->
    {805009, [{72002, 140}, {1, 4600000}], 20};
get_skill({4, 10}) ->
    {805010, [{72002, 160}, {1, 5600000}], 22};
get_skill({4, 11}) ->
    {805011, [{72002, 180}, {1, 6700000}], 24};
get_skill({4, 12}) -> {805012, [], val_not_exist};
get_skill({5, 1}) ->
    {807001, [{72002, 10}, {1, 200000}], 4};
get_skill({5, 2}) ->
    {807002, [{72002, 20}, {1, 400000}], 6};
get_skill({5, 3}) ->
    {807003, [{72002, 30}, {1, 700000}], 8};
get_skill({5, 4}) ->
    {807004, [{72002, 40}, {1, 1100000}], 10};
get_skill({5, 5}) ->
    {807005, [{72002, 60}, {1, 1600000}], 12};
get_skill({5, 6}) ->
    {807006, [{72002, 80}, {1, 2200000}], 14};
get_skill({5, 7}) ->
    {807007, [{72002, 100}, {1, 2900000}], 16};
get_skill({5, 8}) ->
    {807008, [{72002, 120}, {1, 3700000}], 18};
get_skill({5, 9}) ->
    {807009, [{72002, 140}, {1, 4600000}], 20};
get_skill({5, 10}) ->
    {807010, [{72002, 160}, {1, 5600000}], 22};
get_skill({5, 11}) ->
    {807011, [{72002, 180}, {1, 6700000}], 24};
get_skill({5, 12}) -> {807012, [], val_not_exist};
get_skill(_Info) ->
    logger:data_error("get_skill_data_not_exist===>~w",
		      [_Info], hallows_data, 1712),
    undefined.

skill_attr(5) ->
    [{[{crit_rate, 100}], 4}, {[{crit_ratio, 200}], 8},
     {[{speed, 40}], 12}];
skill_attr(4) ->
    [{[{dodge_rate, 100}], 4}, {[{tenacity, 100}], 8},
     {[{speed, 40}], 12}];
skill_attr(3) ->
    [{[{tenacity, 100}], 4},
     {[{cure, 100}, {be_cure, 100}], 8},
     {[{speed, 40}], 12}];
skill_attr(2) ->
    [{[{def_per, 100}], 4}, {[{res, 100}], 8},
     {[{speed, 40}], 12}];
skill_attr(1) ->
    [{[{atk_per, 100}], 4}, {[{hit_rate, 100}], 8},
     {[{speed, 40}], 12}];
skill_attr(_) -> [].

seal_limit({5, Step}) when Step >= 24 -> 105;
seal_limit({5, Step}) when Step >= 23 -> 100;
seal_limit({5, Step}) when Step >= 22 -> 95;
seal_limit({5, Step}) when Step >= 21 -> 90;
seal_limit({5, Step}) when Step >= 20 -> 85;
seal_limit({5, Step}) when Step >= 19 -> 80;
seal_limit({5, Step}) when Step >= 18 -> 75;
seal_limit({5, Step}) when Step >= 17 -> 70;
seal_limit({5, Step}) when Step >= 16 -> 65;
seal_limit({5, Step}) when Step >= 15 -> 60;
seal_limit({5, Step}) when Step >= 14 -> 55;
seal_limit({5, Step}) when Step >= 13 -> 50;
seal_limit({5, Step}) when Step >= 12 -> 45;
seal_limit({5, Step}) when Step >= 11 -> 40;
seal_limit({5, Step}) when Step >= 10 -> 35;
seal_limit({5, Step}) when Step >= 9 -> 30;
seal_limit({5, Step}) when Step >= 8 -> 25;
seal_limit({5, Step}) when Step >= 7 -> 20;
seal_limit({5, Step}) when Step >= 6 -> 15;
seal_limit({5, Step}) when Step >= 5 -> 10;
seal_limit({5, Step}) when Step >= 4 -> 5;
seal_limit({5, Step}) when Step >= 3 -> 3;
seal_limit({5, Step}) when Step >= 2 -> 0;
seal_limit({5, Step}) when Step >= 1 -> 0;
seal_limit({4, Step}) when Step >= 24 -> 105;
seal_limit({4, Step}) when Step >= 23 -> 100;
seal_limit({4, Step}) when Step >= 22 -> 95;
seal_limit({4, Step}) when Step >= 21 -> 90;
seal_limit({4, Step}) when Step >= 20 -> 85;
seal_limit({4, Step}) when Step >= 19 -> 80;
seal_limit({4, Step}) when Step >= 18 -> 75;
seal_limit({4, Step}) when Step >= 17 -> 70;
seal_limit({4, Step}) when Step >= 16 -> 65;
seal_limit({4, Step}) when Step >= 15 -> 60;
seal_limit({4, Step}) when Step >= 14 -> 55;
seal_limit({4, Step}) when Step >= 13 -> 50;
seal_limit({4, Step}) when Step >= 12 -> 45;
seal_limit({4, Step}) when Step >= 11 -> 40;
seal_limit({4, Step}) when Step >= 10 -> 35;
seal_limit({4, Step}) when Step >= 9 -> 30;
seal_limit({4, Step}) when Step >= 8 -> 25;
seal_limit({4, Step}) when Step >= 7 -> 20;
seal_limit({4, Step}) when Step >= 6 -> 15;
seal_limit({4, Step}) when Step >= 5 -> 10;
seal_limit({4, Step}) when Step >= 4 -> 5;
seal_limit({4, Step}) when Step >= 3 -> 3;
seal_limit({4, Step}) when Step >= 2 -> 0;
seal_limit({4, Step}) when Step >= 1 -> 0;
seal_limit({3, Step}) when Step >= 24 -> 105;
seal_limit({3, Step}) when Step >= 23 -> 100;
seal_limit({3, Step}) when Step >= 22 -> 95;
seal_limit({3, Step}) when Step >= 21 -> 90;
seal_limit({3, Step}) when Step >= 20 -> 85;
seal_limit({3, Step}) when Step >= 19 -> 80;
seal_limit({3, Step}) when Step >= 18 -> 75;
seal_limit({3, Step}) when Step >= 17 -> 70;
seal_limit({3, Step}) when Step >= 16 -> 65;
seal_limit({3, Step}) when Step >= 15 -> 60;
seal_limit({3, Step}) when Step >= 14 -> 55;
seal_limit({3, Step}) when Step >= 13 -> 50;
seal_limit({3, Step}) when Step >= 12 -> 45;
seal_limit({3, Step}) when Step >= 11 -> 40;
seal_limit({3, Step}) when Step >= 10 -> 35;
seal_limit({3, Step}) when Step >= 9 -> 30;
seal_limit({3, Step}) when Step >= 8 -> 25;
seal_limit({3, Step}) when Step >= 7 -> 20;
seal_limit({3, Step}) when Step >= 6 -> 15;
seal_limit({3, Step}) when Step >= 5 -> 10;
seal_limit({3, Step}) when Step >= 4 -> 5;
seal_limit({3, Step}) when Step >= 3 -> 3;
seal_limit({3, Step}) when Step >= 2 -> 0;
seal_limit({3, Step}) when Step >= 1 -> 0;
seal_limit({2, Step}) when Step >= 24 -> 105;
seal_limit({2, Step}) when Step >= 23 -> 100;
seal_limit({2, Step}) when Step >= 22 -> 95;
seal_limit({2, Step}) when Step >= 21 -> 90;
seal_limit({2, Step}) when Step >= 20 -> 85;
seal_limit({2, Step}) when Step >= 19 -> 80;
seal_limit({2, Step}) when Step >= 18 -> 75;
seal_limit({2, Step}) when Step >= 17 -> 70;
seal_limit({2, Step}) when Step >= 16 -> 65;
seal_limit({2, Step}) when Step >= 15 -> 60;
seal_limit({2, Step}) when Step >= 14 -> 55;
seal_limit({2, Step}) when Step >= 13 -> 50;
seal_limit({2, Step}) when Step >= 12 -> 45;
seal_limit({2, Step}) when Step >= 11 -> 40;
seal_limit({2, Step}) when Step >= 10 -> 35;
seal_limit({2, Step}) when Step >= 9 -> 30;
seal_limit({2, Step}) when Step >= 8 -> 25;
seal_limit({2, Step}) when Step >= 7 -> 20;
seal_limit({2, Step}) when Step >= 6 -> 15;
seal_limit({2, Step}) when Step >= 5 -> 10;
seal_limit({2, Step}) when Step >= 4 -> 5;
seal_limit({2, Step}) when Step >= 3 -> 3;
seal_limit({2, Step}) when Step >= 2 -> 0;
seal_limit({2, Step}) when Step >= 1 -> 0;
seal_limit({1, Step}) when Step >= 24 -> 105;
seal_limit({1, Step}) when Step >= 23 -> 100;
seal_limit({1, Step}) when Step >= 22 -> 95;
seal_limit({1, Step}) when Step >= 21 -> 90;
seal_limit({1, Step}) when Step >= 20 -> 85;
seal_limit({1, Step}) when Step >= 19 -> 80;
seal_limit({1, Step}) when Step >= 18 -> 75;
seal_limit({1, Step}) when Step >= 17 -> 70;
seal_limit({1, Step}) when Step >= 16 -> 65;
seal_limit({1, Step}) when Step >= 15 -> 60;
seal_limit({1, Step}) when Step >= 14 -> 55;
seal_limit({1, Step}) when Step >= 13 -> 50;
seal_limit({1, Step}) when Step >= 12 -> 45;
seal_limit({1, Step}) when Step >= 11 -> 40;
seal_limit({1, Step}) when Step >= 10 -> 35;
seal_limit({1, Step}) when Step >= 9 -> 30;
seal_limit({1, Step}) when Step >= 8 -> 25;
seal_limit({1, Step}) when Step >= 7 -> 20;
seal_limit({1, Step}) when Step >= 6 -> 15;
seal_limit({1, Step}) when Step >= 5 -> 10;
seal_limit({1, Step}) when Step >= 4 -> 5;
seal_limit({1, Step}) when Step >= 3 -> 3;
seal_limit({1, Step}) when Step >= 2 -> 0;
seal_limit({1, Step}) when Step >= 1 -> 0;
seal_limit(_) -> 0.

career_ratio(4) -> [{atk, 1000}, {hp_max, 1000}];
career_ratio(3) -> [{atk, 1000}, {hp_max, 1000}];
career_ratio(2) -> [{atk, 1000}, {hp_max, 1000}];
career_ratio(5) -> [{atk, 1000}, {hp_max, 1000}];
career_ratio(_) -> 0.

list_quest() ->
    [101, 102, 103, 104, 201, 202, 203, 204, 301, 302, 303,
     304, 401, 402, 403, 404, 501, 502, 503, 504].

type_quest(5) -> [501, 502, 503, 504];
type_quest(4) -> [401, 402, 403, 404];
type_quest(3) -> [301, 302, 303, 304];
type_quest(2) -> [201, 202, 203, 204];
type_quest(1) -> [101, 102, 103, 104];
type_quest(_) -> [].

get_quest(101) ->
    #hallows_quest_data{id = 101, hid = 1,
			items = [{3, 50}],
			progress =
			    [#quest_progress{label = evt_dungeon_pass,
					     target = 10020, target_val = 1,
					     param = [chapter]}]};
get_quest(102) ->
    #hallows_quest_data{id = 102, hid = 1,
			items = [{3, 50}],
			progress =
			    [#quest_progress{label = evt_levup, target = 0,
					     target_val = 5, param = []}]};
get_quest(103) ->
    #hallows_quest_data{id = 103, hid = 1,
			items = [{3, 50}],
			progress =
			    [#quest_progress{label = evt_partner, target = 0,
					     target_val = 1,
					     param = [{lev, 20}]}]};
get_quest(104) ->
    #hallows_quest_data{id = 104, hid = 1,
			items = [{3, 50}],
			progress =
			    [#quest_progress{label = evt_recruit, target = 300,
					     target_val = 1, param = []}]};
get_quest(201) ->
    #hallows_quest_data{id = 201, hid = 2,
			items = [{3, 50}],
			progress =
			    [#quest_progress{label = evt_dungeon_pass,
					     target = 10200, target_val = 1,
					     param = [chapter]}]};
get_quest(202) ->
    #hallows_quest_data{id = 202, hid = 2,
			items = [{3, 50}],
			progress =
			    [#quest_progress{label = evt_levup, target = 0,
					     target_val = 10, param = []}]};
get_quest(203) ->
    #hallows_quest_data{id = 203, hid = 2,
			items = [{3, 50}],
			progress =
			    [#quest_progress{label = evt_arena_fight,
					     target = 0, target_val = 3,
					     param = []}]};
get_quest(204) ->
    #hallows_quest_data{id = 204, hid = 2,
			items = [{3, 50}],
			progress =
			    [#quest_progress{label = evt_shipping, target = 0,
					     target_val = 1, param = []}]};
get_quest(301) ->
    #hallows_quest_data{id = 301, hid = 3,
			items = [{3, 50}],
			progress =
			    [#quest_progress{label = evt_dungeon_pass,
					     target = 10300, target_val = 1,
					     param = [chapter]}]};
get_quest(302) ->
    #hallows_quest_data{id = 302, hid = 3,
			items = [{3, 50}],
			progress =
			    [#quest_progress{label = evt_levup, target = 0,
					     target_val = 15, param = []}]};
get_quest(303) ->
    #hallows_quest_data{id = 303, hid = 3,
			items = [{3, 50}],
			progress =
			    [#quest_progress{label = evt_dungeon_fast_combat,
					     target = 0, target_val = 1,
					     param = []}]};
get_quest(304) ->
    #hallows_quest_data{id = 304, hid = 3,
			items = [{3, 50}],
			progress =
			    [#quest_progress{label = evt_mystery_buy,
					     target = 4, target_val = 3,
					     param = []}]};
get_quest(401) ->
    #hallows_quest_data{id = 401, hid = 4,
			items = [{3, 50}],
			progress =
			    [#quest_progress{label = evt_dungeon_pass,
					     target = 20100, target_val = 1,
					     param = [chapter]}]};
get_quest(402) ->
    #hallows_quest_data{id = 402, hid = 4,
			items = [{3, 50}],
			progress =
			    [#quest_progress{label = evt_levup, target = 0,
					     target_val = 20, param = []}]};
get_quest(403) ->
    #hallows_quest_data{id = 403, hid = 4,
			items = [{3, 50}],
			progress =
			    [#quest_progress{label = evt_guild_dun_fight,
					     target = 0, target_val = 1,
					     param = []}]};
get_quest(404) ->
    #hallows_quest_data{id = 404, hid = 4,
			items = [{3, 50}],
			progress =
			    [#quest_progress{label = evt_star_tower_floor_pass,
					     target = 0, target_val = 10,
					     param = []}]};
get_quest(501) ->
    #hallows_quest_data{id = 501, hid = 5,
			items = [{3, 50}],
			progress =
			    [#quest_progress{label = evt_dungeon_pass,
					     target = 20300, target_val = 1,
					     param = [chapter]}]};
get_quest(502) ->
    #hallows_quest_data{id = 502, hid = 5,
			items = [{3, 50}],
			progress =
			    [#quest_progress{label = evt_levup, target = 0,
					     target_val = 25, param = []}]};
get_quest(503) ->
    #hallows_quest_data{id = 503, hid = 5,
			items = [{3, 50}],
			progress =
			    [#quest_progress{label = evt_power, target = 0,
					     target_val = 50000, param = []}]};
get_quest(504) ->
    #hallows_quest_data{id = 504, hid = 5,
			items = [{3, 50}],
			progress =
			    [#quest_progress{label = evt_partner_star_up,
					     target = 5, target_val = 1,
					     param = []}]};
get_quest(_Info) ->
    logger:data_error("get_quest_data_not_exist===>~w",
		      [_Info], hallows_data, 1998),
    undefined.

get_attr({1, 1}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({1, 2}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({1, 3}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({1, 4}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({1, 5}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({1, 6}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({1, 7}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({1, 8}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({1, 9}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({1, 10}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({1, 11}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({1, 12}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({1, 13}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({1, 14}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({1, 15}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({1, 16}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({1, 17}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({1, 18}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({1, 19}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({1, 20}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({1, 21}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({1, 22}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({1, 23}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({1, 24}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({2, 1}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({2, 2}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({2, 3}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({2, 4}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({2, 5}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({2, 6}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({2, 7}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({2, 8}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({2, 9}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({2, 10}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({2, 11}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({2, 12}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({2, 13}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({2, 14}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({2, 15}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({2, 16}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({2, 17}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({2, 18}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({2, 19}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({2, 20}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({2, 21}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({2, 22}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({2, 23}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({2, 24}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({3, 1}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({3, 2}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({3, 3}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({3, 4}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({3, 5}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({3, 6}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({3, 7}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({3, 8}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({3, 9}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({3, 10}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({3, 11}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({3, 12}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({3, 13}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({3, 14}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({3, 15}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({3, 16}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({3, 17}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({3, 18}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({3, 19}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({3, 20}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({3, 21}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({3, 22}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({3, 23}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({3, 24}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({4, 1}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({4, 2}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({4, 3}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({4, 4}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({4, 5}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({4, 6}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({4, 7}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({4, 8}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({4, 9}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({4, 10}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({4, 11}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({4, 12}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({4, 13}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({4, 14}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({4, 15}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({4, 16}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({4, 17}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({4, 18}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({4, 19}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({4, 20}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({4, 21}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({4, 22}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({4, 23}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({4, 24}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({5, 1}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({5, 2}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({5, 3}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({5, 4}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({5, 5}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({5, 6}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({5, 7}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({5, 8}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({5, 9}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({5, 10}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({5, 11}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({5, 12}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({5, 13}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({5, 14}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({5, 15}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({5, 16}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({5, 17}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({5, 18}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({5, 19}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({5, 20}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({5, 21}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({5, 22}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({5, 23}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr({5, 24}) ->
    #attr{atk = 0, def_p = 1, def_s = 1, hp_max = 999999,
	  speed = 9999, hit_rate = 10000, dodge_rate = 0,
	  crit_rate = 2000, crit_ratio = 1000, hit_magic = 0,
	  dodge_magic = 100, res = 95, res_p = 95, res_s = 95};
get_attr(_Info) ->
    logger:data_error("get_attr_data_not_exist===>~w",
		      [_Info], hallows_data, 4040),
    undefined.

look_list_quest() -> [101, 103, 104, 106].

look_type_quest(2) -> [101, 103, 104, 106];
look_type_quest(_) -> [].

get_look_quest(101) ->
    #hallows_quest_data{id = 101, hid = 2,
			items = [{3, 50}],
			progress =
			    [#quest_progress{label = evt_levup, target = 0,
					     target_val = 70, param = []}]};
get_look_quest(103) ->
    #hallows_quest_data{id = 103, hid = 2,
			items = [{3, 50}],
			progress =
			    [#quest_progress{label = evt_levup, target = 0,
					     target_val = 130, param = []}]};
get_look_quest(104) ->
    #hallows_quest_data{id = 104, hid = 2,
			items = [{3, 50}],
			progress =
			    [#quest_progress{label = evt_partner, target = 0,
					     target_val = 2,
					     param = [{star, 10}]}]};
get_look_quest(106) ->
    #hallows_quest_data{id = 106, hid = 2,
			items = [{3, 50}],
			progress =
			    [#quest_progress{label = evt_recruit_high,
					     target = 0, target_val = 20,
					     param = []}]};
get_look_quest(_Info) ->
    logger:data_error("get_look_quest_data_not_exist===>~w",
		      [_Info], hallows_data, 4075),
    undefined.

get_look(1) ->
    #hallows_look_data{id = 1,
		       name = lang:get(<<"死神镰刀"/utf8>>),
		       attr = [{hp_max_per, 20}, {atk_per, 20}], is_item = 2,
		       time = 604800, loss = [{72109, 1}]};
get_look(2) ->
    #hallows_look_data{id = 2,
		       name = lang:get(<<"烈焰之剑"/utf8>>),
		       attr = [{hp_max_per, 30}, {atk_per, 30}], is_item = 0,
		       time = 0};
get_look(3) ->
    #hallows_look_data{id = 3,
		       name = lang:get(<<"海神三叉戟"/utf8>>),
		       attr = [{hp_max_per, 30}, {atk_per, 30}], is_item = 2,
		       time = 1209600, loss = [{72111, 1}]};
get_look(4) ->
    #hallows_look_data{id = 4,
		       name = lang:get(<<"精灵秘典"/utf8>>),
		       attr = [{hp_max_per, 50}, {atk_per, 50}], is_item = 2,
		       time = 2419200, loss = [{72112, 1}]};
get_look(_Info) ->
    logger:data_error("get_look_data_not_exist===>~w",
		      [_Info], hallows_data, 4112),
    undefined.

get_look_attr(1) -> [{hp_max_per, 20}, {atk_per, 20}];
get_look_attr(2) -> [{hp_max_per, 30}, {atk_per, 30}];
get_look_attr(3) -> [{hp_max_per, 30}, {atk_per, 30}];
get_look_attr(4) -> [{hp_max_per, 50}, {atk_per, 50}];
get_look_attr(_) -> [].

skill_look_bid({801001, 1}) -> 801101;
skill_look_bid({801002, 1}) -> 801102;
skill_look_bid({801003, 1}) -> 801103;
skill_look_bid({801004, 1}) -> 801104;
skill_look_bid({801005, 1}) -> 801105;
skill_look_bid({801006, 1}) -> 801106;
skill_look_bid({801007, 1}) -> 801107;
skill_look_bid({801008, 1}) -> 801108;
skill_look_bid({801009, 1}) -> 801109;
skill_look_bid({801010, 1}) -> 801110;
skill_look_bid({801011, 1}) -> 801111;
skill_look_bid({801012, 1}) -> 801112;
skill_look_bid({801001, 2}) -> 801201;
skill_look_bid({801002, 2}) -> 801202;
skill_look_bid({801003, 2}) -> 801203;
skill_look_bid({801004, 2}) -> 801204;
skill_look_bid({801005, 2}) -> 801205;
skill_look_bid({801006, 2}) -> 801206;
skill_look_bid({801007, 2}) -> 801207;
skill_look_bid({801008, 2}) -> 801208;
skill_look_bid({801009, 2}) -> 801209;
skill_look_bid({801010, 2}) -> 801210;
skill_look_bid({801011, 2}) -> 801211;
skill_look_bid({801012, 2}) -> 801212;
skill_look_bid({801001, 3}) -> 801301;
skill_look_bid({801002, 3}) -> 801302;
skill_look_bid({801003, 3}) -> 801303;
skill_look_bid({801004, 3}) -> 801304;
skill_look_bid({801005, 3}) -> 801305;
skill_look_bid({801006, 3}) -> 801306;
skill_look_bid({801007, 3}) -> 801307;
skill_look_bid({801008, 3}) -> 801308;
skill_look_bid({801009, 3}) -> 801309;
skill_look_bid({801010, 3}) -> 801310;
skill_look_bid({801011, 3}) -> 801311;
skill_look_bid({801012, 3}) -> 801312;
skill_look_bid({801001, 4}) -> 801401;
skill_look_bid({801002, 4}) -> 801402;
skill_look_bid({801003, 4}) -> 801403;
skill_look_bid({801004, 4}) -> 801404;
skill_look_bid({801005, 4}) -> 801405;
skill_look_bid({801006, 4}) -> 801406;
skill_look_bid({801007, 4}) -> 801407;
skill_look_bid({801008, 4}) -> 801408;
skill_look_bid({801009, 4}) -> 801409;
skill_look_bid({801010, 4}) -> 801410;
skill_look_bid({801011, 4}) -> 801411;
skill_look_bid({801012, 4}) -> 801412;
skill_look_bid({802001, 1}) -> 802101;
skill_look_bid({802002, 1}) -> 802102;
skill_look_bid({802003, 1}) -> 802103;
skill_look_bid({802004, 1}) -> 802104;
skill_look_bid({802005, 1}) -> 802105;
skill_look_bid({802006, 1}) -> 802106;
skill_look_bid({802007, 1}) -> 802107;
skill_look_bid({802008, 1}) -> 802108;
skill_look_bid({802009, 1}) -> 802109;
skill_look_bid({802010, 1}) -> 802110;
skill_look_bid({802011, 1}) -> 802111;
skill_look_bid({802012, 1}) -> 802112;
skill_look_bid({802001, 2}) -> 802201;
skill_look_bid({802002, 2}) -> 802202;
skill_look_bid({802003, 2}) -> 802203;
skill_look_bid({802004, 2}) -> 802204;
skill_look_bid({802005, 2}) -> 802205;
skill_look_bid({802006, 2}) -> 802206;
skill_look_bid({802007, 2}) -> 802207;
skill_look_bid({802008, 2}) -> 802208;
skill_look_bid({802009, 2}) -> 802209;
skill_look_bid({802010, 2}) -> 802210;
skill_look_bid({802011, 2}) -> 802211;
skill_look_bid({802012, 2}) -> 802212;
skill_look_bid({802001, 3}) -> 802301;
skill_look_bid({802002, 3}) -> 802302;
skill_look_bid({802003, 3}) -> 802303;
skill_look_bid({802004, 3}) -> 802304;
skill_look_bid({802005, 3}) -> 802305;
skill_look_bid({802006, 3}) -> 802306;
skill_look_bid({802007, 3}) -> 802307;
skill_look_bid({802008, 3}) -> 802308;
skill_look_bid({802009, 3}) -> 802309;
skill_look_bid({802010, 3}) -> 802310;
skill_look_bid({802011, 3}) -> 802311;
skill_look_bid({802012, 3}) -> 802312;
skill_look_bid({802001, 4}) -> 802401;
skill_look_bid({802002, 4}) -> 802402;
skill_look_bid({802003, 4}) -> 802403;
skill_look_bid({802004, 4}) -> 802404;
skill_look_bid({802005, 4}) -> 802405;
skill_look_bid({802006, 4}) -> 802406;
skill_look_bid({802007, 4}) -> 802407;
skill_look_bid({802008, 4}) -> 802408;
skill_look_bid({802009, 4}) -> 802409;
skill_look_bid({802010, 4}) -> 802410;
skill_look_bid({802011, 4}) -> 802411;
skill_look_bid({802012, 4}) -> 802412;
skill_look_bid({803001, 1}) -> 803101;
skill_look_bid({803002, 1}) -> 803102;
skill_look_bid({803003, 1}) -> 803103;
skill_look_bid({803004, 1}) -> 803104;
skill_look_bid({803005, 1}) -> 803105;
skill_look_bid({803006, 1}) -> 803106;
skill_look_bid({803007, 1}) -> 803107;
skill_look_bid({803008, 1}) -> 803108;
skill_look_bid({803009, 1}) -> 803109;
skill_look_bid({803010, 1}) -> 803110;
skill_look_bid({803011, 1}) -> 803111;
skill_look_bid({803012, 1}) -> 803112;
skill_look_bid({803001, 2}) -> 803201;
skill_look_bid({803002, 2}) -> 803202;
skill_look_bid({803003, 2}) -> 803203;
skill_look_bid({803004, 2}) -> 803204;
skill_look_bid({803005, 2}) -> 803205;
skill_look_bid({803006, 2}) -> 803206;
skill_look_bid({803007, 2}) -> 803207;
skill_look_bid({803008, 2}) -> 803208;
skill_look_bid({803009, 2}) -> 803209;
skill_look_bid({803010, 2}) -> 803210;
skill_look_bid({803011, 2}) -> 803211;
skill_look_bid({803012, 2}) -> 803212;
skill_look_bid({803001, 3}) -> 803301;
skill_look_bid({803002, 3}) -> 803302;
skill_look_bid({803003, 3}) -> 803303;
skill_look_bid({803004, 3}) -> 803304;
skill_look_bid({803005, 3}) -> 803305;
skill_look_bid({803006, 3}) -> 803306;
skill_look_bid({803007, 3}) -> 803307;
skill_look_bid({803008, 3}) -> 803308;
skill_look_bid({803009, 3}) -> 803309;
skill_look_bid({803010, 3}) -> 803310;
skill_look_bid({803011, 3}) -> 803311;
skill_look_bid({803012, 3}) -> 803312;
skill_look_bid({803001, 4}) -> 803401;
skill_look_bid({803002, 4}) -> 803402;
skill_look_bid({803003, 4}) -> 803403;
skill_look_bid({803004, 4}) -> 803404;
skill_look_bid({803005, 4}) -> 803405;
skill_look_bid({803006, 4}) -> 803406;
skill_look_bid({803007, 4}) -> 803407;
skill_look_bid({803008, 4}) -> 803408;
skill_look_bid({803009, 4}) -> 803409;
skill_look_bid({803010, 4}) -> 803410;
skill_look_bid({803011, 4}) -> 803411;
skill_look_bid({803012, 4}) -> 803412;
skill_look_bid({805001, 1}) -> 805101;
skill_look_bid({805002, 1}) -> 805102;
skill_look_bid({805003, 1}) -> 805103;
skill_look_bid({805004, 1}) -> 805104;
skill_look_bid({805005, 1}) -> 805105;
skill_look_bid({805006, 1}) -> 805106;
skill_look_bid({805007, 1}) -> 805107;
skill_look_bid({805008, 1}) -> 805108;
skill_look_bid({805009, 1}) -> 805109;
skill_look_bid({805010, 1}) -> 805110;
skill_look_bid({805011, 1}) -> 805111;
skill_look_bid({805012, 1}) -> 805112;
skill_look_bid({805001, 2}) -> 805201;
skill_look_bid({805002, 2}) -> 805202;
skill_look_bid({805003, 2}) -> 805203;
skill_look_bid({805004, 2}) -> 805204;
skill_look_bid({805005, 2}) -> 805205;
skill_look_bid({805006, 2}) -> 805206;
skill_look_bid({805007, 2}) -> 805207;
skill_look_bid({805008, 2}) -> 805208;
skill_look_bid({805009, 2}) -> 805209;
skill_look_bid({805010, 2}) -> 805210;
skill_look_bid({805011, 2}) -> 805211;
skill_look_bid({805012, 2}) -> 805212;
skill_look_bid({805001, 3}) -> 805301;
skill_look_bid({805002, 3}) -> 805302;
skill_look_bid({805003, 3}) -> 805303;
skill_look_bid({805004, 3}) -> 805304;
skill_look_bid({805005, 3}) -> 805305;
skill_look_bid({805006, 3}) -> 805306;
skill_look_bid({805007, 3}) -> 805307;
skill_look_bid({805008, 3}) -> 805308;
skill_look_bid({805009, 3}) -> 805309;
skill_look_bid({805010, 3}) -> 805310;
skill_look_bid({805011, 3}) -> 805311;
skill_look_bid({805012, 3}) -> 805312;
skill_look_bid({805001, 4}) -> 805401;
skill_look_bid({805002, 4}) -> 805402;
skill_look_bid({805003, 4}) -> 805403;
skill_look_bid({805004, 4}) -> 805404;
skill_look_bid({805005, 4}) -> 805405;
skill_look_bid({805006, 4}) -> 805406;
skill_look_bid({805007, 4}) -> 805407;
skill_look_bid({805008, 4}) -> 805408;
skill_look_bid({805009, 4}) -> 805409;
skill_look_bid({805010, 4}) -> 805410;
skill_look_bid({805011, 4}) -> 805411;
skill_look_bid({805012, 4}) -> 805412;
skill_look_bid({807001, 1}) -> 807101;
skill_look_bid({807002, 1}) -> 807102;
skill_look_bid({807003, 1}) -> 807103;
skill_look_bid({807004, 1}) -> 807104;
skill_look_bid({807005, 1}) -> 807105;
skill_look_bid({807006, 1}) -> 807106;
skill_look_bid({807007, 1}) -> 807107;
skill_look_bid({807008, 1}) -> 807108;
skill_look_bid({807009, 1}) -> 807109;
skill_look_bid({807010, 1}) -> 807110;
skill_look_bid({807011, 1}) -> 807111;
skill_look_bid({807012, 1}) -> 807112;
skill_look_bid({807001, 2}) -> 807201;
skill_look_bid({807002, 2}) -> 807202;
skill_look_bid({807003, 2}) -> 807203;
skill_look_bid({807004, 2}) -> 807204;
skill_look_bid({807005, 2}) -> 807205;
skill_look_bid({807006, 2}) -> 807206;
skill_look_bid({807007, 2}) -> 807207;
skill_look_bid({807008, 2}) -> 807208;
skill_look_bid({807009, 2}) -> 807209;
skill_look_bid({807010, 2}) -> 807210;
skill_look_bid({807011, 2}) -> 807211;
skill_look_bid({807012, 2}) -> 807212;
skill_look_bid({807001, 3}) -> 807301;
skill_look_bid({807002, 3}) -> 807302;
skill_look_bid({807003, 3}) -> 807303;
skill_look_bid({807004, 3}) -> 807304;
skill_look_bid({807005, 3}) -> 807305;
skill_look_bid({807006, 3}) -> 807306;
skill_look_bid({807007, 3}) -> 807307;
skill_look_bid({807008, 3}) -> 807308;
skill_look_bid({807009, 3}) -> 807309;
skill_look_bid({807010, 3}) -> 807310;
skill_look_bid({807011, 3}) -> 807311;
skill_look_bid({807012, 3}) -> 807312;
skill_look_bid({807001, 4}) -> 807401;
skill_look_bid({807002, 4}) -> 807402;
skill_look_bid({807003, 4}) -> 807403;
skill_look_bid({807004, 4}) -> 807404;
skill_look_bid({807005, 4}) -> 807405;
skill_look_bid({807006, 4}) -> 807406;
skill_look_bid({807007, 4}) -> 807407;
skill_look_bid({807008, 4}) -> 807408;
skill_look_bid({807009, 4}) -> 807409;
skill_look_bid({807010, 4}) -> 807410;
skill_look_bid({807011, 4}) -> 807411;
skill_look_bid({807012, 4}) -> 807412;
skill_look_bid(_) -> 0.

skill_look_order({1, 1}) -> [80110];
skill_look_order({1, 2}) -> [80120];
skill_look_order({1, 3}) -> [80130];
skill_look_order({1, 4}) -> [80140];
skill_look_order({2, 1}) -> [80210];
skill_look_order({2, 2}) -> [80220];
skill_look_order({2, 3}) -> [80230];
skill_look_order({2, 4}) -> [80240];
skill_look_order({3, 1}) -> [80310];
skill_look_order({3, 2}) -> [80320];
skill_look_order({3, 3}) -> [80330];
skill_look_order({3, 4}) -> [80340];
skill_look_order({4, 1}) -> [80410];
skill_look_order({4, 2}) -> [80420];
skill_look_order({4, 3}) -> [80430];
skill_look_order({4, 4}) -> [80440];
skill_look_order({5, 1}) -> [80510];
skill_look_order({5, 2}) -> [80520];
skill_look_order({5, 3}) -> [80530];
skill_look_order({5, 4}) -> [80540];
skill_look_order(_) -> [].


