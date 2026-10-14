-file("data/boss_data.erl", 1).

-module(boss_data).

-export([get_const/1, list_boss/0, get_boss/1,
	 month_boss/1, list_world_boss/0, get_world_boss/1,
	 world_combat_reward/1, world_rank_reward/1,
	 world_buy_num/1]).

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

-file("data/boss_data.erl", 18).

-file("../server/inc/boss.hrl", 1).

-record(m_boss,
	{ver = 2, boss_list = [], world_num_time = 0,
	 world_can_num = 0, world_had_num = 0, world_buy_num = 0,
	 world_remind = [], extra_boss = []}).

-record(boss, {id = 0, win = 0, status = 0}).

-record(world_boss,
	{id = 0, hp = 0, hp_max = 0, rnum = 0, start_time = 0,
	 ref_time = 0, role_list = [], kill_log = []}).

-record(world_boss_role,
	{id = {0, <<>>}, name = <<>>, sex = 0, face = 0,
	 lev = 0, hurt = 0, power = 0, time = 0}).

-record(boss_data,
	{id = 0, name = <<>>, lev = 0, base_items = [],
	 drop_ids = [], month_boss_tag = 0, show_lev = 0,
	 first_items = [], hook_lose = []}).

-record(world_boss_data,
	{id = 0, name = <<>>, lev = 0, ref_time = 0,
	 ref_item_num = 0, base_items = [], show_lev = 0}).

-file("data/boss_data.erl", 19).

get_const(open_lev) -> 20;
get_const(limit_time) -> 10;
get_const(renew_time) -> 7200;
get_const(boss_item) -> 10002;
get_const(vip_lev) -> 5;
get_const(skip_vip_lev) -> 3;
get_const(skip_lev) -> 30;
get_const(_) -> undefined.

list_boss() ->
    [71001, 71002, 71003, 71004, 71005, 71006, 71007, 71008,
     71009, 72000, 72001, 72002, 72003, 72004, 72005, 72006,
     72007, 72008, 72009, 72010, 72011, 72012, 72013, 72014,
     72015, 72016, 72017, 72018, 72019, 72020, 72021, 72022,
     72023, 72024, 72025, 72026, 72027, 72028, 72029, 72030,
     72031, 72032, 72033, 72034, 72035, 72036, 72037, 72038,
     72039, 72040, 72041, 72042, 72043, 72044, 72045, 72046,
     72047, 72048, 72049, 72050, 72051, 72052, 72053, 72054,
     72055, 72056, 72057, 72058, 72059, 72060, 72061, 72062,
     72063, 72064, 72065, 72066, 72067, 72068, 72069, 72070,
     72071, 72072, 72073, 72074, 72075, 72076, 72077, 72078,
     72079, 72080, 73000, 73001, 73002, 73003, 73004, 73005,
     73006, 73007, 73008, 73009, 73010, 73011, 73012, 73013,
     73014, 73015, 73016, 73017, 73018, 73019, 73020, 73021,
     73022, 73023, 73024, 73025, 73026, 73027, 73028, 73029,
     73030, 73031, 73032, 73033, 73034, 73035, 73036, 73037,
     73038, 73039, 73040, 73041, 73042, 73043, 73044, 73045,
     73046, 73047, 73048, 73049, 73050, 73051, 73052, 73053,
     73054, 73055, 73056, 73057, 73058, 73059, 73060, 73061,
     73062, 73063, 73064, 73065, 73066, 73067, 73068, 73069,
     73070, 73071, 73072, 73073, 73074, 73075, 73076, 73077,
     73078, 73079, 73080].

get_boss(71001) ->
    #boss_data{id = 71001, name = lang:get(<<"阴影法师"/utf8>>),
	       lev = 20, base_items = [{13, 2}], drop_ids = [40002],
	       month_boss_tag = 0, show_lev = 10,
	       first_items = [{13, 10}], hook_lose = [{15, 20}]};
get_boss(71002) ->
    #boss_data{id = 71002, name = lang:get(<<"黑暗渊冰"/utf8>>),
	       lev = 30, base_items = [{13, 2}], drop_ids = [40003],
	       month_boss_tag = 0, show_lev = 20,
	       first_items = [{13, 20}], hook_lose = [{15, 20}]};
get_boss(71003) ->
    #boss_data{id = 71003, name = lang:get(<<"丛林迷影"/utf8>>),
	       lev = 40, base_items = [{13, 2}], drop_ids = [40004],
	       month_boss_tag = 0, show_lev = 30,
	       first_items = [{13, 30}], hook_lose = [{15, 20}]};
get_boss(71004) ->
    #boss_data{id = 71004, name = lang:get(<<"浴火凤凰"/utf8>>),
	       lev = 50, base_items = [{13, 2}], drop_ids = [40005],
	       month_boss_tag = 0, show_lev = 40,
	       first_items = [{13, 40}], hook_lose = [{15, 20}]};
get_boss(71005) ->
    #boss_data{id = 71005, name = lang:get(<<"静默刺客"/utf8>>),
	       lev = 60, base_items = [{13, 2}], drop_ids = [40006],
	       month_boss_tag = 0, show_lev = 50,
	       first_items = [{13, 50}], hook_lose = [{15, 20}]};
get_boss(71006) ->
    #boss_data{id = 71006, name = lang:get(<<"妖艳黑爪"/utf8>>),
	       lev = 70, base_items = [{13, 2}], drop_ids = [40007],
	       month_boss_tag = 0, show_lev = 60,
	       first_items = [{13, 60}], hook_lose = [{15, 20}]};
get_boss(71007) ->
    #boss_data{id = 71007,
	       name = lang:get(<<"传说的三人"/utf8>>), lev = 80,
	       base_items = [{13, 2}], drop_ids = [40008],
	       month_boss_tag = 0, show_lev = 70,
	       first_items = [{13, 70}], hook_lose = [{15, 20}]};
get_boss(71008) ->
    #boss_data{id = 71008, name = lang:get(<<"太阳之耀"/utf8>>),
	       lev = 90, base_items = [{13, 2}], drop_ids = [40009],
	       month_boss_tag = 0, show_lev = 80,
	       first_items = [{13, 80}], hook_lose = [{15, 20}]};
get_boss(71009) ->
    #boss_data{id = 71009, name = lang:get(<<"吞神者"/utf8>>),
	       lev = 100, base_items = [{13, 2}], drop_ids = [40010],
	       month_boss_tag = 0, show_lev = 90,
	       first_items = [{13, 90}], hook_lose = [{15, 20}]};
get_boss(72000) ->
    #boss_data{id = 72000,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 20,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72001) ->
    #boss_data{id = 72001,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 21,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72002) ->
    #boss_data{id = 72002,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 22,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72003) ->
    #boss_data{id = 72003,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 23,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72004) ->
    #boss_data{id = 72004,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 24,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72005) ->
    #boss_data{id = 72005,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 25,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72006) ->
    #boss_data{id = 72006,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 26,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72007) ->
    #boss_data{id = 72007,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 27,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72008) ->
    #boss_data{id = 72008,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 28,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72009) ->
    #boss_data{id = 72009,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 29,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72010) ->
    #boss_data{id = 72010,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 30,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72011) ->
    #boss_data{id = 72011,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 31,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72012) ->
    #boss_data{id = 72012,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 32,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72013) ->
    #boss_data{id = 72013,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 33,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72014) ->
    #boss_data{id = 72014,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 34,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72015) ->
    #boss_data{id = 72015,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 35,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72016) ->
    #boss_data{id = 72016,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 36,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72017) ->
    #boss_data{id = 72017,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 37,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72018) ->
    #boss_data{id = 72018,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 38,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72019) ->
    #boss_data{id = 72019,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 39,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72020) ->
    #boss_data{id = 72020,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 40,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72021) ->
    #boss_data{id = 72021,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 41,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72022) ->
    #boss_data{id = 72022,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 42,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72023) ->
    #boss_data{id = 72023,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 43,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72024) ->
    #boss_data{id = 72024,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 44,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72025) ->
    #boss_data{id = 72025,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 45,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72026) ->
    #boss_data{id = 72026,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 46,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72027) ->
    #boss_data{id = 72027,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 47,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72028) ->
    #boss_data{id = 72028,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 48,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72029) ->
    #boss_data{id = 72029,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 49,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72030) ->
    #boss_data{id = 72030,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 50,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72031) ->
    #boss_data{id = 72031,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 51,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72032) ->
    #boss_data{id = 72032,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 52,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72033) ->
    #boss_data{id = 72033,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 53,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72034) ->
    #boss_data{id = 72034,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 54,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72035) ->
    #boss_data{id = 72035,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 55,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72036) ->
    #boss_data{id = 72036,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 56,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72037) ->
    #boss_data{id = 72037,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 57,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72038) ->
    #boss_data{id = 72038,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 58,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72039) ->
    #boss_data{id = 72039,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 59,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72040) ->
    #boss_data{id = 72040,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 60,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72041) ->
    #boss_data{id = 72041,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 61,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72042) ->
    #boss_data{id = 72042,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 62,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72043) ->
    #boss_data{id = 72043,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 63,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72044) ->
    #boss_data{id = 72044,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 64,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72045) ->
    #boss_data{id = 72045,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 65,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72046) ->
    #boss_data{id = 72046,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 66,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72047) ->
    #boss_data{id = 72047,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 67,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72048) ->
    #boss_data{id = 72048,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 68,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72049) ->
    #boss_data{id = 72049,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 69,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72050) ->
    #boss_data{id = 72050,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 70,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72051) ->
    #boss_data{id = 72051,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 71,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72052) ->
    #boss_data{id = 72052,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 72,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72053) ->
    #boss_data{id = 72053,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 73,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72054) ->
    #boss_data{id = 72054,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 74,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72055) ->
    #boss_data{id = 72055,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 75,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72056) ->
    #boss_data{id = 72056,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 76,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72057) ->
    #boss_data{id = 72057,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 77,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72058) ->
    #boss_data{id = 72058,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 78,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72059) ->
    #boss_data{id = 72059,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 79,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72060) ->
    #boss_data{id = 72060,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 80,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72061) ->
    #boss_data{id = 72061,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 81,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72062) ->
    #boss_data{id = 72062,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 82,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72063) ->
    #boss_data{id = 72063,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 83,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72064) ->
    #boss_data{id = 72064,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 84,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72065) ->
    #boss_data{id = 72065,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 85,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72066) ->
    #boss_data{id = 72066,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 86,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72067) ->
    #boss_data{id = 72067,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 87,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72068) ->
    #boss_data{id = 72068,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 88,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72069) ->
    #boss_data{id = 72069,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 89,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72070) ->
    #boss_data{id = 72070,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 90,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72071) ->
    #boss_data{id = 72071,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 91,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72072) ->
    #boss_data{id = 72072,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 92,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72073) ->
    #boss_data{id = 72073,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 93,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72074) ->
    #boss_data{id = 72074,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 94,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72075) ->
    #boss_data{id = 72075,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 95,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72076) ->
    #boss_data{id = 72076,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 96,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72077) ->
    #boss_data{id = 72077,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 97,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72078) ->
    #boss_data{id = 72078,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 98,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72079) ->
    #boss_data{id = 72079,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 99,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(72080) ->
    #boss_data{id = 72080,
	       name = lang:get(<<"荣耀月卡专属"/utf8>>), lev = 100,
	       base_items = [{13, 2}], drop_ids = [40030],
	       month_boss_tag = 1, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73000) ->
    #boss_data{id = 73000,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 20,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73001) ->
    #boss_data{id = 73001,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 21,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73002) ->
    #boss_data{id = 73002,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 22,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73003) ->
    #boss_data{id = 73003,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 23,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73004) ->
    #boss_data{id = 73004,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 24,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73005) ->
    #boss_data{id = 73005,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 25,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73006) ->
    #boss_data{id = 73006,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 26,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73007) ->
    #boss_data{id = 73007,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 27,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73008) ->
    #boss_data{id = 73008,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 28,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73009) ->
    #boss_data{id = 73009,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 29,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73010) ->
    #boss_data{id = 73010,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 30,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73011) ->
    #boss_data{id = 73011,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 31,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73012) ->
    #boss_data{id = 73012,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 32,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73013) ->
    #boss_data{id = 73013,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 33,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73014) ->
    #boss_data{id = 73014,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 34,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73015) ->
    #boss_data{id = 73015,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 35,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73016) ->
    #boss_data{id = 73016,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 36,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73017) ->
    #boss_data{id = 73017,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 37,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73018) ->
    #boss_data{id = 73018,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 38,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73019) ->
    #boss_data{id = 73019,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 39,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73020) ->
    #boss_data{id = 73020,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 40,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73021) ->
    #boss_data{id = 73021,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 41,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73022) ->
    #boss_data{id = 73022,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 42,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73023) ->
    #boss_data{id = 73023,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 43,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73024) ->
    #boss_data{id = 73024,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 44,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73025) ->
    #boss_data{id = 73025,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 45,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73026) ->
    #boss_data{id = 73026,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 46,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73027) ->
    #boss_data{id = 73027,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 47,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73028) ->
    #boss_data{id = 73028,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 48,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73029) ->
    #boss_data{id = 73029,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 49,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73030) ->
    #boss_data{id = 73030,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 50,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73031) ->
    #boss_data{id = 73031,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 51,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73032) ->
    #boss_data{id = 73032,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 52,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73033) ->
    #boss_data{id = 73033,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 53,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73034) ->
    #boss_data{id = 73034,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 54,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73035) ->
    #boss_data{id = 73035,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 55,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73036) ->
    #boss_data{id = 73036,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 56,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73037) ->
    #boss_data{id = 73037,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 57,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73038) ->
    #boss_data{id = 73038,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 58,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73039) ->
    #boss_data{id = 73039,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 59,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73040) ->
    #boss_data{id = 73040,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 60,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73041) ->
    #boss_data{id = 73041,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 61,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73042) ->
    #boss_data{id = 73042,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 62,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73043) ->
    #boss_data{id = 73043,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 63,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73044) ->
    #boss_data{id = 73044,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 64,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73045) ->
    #boss_data{id = 73045,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 65,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73046) ->
    #boss_data{id = 73046,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 66,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73047) ->
    #boss_data{id = 73047,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 67,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73048) ->
    #boss_data{id = 73048,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 68,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73049) ->
    #boss_data{id = 73049,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 69,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73050) ->
    #boss_data{id = 73050,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 70,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73051) ->
    #boss_data{id = 73051,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 71,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73052) ->
    #boss_data{id = 73052,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 72,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73053) ->
    #boss_data{id = 73053,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 73,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73054) ->
    #boss_data{id = 73054,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 74,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73055) ->
    #boss_data{id = 73055,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 75,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73056) ->
    #boss_data{id = 73056,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 76,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73057) ->
    #boss_data{id = 73057,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 77,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73058) ->
    #boss_data{id = 73058,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 78,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73059) ->
    #boss_data{id = 73059,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 79,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73060) ->
    #boss_data{id = 73060,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 80,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73061) ->
    #boss_data{id = 73061,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 81,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73062) ->
    #boss_data{id = 73062,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 82,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73063) ->
    #boss_data{id = 73063,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 83,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73064) ->
    #boss_data{id = 73064,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 84,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73065) ->
    #boss_data{id = 73065,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 85,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73066) ->
    #boss_data{id = 73066,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 86,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73067) ->
    #boss_data{id = 73067,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 87,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73068) ->
    #boss_data{id = 73068,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 88,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73069) ->
    #boss_data{id = 73069,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 89,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73070) ->
    #boss_data{id = 73070,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 90,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73071) ->
    #boss_data{id = 73071,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 91,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73072) ->
    #boss_data{id = 73072,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 92,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73073) ->
    #boss_data{id = 73073,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 93,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73074) ->
    #boss_data{id = 73074,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 94,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73075) ->
    #boss_data{id = 73075,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 95,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73076) ->
    #boss_data{id = 73076,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 96,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73077) ->
    #boss_data{id = 73077,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 97,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73078) ->
    #boss_data{id = 73078,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 98,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73079) ->
    #boss_data{id = 73079,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 99,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(73080) ->
    #boss_data{id = 73080,
	       name = lang:get(<<"至尊月卡专属"/utf8>>), lev = 100,
	       base_items = [{13, 2}], drop_ids = [40031],
	       month_boss_tag = 2, show_lev = 10,
	       hook_lose = [{15, 20}]};
get_boss(_Info) ->
    lager:error(io_lib:format("get_boss_data_not_exist===>~w",
			      [_Info])),
    undefined.

month_boss({0, 20}) -> 71001;
month_boss({0, 30}) -> 71002;
month_boss({0, 40}) -> 71003;
month_boss({0, 50}) -> 71004;
month_boss({0, 60}) -> 71005;
month_boss({0, 70}) -> 71006;
month_boss({0, 80}) -> 71007;
month_boss({0, 90}) -> 71008;
month_boss({0, 100}) -> 71009;
month_boss({1, 20}) -> 72000;
month_boss({1, 21}) -> 72001;
month_boss({1, 22}) -> 72002;
month_boss({1, 23}) -> 72003;
month_boss({1, 24}) -> 72004;
month_boss({1, 25}) -> 72005;
month_boss({1, 26}) -> 72006;
month_boss({1, 27}) -> 72007;
month_boss({1, 28}) -> 72008;
month_boss({1, 29}) -> 72009;
month_boss({1, 30}) -> 72010;
month_boss({1, 31}) -> 72011;
month_boss({1, 32}) -> 72012;
month_boss({1, 33}) -> 72013;
month_boss({1, 34}) -> 72014;
month_boss({1, 35}) -> 72015;
month_boss({1, 36}) -> 72016;
month_boss({1, 37}) -> 72017;
month_boss({1, 38}) -> 72018;
month_boss({1, 39}) -> 72019;
month_boss({1, 40}) -> 72020;
month_boss({1, 41}) -> 72021;
month_boss({1, 42}) -> 72022;
month_boss({1, 43}) -> 72023;
month_boss({1, 44}) -> 72024;
month_boss({1, 45}) -> 72025;
month_boss({1, 46}) -> 72026;
month_boss({1, 47}) -> 72027;
month_boss({1, 48}) -> 72028;
month_boss({1, 49}) -> 72029;
month_boss({1, 50}) -> 72030;
month_boss({1, 51}) -> 72031;
month_boss({1, 52}) -> 72032;
month_boss({1, 53}) -> 72033;
month_boss({1, 54}) -> 72034;
month_boss({1, 55}) -> 72035;
month_boss({1, 56}) -> 72036;
month_boss({1, 57}) -> 72037;
month_boss({1, 58}) -> 72038;
month_boss({1, 59}) -> 72039;
month_boss({1, 60}) -> 72040;
month_boss({1, 61}) -> 72041;
month_boss({1, 62}) -> 72042;
month_boss({1, 63}) -> 72043;
month_boss({1, 64}) -> 72044;
month_boss({1, 65}) -> 72045;
month_boss({1, 66}) -> 72046;
month_boss({1, 67}) -> 72047;
month_boss({1, 68}) -> 72048;
month_boss({1, 69}) -> 72049;
month_boss({1, 70}) -> 72050;
month_boss({1, 71}) -> 72051;
month_boss({1, 72}) -> 72052;
month_boss({1, 73}) -> 72053;
month_boss({1, 74}) -> 72054;
month_boss({1, 75}) -> 72055;
month_boss({1, 76}) -> 72056;
month_boss({1, 77}) -> 72057;
month_boss({1, 78}) -> 72058;
month_boss({1, 79}) -> 72059;
month_boss({1, 80}) -> 72060;
month_boss({1, 81}) -> 72061;
month_boss({1, 82}) -> 72062;
month_boss({1, 83}) -> 72063;
month_boss({1, 84}) -> 72064;
month_boss({1, 85}) -> 72065;
month_boss({1, 86}) -> 72066;
month_boss({1, 87}) -> 72067;
month_boss({1, 88}) -> 72068;
month_boss({1, 89}) -> 72069;
month_boss({1, 90}) -> 72070;
month_boss({1, 91}) -> 72071;
month_boss({1, 92}) -> 72072;
month_boss({1, 93}) -> 72073;
month_boss({1, 94}) -> 72074;
month_boss({1, 95}) -> 72075;
month_boss({1, 96}) -> 72076;
month_boss({1, 97}) -> 72077;
month_boss({1, 98}) -> 72078;
month_boss({1, 99}) -> 72079;
month_boss({1, 100}) -> 72080;
month_boss({2, 20}) -> 73000;
month_boss({2, 21}) -> 73001;
month_boss({2, 22}) -> 73002;
month_boss({2, 23}) -> 73003;
month_boss({2, 24}) -> 73004;
month_boss({2, 25}) -> 73005;
month_boss({2, 26}) -> 73006;
month_boss({2, 27}) -> 73007;
month_boss({2, 28}) -> 73008;
month_boss({2, 29}) -> 73009;
month_boss({2, 30}) -> 73010;
month_boss({2, 31}) -> 73011;
month_boss({2, 32}) -> 73012;
month_boss({2, 33}) -> 73013;
month_boss({2, 34}) -> 73014;
month_boss({2, 35}) -> 73015;
month_boss({2, 36}) -> 73016;
month_boss({2, 37}) -> 73017;
month_boss({2, 38}) -> 73018;
month_boss({2, 39}) -> 73019;
month_boss({2, 40}) -> 73020;
month_boss({2, 41}) -> 73021;
month_boss({2, 42}) -> 73022;
month_boss({2, 43}) -> 73023;
month_boss({2, 44}) -> 73024;
month_boss({2, 45}) -> 73025;
month_boss({2, 46}) -> 73026;
month_boss({2, 47}) -> 73027;
month_boss({2, 48}) -> 73028;
month_boss({2, 49}) -> 73029;
month_boss({2, 50}) -> 73030;
month_boss({2, 51}) -> 73031;
month_boss({2, 52}) -> 73032;
month_boss({2, 53}) -> 73033;
month_boss({2, 54}) -> 73034;
month_boss({2, 55}) -> 73035;
month_boss({2, 56}) -> 73036;
month_boss({2, 57}) -> 73037;
month_boss({2, 58}) -> 73038;
month_boss({2, 59}) -> 73039;
month_boss({2, 60}) -> 73040;
month_boss({2, 61}) -> 73041;
month_boss({2, 62}) -> 73042;
month_boss({2, 63}) -> 73043;
month_boss({2, 64}) -> 73044;
month_boss({2, 65}) -> 73045;
month_boss({2, 66}) -> 73046;
month_boss({2, 67}) -> 73047;
month_boss({2, 68}) -> 73048;
month_boss({2, 69}) -> 73049;
month_boss({2, 70}) -> 73050;
month_boss({2, 71}) -> 73051;
month_boss({2, 72}) -> 73052;
month_boss({2, 73}) -> 73053;
month_boss({2, 74}) -> 73054;
month_boss({2, 75}) -> 73055;
month_boss({2, 76}) -> 73056;
month_boss({2, 77}) -> 73057;
month_boss({2, 78}) -> 73058;
month_boss({2, 79}) -> 73059;
month_boss({2, 80}) -> 73060;
month_boss({2, 81}) -> 73061;
month_boss({2, 82}) -> 73062;
month_boss({2, 83}) -> 73063;
month_boss({2, 84}) -> 73064;
month_boss({2, 85}) -> 73065;
month_boss({2, 86}) -> 73066;
month_boss({2, 87}) -> 73067;
month_boss({2, 88}) -> 73068;
month_boss({2, 89}) -> 73069;
month_boss({2, 90}) -> 73070;
month_boss({2, 91}) -> 73071;
month_boss({2, 92}) -> 73072;
month_boss({2, 93}) -> 73073;
month_boss({2, 94}) -> 73074;
month_boss({2, 95}) -> 73075;
month_boss({2, 96}) -> 73076;
month_boss({2, 97}) -> 73077;
month_boss({2, 98}) -> 73078;
month_boss({2, 99}) -> 73079;
month_boss({2, 100}) -> 73080;
month_boss(_) -> undefined.

list_world_boss() ->
    [70011, 70012, 70013, 70014, 70015, 70016, 70017, 70018,
     70019].

get_world_boss(70011) ->
    #world_boss_data{id = 70011,
		     name = lang:get(<<"阴影源头"/utf8>>), lev = 20,
		     ref_time = 300, ref_item_num = 1,
		     base_items = [{13, 1}], show_lev = 10};
get_world_boss(70012) ->
    #world_boss_data{id = 70012,
		     name = lang:get(<<"深海三叉戟"/utf8>>), lev = 30,
		     ref_time = 600, ref_item_num = 1,
		     base_items = [{13, 1}], show_lev = 20};
get_world_boss(70013) ->
    #world_boss_data{id = 70013,
		     name = lang:get(<<"八脚马的主人"/utf8>>), lev = 40,
		     ref_time = 900, ref_item_num = 1,
		     base_items = [{13, 2}], show_lev = 30};
get_world_boss(70014) ->
    #world_boss_data{id = 70014,
		     name = lang:get(<<"冰冠王者"/utf8>>), lev = 50,
		     ref_time = 1200, ref_item_num = 1,
		     base_items = [{13, 3}], show_lev = 40};
get_world_boss(70015) ->
    #world_boss_data{id = 70015,
		     name = lang:get(<<"火山霸主"/utf8>>), lev = 60,
		     ref_time = 1500, ref_item_num = 1,
		     base_items = [{13, 3}], show_lev = 50};
get_world_boss(70016) ->
    #world_boss_data{id = 70016,
		     name = lang:get(<<"地狱追捕者"/utf8>>), lev = 70,
		     ref_time = 1800, ref_item_num = 1,
		     base_items = [{13, 4}], show_lev = 60};
get_world_boss(70017) ->
    #world_boss_data{id = 70017,
		     name = lang:get(<<"红剑三倍速"/utf8>>), lev = 80,
		     ref_time = 2400, ref_item_num = 1,
		     base_items = [{13, 5}], show_lev = 70};
get_world_boss(70018) ->
    #world_boss_data{id = 70018,
		     name = lang:get(<<"大罪掌握者"/utf8>>), lev = 90,
		     ref_time = 3000, ref_item_num = 1,
		     base_items = [{13, 5}], show_lev = 80};
get_world_boss(70019) ->
    #world_boss_data{id = 70019,
		     name = lang:get(<<"混沌之翼"/utf8>>), lev = 100,
		     ref_time = 3600, ref_item_num = 1,
		     base_items = [{13, 6}], show_lev = 90};
get_world_boss(_Info) ->
    lager:error(io_lib:format("get_world_boss_data_not_exist===>~w",
			      [_Info])),
    undefined.

world_combat_reward({70010, HurtPer})
    when HurtPer >= 0 andalso HurtPer =< 0 ->
    #{id => 70010, min => 0, max => 0};
world_combat_reward({70010, HurtPer})
    when HurtPer >= 1 andalso HurtPer =< 10 ->
    #{id => 70010, min => 1, max => 10,
      drop_ids => [40110]};
world_combat_reward({70010, HurtPer})
    when HurtPer >= 11 andalso HurtPer =< 20 ->
    #{id => 70010, min => 11, max => 20,
      drop_ids => [40110]};
world_combat_reward({70010, HurtPer})
    when HurtPer >= 21 andalso HurtPer =< 40 ->
    #{id => 70010, min => 21, max => 40,
      drop_ids => [40110]};
world_combat_reward({70010, HurtPer})
    when HurtPer >= 41 andalso HurtPer =< 60 ->
    #{id => 70010, min => 41, max => 60,
      drop_ids => [40110]};
world_combat_reward({70010, HurtPer})
    when HurtPer >= 61 andalso HurtPer =< 80 ->
    #{id => 70010, min => 61, max => 80,
      drop_ids => [40110]};
world_combat_reward({70010, HurtPer})
    when HurtPer >= 81 andalso HurtPer =< 99 ->
    #{id => 70010, min => 81, max => 99,
      drop_ids => [40110]};
world_combat_reward({70010, HurtPer})
    when HurtPer >= 100 andalso HurtPer =< 100 ->
    #{id => 70010, min => 100, max => 100,
      drop_ids => [40110]};
world_combat_reward({70011, HurtPer})
    when HurtPer >= 0 andalso HurtPer =< 0 ->
    #{id => 70011, min => 0, max => 0};
world_combat_reward({70011, HurtPer})
    when HurtPer >= 1 andalso HurtPer =< 10 ->
    #{id => 70011, min => 1, max => 10,
      drop_ids => [40120]};
world_combat_reward({70011, HurtPer})
    when HurtPer >= 11 andalso HurtPer =< 20 ->
    #{id => 70011, min => 11, max => 20,
      drop_ids => [40120]};
world_combat_reward({70011, HurtPer})
    when HurtPer >= 21 andalso HurtPer =< 40 ->
    #{id => 70011, min => 21, max => 40,
      drop_ids => [40120]};
world_combat_reward({70011, HurtPer})
    when HurtPer >= 41 andalso HurtPer =< 60 ->
    #{id => 70011, min => 41, max => 60,
      drop_ids => [40120]};
world_combat_reward({70011, HurtPer})
    when HurtPer >= 61 andalso HurtPer =< 80 ->
    #{id => 70011, min => 61, max => 80,
      drop_ids => [40120]};
world_combat_reward({70011, HurtPer})
    when HurtPer >= 81 andalso HurtPer =< 99 ->
    #{id => 70011, min => 81, max => 99,
      drop_ids => [40120]};
world_combat_reward({70011, HurtPer})
    when HurtPer >= 100 andalso HurtPer =< 100 ->
    #{id => 70011, min => 100, max => 100,
      drop_ids => [40120]};
world_combat_reward({70012, HurtPer})
    when HurtPer >= 0 andalso HurtPer =< 0 ->
    #{id => 70012, min => 0, max => 0};
world_combat_reward({70012, HurtPer})
    when HurtPer >= 1 andalso HurtPer =< 10 ->
    #{id => 70012, min => 1, max => 10,
      per_items => [{2, 40000}], drop_ids => [40130]};
world_combat_reward({70012, HurtPer})
    when HurtPer >= 11 andalso HurtPer =< 20 ->
    #{id => 70012, min => 11, max => 20,
      per_items => [{2, 40000}], drop_ids => [40130]};
world_combat_reward({70012, HurtPer})
    when HurtPer >= 21 andalso HurtPer =< 40 ->
    #{id => 70012, min => 21, max => 40,
      per_items => [{2, 40000}], drop_ids => [40130]};
world_combat_reward({70012, HurtPer})
    when HurtPer >= 41 andalso HurtPer =< 60 ->
    #{id => 70012, min => 41, max => 60,
      per_items => [{2, 40000}], drop_ids => [40130]};
world_combat_reward({70012, HurtPer})
    when HurtPer >= 61 andalso HurtPer =< 80 ->
    #{id => 70012, min => 61, max => 80,
      per_items => [{2, 40000}], drop_ids => [40130]};
world_combat_reward({70012, HurtPer})
    when HurtPer >= 81 andalso HurtPer =< 99 ->
    #{id => 70012, min => 81, max => 99,
      per_items => [{2, 40000}], drop_ids => [40130]};
world_combat_reward({70012, HurtPer})
    when HurtPer >= 100 andalso HurtPer =< 100 ->
    #{id => 70012, min => 100, max => 100,
      per_items => [{2, 40000}], drop_ids => [40130]};
world_combat_reward({70013, HurtPer})
    when HurtPer >= 0 andalso HurtPer =< 0 ->
    #{id => 70013, min => 0, max => 0};
world_combat_reward({70013, HurtPer})
    when HurtPer >= 1 andalso HurtPer =< 10 ->
    #{id => 70013, min => 1, max => 10,
      per_items => [{2, 63500}], drop_ids => [40140]};
world_combat_reward({70013, HurtPer})
    when HurtPer >= 11 andalso HurtPer =< 20 ->
    #{id => 70013, min => 11, max => 20,
      per_items => [{2, 63500}], drop_ids => [40140]};
world_combat_reward({70013, HurtPer})
    when HurtPer >= 21 andalso HurtPer =< 40 ->
    #{id => 70013, min => 21, max => 40,
      per_items => [{2, 63500}], drop_ids => [40140]};
world_combat_reward({70013, HurtPer})
    when HurtPer >= 41 andalso HurtPer =< 60 ->
    #{id => 70013, min => 41, max => 60,
      per_items => [{2, 63500}], drop_ids => [40140]};
world_combat_reward({70013, HurtPer})
    when HurtPer >= 61 andalso HurtPer =< 80 ->
    #{id => 70013, min => 61, max => 80,
      per_items => [{2, 63500}], drop_ids => [40140]};
world_combat_reward({70013, HurtPer})
    when HurtPer >= 81 andalso HurtPer =< 99 ->
    #{id => 70013, min => 81, max => 99,
      per_items => [{2, 63500}], drop_ids => [40140]};
world_combat_reward({70013, HurtPer})
    when HurtPer >= 100 andalso HurtPer =< 100 ->
    #{id => 70013, min => 100, max => 100,
      per_items => [{2, 63500}], drop_ids => [40140]};
world_combat_reward({70014, HurtPer})
    when HurtPer >= 0 andalso HurtPer =< 0 ->
    #{id => 70014, min => 0, max => 0};
world_combat_reward({70014, HurtPer})
    when HurtPer >= 1 andalso HurtPer =< 10 ->
    #{id => 70014, min => 1, max => 10,
      per_items => [{2, 115000}], drop_ids => [40150]};
world_combat_reward({70014, HurtPer})
    when HurtPer >= 11 andalso HurtPer =< 20 ->
    #{id => 70014, min => 11, max => 20,
      per_items => [{2, 115000}], drop_ids => [40150]};
world_combat_reward({70014, HurtPer})
    when HurtPer >= 21 andalso HurtPer =< 40 ->
    #{id => 70014, min => 21, max => 40,
      per_items => [{2, 115000}], drop_ids => [40150]};
world_combat_reward({70014, HurtPer})
    when HurtPer >= 41 andalso HurtPer =< 60 ->
    #{id => 70014, min => 41, max => 60,
      per_items => [{2, 115000}], drop_ids => [40150]};
world_combat_reward({70014, HurtPer})
    when HurtPer >= 61 andalso HurtPer =< 80 ->
    #{id => 70014, min => 61, max => 80,
      per_items => [{2, 115000}], drop_ids => [40150]};
world_combat_reward({70014, HurtPer})
    when HurtPer >= 81 andalso HurtPer =< 99 ->
    #{id => 70014, min => 81, max => 99,
      per_items => [{2, 115000}], drop_ids => [40150]};
world_combat_reward({70014, HurtPer})
    when HurtPer >= 100 andalso HurtPer =< 100 ->
    #{id => 70014, min => 100, max => 100,
      per_items => [{2, 115000}], drop_ids => [40150]};
world_combat_reward({70015, HurtPer})
    when HurtPer >= 0 andalso HurtPer =< 0 ->
    #{id => 70015, min => 0, max => 0};
world_combat_reward({70015, HurtPer})
    when HurtPer >= 1 andalso HurtPer =< 10 ->
    #{id => 70015, min => 1, max => 10,
      per_items => [{2, 175000}], drop_ids => [40160]};
world_combat_reward({70015, HurtPer})
    when HurtPer >= 11 andalso HurtPer =< 20 ->
    #{id => 70015, min => 11, max => 20,
      per_items => [{2, 175000}], drop_ids => [40160]};
world_combat_reward({70015, HurtPer})
    when HurtPer >= 21 andalso HurtPer =< 40 ->
    #{id => 70015, min => 21, max => 40,
      per_items => [{2, 175000}], drop_ids => [40160]};
world_combat_reward({70015, HurtPer})
    when HurtPer >= 41 andalso HurtPer =< 60 ->
    #{id => 70015, min => 41, max => 60,
      per_items => [{2, 175000}], drop_ids => [40160]};
world_combat_reward({70015, HurtPer})
    when HurtPer >= 61 andalso HurtPer =< 80 ->
    #{id => 70015, min => 61, max => 80,
      per_items => [{2, 175000}], drop_ids => [40160]};
world_combat_reward({70015, HurtPer})
    when HurtPer >= 81 andalso HurtPer =< 99 ->
    #{id => 70015, min => 81, max => 99,
      per_items => [{2, 175000}], drop_ids => [40160]};
world_combat_reward({70015, HurtPer})
    when HurtPer >= 100 andalso HurtPer =< 100 ->
    #{id => 70015, min => 100, max => 100,
      per_items => [{2, 175000}], drop_ids => [40160]};
world_combat_reward({70016, HurtPer})
    when HurtPer >= 0 andalso HurtPer =< 0 ->
    #{id => 70016, min => 0, max => 0};
world_combat_reward({70016, HurtPer})
    when HurtPer >= 1 andalso HurtPer =< 10 ->
    #{id => 70016, min => 1, max => 10,
      per_items => [{2, 260000}], drop_ids => [40170]};
world_combat_reward({70016, HurtPer})
    when HurtPer >= 11 andalso HurtPer =< 20 ->
    #{id => 70016, min => 11, max => 20,
      per_items => [{2, 260000}], drop_ids => [40170]};
world_combat_reward({70016, HurtPer})
    when HurtPer >= 21 andalso HurtPer =< 40 ->
    #{id => 70016, min => 21, max => 40,
      per_items => [{2, 260000}], drop_ids => [40170]};
world_combat_reward({70016, HurtPer})
    when HurtPer >= 41 andalso HurtPer =< 60 ->
    #{id => 70016, min => 41, max => 60,
      per_items => [{2, 260000}], drop_ids => [40170]};
world_combat_reward({70016, HurtPer})
    when HurtPer >= 61 andalso HurtPer =< 80 ->
    #{id => 70016, min => 61, max => 80,
      per_items => [{2, 260000}], drop_ids => [40170]};
world_combat_reward({70016, HurtPer})
    when HurtPer >= 81 andalso HurtPer =< 99 ->
    #{id => 70016, min => 81, max => 99,
      per_items => [{2, 260000}], drop_ids => [40170]};
world_combat_reward({70016, HurtPer})
    when HurtPer >= 100 andalso HurtPer =< 100 ->
    #{id => 70016, min => 100, max => 100,
      per_items => [{2, 260000}], drop_ids => [40170]};
world_combat_reward({70017, HurtPer})
    when HurtPer >= 0 andalso HurtPer =< 0 ->
    #{id => 70017, min => 0, max => 0};
world_combat_reward({70017, HurtPer})
    when HurtPer >= 1 andalso HurtPer =< 10 ->
    #{id => 70017, min => 1, max => 10,
      per_items => [{2, 400000}], drop_ids => [40180]};
world_combat_reward({70017, HurtPer})
    when HurtPer >= 11 andalso HurtPer =< 20 ->
    #{id => 70017, min => 11, max => 20,
      per_items => [{2, 400000}], drop_ids => [40180]};
world_combat_reward({70017, HurtPer})
    when HurtPer >= 21 andalso HurtPer =< 40 ->
    #{id => 70017, min => 21, max => 40,
      per_items => [{2, 400000}], drop_ids => [40180]};
world_combat_reward({70017, HurtPer})
    when HurtPer >= 41 andalso HurtPer =< 60 ->
    #{id => 70017, min => 41, max => 60,
      per_items => [{2, 400000}], drop_ids => [40180]};
world_combat_reward({70017, HurtPer})
    when HurtPer >= 61 andalso HurtPer =< 80 ->
    #{id => 70017, min => 61, max => 80,
      per_items => [{2, 400000}], drop_ids => [40180]};
world_combat_reward({70017, HurtPer})
    when HurtPer >= 81 andalso HurtPer =< 99 ->
    #{id => 70017, min => 81, max => 99,
      per_items => [{2, 400000}], drop_ids => [40180]};
world_combat_reward({70017, HurtPer})
    when HurtPer >= 100 andalso HurtPer =< 100 ->
    #{id => 70017, min => 100, max => 100,
      per_items => [{2, 400000}], drop_ids => [40180]};
world_combat_reward({70018, HurtPer})
    when HurtPer >= 0 andalso HurtPer =< 0 ->
    #{id => 70018, min => 0, max => 0};
world_combat_reward({70018, HurtPer})
    when HurtPer >= 1 andalso HurtPer =< 10 ->
    #{id => 70018, min => 1, max => 10,
      per_items => [{2, 450000}], drop_ids => [40190]};
world_combat_reward({70018, HurtPer})
    when HurtPer >= 11 andalso HurtPer =< 20 ->
    #{id => 70018, min => 11, max => 20,
      per_items => [{2, 450000}], drop_ids => [40190]};
world_combat_reward({70018, HurtPer})
    when HurtPer >= 21 andalso HurtPer =< 40 ->
    #{id => 70018, min => 21, max => 40,
      per_items => [{2, 450000}], drop_ids => [40190]};
world_combat_reward({70018, HurtPer})
    when HurtPer >= 41 andalso HurtPer =< 60 ->
    #{id => 70018, min => 41, max => 60,
      per_items => [{2, 450000}], drop_ids => [40190]};
world_combat_reward({70018, HurtPer})
    when HurtPer >= 61 andalso HurtPer =< 80 ->
    #{id => 70018, min => 61, max => 80,
      per_items => [{2, 450000}], drop_ids => [40190]};
world_combat_reward({70018, HurtPer})
    when HurtPer >= 81 andalso HurtPer =< 99 ->
    #{id => 70018, min => 81, max => 99,
      per_items => [{2, 450000}], drop_ids => [40190]};
world_combat_reward({70018, HurtPer})
    when HurtPer >= 100 andalso HurtPer =< 100 ->
    #{id => 70018, min => 100, max => 100,
      per_items => [{2, 450000}], drop_ids => [40190]};
world_combat_reward({70019, HurtPer})
    when HurtPer >= 0 andalso HurtPer =< 0 ->
    #{id => 70019, min => 0, max => 0};
world_combat_reward({70019, HurtPer})
    when HurtPer >= 1 andalso HurtPer =< 10 ->
    #{id => 70019, min => 1, max => 10,
      per_items => [{2, 500000}], drop_ids => [40200]};
world_combat_reward({70019, HurtPer})
    when HurtPer >= 11 andalso HurtPer =< 20 ->
    #{id => 70019, min => 11, max => 20,
      per_items => [{2, 500000}], drop_ids => [40200]};
world_combat_reward({70019, HurtPer})
    when HurtPer >= 21 andalso HurtPer =< 40 ->
    #{id => 70019, min => 21, max => 40,
      per_items => [{2, 500000}], drop_ids => [40200]};
world_combat_reward({70019, HurtPer})
    when HurtPer >= 41 andalso HurtPer =< 60 ->
    #{id => 70019, min => 41, max => 60,
      per_items => [{2, 500000}], drop_ids => [40200]};
world_combat_reward({70019, HurtPer})
    when HurtPer >= 61 andalso HurtPer =< 80 ->
    #{id => 70019, min => 61, max => 80,
      per_items => [{2, 500000}], drop_ids => [40200]};
world_combat_reward({70019, HurtPer})
    when HurtPer >= 81 andalso HurtPer =< 99 ->
    #{id => 70019, min => 81, max => 99,
      per_items => [{2, 500000}], drop_ids => [40200]};
world_combat_reward({70019, HurtPer})
    when HurtPer >= 100 andalso HurtPer =< 100 ->
    #{id => 70019, min => 100, max => 100,
      per_items => [{2, 500000}], drop_ids => [40200]};
world_combat_reward(_Info) ->
    lager:error(io_lib:format("world_combat_reward_data_not_exist===>~w",
			      [_Info])),
    undefined.

world_rank_reward({70010, Rank})
    when Rank >= 1 andalso Rank =< 1 ->
    #{id => 70010, min => 1, max => 1,
      base_items => [{13, 1}], drop_ids => [40111]};
world_rank_reward({70010, Rank})
    when Rank >= 2 andalso Rank =< 9999 ->
    #{id => 70010, min => 2, max => 9999,
      drop_ids => [40112]};
world_rank_reward({70011, Rank})
    when Rank >= 1 andalso Rank =< 1 ->
    #{id => 70011, min => 1, max => 1,
      base_items => [{13, 1}], drop_ids => [40121]};
world_rank_reward({70011, Rank})
    when Rank >= 2 andalso Rank =< 3 ->
    #{id => 70011, min => 2, max => 3,
      base_items => [{13, 1}], drop_ids => [40122]};
world_rank_reward({70011, Rank})
    when Rank >= 4 andalso Rank =< 9999 ->
    #{id => 70011, min => 4, max => 9999,
      drop_ids => [40123]};
world_rank_reward({70012, Rank})
    when Rank >= 1 andalso Rank =< 1 ->
    #{id => 70012, min => 1, max => 1,
      base_items => [{13, 2}], drop_ids => [40131]};
world_rank_reward({70012, Rank})
    when Rank >= 2 andalso Rank =< 3 ->
    #{id => 70012, min => 2, max => 3,
      base_items => [{13, 2}], drop_ids => [40132]};
world_rank_reward({70012, Rank})
    when Rank >= 4 andalso Rank =< 9999 ->
    #{id => 70012, min => 4, max => 9999,
      drop_ids => [40133]};
world_rank_reward({70013, Rank})
    when Rank >= 1 andalso Rank =< 1 ->
    #{id => 70013, min => 1, max => 1,
      base_items => [{13, 3}], drop_ids => [40141]};
world_rank_reward({70013, Rank})
    when Rank >= 2 andalso Rank =< 3 ->
    #{id => 70013, min => 2, max => 3,
      base_items => [{13, 3}], drop_ids => [40142]};
world_rank_reward({70013, Rank})
    when Rank >= 4 andalso Rank =< 9999 ->
    #{id => 70013, min => 4, max => 9999,
      drop_ids => [40143]};
world_rank_reward({70014, Rank})
    when Rank >= 1 andalso Rank =< 1 ->
    #{id => 70014, min => 1, max => 1,
      base_items => [{13, 4}], drop_ids => [40151]};
world_rank_reward({70014, Rank})
    when Rank >= 2 andalso Rank =< 3 ->
    #{id => 70014, min => 2, max => 3,
      base_items => [{13, 4}], drop_ids => [40152]};
world_rank_reward({70014, Rank})
    when Rank >= 4 andalso Rank =< 9999 ->
    #{id => 70014, min => 4, max => 9999,
      drop_ids => [40153]};
world_rank_reward({70015, Rank})
    when Rank >= 1 andalso Rank =< 1 ->
    #{id => 70015, min => 1, max => 1,
      base_items => [{13, 5}], drop_ids => [40161]};
world_rank_reward({70015, Rank})
    when Rank >= 2 andalso Rank =< 3 ->
    #{id => 70015, min => 2, max => 3,
      base_items => [{13, 5}], drop_ids => [40162]};
world_rank_reward({70015, Rank})
    when Rank >= 4 andalso Rank =< 9999 ->
    #{id => 70015, min => 4, max => 9999,
      drop_ids => [40163]};
world_rank_reward({70016, Rank})
    when Rank >= 1 andalso Rank =< 1 ->
    #{id => 70016, min => 1, max => 1,
      base_items => [{13, 6}], drop_ids => [40171]};
world_rank_reward({70016, Rank})
    when Rank >= 2 andalso Rank =< 3 ->
    #{id => 70016, min => 2, max => 3,
      base_items => [{13, 6}], drop_ids => [40172]};
world_rank_reward({70016, Rank})
    when Rank >= 4 andalso Rank =< 9999 ->
    #{id => 70016, min => 4, max => 9999,
      drop_ids => [40173]};
world_rank_reward({70017, Rank})
    when Rank >= 1 andalso Rank =< 1 ->
    #{id => 70017, min => 1, max => 1,
      base_items => [{13, 7}], drop_ids => [40181]};
world_rank_reward({70017, Rank})
    when Rank >= 2 andalso Rank =< 3 ->
    #{id => 70017, min => 2, max => 3,
      base_items => [{13, 7}], drop_ids => [40182]};
world_rank_reward({70017, Rank})
    when Rank >= 4 andalso Rank =< 9999 ->
    #{id => 70017, min => 4, max => 9999,
      drop_ids => [40183]};
world_rank_reward({70018, Rank})
    when Rank >= 1 andalso Rank =< 1 ->
    #{id => 70018, min => 1, max => 1,
      base_items => [{13, 8}], drop_ids => [40191]};
world_rank_reward({70018, Rank})
    when Rank >= 2 andalso Rank =< 3 ->
    #{id => 70018, min => 2, max => 3,
      base_items => [{13, 8}], drop_ids => [40192]};
world_rank_reward({70018, Rank})
    when Rank >= 4 andalso Rank =< 9999 ->
    #{id => 70018, min => 4, max => 9999,
      drop_ids => [40193]};
world_rank_reward({70019, Rank})
    when Rank >= 1 andalso Rank =< 1 ->
    #{id => 70019, min => 1, max => 1,
      base_items => [{13, 10}], drop_ids => [40201]};
world_rank_reward({70019, Rank})
    when Rank >= 2 andalso Rank =< 3 ->
    #{id => 70019, min => 2, max => 3,
      base_items => [{13, 9}], drop_ids => [40202]};
world_rank_reward({70019, Rank})
    when Rank >= 4 andalso Rank =< 9999 ->
    #{id => 70019, min => 4, max => 9999,
      drop_ids => [40203]};
world_rank_reward(_Info) ->
    lager:error(io_lib:format("world_rank_reward_data_not_exist===>~w",
			      [_Info])),
    undefined.

world_buy_num(1) -> #{num => 1, cost => 20};
world_buy_num(2) -> #{num => 2, vip => 1, cost => 20};
world_buy_num(3) -> #{num => 3, vip => 1, cost => 20};
world_buy_num(4) -> #{num => 4, vip => 2, cost => 20};
world_buy_num(5) -> #{num => 5, vip => 3, cost => 30};
world_buy_num(6) -> #{num => 6, vip => 4, cost => 30};
world_buy_num(7) -> #{num => 7, vip => 4, cost => 30};
world_buy_num(8) -> #{num => 8, vip => 5, cost => 35};
world_buy_num(9) -> #{num => 9, vip => 5, cost => 35};
world_buy_num(10) -> #{num => 10, vip => 6, cost => 40};
world_buy_num(11) -> #{num => 11, vip => 7, cost => 40};
world_buy_num(12) -> #{num => 12, vip => 8, cost => 50};
world_buy_num(13) -> #{num => 13, vip => 9, cost => 50};
world_buy_num(14) ->
    #{num => 14, vip => 10, cost => 60};
world_buy_num(15) ->
    #{num => 15, vip => 11, cost => 60};
world_buy_num(16) ->
    #{num => 16, vip => 12, cost => 70};
world_buy_num(17) ->
    #{num => 17, vip => 13, cost => 70};
world_buy_num(18) ->
    #{num => 18, vip => 14, cost => 80};
world_buy_num(19) ->
    #{num => 19, vip => 15, cost => 80};
world_buy_num(20) ->
    #{num => 20, vip => 15, cost => 90};
world_buy_num(_Info) ->
    lager:error(io_lib:format("world_buy_num_data_not_exist===>~w",
			      [_Info])),
    undefined.


