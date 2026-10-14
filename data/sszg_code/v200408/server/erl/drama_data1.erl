-file("src/data/drama_data.erl", 1).

-module(drama_data).

-lager_records([{condition, [label, op, val, msg]},
		{drama_quest_unit,
		 [label, id, base_id, type, pos, dir, act_type,
		  is_rand_pos]},
		{drama_play,
		 [id, act_type, label, base_id, map_bid, x, y, type, val,
		  name, desc]},
		{drama_obj,
		 [id, name, base_id, type, minor_type, map_bid, x, y,
		  dir, act_type, looks, status, quest_id, quest_prog_id,
		  sex, career]},
		{drama_data,
		 [bid, name, lev, is_open, is_skip, num, event, act_cond,
		  act, condition, offline]},
		{drama, [id, act_idx, num]},
		{m_drama,
		 [ver, finished, play_list, do_list, combat_list,
		  obj_list, guide_list, finish_guide]}]).

-export([list/0, open_list/0, get/1, tri_guide_cond/1,
	 get_guide/1, get_const/1]).

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

-file("src/data/drama_data.erl", 20).

-file("inc/drama.hrl", 1).

-record(m_drama,
	{ver = 1, finished = []  :: [pos_integer()],
	 play_list = []  :: [pos_integer()],
	 do_list = []  :: [tuple()],
	 combat_list = []  :: [tuple()], obj_list = [],
	 guide_list = []  :: [pos_integer()],
	 finish_guide = []  :: list()}).

-record(drama, {id = 0, act_idx = 0, num = 0}).

-record(drama_data,
	{bid = 0, name = <<>>, lev = 0, is_open = 0,
	 is_skip = 0, num = 1, event, act_cond = [], act = [],
	 condition = [], offline = 1}).

-record(drama_obj,
	{id = 0, name = <<>>  :: binary(),
	 base_id = 0  :: non_neg_integer(),
	 type = 0  :: non_neg_integer(), minor_type = 0,
	 map_bid = 0  :: non_neg_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer(),
	 dir = 0  :: non_neg_integer(),
	 act_type = ""  :: bitstring(), looks = []  :: [tuple()],
	 status = 0  :: non_neg_integer(),
	 quest_id = 0  :: non_neg_integer(),
	 quest_prog_id = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 career = 0  :: non_neg_integer()}).

-record(drama_play,
	{id = 0  :: non_neg_integer(),
	 act_type = 0  :: non_neg_integer(),
	 label = act  :: atom(),
	 base_id = 0  :: non_neg_integer(),
	 map_bid = 0  :: non_neg_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer(),
	 type = 0  :: non_neg_integer(),
	 val = 0  :: non_neg_integer(), name = <<>>  :: binary(),
	 desc = <<>>  :: binary()}).

-record(drama_quest_unit,
	{label, id = 0, base_id = 0, type = 0, pos, dir,
	 act_type, is_rand_pos = 0  :: 0 | 1}).

-file("src/data/drama_data.erl", 21).

-file("inc/condition.hrl", 1).

-record(condition,
	{label  :: atom(),
	 op = eq  ::
	     ue | eq | lt | gt | le | ge | range | include,
	 val  :: term(), msg = <<>>  :: bitstring()}).

-file("src/data/drama_data.erl", 22).

list() ->
    [10008, 10010, 10011, 10012, 10030, 10040, 10041, 10050,
     10051, 10060, 10061, 10071, 10080, 10081, 10090, 10091,
     10100, 10101, 10120, 10121, 10130, 10131, 10140, 10141,
     10142, 10151, 10152, 10153, 10160, 10161, 10165, 10166,
     10170, 10171, 10172, 10173, 10174, 10175, 10176, 10177,
     10178, 10179, 10180, 10181, 10182, 10183, 10192, 10193,
     10194, 10195, 20010, 20011, 20020, 20021, 10187, 10188,
     10185, 10186, 10197, 10198, 10199, 10190, 10191, 10200,
     10201, 10210, 10211, 10212, 10220, 10221, 10222, 10223,
     10250, 10251, 10300, 10310, 10311, 10330, 10331, 10340,
     10341, 10350, 10351, 10360, 10361, 10370, 10371, 10372,
     10380, 10381, 10382, 10383, 10390, 10391, 10400, 10401,
     10410, 10411, 10412, 10420, 10421, 10422].

open_list() ->
    [10008, 10010, 10011, 10012, 10030, 10040, 10041, 10050,
     10051, 10060, 10061, 10071, 10080, 10081, 10090, 10091,
     10100, 10101, 10120, 10121, 10130, 10131, 10140, 10141,
     10142, 10151, 10152, 10153, 10160, 10161, 10165, 10166,
     10170, 10171, 10172, 10173, 10174, 10175, 10176, 10177,
     10178, 10180, 10181, 10192, 10193, 10194, 10195, 20010,
     20011, 20020, 20021, 10187, 10188, 10185, 10186, 10190,
     10191, 10200, 10201, 10210, 10211, 10212, 10220, 10221,
     10222, 10223, 10300, 10310, 10311, 10330, 10331, 10340,
     10341, 10350, 10351, 10370, 10371, 10372, 10380, 10381,
     10382, 10383, 10390, 10391, 10400, 10401, 10410, 10411,
     10412, 10420, 10421, 10422].

get(10008) ->
    #drama_data{bid = 10008,
		name = lang:get(<<"开场黑幕"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_cli_loaded,
		act =
		    [{unit_black, 0, 20,
		      "300年前，&邪恶的魔族自黑暗中苏醒，&于危难之中，&伟大先知集齐传说中的五大神器，\n以"
		      "驱逐恶魔未名，组建先知圣殿。&就在人类即将大获全胜之时，&恶魔之主发动了蓄谋已久的永夜祭典"
		      "，&企图让永恒的黑暗降临世界。&先知以生命为代价，借助五大神器将之禁锢。&但魔主不死，黑暗"
		      "不灭。&“唯有异界之人，方能驱逐黑暗”。&遵循着先知的最终预言，异界之门被打开，&大陆也迎"
		      "来了新的冒险时代。",
		      1.5, 2}]};
get(10010) ->
    #drama_data{bid = 10010,
		name = lang:get(<<"开场对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10008}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"传说中<div fontcolor=#d95014>集齐失落神器</div>，重现诸神荣耀"
				 "的勇者，你终于来了！"/utf8>>),
		      d_1001},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"顺着神灵的指引，你一定可以再次<div fontcolor=#d95014>封印魔族，拯救"
				 "冒险大陆</div>的！"/utf8>>)},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"现在，先告诉我你的名字吧~"/utf8>>)}]};
get(10011) ->
    #drama_data{bid = 10011,
		name = lang:get(<<"月骑召唤引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 2, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10012}],
		act = [{play_guide, 10010}]};
get(10030) ->
    #drama_data{bid = 10030,
		name = lang:get(<<"推图第一关引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10010}],
		act = [{play_guide, 10030}]};
get(10040) ->
    #drama_data{bid = 10040,
		name = lang:get(<<"领取通关奖励对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_dungeon_pass,
		act_cond =
		    [#condition{label = dungeon, op = eq, val = 10010}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"通关一定关卡后就可以领取通关奖励啦！"/utf8>>), d_1006}]};
get(10041) ->
    #drama_data{bid = 10041,
		name = lang:get(<<"领取通关奖励引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10040}],
		act = [{play_guide, 10040}]};
get(10050) ->
    #drama_data{bid = 10050,
		name = lang:get(<<"碎片合成对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10040}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"刚才的战斗中获得了英雄碎片，现在可以合成英雄啦~"/utf8>>),
		      d_1007}]};
get(10051) ->
    #drama_data{bid = 10051,
		name = lang:get(<<"碎片合成引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10050}],
		act = [{play_guide, 10050}]};
get(10060) ->
    #drama_data{bid = 10060,
		name = lang:get(<<"英雄升级对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10050}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"现在就让我们为英雄进行升级！"/utf8>>), d_1009}]};
get(10061) ->
    #drama_data{bid = 10061,
		name = lang:get(<<"英雄升级引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10060}],
		act = [{play_guide, 10060}]};
get(10071) ->
    #drama_data{bid = 10071,
		name = lang:get(<<"装备穿戴引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10060}],
		act = [{play_guide, 10070}]};
get(10080) ->
    #drama_data{bid = 10080,
		name = lang:get(<<"推图第二关对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10070}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"实力大增，让我们继续前进吧！"/utf8>>)}]};
get(10081) ->
    #drama_data{bid = 10081,
		name = lang:get(<<"推图第二关引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10080}],
		act = [{play_guide, 10080}]};
get(10090) ->
    #drama_data{bid = 10090,
		name = lang:get(<<"召唤券购买对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_dungeon_pass,
		act_cond =
		    [#condition{label = dungeon, op = eq, val = 10020}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"主城的精灵商店中经常会有打折的物品出售！"/utf8>>)},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"一起去看看吧~"/utf8>>)}]};
get(10091) ->
    #drama_data{bid = 10091,
		name = lang:get(<<"召唤券购买引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10090}],
		act = [{play_guide, 10090}]};
get(10100) ->
    #drama_data{bid = 10100,
		name = lang:get(<<"第二次召唤对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10090}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"接下来又可以继续前往召唤啦，这次我们可以使用高级召唤！"/utf8>>),
		      d_1018},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"除了用召唤卷召唤之外，每天还有1次免费召唤的机会！"/utf8>>)}]};
get(10101) ->
    #drama_data{bid = 10101,
		name = lang:get(<<"第二次召唤引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10100}],
		act = [{play_guide, 10100}]};
get(10120) ->
    #drama_data{bid = 10120,
		name = lang:get(<<"快速作战对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10100}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"觉得升级速度太慢？每天都有一次免费的快速作战！"/utf8>>)}]};
get(10121) ->
    #drama_data{bid = 10121,
		name = lang:get(<<"快速作战引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10120}],
		act = [{play_guide, 10120}]};
get(10130) ->
    #drama_data{bid = 10130,
		name = lang:get(<<"推图第三关对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10120}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"准备好就一起继续前进吧！"/utf8>>), d_1014}]};
get(10131) ->
    #drama_data{bid = 10131,
		name = lang:get(<<"推图第三关引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10130}],
		act = [{play_guide, 10130}]};
get(10140) ->
    #drama_data{bid = 10140,
		name = lang:get(<<"神器任务对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_dungeon_pass,
		act_cond =
		    [#condition{label = dungeon, op = eq, val = 10030}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"神器开启了！神器拥有特殊技能，还可以在战斗中提升英雄属性！"/utf8>>),
		      d_1019},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"但是，解锁神器需要先达成目标，一起去看看吧~"/utf8>>)}]};
get(10141) ->
    #drama_data{bid = 10141,
		name = lang:get(<<"神器界面引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10140}],
		act = [{play_guide, 10140}]};
get(10142) ->
    #drama_data{bid = 10142,
		name = lang:get(<<"神器任务引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10140}],
		act = [{play_guide, 10141}]};
get(10151) ->
    #drama_data{bid = 10151,
		name = lang:get(<<"任务奖励引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10141}],
		act = [{play_guide, 10150}]};
get(10152) ->
    #drama_data{bid = 10152,
		name = lang:get(<<"任务跳转引导（5级以下）"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10150},
		     #condition{label = lev, op = lt, val = 5}],
		act = [{play_guide, 10151}]};
get(10153) ->
    #drama_data{bid = 10153,
		name = lang:get(<<"任务跳转引导（5级以上）"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10150},
		     #condition{label = lev, op = ge, val = 5}],
		act = [{play_guide, 10152}]};
get(10160) ->
    #drama_data{bid = 10160,
		name = lang:get(<<"推图第四关引导（5级以下）"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10151}],
		act = [{play_guide, 10160}]};
get(10161) ->
    #drama_data{bid = 10161,
		name = lang:get(<<"推图第四关引导（5级以上）"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10152}],
		act = [{play_guide, 10161}]};
get(10165) ->
    #drama_data{bid = 10165,
		name = lang:get(<<"领取挂机收益对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_dungeon_pass,
		act_cond =
		    [#condition{label = dungeon, op = eq, val = 10040},
		     #condition{label = hook_time, op = ge, val = 60}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"每隔一段时间就会积累一定的挂机收益，记得及时领取哟~"/utf8>>),
		      d_1013}]};
get(10166) ->
    #drama_data{bid = 10166,
		name = lang:get(<<"领取挂机收益引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10165}],
		act = [{play_guide, 10165}]};
get(10170) ->
    #drama_data{bid = 10170,
		name = lang:get(<<"推图第五关对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10165}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"通关的<div fontcolor=#d95014>关卡数越高，挂机收益越多</div>，"
				 "让我们继续出发吧~"/utf8>>)}]};
get(10171) ->
    #drama_data{bid = 10171,
		name = lang:get(<<"推图第五关引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10170}],
		act = [{play_guide, 10170}]};
get(10172) ->
    #drama_data{bid = 10172,
		name = lang:get(<<"变强升级对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_dungeon_pass,
		act_cond =
		    [#condition{label = dungeon, op = eq, val = 10050}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"如果对英雄还不熟悉的话，可以通过英雄变强去了解噢~"/utf8>>)}]};
get(10173) ->
    #drama_data{bid = 10173,
		name = lang:get(<<"变强升级引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10172}],
		act = [{play_guide, 10172}]};
get(10174) ->
    #drama_data{bid = 10174,
		name = lang:get(<<"变强升级提示"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10172}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"升级和进阶是提升英雄最快的途径，长按<div fontcolor=#d95014>升级按钮"
				 "</div>还可以进行连续升级哦~"/utf8>>)}]};
get(10175) ->
    #drama_data{bid = 10175,
		name = lang:get(<<"七天登录奖励对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1, event = evt_levup,
		act_cond =
		    [#condition{label = lev, op = eq, val = 7},
		     #condition{label = is_login_days, op = eq, val = 1}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"本小助手给你准备了冒险大礼包哟~每天登录即可领取！"/utf8>>)}]};
get(10176) ->
    #drama_data{bid = 10176,
		name = lang:get(<<"七天登录奖励引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10175}],
		act = [{play_guide, 10175}]};
get(10177) ->
    #drama_data{bid = 10177,
		name = lang:get(<<"每日签到对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10175},
		     #condition{label = is_checkin, op = eq, val = 1}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"每日签到轻轻一点也可以领取到丰厚奖励，千万不要错过啦！"/utf8>>)}]};
get(10178) ->
    #drama_data{bid = 10178,
		name = lang:get(<<"每日签到引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10177}],
		act = [{play_guide, 10177}]};
get(10179) ->
    #drama_data{bid = 10179,
		name = lang:get(<<"推图第六关引导"/utf8>>), is_open = 0,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10177}],
		act = [{play_guide, 10179}]};
get(10180) ->
    #drama_data{bid = 10180,
		name = lang:get(<<"竞技场对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1, event = evt_levup,
		act_cond = [#condition{label = lev, op = eq, val = 8}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"竞技场的荣耀之门已经开启！每次战斗均可获得相应奖励噢~"/utf8>>)}]};
get(10181) ->
    #drama_data{bid = 10181,
		name = lang:get(<<"竞技场引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10180}],
		act = [{play_guide, 10180}]};
get(10182) ->
    #drama_data{bid = 10182,
		name = lang:get(<<"探宝对话"/utf8>>), is_open = 0,
		is_skip = 0, offline = 1, num = 1, event = evt_levup,
		act_cond =
		    [#condition{label = lev, op = eq, val = 11},
		     #condition{label = item_num, op = ge,
				val = {37001, 1}}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"探宝开启，刚才获得的探宝券可以派上用场了！"/utf8>>)}]};
get(10183) ->
    #drama_data{bid = 10183,
		name = lang:get(<<"探宝引导"/utf8>>), is_open = 0,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10182}],
		act = [{play_guide, 10182}]};
get(10192) ->
    #drama_data{bid = 10192,
		name = lang:get(<<"新版首充对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1, event = evt_levup,
		act_cond =
		    [#condition{label = lev, op = eq, val = 10},
		     #condition{label = is_first_charge, op = eq, val = 1},
		     #condition{label = first_charge_ver, op = eq, val = 1}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"满足首次充值的条件后，即可选择一位强力五星英雄与你并肩作战，并领取强力橙装！"/utf8>>)},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"获得五星英雄之后，也别忘了接下来两天前往领取装备噢~"/utf8>>)}]};
get(10193) ->
    #drama_data{bid = 10193,
		name = lang:get(<<"新版首充引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10192}],
		act = [{play_guide, 10192}]};
get(10194) ->
    #drama_data{bid = 10194,
		name = lang:get(<<"新版2首充引导（耶梦加得）"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1, event = evt_levup,
		act_cond =
		    [#condition{label = lev, op = eq, val = 10},
		     #condition{label = is_first_charge, op = eq, val = 1},
		     #condition{label = first_charge_ver, op = eq, val = 2}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"满足首次充值的条件后，即可与强力五星英雄耶梦加得并肩作战，并领取强力橙装！"/utf8>>)},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"获得耶梦加得之后，也别忘了接下来两天前往领取装备噢~"/utf8>>)}]};
get(10195) ->
    #drama_data{bid = 10195,
		name = lang:get(<<"新版2首充引导（耶梦加得）"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10194}],
		act = [{play_guide, 10194}]};
get(20010) ->
    #drama_data{bid = 20010,
		name = lang:get(<<"新版3首充对话（利维坦）"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1, event = evt_levup,
		act_cond =
		    [#condition{label = lev, op = eq, val = 10},
		     #condition{label = is_first_charge, op = eq, val = 1},
		     #condition{label = first_charge_ver, op = eq, val = 3}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"满足首次充值的条件后，即可与强力五星英雄利维坦并肩作战，并领取强力橙装！"/utf8>>)},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"获得利维坦之后，也别忘了接下来两天前往领取装备噢~"/utf8>>)}]};
get(20011) ->
    #drama_data{bid = 20011,
		name = lang:get(<<"新版3首充引导（利维坦）"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 20010}],
		act = [{play_guide, 20010}]};
get(20020) ->
    #drama_data{bid = 20020,
		name = lang:get(<<"新版4首充对话（耶梦&利维坦）"/utf8>>),
		is_open = 1, is_skip = 0, offline = 1, num = 1,
		event = evt_levup,
		act_cond =
		    [#condition{label = lev, op = eq, val = 10},
		     #condition{label = is_first_charge, op = eq, val = 1},
		     #condition{label = first_charge_ver, op = eq, val = 4}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"满足首次充值的条件后，即可与五星法师英雄耶梦加得并肩作战，并领取强力橙装！"/utf8>>)},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"后续满足条件的话还可获得五星战士英雄英雄利维坦哦！"/utf8>>)}]};
get(20021) ->
    #drama_data{bid = 20021,
		name = lang:get(<<"新版4首充引导（耶梦&利维坦）"/utf8>>),
		is_open = 1, is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 20020}],
		act = [{play_guide, 20020}]};
get(10187) ->
    #drama_data{bid = 10187,
		name = lang:get(<<"旧版首充对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1, event = evt_levup,
		act_cond =
		    [#condition{label = lev, op = eq, val = 10},
		     #condition{label = is_first_charge, op = eq, val = 1},
		     #condition{label = first_charge_ver, op = eq, val = 0}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"满足首次充值的条件后，即可与强力五星英雄雅典娜并肩作战，并领取强力橙装！"/utf8>>)},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"获得雅典娜之后，也别忘了接下来两天前往领取装备噢~"/utf8>>)}]};
get(10188) ->
    #drama_data{bid = 10188,
		name = lang:get(<<"旧版首充引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10187}],
		act = [{play_guide, 10187}]};
get(10185) ->
    #drama_data{bid = 10185,
		name = lang:get(<<"远航对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1, event = evt_levup,
		act_cond =
		    [#condition{label = lev, op = eq, val = 12},
		     #condition{label = has_partner, op = eq, val = 10302},
		     #condition{label = has_partner, op = eq, val = 30405}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"远航开启，派遣英雄接取任务，等待一段时间即可领取丰厚奖励噢！"/utf8>>)}]};
get(10186) ->
    #drama_data{bid = 10186,
		name = lang:get(<<"远航引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10185}],
		act = [{play_guide, 10185}]};
get(10197) ->
    #drama_data{bid = 10197,
		name = lang:get(<<"杂货店购买对话（商业街去除，已废弃）"/utf8>>),
		is_open = 0, is_skip = 0, offline = 1, num = 1,
		event = evt_levup,
		act_cond = [#condition{label = lev, op = eq, val = 14}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"储备足够的冒险物资才能有备无患！"/utf8>>)},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"这个时候不妨前往<div fontcolor=#d95014>精灵商店</div>看看，那"
				 "里经常会出售各种折扣商品噢~"/utf8>>)}]};
get(10198) ->
    #drama_data{bid = 10198,
		name = lang:get(<<"杂货店购买引导（商业街去除，已废弃）"/utf8>>),
		is_open = 0, is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10197}],
		act = [{play_guide, 10197}]};
get(10199) ->
    #drama_data{bid = 10199,
		name = lang:get(<<"杂货店后续对话（商业街去除，已废弃）"/utf8>>),
		is_open = 0, is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10197}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"除此之外，商业区中还有其他的商店，各种惊喜等着你来发掘。"/utf8>>)},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"别忘了常来看看哟~"/utf8>>)}]};
get(10190) ->
    #drama_data{bid = 10190,
		name = lang:get(<<"金币副本对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1, event = evt_levup,
		act_cond = [#condition{label = lev, op = eq, val = 15}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"日常副本开启了，赶紧去看看！"/utf8>>)}]};
get(10191) ->
    #drama_data{bid = 10191,
		name = lang:get(<<"金币副本引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10190}],
		act = [{play_guide, 10190}]};
get(10200) ->
    #drama_data{bid = 10200,
		name = lang:get(<<"试练塔对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1, event = evt_levup,
		act_cond = [#condition{label = lev, op = eq, val = 16}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"英雄进阶可以解锁技能、提高属性成长，是提升的重要方式之一！"/utf8>>)},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"而试炼塔则是神秘的进阶最重要的获取途径！"/utf8>>)}]};
get(10201) ->
    #drama_data{bid = 10201,
		name = lang:get(<<"试练塔引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10200}],
		act = [{play_guide, 10200}]};
get(10210) ->
    #drama_data{bid = 10210,
		name = lang:get(<<"公会对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1, event = evt_levup,
		act_cond = [#condition{label = lev, op = eq, val = 18}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"是时候加入<div fontcolor=#d95014>公会</div>了！在这里可以和其"
				 "他人打Boss，抢红包~"/utf8>>)},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"同时<div fontcolor=#d95014>公会技能</div>能够大幅度提升英雄的属性！"/utf8>>)}]};
get(10211) ->
    #drama_data{bid = 10211,
		name = lang:get(<<"公会引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10210}],
		act = [{play_guide, 10210}]};
get(10212) ->
    #drama_data{bid = 10212,
		name = lang:get(<<"加入公会对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10210}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"千万别忘了加入<div fontcolor=#d95014>公会</div>哦~"/utf8>>)}]};
get(10220) ->
    #drama_data{bid = 10220,
		name = lang:get(<<"先知圣殿对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1, event = evt_levup,
		act_cond = [#condition{label = lev, op = eq, val = 30}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"冒险大陆上的先知圣殿，是比召唤更为强大的神秘存在。"/utf8>>)},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"在这里可以指定召唤出各系的四星、五星英雄。"/utf8>>)}]};
get(10221) ->
    #drama_data{bid = 10221,
		name = lang:get(<<"先知圣殿引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10220}],
		act = [{play_guide, 10220}]};
get(10222) ->
    #drama_data{bid = 10222,
		name = lang:get(<<"圣殿道具对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10220}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"选择相应系别的卡牌即可召唤，当然啦，开启先知召唤所需的先知水晶也更为珍贵！"/utf8>>)},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"竞技场宝箱等可以获得先知水晶，可别忘了及时召唤噢~"/utf8>>)}]};
get(10223) ->
    #drama_data{bid = 10223,
		name = lang:get(<<"圣殿礼包弹出引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10222}],
		act = [{play_guide, 10222}]};
get(10250) ->
    #drama_data{bid = 10250,
		name = lang:get(<<"神器穿戴对话"/utf8>>), is_open = 0,
		is_skip = 0, offline = 1, num = 1,
		event = evt_hallows_activate,
		act_cond =
		    [#condition{label = hallows_id, op = eq, val = 1}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"神器激活后就可以携带进入战斗啦！"/utf8>>)}]};
get(10251) ->
    #drama_data{bid = 10251,
		name = lang:get(<<"神器穿戴引导"/utf8>>), is_open = 0,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10220}],
		act = [{play_guide, 10250}]};
get(10300) ->
    #drama_data{bid = 10300,
		name = lang:get(<<"获取家园钥匙引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1, event = evt_get_item,
		act_cond =
		    [#condition{label = item_id, op = eq, val = 10033}],
		act = [{play_guide, 10300}]};
get(10310) ->
    #drama_data{bid = 10310,
		name = lang:get(<<"家园进入剧情"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10300}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"哇！获得了这把钥匙，就意味着你在冒险大陆上拥有自己的家啦！"/utf8>>)},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"快点回去看看吧！"/utf8>>)}]};
get(10311) ->
    #drama_data{bid = 10311,
		name = lang:get(<<"家园进入引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10310}],
		act = [{play_guide, 10310}]};
get(10330) ->
    #drama_data{bid = 10330,
		name = lang:get(<<"购买家具剧情"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_first_enter_home,
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"新家还是空荡荡的，不过没关系，商店中可以购买各种家具~"/utf8>>)}]};
get(10331) ->
    #drama_data{bid = 10331,
		name = lang:get(<<"购买家具引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10330}],
		act = [{play_guide, 10330}]};
get(10340) ->
    #drama_data{bid = 10340,
		name = lang:get(<<"摆放家具剧情"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10330},
		     #condition{label = home_item_num, op = ge,
				val = {200104, 1}}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"拥有家具之后，我们就可以来装饰自己的家啦~"/utf8>>)}]};
get(10341) ->
    #drama_data{bid = 10341,
		name = lang:get(<<"摆放家具引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10340}],
		act = [{play_guide, 10340}]};
get(10350) ->
    #drama_data{bid = 10350,
		name = lang:get(<<"调整家具剧情"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10340},
		     #condition{label = furniture_in_home, op = eq,
				val = 200104}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"如果对已摆放的家具不满意，编辑模式中也可以进行调整~"/utf8>>)}]};
get(10351) ->
    #drama_data{bid = 10351,
		name = lang:get(<<"调整家具引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10340}],
		act = [{play_guide, 10350}]};
get(10360) ->
    #drama_data{bid = 10360,
		name = lang:get(<<"新手训练营剧情"/utf8>>), is_open = 0,
		is_skip = 0, offline = 1, num = 1, event = evt_levup,
		act_cond = [#condition{label = lev, op = eq, val = 20}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"了解这片大陆的规则有助于你更好地应对危机！"/utf8>>)},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"现在就让我们一起去新手训练营学习一下吧~"/utf8>>)}]};
get(10361) ->
    #drama_data{bid = 10361,
		name = lang:get(<<"新手训练营引导"/utf8>>), is_open = 0,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10360}],
		act = [{play_guide, 10360}]};
get(10370) ->
    #drama_data{bid = 10370,
		name = lang:get(<<"位面之境剧情"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1, event = evt_levup,
		act_cond =
		    [#condition{label = lev, op = eq, val = 31},
		     #condition{label = planes, op = eq, val = 0}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"元素乱流中的新位面开启了！"/utf8>>)},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"在位面中征战，完成副本后可以获得大量金币、<div fontcolor=#d95014>征"
				 "战勋章</div>和特定系别<div fontcolor=#d95014>英雄碎片</di"
				 "v>！"/utf8>>)},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"副本中还可拾取蕴含神秘力量的<div fontcolor=#d95014>增益遗物</di"
				 "v>，体验不一样的战斗和英雄技能效果！"/utf8>>)},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"现在就一起去位面之境探险吧！"/utf8>>)}]};
get(10371) ->
    #drama_data{bid = 10371,
		name = lang:get(<<"位面之境引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10370}],
		act = [{play_guide, 10370}]};
get(10372) ->
    #drama_data{bid = 10372, is_open = 1, is_skip = 0,
		offline = 1, num = 1, event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10370}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"接下来就不断地向前探索吧！位面之境每<div fontcolor=#d95014>2天的0"
				 "点</div>会自动重置，探索得越多奖励越丰厚哦~"/utf8>>)}]};
get(10380) ->
    #drama_data{bid = 10380,
		name = lang:get(<<"精灵剧情"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1, event = evt_levup,
		act_cond = [#condition{label = lev, op = eq, val = 80}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"精灵可以依附于神器之上进行战斗，在固定回合释放强力技能！"/utf8>>)},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"而精灵可以通过孵化精灵蛋获得，现在就一起去看看吧~"/utf8>>)}]};
get(10381) ->
    #drama_data{bid = 10381,
		name = lang:get(<<"精灵引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10380}],
		act = [{play_guide, 10380}]};
get(10382) ->
    #drama_data{bid = 10382,
		name = lang:get(<<"精灵孵化说明"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10380}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"等待孵化倒计时结束后就可以获取精灵了，运气好的话还有可能获得极其稀有的橙色精灵~"/utf8>>)},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"当然，还可以直接召唤精灵！通过许愿池许愿后再召唤，有更高概率获得指定精灵哦~"/utf8>>)}]};
get(10383) ->
    #drama_data{bid = 10383,
		name = lang:get(<<"精灵召唤引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10382}],
		act = [{play_guide, 10382}]};
get(10390) ->
    #drama_data{bid = 10390,
		name = lang:get(<<"神装祈祷对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = holy_eqm_frist_open,
		act_cond =
		    [#condition{label = partner_star_num, op = ge,
				val = {9, 1}},
		     #condition{label = partner_not_puton_holy_eqm, op = eq,
				val = 1}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"神装是由矮人族使用神石锻造出来的特别装备，可以为英雄额外附加特殊属性和技能！"/utf8>>)},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"通过天界祈祷和天界副本可以获得神装，现在就一起去看看吧~"/utf8>>)}]};
get(10391) ->
    #drama_data{bid = 10391,
		name = lang:get(<<"神装祈祷引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10390}],
		act = [{play_guide, 10390}]};
get(10400) ->
    #drama_data{bid = 10400,
		name = lang:get(<<"神装穿戴对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10390}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"哇，获得了神装耳环，现在就给英雄穿戴上吧！"/utf8>>)}]};
get(10401) ->
    #drama_data{bid = 10401,
		name = lang:get(<<"神装穿戴引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10400}],
		act = [{play_guide, 10400}]};
get(10410) ->
    #drama_data{bid = 10410,
		name = lang:get(<<"神装副本对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10400}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"神装凑齐两件套和四件套时还能拥有更强大的效果！天界副本中也会掉落神装和材料哟~"/utf8>>)}]};
get(10411) ->
    #drama_data{bid = 10411,
		name = lang:get(<<"神装副本引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10410}],
		act = [{play_guide, 10410}]};
get(10412) ->
    #drama_data{bid = 10412,
		name = lang:get(<<"神装副本对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10410}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"通关的章节关卡越高，获得的奖励就越丰厚哦，努力挑战吧！"/utf8>>)}]};
get(10420) ->
    #drama_data{bid = 10420,
		name = lang:get(<<"原力水晶对话"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1, event = evt_levup,
		act_cond =
		    [#condition{label = lev, op = eq, val = 90},
		     #condition{label = partner_star_num, op = ge,
				val = {1, 6}}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"哇，发现了神秘的原力水晶！我们的英雄可以加入水晶的槽位之中，从而提升为和水晶相同的等级！"/utf8>>)},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"而水晶的等级，则取决于我们最高级的5个英雄！"/utf8>>)}]};
get(10421) ->
    #drama_data{bid = 10421,
		name = lang:get(<<"原力水晶引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_broadcast_drama,
		act_cond =
		    [#condition{label = drama_id, op = eq, val = 10420}],
		act = [{play_guide, 10420}]};
get(10422) ->
    #drama_data{bid = 10422,
		name = lang:get(<<"原力水晶引导"/utf8>>), is_open = 1,
		is_skip = 0, offline = 1, num = 1,
		event = evt_finish_guide,
		act_cond =
		    [#condition{label = guide_id, op = eq, val = 10420}],
		act =
		    [{unit_dialog, 0, 5, 1, 235, 1,
		      lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"放入英雄之后就可以提升英雄等级啦，但是最大不能超过英雄所能达到的等级哦~"/utf8>>)},
		     {unit_dialog, 0, 5, 1, 235, 1, lang:get(<<"小助手"/utf8>>),
		      lang:get(<<"槽位上的英雄取下来后，也需要等待24小时才能再次放入英雄！"/utf8>>)}]};
get(_Id) -> {error, not_exists}.

tri_guide_cond(10200) -> [{star_tower, 0}];
tri_guide_cond(_) -> [].

get_guide(10200) -> [{star_tower, 0}];
get_guide(_) -> [].

get_const(home_pet_dump_id) -> 10350;
get_const(home_pet_leap_id) -> [10330, 10340];
get_const(delay_drama_id) -> 10330;
get_const(heaven_world_lev) -> 110;
get_const(heaven_player_lev1) -> 120;
get_const(heaven_player_lev2) -> 105;
get_const(guide_heavn_id) -> [10390, 10400];
get_const(_) -> undefined.


