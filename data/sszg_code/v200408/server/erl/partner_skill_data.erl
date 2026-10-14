-file("src/mod/data/partner_skill_data.erl", 1).

-module(partner_skill_data).

-lager_records([{group_attr, [atk, hp_max, def, speed]},
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

-export([get_constant/1, get_pos_limit/1,
	 learn_expend/1, get_skill_limit_career/1,
	 get_next_skill_info/1, get_forget/1,
	 get_decompose_award/1, get_decompose_award2/1,
	 get_decompose_award3/1]).

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

-file("src/mod/data/partner_skill_data.erl", 18).

-file("inc/common.hrl", 1).

-file("src/mod/data/partner_skill_data.erl", 19).

-file("inc/attr.hrl", 1).

-file("src/mod/data/partner_skill_data.erl", 20).

get_constant(skill_slot) -> {star, 6};
get_constant(skill_rule) -> 1;
get_constant(_) -> undefined.

get_pos_limit(1) -> {star, 6};
get_pos_limit(2) -> {star, 11};
get_pos_limit(3) -> {star, 13};
get_pos_limit(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpartner_skill_data28, _,
       {__Levelpartner_skill_data28,
	__Tracespartner_skill_data28}}
	  when __Levelpartner_skill_data28 band 8 /= 0 orelse
		 __Tracespartner_skill_data28 /= [] ->
	  lager:do_log(error,
		       [{module, partner_skill_data},
			{function, get_pos_limit}, {line, 28},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("get_pos_limit_data_not_exist===>~w",
				     [_Info]),
		       none, 4096, 8, __Levelpartner_skill_data28,
		       __Tracespartner_skill_data28, lager_event,
		       __Pidpartner_skill_data28);
      _ -> ok
    end,
    undefined.

learn_expend(700001) -> [{16001, 1}];
learn_expend(700011) -> [{16002, 1}];
learn_expend(700021) -> [{16003, 1}];
learn_expend(700031) -> [{16004, 1}];
learn_expend(700041) -> [{16005, 1}];
learn_expend(700051) -> [{16006, 1}];
learn_expend(700061) -> [{16007, 1}];
learn_expend(700071) -> [{16008, 1}];
learn_expend(700081) -> [{16009, 1}];
learn_expend(700091) -> [{16010, 1}];
learn_expend(700101) -> [{16011, 1}];
learn_expend(700111) -> [{16012, 1}];
learn_expend(700121) -> [{16013, 1}];
learn_expend(700131) -> [{16014, 1}];
learn_expend(700141) -> [{16015, 1}];
learn_expend(700151) -> [{16016, 1}];
learn_expend(700161) -> [{16017, 1}];
learn_expend(700171) -> [{16018, 1}];
learn_expend(700181) -> [{16019, 1}];
learn_expend(700191) -> [{16020, 1}];
learn_expend(700201) -> [{16021, 1}];
learn_expend(700211) -> [{16022, 1}];
learn_expend(700221) -> [{16023, 1}];
learn_expend(700231) -> [{16024, 1}];
learn_expend(700241) -> [{16025, 1}];
learn_expend(700251) -> [{16026, 1}];
learn_expend(700261) -> [{16027, 1}];
learn_expend(700271) -> [{16028, 1}];
learn_expend(700291) -> [{16029, 1}];
learn_expend(700301) -> [{16030, 1}];
learn_expend(700311) -> [{16031, 1}];
learn_expend(700321) -> [{16032, 1}];
learn_expend(750000) -> [{16033, 1}];
learn_expend(750100) -> [{16034, 1}];
learn_expend(750200) -> [{16035, 1}];
learn_expend(750400) -> [{16036, 1}];
learn_expend(700281) -> [{16037, 1}];
learn_expend(700361) -> [{16038, 1}];
learn_expend(700371) -> [{16039, 1}];
learn_expend(700381) -> [{16040, 1}];
learn_expend(700391) -> [{16041, 1}];
learn_expend(700401) -> [{16042, 1}];
learn_expend(700411) -> [{16043, 1}];
learn_expend(700421) -> [{16044, 1}];
learn_expend(700431) -> [{16045, 1}];
learn_expend(700441) -> [{16046, 1}];
learn_expend(700451) -> [{16047, 1}];
learn_expend(701001) -> [{16101, 1}];
learn_expend(701011) -> [{16102, 1}];
learn_expend(701021) -> [{16103, 1}];
learn_expend(701031) -> [{16104, 1}];
learn_expend(701041) -> [{16105, 1}];
learn_expend(701051) -> [{16106, 1}];
learn_expend(701061) -> [{16107, 1}];
learn_expend(701071) -> [{16108, 1}];
learn_expend(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpartner_skill_data85, _,
       {__Levelpartner_skill_data85,
	__Tracespartner_skill_data85}}
	  when __Levelpartner_skill_data85 band 8 /= 0 orelse
		 __Tracespartner_skill_data85 /= [] ->
	  lager:do_log(error,
		       [{module, partner_skill_data}, {function, learn_expend},
			{line, 85}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("learn_expend_data_not_exist===>~w",
				     [_Info]),
		       none, 4096, 8, __Levelpartner_skill_data85,
		       __Tracespartner_skill_data85, lager_event,
		       __Pidpartner_skill_data85);
      _ -> ok
    end,
    undefined.

get_skill_limit_career(700001) -> {};
get_skill_limit_career(700011) -> {};
get_skill_limit_career(700021) -> {};
get_skill_limit_career(700031) -> {};
get_skill_limit_career(700041) -> {};
get_skill_limit_career(700051) -> {};
get_skill_limit_career(700061) -> {};
get_skill_limit_career(700071) -> {};
get_skill_limit_career(700081) -> {};
get_skill_limit_career(700091) -> {};
get_skill_limit_career(700101) -> {};
get_skill_limit_career(700111) -> {};
get_skill_limit_career(700121) -> {};
get_skill_limit_career(700131) -> {};
get_skill_limit_career(700141) -> {};
get_skill_limit_career(700151) -> {};
get_skill_limit_career(700161) -> {};
get_skill_limit_career(700171) -> {};
get_skill_limit_career(700181) -> {};
get_skill_limit_career(700191) -> {};
get_skill_limit_career(700201) -> {};
get_skill_limit_career(700211) -> {};
get_skill_limit_career(700221) -> {};
get_skill_limit_career(700231) -> {};
get_skill_limit_career(700241) -> {};
get_skill_limit_career(700251) -> {};
get_skill_limit_career(700261) -> {};
get_skill_limit_career(700271) -> {};
get_skill_limit_career(700291) -> {};
get_skill_limit_career(700301) -> {};
get_skill_limit_career(700311) -> {};
get_skill_limit_career(700321) -> {};
get_skill_limit_career(750000) -> {};
get_skill_limit_career(750100) -> {};
get_skill_limit_career(750200) -> {};
get_skill_limit_career(750400) -> {};
get_skill_limit_career(700281) -> {};
get_skill_limit_career(700361) -> {};
get_skill_limit_career(700371) -> {};
get_skill_limit_career(700381) -> {};
get_skill_limit_career(700391) -> {};
get_skill_limit_career(700401) -> {};
get_skill_limit_career(700411) -> {};
get_skill_limit_career(700421) -> {};
get_skill_limit_career(700431) -> {};
get_skill_limit_career(700441) -> {};
get_skill_limit_career(700451) -> {};
get_skill_limit_career(701001) -> [{3}];
get_skill_limit_career(701011) -> [{3}];
get_skill_limit_career(701021) -> [{2}];
get_skill_limit_career(701031) -> [{2}];
get_skill_limit_career(701041) -> [{4}];
get_skill_limit_career(701051) -> [{4}];
get_skill_limit_career(701061) -> [{5}];
get_skill_limit_career(701071) -> [{5}];
get_skill_limit_career(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpartner_skill_data142, _,
       {__Levelpartner_skill_data142,
	__Tracespartner_skill_data142}}
	  when __Levelpartner_skill_data142 band 8 /= 0 orelse
		 __Tracespartner_skill_data142 /= [] ->
	  lager:do_log(error,
		       [{module, partner_skill_data},
			{function, get_skill_limit_career}, {line, 142},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("get_skill_limit_career_data_not_exist===>~w",
				     [_Info]),
		       none, 4096, 8, __Levelpartner_skill_data142,
		       __Tracespartner_skill_data142, lager_event,
		       __Pidpartner_skill_data142);
      _ -> ok
    end,
    undefined.

get_next_skill_info(700001) ->
    {700003, [{16001, 3}, {10450, 10000}]};
get_next_skill_info(700011) ->
    {700013, [{16002, 3}, {10450, 10000}]};
get_next_skill_info(700021) ->
    {700023, [{16003, 3}, {10450, 10000}]};
get_next_skill_info(700031) ->
    {700033, [{16004, 3}, {10450, 10000}]};
get_next_skill_info(700041) ->
    {700043, [{16005, 3}, {10450, 10000}]};
get_next_skill_info(700051) ->
    {700053, [{16006, 3}, {10450, 10000}]};
get_next_skill_info(700061) ->
    {700063, [{16007, 3}, {10450, 10000}]};
get_next_skill_info(700071) ->
    {700073, [{16008, 3}, {10450, 10000}]};
get_next_skill_info(700081) ->
    {700083, [{16009, 3}, {10450, 10000}]};
get_next_skill_info(700091) ->
    {700093, [{16010, 3}, {10450, 10000}]};
get_next_skill_info(700101) ->
    {700103, [{16011, 3}, {10450, 10000}]};
get_next_skill_info(700111) ->
    {700113, [{16012, 3}, {10450, 10000}]};
get_next_skill_info(700121) ->
    {700123, [{16013, 3}, {10450, 10000}]};
get_next_skill_info(700131) ->
    {700133, [{16014, 3}, {10450, 10000}]};
get_next_skill_info(700141) ->
    {700143, [{16015, 3}, {10450, 10000}]};
get_next_skill_info(700151) ->
    {700153, [{16016, 3}, {10450, 10000}]};
get_next_skill_info(700161) ->
    {700163, [{16017, 3}, {10450, 10000}]};
get_next_skill_info(700171) ->
    {700173, [{16018, 3}, {10450, 10000}]};
get_next_skill_info(700181) ->
    {700183, [{16019, 3}, {10450, 10000}]};
get_next_skill_info(700191) ->
    {700193, [{16020, 3}, {10450, 10000}]};
get_next_skill_info(700201) ->
    {700203, [{16021, 3}, {10450, 10000}]};
get_next_skill_info(700211) ->
    {700213, [{16022, 3}, {10450, 10000}]};
get_next_skill_info(700221) ->
    {700223, [{16023, 3}, {10450, 10000}]};
get_next_skill_info(700231) ->
    {700233, [{16024, 3}, {10450, 10000}]};
get_next_skill_info(700241) ->
    {700243, [{16025, 3}, {10450, 10000}]};
get_next_skill_info(700251) ->
    {700253, [{16026, 3}, {10450, 10000}]};
get_next_skill_info(700261) ->
    {700263, [{16027, 3}, {10450, 10000}]};
get_next_skill_info(700271) ->
    {700273, [{16028, 3}, {10450, 10000}]};
get_next_skill_info(700291) ->
    {700293, [{16029, 3}, {10450, 10000}]};
get_next_skill_info(700301) ->
    {700303, [{16030, 3}, {10450, 10000}]};
get_next_skill_info(700311) ->
    {700313, [{16031, 3}, {10450, 10000}]};
get_next_skill_info(700321) ->
    {700323, [{16032, 3}, {10450, 10000}]};
get_next_skill_info(750000) ->
    {750001, [{16033, 3}, {10450, 10000}]};
get_next_skill_info(750100) ->
    {750101, [{16034, 3}, {10450, 10000}]};
get_next_skill_info(750200) ->
    {750201, [{16035, 3}, {10450, 10000}]};
get_next_skill_info(750400) ->
    {750401, [{16036, 3}, {10450, 10000}]};
get_next_skill_info(700281) ->
    {700283, [{16037, 3}, {10450, 10000}]};
get_next_skill_info(700361) ->
    {700363, [{16038, 3}, {10450, 10000}]};
get_next_skill_info(700371) ->
    {700373, [{16039, 3}, {10450, 10000}]};
get_next_skill_info(700381) ->
    {700383, [{16040, 3}, {10450, 10000}]};
get_next_skill_info(700391) ->
    {700393, [{16041, 3}, {10450, 10000}]};
get_next_skill_info(700401) ->
    {700403, [{16042, 3}, {10450, 10000}]};
get_next_skill_info(700411) ->
    {700413, [{16043, 3}, {10450, 10000}]};
get_next_skill_info(700421) ->
    {700423, [{16044, 3}, {10450, 10000}]};
get_next_skill_info(700431) ->
    {700433, [{16045, 3}, {10450, 10000}]};
get_next_skill_info(700441) ->
    {700443, [{16046, 3}, {10450, 10000}]};
get_next_skill_info(700451) ->
    {700453, [{16047, 3}, {10450, 10000}]};
get_next_skill_info(701001) ->
    {701003, [{16101, 3}, {10460, 10}]};
get_next_skill_info(701011) ->
    {701013, [{16102, 3}, {10460, 10}]};
get_next_skill_info(701021) ->
    {701023, [{16103, 3}, {10460, 10}]};
get_next_skill_info(701031) ->
    {701033, [{16104, 3}, {10460, 10}]};
get_next_skill_info(701041) ->
    {701043, [{16105, 3}, {10460, 10}]};
get_next_skill_info(701051) ->
    {701053, [{16106, 3}, {10460, 10}]};
get_next_skill_info(701061) ->
    {701063, [{16107, 3}, {10460, 10}]};
get_next_skill_info(701071) ->
    {701073, [{16108, 3}, {10460, 10}]};
get_next_skill_info(700003) ->
    {700005, [{16001, 5}, {10450, 20000}]};
get_next_skill_info(700013) ->
    {700015, [{16002, 5}, {10450, 20000}]};
get_next_skill_info(700023) ->
    {700025, [{16003, 5}, {10450, 20000}]};
get_next_skill_info(700033) ->
    {700035, [{16004, 5}, {10450, 20000}]};
get_next_skill_info(700043) ->
    {700045, [{16005, 5}, {10450, 20000}]};
get_next_skill_info(700053) ->
    {700055, [{16006, 5}, {10450, 20000}]};
get_next_skill_info(700063) ->
    {700065, [{16007, 5}, {10450, 20000}]};
get_next_skill_info(700073) ->
    {700075, [{16008, 5}, {10450, 20000}]};
get_next_skill_info(700083) ->
    {700085, [{16009, 5}, {10450, 20000}]};
get_next_skill_info(700093) ->
    {700095, [{16010, 5}, {10450, 20000}]};
get_next_skill_info(700103) ->
    {700105, [{16011, 5}, {10450, 20000}]};
get_next_skill_info(700113) ->
    {700115, [{16012, 5}, {10450, 20000}]};
get_next_skill_info(700123) ->
    {700125, [{16013, 5}, {10450, 20000}]};
get_next_skill_info(700133) ->
    {700135, [{16014, 5}, {10450, 20000}]};
get_next_skill_info(700143) ->
    {700145, [{16015, 5}, {10450, 20000}]};
get_next_skill_info(700153) ->
    {700155, [{16016, 5}, {10450, 20000}]};
get_next_skill_info(700163) ->
    {700165, [{16017, 5}, {10450, 20000}]};
get_next_skill_info(700173) ->
    {700175, [{16018, 5}, {10450, 20000}]};
get_next_skill_info(700183) ->
    {700185, [{16019, 5}, {10450, 20000}]};
get_next_skill_info(700193) ->
    {700195, [{16020, 5}, {10450, 20000}]};
get_next_skill_info(700203) ->
    {700205, [{16021, 5}, {10450, 20000}]};
get_next_skill_info(700213) ->
    {700215, [{16022, 5}, {10450, 20000}]};
get_next_skill_info(700223) ->
    {700225, [{16023, 5}, {10450, 20000}]};
get_next_skill_info(700233) ->
    {700235, [{16024, 5}, {10450, 20000}]};
get_next_skill_info(700243) ->
    {700245, [{16025, 5}, {10450, 20000}]};
get_next_skill_info(700253) ->
    {700255, [{16026, 5}, {10450, 20000}]};
get_next_skill_info(700263) ->
    {700265, [{16027, 5}, {10450, 20000}]};
get_next_skill_info(700273) ->
    {700275, [{16028, 5}, {10450, 20000}]};
get_next_skill_info(700293) ->
    {700295, [{16029, 5}, {10450, 20000}]};
get_next_skill_info(700303) ->
    {700305, [{16030, 5}, {10450, 20000}]};
get_next_skill_info(700313) ->
    {700315, [{16031, 5}, {10450, 20000}]};
get_next_skill_info(700323) ->
    {700325, [{16032, 5}, {10450, 20000}]};
get_next_skill_info(750001) ->
    {750002, [{16033, 5}, {10450, 20000}]};
get_next_skill_info(750101) ->
    {750102, [{16034, 5}, {10450, 20000}]};
get_next_skill_info(750201) ->
    {750202, [{16035, 5}, {10450, 20000}]};
get_next_skill_info(750401) ->
    {750402, [{16036, 5}, {10450, 20000}]};
get_next_skill_info(700283) ->
    {700285, [{16037, 5}, {10450, 20000}]};
get_next_skill_info(700363) ->
    {700365, [{16038, 5}, {10450, 20000}]};
get_next_skill_info(700373) ->
    {700375, [{16039, 5}, {10450, 20000}]};
get_next_skill_info(700383) ->
    {700385, [{16040, 5}, {10450, 20000}]};
get_next_skill_info(700393) ->
    {700395, [{16041, 5}, {10450, 20000}]};
get_next_skill_info(700403) ->
    {700405, [{16042, 5}, {10450, 20000}]};
get_next_skill_info(700413) ->
    {700415, [{16043, 5}, {10450, 20000}]};
get_next_skill_info(700423) ->
    {700425, [{16044, 5}, {10450, 20000}]};
get_next_skill_info(700433) ->
    {700435, [{16045, 5}, {10450, 20000}]};
get_next_skill_info(700443) ->
    {700445, [{16046, 5}, {10450, 20000}]};
get_next_skill_info(700453) ->
    {700455, [{16047, 5}, {10450, 20000}]};
get_next_skill_info(701003) ->
    {701005, [{16101, 5}, {10460, 20}]};
get_next_skill_info(701013) ->
    {701015, [{16102, 5}, {10460, 20}]};
get_next_skill_info(701023) ->
    {701025, [{16103, 5}, {10460, 20}]};
get_next_skill_info(701033) ->
    {701035, [{16104, 5}, {10460, 20}]};
get_next_skill_info(701043) ->
    {701045, [{16105, 5}, {10460, 20}]};
get_next_skill_info(701053) ->
    {701055, [{16106, 5}, {10460, 20}]};
get_next_skill_info(701063) ->
    {701065, [{16107, 5}, {10460, 20}]};
get_next_skill_info(701073) ->
    {701075, [{16108, 5}, {10460, 20}]};
get_next_skill_info(701005) ->
    {701006, [{16101, 5}, {10460, 20}]};
get_next_skill_info(701015) ->
    {701016, [{16102, 5}, {10460, 20}]};
get_next_skill_info(701025) ->
    {701026, [{16103, 5}, {10460, 20}]};
get_next_skill_info(701035) ->
    {701036, [{16104, 5}, {10460, 20}]};
get_next_skill_info(701045) ->
    {701046, [{16105, 5}, {10460, 20}]};
get_next_skill_info(701055) ->
    {701056, [{16106, 5}, {10460, 20}]};
get_next_skill_info(701065) ->
    {701066, [{16107, 5}, {10460, 20}]};
get_next_skill_info(701075) ->
    {701076, [{16108, 5}, {10460, 20}]};
get_next_skill_info(700005) ->
    {700006, [{16001, 5}, {10450, 20000}]};
get_next_skill_info(700015) ->
    {700016, [{16002, 5}, {10450, 20000}]};
get_next_skill_info(700025) ->
    {700026, [{16003, 5}, {10450, 20000}]};
get_next_skill_info(700035) ->
    {700036, [{16004, 5}, {10450, 20000}]};
get_next_skill_info(700045) ->
    {700046, [{16005, 5}, {10450, 20000}]};
get_next_skill_info(700055) ->
    {700056, [{16006, 5}, {10450, 20000}]};
get_next_skill_info(700065) ->
    {700066, [{16007, 5}, {10450, 20000}]};
get_next_skill_info(700075) ->
    {700076, [{16008, 5}, {10450, 20000}]};
get_next_skill_info(700085) ->
    {700086, [{16009, 5}, {10450, 20000}]};
get_next_skill_info(700095) ->
    {700096, [{16010, 5}, {10450, 20000}]};
get_next_skill_info(700105) ->
    {700106, [{16011, 5}, {10450, 20000}]};
get_next_skill_info(700115) ->
    {700116, [{16012, 5}, {10450, 20000}]};
get_next_skill_info(700125) ->
    {700126, [{16013, 5}, {10450, 20000}]};
get_next_skill_info(700135) ->
    {700136, [{16014, 5}, {10450, 20000}]};
get_next_skill_info(700145) ->
    {700146, [{16015, 5}, {10450, 20000}]};
get_next_skill_info(700155) ->
    {700156, [{16016, 5}, {10450, 20000}]};
get_next_skill_info(700165) ->
    {700166, [{16017, 5}, {10450, 20000}]};
get_next_skill_info(700175) ->
    {700176, [{16018, 5}, {10450, 20000}]};
get_next_skill_info(700185) ->
    {700186, [{16019, 5}, {10450, 20000}]};
get_next_skill_info(700195) ->
    {700196, [{16020, 5}, {10450, 20000}]};
get_next_skill_info(700205) ->
    {700206, [{16021, 5}, {10450, 20000}]};
get_next_skill_info(700215) ->
    {700216, [{16022, 5}, {10450, 20000}]};
get_next_skill_info(700225) ->
    {700226, [{16023, 5}, {10450, 20000}]};
get_next_skill_info(700235) ->
    {700236, [{16024, 5}, {10450, 20000}]};
get_next_skill_info(700245) ->
    {700246, [{16025, 5}, {10450, 20000}]};
get_next_skill_info(700255) ->
    {700256, [{16026, 5}, {10450, 20000}]};
get_next_skill_info(700265) ->
    {700266, [{16027, 5}, {10450, 20000}]};
get_next_skill_info(700275) ->
    {700276, [{16028, 5}, {10450, 20000}]};
get_next_skill_info(700295) ->
    {700296, [{16029, 5}, {10450, 20000}]};
get_next_skill_info(700305) ->
    {700306, [{16030, 5}, {10450, 20000}]};
get_next_skill_info(700315) ->
    {700316, [{16031, 5}, {10450, 20000}]};
get_next_skill_info(700325) ->
    {700326, [{16032, 5}, {10450, 20000}]};
get_next_skill_info(750002) ->
    {750003, [{16033, 5}, {10450, 20000}]};
get_next_skill_info(750102) ->
    {750103, [{16034, 5}, {10450, 20000}]};
get_next_skill_info(750202) ->
    {750203, [{16035, 5}, {10450, 20000}]};
get_next_skill_info(750402) ->
    {750403, [{16036, 5}, {10450, 20000}]};
get_next_skill_info(700285) ->
    {700286, [{16037, 5}, {10450, 20000}]};
get_next_skill_info(700365) ->
    {700366, [{16038, 5}, {10450, 20000}]};
get_next_skill_info(700375) ->
    {700376, [{16039, 5}, {10450, 20000}]};
get_next_skill_info(700385) ->
    {700386, [{16040, 5}, {10450, 20000}]};
get_next_skill_info(700395) ->
    {700396, [{16041, 5}, {10450, 20000}]};
get_next_skill_info(700405) ->
    {700406, [{16042, 5}, {10450, 20000}]};
get_next_skill_info(700415) ->
    {700416, [{16043, 5}, {10450, 20000}]};
get_next_skill_info(700425) ->
    {700426, [{16044, 5}, {10450, 20000}]};
get_next_skill_info(700435) ->
    {700436, [{16045, 5}, {10450, 20000}]};
get_next_skill_info(700445) ->
    {700446, [{16046, 5}, {10450, 20000}]};
get_next_skill_info(700455) ->
    {700456, [{16047, 5}, {10450, 20000}]};
get_next_skill_info(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpartner_skill_data309, _,
       {__Levelpartner_skill_data309,
	__Tracespartner_skill_data309}}
	  when __Levelpartner_skill_data309 band 8 /= 0 orelse
		 __Tracespartner_skill_data309 /= [] ->
	  lager:do_log(error,
		       [{module, partner_skill_data},
			{function, get_next_skill_info}, {line, 309},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("get_next_skill_info_data_not_exist===>~w",
				     [_Info]),
		       none, 4096, 8, __Levelpartner_skill_data309,
		       __Tracespartner_skill_data309, lager_event,
		       __Pidpartner_skill_data309);
      _ -> ok
    end,
    undefined.

get_forget(700001) -> {[{10450, 1375}], [{3, 100}]};
get_forget(700011) -> {[{10450, 1375}], [{3, 100}]};
get_forget(700021) -> {[{10450, 1250}], [{3, 100}]};
get_forget(700031) -> {[{10450, 1250}], [{3, 100}]};
get_forget(700041) -> {[{10450, 1375}], [{3, 100}]};
get_forget(700051) -> {[{10450, 1375}], [{3, 100}]};
get_forget(700061) -> {[{10450, 1250}], [{3, 100}]};
get_forget(700071) -> {[{10450, 1500}], [{3, 100}]};
get_forget(700081) -> {[{10450, 1000}], [{3, 100}]};
get_forget(700091) -> {[{10450, 1000}], [{3, 100}]};
get_forget(700101) -> {[{10450, 1000}], [{3, 100}]};
get_forget(700111) -> {[{10450, 1000}], [{3, 100}]};
get_forget(700121) -> {[{10450, 1000}], [{3, 100}]};
get_forget(700131) -> {[{10450, 1000}], [{3, 100}]};
get_forget(700141) -> {[{10450, 1250}], [{3, 100}]};
get_forget(700151) -> {[{10450, 1000}], [{3, 100}]};
get_forget(700161) -> {[{10450, 1000}], [{3, 100}]};
get_forget(700171) -> {[{10450, 1375}], [{3, 100}]};
get_forget(700181) -> {[{10450, 1250}], [{3, 100}]};
get_forget(700191) -> {[{10450, 1250}], [{3, 100}]};
get_forget(700201) -> {[{10450, 1375}], [{3, 100}]};
get_forget(700211) -> {[{10450, 1250}], [{3, 100}]};
get_forget(700221) -> {[{10450, 1250}], [{3, 100}]};
get_forget(700231) -> {[{10450, 1375}], [{3, 100}]};
get_forget(700241) -> {[{10450, 1375}], [{3, 100}]};
get_forget(700251) -> {[{10450, 1250}], [{3, 100}]};
get_forget(700261) -> {[{10450, 1375}], [{3, 100}]};
get_forget(700271) -> {[{10450, 1375}], [{3, 100}]};
get_forget(700291) -> {[{10450, 1250}], [{3, 100}]};
get_forget(700301) -> {[{10450, 1000}], [{3, 100}]};
get_forget(700311) -> {[{10450, 1375}], [{3, 100}]};
get_forget(700321) -> {[{10450, 1375}], [{3, 100}]};
get_forget(750000) -> {[{10450, 1500}], [{3, 100}]};
get_forget(750100) -> {[{10450, 1375}], [{3, 100}]};
get_forget(750200) -> {[{10450, 1500}], [{3, 100}]};
get_forget(750400) -> {[{10450, 1375}], [{3, 100}]};
get_forget(700281) -> {[{10450, 1375}], [{3, 100}]};
get_forget(700361) -> {[{10450, 1375}], [{3, 100}]};
get_forget(700371) -> {[{10450, 1250}], [{3, 100}]};
get_forget(700381) -> {[{10450, 1250}], [{3, 100}]};
get_forget(700391) -> {[{10450, 1375}], [{3, 100}]};
get_forget(700401) -> {[{10450, 1375}], [{3, 100}]};
get_forget(700411) -> {[{10450, 1375}], [{3, 100}]};
get_forget(700421) -> {[{10450, 1375}], [{3, 100}]};
get_forget(700431) -> {[{10450, 1375}], [{3, 100}]};
get_forget(700441) -> {[{10450, 1375}], [{3, 100}]};
get_forget(700451) -> {[{10450, 1375}], [{3, 100}]};
get_forget(701001) -> {[{10460, 2}], [{3, 100}]};
get_forget(701011) -> {[{10460, 2}], [{3, 100}]};
get_forget(701021) -> {[{10460, 2}], [{3, 100}]};
get_forget(701031) -> {[{10460, 2}], [{3, 100}]};
get_forget(701041) -> {[{10460, 2}], [{3, 100}]};
get_forget(701051) -> {[{10460, 2}], [{3, 100}]};
get_forget(701061) -> {[{10460, 2}], [{3, 100}]};
get_forget(701071) -> {[{10460, 2}], [{3, 100}]};
get_forget(700003) -> {[{10450, 10500}], [{3, 200}]};
get_forget(700013) -> {[{10450, 10500}], [{3, 200}]};
get_forget(700023) -> {[{10450, 10000}], [{3, 200}]};
get_forget(700033) -> {[{10450, 10000}], [{3, 200}]};
get_forget(700043) -> {[{10450, 10500}], [{3, 200}]};
get_forget(700053) -> {[{10450, 10500}], [{3, 200}]};
get_forget(700063) -> {[{10450, 10000}], [{3, 200}]};
get_forget(700073) -> {[{10450, 11000}], [{3, 200}]};
get_forget(700083) -> {[{10450, 9000}], [{3, 200}]};
get_forget(700093) -> {[{10450, 9000}], [{3, 200}]};
get_forget(700103) -> {[{10450, 9000}], [{3, 200}]};
get_forget(700113) -> {[{10450, 9000}], [{3, 200}]};
get_forget(700123) -> {[{10450, 9000}], [{3, 200}]};
get_forget(700133) -> {[{10450, 9000}], [{3, 200}]};
get_forget(700143) -> {[{10450, 10000}], [{3, 200}]};
get_forget(700153) -> {[{10450, 9000}], [{3, 200}]};
get_forget(700163) -> {[{10450, 9000}], [{3, 200}]};
get_forget(700173) -> {[{10450, 10500}], [{3, 200}]};
get_forget(700183) -> {[{10450, 10000}], [{3, 200}]};
get_forget(700193) -> {[{10450, 10000}], [{3, 200}]};
get_forget(700203) -> {[{10450, 10500}], [{3, 200}]};
get_forget(700213) -> {[{10450, 10000}], [{3, 200}]};
get_forget(700223) -> {[{10450, 10000}], [{3, 200}]};
get_forget(700233) -> {[{10450, 10500}], [{3, 200}]};
get_forget(700243) -> {[{10450, 10500}], [{3, 200}]};
get_forget(700253) -> {[{10450, 10000}], [{3, 200}]};
get_forget(700263) -> {[{10450, 10500}], [{3, 200}]};
get_forget(700273) -> {[{10450, 10500}], [{3, 200}]};
get_forget(700293) -> {[{10450, 10000}], [{3, 200}]};
get_forget(700303) -> {[{10450, 9000}], [{3, 200}]};
get_forget(700313) -> {[{10450, 10500}], [{3, 200}]};
get_forget(700323) -> {[{10450, 10500}], [{3, 200}]};
get_forget(750001) -> {[{10450, 11000}], [{3, 200}]};
get_forget(750101) -> {[{10450, 10500}], [{3, 200}]};
get_forget(750201) -> {[{10450, 11000}], [{3, 200}]};
get_forget(750401) -> {[{10450, 10500}], [{3, 200}]};
get_forget(700283) -> {[{10450, 10500}], [{3, 200}]};
get_forget(700363) -> {[{10450, 10500}], [{3, 200}]};
get_forget(700373) -> {[{10450, 10000}], [{3, 200}]};
get_forget(700383) -> {[{10450, 10000}], [{3, 200}]};
get_forget(700393) -> {[{10450, 10500}], [{3, 200}]};
get_forget(700403) -> {[{10450, 10500}], [{3, 200}]};
get_forget(700413) -> {[{10450, 10500}], [{3, 200}]};
get_forget(700423) -> {[{10450, 10500}], [{3, 200}]};
get_forget(700433) -> {[{10450, 10500}], [{3, 200}]};
get_forget(700443) -> {[{10450, 10500}], [{3, 200}]};
get_forget(700453) -> {[{10450, 10500}], [{3, 200}]};
get_forget(701003) -> {[{10460, 13}], [{3, 200}]};
get_forget(701013) -> {[{10460, 13}], [{3, 200}]};
get_forget(701023) -> {[{10460, 13}], [{3, 200}]};
get_forget(701033) -> {[{10460, 13}], [{3, 200}]};
get_forget(701043) -> {[{10460, 13}], [{3, 200}]};
get_forget(701053) -> {[{10460, 13}], [{3, 200}]};
get_forget(701063) -> {[{10460, 13}], [{3, 200}]};
get_forget(701073) -> {[{10460, 13}], [{3, 200}]};
get_forget(700005) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700015) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700025) -> {[{10450, 26250}], [{3, 500}]};
get_forget(700035) -> {[{10450, 26250}], [{3, 500}]};
get_forget(700045) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700055) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700065) -> {[{10450, 26250}], [{3, 500}]};
get_forget(700075) -> {[{10450, 28500}], [{3, 500}]};
get_forget(700085) -> {[{10450, 24000}], [{3, 500}]};
get_forget(700095) -> {[{10450, 24000}], [{3, 500}]};
get_forget(700105) -> {[{10450, 24000}], [{3, 500}]};
get_forget(700115) -> {[{10450, 24000}], [{3, 500}]};
get_forget(700125) -> {[{10450, 24000}], [{3, 500}]};
get_forget(700135) -> {[{10450, 24000}], [{3, 500}]};
get_forget(700145) -> {[{10450, 26250}], [{3, 500}]};
get_forget(700155) -> {[{10450, 24000}], [{3, 500}]};
get_forget(700165) -> {[{10450, 24000}], [{3, 500}]};
get_forget(700175) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700185) -> {[{10450, 26250}], [{3, 500}]};
get_forget(700195) -> {[{10450, 26250}], [{3, 500}]};
get_forget(700205) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700215) -> {[{10450, 26250}], [{3, 500}]};
get_forget(700225) -> {[{10450, 26250}], [{3, 500}]};
get_forget(700235) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700245) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700255) -> {[{10450, 26250}], [{3, 500}]};
get_forget(700265) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700275) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700295) -> {[{10450, 26250}], [{3, 500}]};
get_forget(700305) -> {[{10450, 24000}], [{3, 500}]};
get_forget(700315) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700325) -> {[{10450, 27375}], [{3, 500}]};
get_forget(750002) -> {[{10450, 28500}], [{3, 500}]};
get_forget(750102) -> {[{10450, 27375}], [{3, 500}]};
get_forget(750202) -> {[{10450, 28500}], [{3, 500}]};
get_forget(750402) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700285) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700365) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700375) -> {[{10450, 26250}], [{3, 500}]};
get_forget(700385) -> {[{10450, 26250}], [{3, 500}]};
get_forget(700395) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700405) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700415) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700425) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700435) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700445) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700455) -> {[{10450, 27375}], [{3, 500}]};
get_forget(701005) -> {[{10460, 33}], [{3, 500}]};
get_forget(701015) -> {[{10460, 33}], [{3, 500}]};
get_forget(701025) -> {[{10460, 33}], [{3, 500}]};
get_forget(701035) -> {[{10460, 33}], [{3, 500}]};
get_forget(701045) -> {[{10460, 33}], [{3, 500}]};
get_forget(701055) -> {[{10460, 33}], [{3, 500}]};
get_forget(701065) -> {[{10460, 33}], [{3, 500}]};
get_forget(701075) -> {[{10460, 33}], [{3, 500}]};
get_forget(701006) -> {[{10460, 43}], [{3, 500}]};
get_forget(701016) -> {[{10460, 43}], [{3, 500}]};
get_forget(701026) -> {[{10460, 43}], [{3, 500}]};
get_forget(701036) -> {[{10460, 43}], [{3, 500}]};
get_forget(701046) -> {[{10460, 43}], [{3, 500}]};
get_forget(701056) -> {[{10460, 43}], [{3, 500}]};
get_forget(701066) -> {[{10460, 43}], [{3, 500}]};
get_forget(701076) -> {[{10460, 43}], [{3, 500}]};
get_forget(700006) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700016) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700026) -> {[{10450, 26250}], [{3, 500}]};
get_forget(700036) -> {[{10450, 26250}], [{3, 500}]};
get_forget(700046) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700056) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700066) -> {[{10450, 26250}], [{3, 500}]};
get_forget(700076) -> {[{10450, 28500}], [{3, 500}]};
get_forget(700086) -> {[{10450, 24000}], [{3, 500}]};
get_forget(700096) -> {[{10450, 24000}], [{3, 500}]};
get_forget(700106) -> {[{10450, 24000}], [{3, 500}]};
get_forget(700116) -> {[{10450, 24000}], [{3, 500}]};
get_forget(700126) -> {[{10450, 24000}], [{3, 500}]};
get_forget(700136) -> {[{10450, 24000}], [{3, 500}]};
get_forget(700146) -> {[{10450, 26250}], [{3, 500}]};
get_forget(700156) -> {[{10450, 24000}], [{3, 500}]};
get_forget(700166) -> {[{10450, 24000}], [{3, 500}]};
get_forget(700176) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700186) -> {[{10450, 26250}], [{3, 500}]};
get_forget(700196) -> {[{10450, 26250}], [{3, 500}]};
get_forget(700206) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700216) -> {[{10450, 26250}], [{3, 500}]};
get_forget(700226) -> {[{10450, 26250}], [{3, 500}]};
get_forget(700236) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700246) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700256) -> {[{10450, 26250}], [{3, 500}]};
get_forget(700266) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700276) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700296) -> {[{10450, 26250}], [{3, 500}]};
get_forget(700306) -> {[{10450, 24000}], [{3, 500}]};
get_forget(700316) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700326) -> {[{10450, 27375}], [{3, 500}]};
get_forget(750003) -> {[{10450, 28500}], [{3, 500}]};
get_forget(750103) -> {[{10450, 27375}], [{3, 500}]};
get_forget(750203) -> {[{10450, 28500}], [{3, 500}]};
get_forget(750403) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700286) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700366) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700376) -> {[{10450, 26250}], [{3, 500}]};
get_forget(700386) -> {[{10450, 26250}], [{3, 500}]};
get_forget(700396) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700406) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700416) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700426) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700436) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700446) -> {[{10450, 27375}], [{3, 500}]};
get_forget(700456) -> {[{10450, 27375}], [{3, 500}]};
get_forget(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpartner_skill_data531, _,
       {__Levelpartner_skill_data531,
	__Tracespartner_skill_data531}}
	  when __Levelpartner_skill_data531 band 8 /= 0 orelse
		 __Tracespartner_skill_data531 /= [] ->
	  lager:do_log(error,
		       [{module, partner_skill_data}, {function, get_forget},
			{line, 531}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("get_forget_data_not_exist===>~w",
				     [_Info]),
		       none, 4096, 8, __Levelpartner_skill_data531,
		       __Tracespartner_skill_data531, lager_event,
		       __Pidpartner_skill_data531);
      _ -> ok
    end,
    undefined.

get_decompose_award(700001) -> [{10450, 1375}];
get_decompose_award(700011) -> [{10450, 1375}];
get_decompose_award(700021) -> [{10450, 1250}];
get_decompose_award(700031) -> [{10450, 1250}];
get_decompose_award(700041) -> [{10450, 1375}];
get_decompose_award(700051) -> [{10450, 1375}];
get_decompose_award(700061) -> [{10450, 1250}];
get_decompose_award(700071) -> [{10450, 1500}];
get_decompose_award(700081) -> [{10450, 1000}];
get_decompose_award(700091) -> [{10450, 1000}];
get_decompose_award(700101) -> [{10450, 1000}];
get_decompose_award(700111) -> [{10450, 1000}];
get_decompose_award(700121) -> [{10450, 1000}];
get_decompose_award(700131) -> [{10450, 1000}];
get_decompose_award(700141) -> [{10450, 1250}];
get_decompose_award(700151) -> [{10450, 1000}];
get_decompose_award(700161) -> [{10450, 1000}];
get_decompose_award(700171) -> [{10450, 1375}];
get_decompose_award(700181) -> [{10450, 1250}];
get_decompose_award(700191) -> [{10450, 1250}];
get_decompose_award(700201) -> [{10450, 1375}];
get_decompose_award(700211) -> [{10450, 1250}];
get_decompose_award(700221) -> [{10450, 1250}];
get_decompose_award(700231) -> [{10450, 1375}];
get_decompose_award(700241) -> [{10450, 1375}];
get_decompose_award(700251) -> [{10450, 1250}];
get_decompose_award(700261) -> [{10450, 1375}];
get_decompose_award(700271) -> [{10450, 1375}];
get_decompose_award(700291) -> [{10450, 1250}];
get_decompose_award(700301) -> [{10450, 1000}];
get_decompose_award(700311) -> [{10450, 1375}];
get_decompose_award(700321) -> [{10450, 1375}];
get_decompose_award(750000) -> [{10450, 1500}];
get_decompose_award(750100) -> [{10450, 1375}];
get_decompose_award(750200) -> [{10450, 1500}];
get_decompose_award(750400) -> [{10450, 1375}];
get_decompose_award(700281) -> [{10450, 1375}];
get_decompose_award(700361) -> [{10450, 1375}];
get_decompose_award(700371) -> [{10450, 1250}];
get_decompose_award(700381) -> [{10450, 1250}];
get_decompose_award(700391) -> [{10450, 1375}];
get_decompose_award(700401) -> [{10450, 1375}];
get_decompose_award(700411) -> [{10450, 1375}];
get_decompose_award(700421) -> [{10450, 1375}];
get_decompose_award(700431) -> [{10450, 1375}];
get_decompose_award(700441) -> [{10450, 1375}];
get_decompose_award(700451) -> [{10450, 1375}];
get_decompose_award(701001) -> [{10460, 2}];
get_decompose_award(701011) -> [{10460, 2}];
get_decompose_award(701021) -> [{10460, 2}];
get_decompose_award(701031) -> [{10460, 2}];
get_decompose_award(701041) -> [{10460, 2}];
get_decompose_award(701051) -> [{10460, 2}];
get_decompose_award(701061) -> [{10460, 2}];
get_decompose_award(701071) -> [{10460, 2}];
get_decompose_award(700003) -> [{10450, 10500}];
get_decompose_award(700013) -> [{10450, 10500}];
get_decompose_award(700023) -> [{10450, 10000}];
get_decompose_award(700033) -> [{10450, 10000}];
get_decompose_award(700043) -> [{10450, 10500}];
get_decompose_award(700053) -> [{10450, 10500}];
get_decompose_award(700063) -> [{10450, 10000}];
get_decompose_award(700073) -> [{10450, 11000}];
get_decompose_award(700083) -> [{10450, 9000}];
get_decompose_award(700093) -> [{10450, 9000}];
get_decompose_award(700103) -> [{10450, 9000}];
get_decompose_award(700113) -> [{10450, 9000}];
get_decompose_award(700123) -> [{10450, 9000}];
get_decompose_award(700133) -> [{10450, 9000}];
get_decompose_award(700143) -> [{10450, 10000}];
get_decompose_award(700153) -> [{10450, 9000}];
get_decompose_award(700163) -> [{10450, 9000}];
get_decompose_award(700173) -> [{10450, 10500}];
get_decompose_award(700183) -> [{10450, 10000}];
get_decompose_award(700193) -> [{10450, 10000}];
get_decompose_award(700203) -> [{10450, 10500}];
get_decompose_award(700213) -> [{10450, 10000}];
get_decompose_award(700223) -> [{10450, 10000}];
get_decompose_award(700233) -> [{10450, 10500}];
get_decompose_award(700243) -> [{10450, 10500}];
get_decompose_award(700253) -> [{10450, 10000}];
get_decompose_award(700263) -> [{10450, 10500}];
get_decompose_award(700273) -> [{10450, 10500}];
get_decompose_award(700293) -> [{10450, 10000}];
get_decompose_award(700303) -> [{10450, 9000}];
get_decompose_award(700313) -> [{10450, 10500}];
get_decompose_award(700323) -> [{10450, 10500}];
get_decompose_award(750001) -> [{10450, 11000}];
get_decompose_award(750101) -> [{10450, 10500}];
get_decompose_award(750201) -> [{10450, 11000}];
get_decompose_award(750401) -> [{10450, 10500}];
get_decompose_award(700283) -> [{10450, 10500}];
get_decompose_award(700363) -> [{10450, 10500}];
get_decompose_award(700373) -> [{10450, 10000}];
get_decompose_award(700383) -> [{10450, 10000}];
get_decompose_award(700393) -> [{10450, 10500}];
get_decompose_award(700403) -> [{10450, 10500}];
get_decompose_award(700413) -> [{10450, 10500}];
get_decompose_award(700423) -> [{10450, 10500}];
get_decompose_award(700433) -> [{10450, 10500}];
get_decompose_award(700443) -> [{10450, 10500}];
get_decompose_award(700453) -> [{10450, 10500}];
get_decompose_award(701003) -> [{10460, 13}];
get_decompose_award(701013) -> [{10460, 13}];
get_decompose_award(701023) -> [{10460, 13}];
get_decompose_award(701033) -> [{10460, 13}];
get_decompose_award(701043) -> [{10460, 13}];
get_decompose_award(701053) -> [{10460, 13}];
get_decompose_award(701063) -> [{10460, 13}];
get_decompose_award(701073) -> [{10460, 13}];
get_decompose_award(700005) -> [{10450, 27375}];
get_decompose_award(700015) -> [{10450, 27375}];
get_decompose_award(700025) -> [{10450, 26250}];
get_decompose_award(700035) -> [{10450, 26250}];
get_decompose_award(700045) -> [{10450, 27375}];
get_decompose_award(700055) -> [{10450, 27375}];
get_decompose_award(700065) -> [{10450, 26250}];
get_decompose_award(700075) -> [{10450, 28500}];
get_decompose_award(700085) -> [{10450, 24000}];
get_decompose_award(700095) -> [{10450, 24000}];
get_decompose_award(700105) -> [{10450, 24000}];
get_decompose_award(700115) -> [{10450, 24000}];
get_decompose_award(700125) -> [{10450, 24000}];
get_decompose_award(700135) -> [{10450, 24000}];
get_decompose_award(700145) -> [{10450, 26250}];
get_decompose_award(700155) -> [{10450, 24000}];
get_decompose_award(700165) -> [{10450, 24000}];
get_decompose_award(700175) -> [{10450, 27375}];
get_decompose_award(700185) -> [{10450, 26250}];
get_decompose_award(700195) -> [{10450, 26250}];
get_decompose_award(700205) -> [{10450, 27375}];
get_decompose_award(700215) -> [{10450, 26250}];
get_decompose_award(700225) -> [{10450, 26250}];
get_decompose_award(700235) -> [{10450, 27375}];
get_decompose_award(700245) -> [{10450, 27375}];
get_decompose_award(700255) -> [{10450, 26250}];
get_decompose_award(700265) -> [{10450, 27375}];
get_decompose_award(700275) -> [{10450, 27375}];
get_decompose_award(700295) -> [{10450, 26250}];
get_decompose_award(700305) -> [{10450, 24000}];
get_decompose_award(700315) -> [{10450, 27375}];
get_decompose_award(700325) -> [{10450, 27375}];
get_decompose_award(750002) -> [{10450, 28500}];
get_decompose_award(750102) -> [{10450, 27375}];
get_decompose_award(750202) -> [{10450, 28500}];
get_decompose_award(750402) -> [{10450, 27375}];
get_decompose_award(700285) -> [{10450, 27375}];
get_decompose_award(700365) -> [{10450, 27375}];
get_decompose_award(700375) -> [{10450, 26250}];
get_decompose_award(700385) -> [{10450, 26250}];
get_decompose_award(700395) -> [{10450, 27375}];
get_decompose_award(700405) -> [{10450, 27375}];
get_decompose_award(700415) -> [{10450, 27375}];
get_decompose_award(700425) -> [{10450, 27375}];
get_decompose_award(700435) -> [{10450, 27375}];
get_decompose_award(700445) -> [{10450, 27375}];
get_decompose_award(700455) -> [{10450, 27375}];
get_decompose_award(701005) -> [{10460, 33}];
get_decompose_award(701015) -> [{10460, 33}];
get_decompose_award(701025) -> [{10460, 33}];
get_decompose_award(701035) -> [{10460, 33}];
get_decompose_award(701045) -> [{10460, 33}];
get_decompose_award(701055) -> [{10460, 33}];
get_decompose_award(701065) -> [{10460, 33}];
get_decompose_award(701075) -> [{10460, 33}];
get_decompose_award(701006) -> [{10460, 43}];
get_decompose_award(701016) -> [{10460, 43}];
get_decompose_award(701026) -> [{10460, 43}];
get_decompose_award(701036) -> [{10460, 43}];
get_decompose_award(701046) -> [{10460, 43}];
get_decompose_award(701056) -> [{10460, 43}];
get_decompose_award(701066) -> [{10460, 43}];
get_decompose_award(701076) -> [{10460, 43}];
get_decompose_award(700006) -> [{10450, 27375}];
get_decompose_award(700016) -> [{10450, 27375}];
get_decompose_award(700026) -> [{10450, 26250}];
get_decompose_award(700036) -> [{10450, 26250}];
get_decompose_award(700046) -> [{10450, 27375}];
get_decompose_award(700056) -> [{10450, 27375}];
get_decompose_award(700066) -> [{10450, 26250}];
get_decompose_award(700076) -> [{10450, 28500}];
get_decompose_award(700086) -> [{10450, 24000}];
get_decompose_award(700096) -> [{10450, 24000}];
get_decompose_award(700106) -> [{10450, 24000}];
get_decompose_award(700116) -> [{10450, 24000}];
get_decompose_award(700126) -> [{10450, 24000}];
get_decompose_award(700136) -> [{10450, 24000}];
get_decompose_award(700146) -> [{10450, 26250}];
get_decompose_award(700156) -> [{10450, 24000}];
get_decompose_award(700166) -> [{10450, 24000}];
get_decompose_award(700176) -> [{10450, 27375}];
get_decompose_award(700186) -> [{10450, 26250}];
get_decompose_award(700196) -> [{10450, 26250}];
get_decompose_award(700206) -> [{10450, 27375}];
get_decompose_award(700216) -> [{10450, 26250}];
get_decompose_award(700226) -> [{10450, 26250}];
get_decompose_award(700236) -> [{10450, 27375}];
get_decompose_award(700246) -> [{10450, 27375}];
get_decompose_award(700256) -> [{10450, 26250}];
get_decompose_award(700266) -> [{10450, 27375}];
get_decompose_award(700276) -> [{10450, 27375}];
get_decompose_award(700296) -> [{10450, 26250}];
get_decompose_award(700306) -> [{10450, 24000}];
get_decompose_award(700316) -> [{10450, 27375}];
get_decompose_award(700326) -> [{10450, 27375}];
get_decompose_award(750003) -> [{10450, 28500}];
get_decompose_award(750103) -> [{10450, 27375}];
get_decompose_award(750203) -> [{10450, 28500}];
get_decompose_award(750403) -> [{10450, 27375}];
get_decompose_award(700286) -> [{10450, 27375}];
get_decompose_award(700366) -> [{10450, 27375}];
get_decompose_award(700376) -> [{10450, 26250}];
get_decompose_award(700386) -> [{10450, 26250}];
get_decompose_award(700396) -> [{10450, 27375}];
get_decompose_award(700406) -> [{10450, 27375}];
get_decompose_award(700416) -> [{10450, 27375}];
get_decompose_award(700426) -> [{10450, 27375}];
get_decompose_award(700436) -> [{10450, 27375}];
get_decompose_award(700446) -> [{10450, 27375}];
get_decompose_award(700456) -> [{10450, 27375}];
get_decompose_award(_) -> [].

get_decompose_award2(700001) -> [{10450, 1375}];
get_decompose_award2(700011) -> [{10450, 1375}];
get_decompose_award2(700021) -> [{10450, 1250}];
get_decompose_award2(700031) -> [{10450, 1250}];
get_decompose_award2(700041) -> [{10450, 1375}];
get_decompose_award2(700051) -> [{10450, 1375}];
get_decompose_award2(700061) -> [{10450, 1250}];
get_decompose_award2(700071) -> [{10450, 1500}];
get_decompose_award2(700081) -> [{10450, 1000}];
get_decompose_award2(700091) -> [{10450, 1000}];
get_decompose_award2(700101) -> [{10450, 1000}];
get_decompose_award2(700111) -> [{10450, 1000}];
get_decompose_award2(700121) -> [{10450, 1000}];
get_decompose_award2(700131) -> [{10450, 1000}];
get_decompose_award2(700141) -> [{10450, 1250}];
get_decompose_award2(700151) -> [{10450, 1000}];
get_decompose_award2(700161) -> [{10450, 1000}];
get_decompose_award2(700171) -> [{10450, 1375}];
get_decompose_award2(700181) -> [{10450, 1250}];
get_decompose_award2(700191) -> [{10450, 1250}];
get_decompose_award2(700201) -> [{10450, 1375}];
get_decompose_award2(700211) -> [{10450, 1250}];
get_decompose_award2(700221) -> [{10450, 1250}];
get_decompose_award2(700231) -> [{10450, 1375}];
get_decompose_award2(700241) -> [{10450, 1375}];
get_decompose_award2(700251) -> [{10450, 1250}];
get_decompose_award2(700261) -> [{10450, 1375}];
get_decompose_award2(700271) -> [{10450, 1375}];
get_decompose_award2(700291) -> [{10450, 1250}];
get_decompose_award2(700301) -> [{10450, 1000}];
get_decompose_award2(700311) -> [{10450, 1375}];
get_decompose_award2(700321) -> [{10450, 1375}];
get_decompose_award2(750000) -> [{10450, 1500}];
get_decompose_award2(750100) -> [{10450, 1375}];
get_decompose_award2(750200) -> [{10450, 1500}];
get_decompose_award2(750400) -> [{10450, 1375}];
get_decompose_award2(700281) -> [{10450, 1375}];
get_decompose_award2(700361) -> [{10450, 1375}];
get_decompose_award2(700371) -> [{10450, 1250}];
get_decompose_award2(700381) -> [{10450, 1250}];
get_decompose_award2(700391) -> [{10450, 1375}];
get_decompose_award2(700401) -> [{10450, 1375}];
get_decompose_award2(700411) -> [{10450, 1375}];
get_decompose_award2(700421) -> [{10450, 1375}];
get_decompose_award2(700431) -> [{10450, 1375}];
get_decompose_award2(700441) -> [{10450, 1375}];
get_decompose_award2(700451) -> [{10450, 1375}];
get_decompose_award2(701001) -> [{10460, 2}];
get_decompose_award2(701011) -> [{10460, 2}];
get_decompose_award2(701021) -> [{10460, 2}];
get_decompose_award2(701031) -> [{10460, 2}];
get_decompose_award2(701041) -> [{10460, 2}];
get_decompose_award2(701051) -> [{10460, 2}];
get_decompose_award2(701061) -> [{10460, 2}];
get_decompose_award2(701071) -> [{10460, 2}];
get_decompose_award2(700003) -> [{10450, 10500}];
get_decompose_award2(700013) -> [{10450, 10500}];
get_decompose_award2(700023) -> [{10450, 10000}];
get_decompose_award2(700033) -> [{10450, 10000}];
get_decompose_award2(700043) -> [{10450, 10500}];
get_decompose_award2(700053) -> [{10450, 10500}];
get_decompose_award2(700063) -> [{10450, 10000}];
get_decompose_award2(700073) -> [{10450, 11000}];
get_decompose_award2(700083) -> [{10450, 9000}];
get_decompose_award2(700093) -> [{10450, 9000}];
get_decompose_award2(700103) -> [{10450, 9000}];
get_decompose_award2(700113) -> [{10450, 9000}];
get_decompose_award2(700123) -> [{10450, 9000}];
get_decompose_award2(700133) -> [{10450, 9000}];
get_decompose_award2(700143) -> [{10450, 10000}];
get_decompose_award2(700153) -> [{10450, 9000}];
get_decompose_award2(700163) -> [{10450, 9000}];
get_decompose_award2(700173) -> [{10450, 10500}];
get_decompose_award2(700183) -> [{10450, 10000}];
get_decompose_award2(700193) -> [{10450, 10000}];
get_decompose_award2(700203) -> [{10450, 10500}];
get_decompose_award2(700213) -> [{10450, 10000}];
get_decompose_award2(700223) -> [{10450, 10000}];
get_decompose_award2(700233) -> [{10450, 10500}];
get_decompose_award2(700243) -> [{10450, 10500}];
get_decompose_award2(700253) -> [{10450, 10000}];
get_decompose_award2(700263) -> [{10450, 10500}];
get_decompose_award2(700273) -> [{10450, 10500}];
get_decompose_award2(700293) -> [{10450, 10000}];
get_decompose_award2(700303) -> [{10450, 9000}];
get_decompose_award2(700313) -> [{10450, 10500}];
get_decompose_award2(700323) -> [{10450, 10500}];
get_decompose_award2(750001) -> [{10450, 11000}];
get_decompose_award2(750101) -> [{10450, 10500}];
get_decompose_award2(750201) -> [{10450, 11000}];
get_decompose_award2(750401) -> [{10450, 10500}];
get_decompose_award2(700283) -> [{10450, 10500}];
get_decompose_award2(700363) -> [{10450, 10500}];
get_decompose_award2(700373) -> [{10450, 10000}];
get_decompose_award2(700383) -> [{10450, 10000}];
get_decompose_award2(700393) -> [{10450, 10500}];
get_decompose_award2(700403) -> [{10450, 10500}];
get_decompose_award2(700413) -> [{10450, 10500}];
get_decompose_award2(700423) -> [{10450, 10500}];
get_decompose_award2(700433) -> [{10450, 10500}];
get_decompose_award2(700443) -> [{10450, 10500}];
get_decompose_award2(700453) -> [{10450, 10500}];
get_decompose_award2(701003) -> [{10460, 13}];
get_decompose_award2(701013) -> [{10460, 13}];
get_decompose_award2(701023) -> [{10460, 13}];
get_decompose_award2(701033) -> [{10460, 13}];
get_decompose_award2(701043) -> [{10460, 13}];
get_decompose_award2(701053) -> [{10460, 13}];
get_decompose_award2(701063) -> [{10460, 13}];
get_decompose_award2(701073) -> [{10460, 13}];
get_decompose_award2(700005) -> [{10450, 27375}];
get_decompose_award2(700015) -> [{10450, 27375}];
get_decompose_award2(700025) -> [{10450, 26250}];
get_decompose_award2(700035) -> [{10450, 26250}];
get_decompose_award2(700045) -> [{10450, 27375}];
get_decompose_award2(700055) -> [{10450, 27375}];
get_decompose_award2(700065) -> [{10450, 26250}];
get_decompose_award2(700075) -> [{10450, 28500}];
get_decompose_award2(700085) -> [{10450, 24000}];
get_decompose_award2(700095) -> [{10450, 24000}];
get_decompose_award2(700105) -> [{10450, 24000}];
get_decompose_award2(700115) -> [{10450, 24000}];
get_decompose_award2(700125) -> [{10450, 24000}];
get_decompose_award2(700135) -> [{10450, 24000}];
get_decompose_award2(700145) -> [{10450, 26250}];
get_decompose_award2(700155) -> [{10450, 24000}];
get_decompose_award2(700165) -> [{10450, 24000}];
get_decompose_award2(700175) -> [{10450, 27375}];
get_decompose_award2(700185) -> [{10450, 26250}];
get_decompose_award2(700195) -> [{10450, 26250}];
get_decompose_award2(700205) -> [{10450, 27375}];
get_decompose_award2(700215) -> [{10450, 26250}];
get_decompose_award2(700225) -> [{10450, 26250}];
get_decompose_award2(700235) -> [{10450, 27375}];
get_decompose_award2(700245) -> [{10450, 27375}];
get_decompose_award2(700255) -> [{10450, 26250}];
get_decompose_award2(700265) -> [{10450, 27375}];
get_decompose_award2(700275) -> [{10450, 27375}];
get_decompose_award2(700295) -> [{10450, 26250}];
get_decompose_award2(700305) -> [{10450, 24000}];
get_decompose_award2(700315) -> [{10450, 27375}];
get_decompose_award2(700325) -> [{10450, 27375}];
get_decompose_award2(750002) -> [{10450, 28500}];
get_decompose_award2(750102) -> [{10450, 27375}];
get_decompose_award2(750202) -> [{10450, 28500}];
get_decompose_award2(750402) -> [{10450, 27375}];
get_decompose_award2(700285) -> [{10450, 27375}];
get_decompose_award2(700365) -> [{10450, 27375}];
get_decompose_award2(700375) -> [{10450, 26250}];
get_decompose_award2(700385) -> [{10450, 26250}];
get_decompose_award2(700395) -> [{10450, 27375}];
get_decompose_award2(700405) -> [{10450, 27375}];
get_decompose_award2(700415) -> [{10450, 27375}];
get_decompose_award2(700425) -> [{10450, 27375}];
get_decompose_award2(700435) -> [{10450, 27375}];
get_decompose_award2(700445) -> [{10450, 27375}];
get_decompose_award2(700455) -> [{10450, 27375}];
get_decompose_award2(701005) -> [{10460, 33}];
get_decompose_award2(701015) -> [{10460, 33}];
get_decompose_award2(701025) -> [{10460, 33}];
get_decompose_award2(701035) -> [{10460, 33}];
get_decompose_award2(701045) -> [{10460, 33}];
get_decompose_award2(701055) -> [{10460, 33}];
get_decompose_award2(701065) -> [{10460, 33}];
get_decompose_award2(701075) -> [{10460, 33}];
get_decompose_award2(701006) -> [{10460, 43}];
get_decompose_award2(701016) -> [{10460, 43}];
get_decompose_award2(701026) -> [{10460, 43}];
get_decompose_award2(701036) -> [{10460, 43}];
get_decompose_award2(701046) -> [{10460, 43}];
get_decompose_award2(701056) -> [{10460, 43}];
get_decompose_award2(701066) -> [{10460, 43}];
get_decompose_award2(701076) -> [{10460, 43}];
get_decompose_award2(700006) -> [{10450, 27375}];
get_decompose_award2(700016) -> [{10450, 27375}];
get_decompose_award2(700026) -> [{10450, 26250}];
get_decompose_award2(700036) -> [{10450, 26250}];
get_decompose_award2(700046) -> [{10450, 27375}];
get_decompose_award2(700056) -> [{10450, 27375}];
get_decompose_award2(700066) -> [{10450, 26250}];
get_decompose_award2(700076) -> [{10450, 28500}];
get_decompose_award2(700086) -> [{10450, 24000}];
get_decompose_award2(700096) -> [{10450, 24000}];
get_decompose_award2(700106) -> [{10450, 24000}];
get_decompose_award2(700116) -> [{10450, 24000}];
get_decompose_award2(700126) -> [{10450, 24000}];
get_decompose_award2(700136) -> [{10450, 24000}];
get_decompose_award2(700146) -> [{10450, 26250}];
get_decompose_award2(700156) -> [{10450, 24000}];
get_decompose_award2(700166) -> [{10450, 24000}];
get_decompose_award2(700176) -> [{10450, 27375}];
get_decompose_award2(700186) -> [{10450, 26250}];
get_decompose_award2(700196) -> [{10450, 26250}];
get_decompose_award2(700206) -> [{10450, 27375}];
get_decompose_award2(700216) -> [{10450, 26250}];
get_decompose_award2(700226) -> [{10450, 26250}];
get_decompose_award2(700236) -> [{10450, 27375}];
get_decompose_award2(700246) -> [{10450, 27375}];
get_decompose_award2(700256) -> [{10450, 26250}];
get_decompose_award2(700266) -> [{10450, 27375}];
get_decompose_award2(700276) -> [{10450, 27375}];
get_decompose_award2(700296) -> [{10450, 26250}];
get_decompose_award2(700306) -> [{10450, 24000}];
get_decompose_award2(700316) -> [{10450, 27375}];
get_decompose_award2(700326) -> [{10450, 27375}];
get_decompose_award2(750003) -> [{10450, 28500}];
get_decompose_award2(750103) -> [{10450, 27375}];
get_decompose_award2(750203) -> [{10450, 28500}];
get_decompose_award2(750403) -> [{10450, 27375}];
get_decompose_award2(700286) -> [{10450, 27375}];
get_decompose_award2(700366) -> [{10450, 27375}];
get_decompose_award2(700376) -> [{10450, 26250}];
get_decompose_award2(700386) -> [{10450, 26250}];
get_decompose_award2(700396) -> [{10450, 27375}];
get_decompose_award2(700406) -> [{10450, 27375}];
get_decompose_award2(700416) -> [{10450, 27375}];
get_decompose_award2(700426) -> [{10450, 27375}];
get_decompose_award2(700436) -> [{10450, 27375}];
get_decompose_award2(700446) -> [{10450, 27375}];
get_decompose_award2(700456) -> [{10450, 27375}];
get_decompose_award2(_) -> [].

get_decompose_award3(700001) -> [{16001, 1}];
get_decompose_award3(700011) -> [{16002, 1}];
get_decompose_award3(700021) -> [{16003, 1}];
get_decompose_award3(700031) -> [{16004, 1}];
get_decompose_award3(700041) -> [{16005, 1}];
get_decompose_award3(700051) -> [{16006, 1}];
get_decompose_award3(700061) -> [{16007, 1}];
get_decompose_award3(700071) -> [{16008, 1}];
get_decompose_award3(700081) -> [{16009, 1}];
get_decompose_award3(700091) -> [{16010, 1}];
get_decompose_award3(700101) -> [{16011, 1}];
get_decompose_award3(700111) -> [{16012, 1}];
get_decompose_award3(700121) -> [{16013, 1}];
get_decompose_award3(700131) -> [{16014, 1}];
get_decompose_award3(700141) -> [{16015, 1}];
get_decompose_award3(700151) -> [{16016, 1}];
get_decompose_award3(700161) -> [{16017, 1}];
get_decompose_award3(700171) -> [{16018, 1}];
get_decompose_award3(700181) -> [{16019, 1}];
get_decompose_award3(700191) -> [{16020, 1}];
get_decompose_award3(700201) -> [{16021, 1}];
get_decompose_award3(700211) -> [{16022, 1}];
get_decompose_award3(700221) -> [{16023, 1}];
get_decompose_award3(700231) -> [{16024, 1}];
get_decompose_award3(700241) -> [{16025, 1}];
get_decompose_award3(700251) -> [{16026, 1}];
get_decompose_award3(700261) -> [{16027, 1}];
get_decompose_award3(700271) -> [{16028, 1}];
get_decompose_award3(700291) -> [{16029, 1}];
get_decompose_award3(700301) -> [{16030, 1}];
get_decompose_award3(700311) -> [{16031, 1}];
get_decompose_award3(700321) -> [{16032, 1}];
get_decompose_award3(750000) -> [{16033, 1}];
get_decompose_award3(750100) -> [{16034, 1}];
get_decompose_award3(750200) -> [{16035, 1}];
get_decompose_award3(750400) -> [{16036, 1}];
get_decompose_award3(700281) -> [{16037, 1}];
get_decompose_award3(700361) -> [{16038, 1}];
get_decompose_award3(700371) -> [{16039, 1}];
get_decompose_award3(700381) -> [{16040, 1}];
get_decompose_award3(700391) -> [{16041, 1}];
get_decompose_award3(700401) -> [{16042, 1}];
get_decompose_award3(700411) -> [{16043, 1}];
get_decompose_award3(700421) -> [{16044, 1}];
get_decompose_award3(700431) -> [{16045, 1}];
get_decompose_award3(700441) -> [{16046, 1}];
get_decompose_award3(700451) -> [{16047, 1}];
get_decompose_award3(701001) -> [{16101, 1}];
get_decompose_award3(701011) -> [{16102, 1}];
get_decompose_award3(701021) -> [{16103, 1}];
get_decompose_award3(701031) -> [{16104, 1}];
get_decompose_award3(701041) -> [{16105, 1}];
get_decompose_award3(701051) -> [{16106, 1}];
get_decompose_award3(701061) -> [{16107, 1}];
get_decompose_award3(701071) -> [{16108, 1}];
get_decompose_award3(700003) ->
    [{16001, 4}, {10450, 10000}];
get_decompose_award3(700013) ->
    [{16002, 4}, {10450, 10000}];
get_decompose_award3(700023) ->
    [{16003, 4}, {10450, 10000}];
get_decompose_award3(700033) ->
    [{16004, 4}, {10450, 10000}];
get_decompose_award3(700043) ->
    [{16005, 4}, {10450, 10000}];
get_decompose_award3(700053) ->
    [{16006, 4}, {10450, 10000}];
get_decompose_award3(700063) ->
    [{16007, 4}, {10450, 10000}];
get_decompose_award3(700073) ->
    [{16008, 4}, {10450, 10000}];
get_decompose_award3(700083) ->
    [{16009, 4}, {10450, 10000}];
get_decompose_award3(700093) ->
    [{16010, 4}, {10450, 10000}];
get_decompose_award3(700103) ->
    [{16011, 4}, {10450, 10000}];
get_decompose_award3(700113) ->
    [{16012, 4}, {10450, 10000}];
get_decompose_award3(700123) ->
    [{16013, 4}, {10450, 10000}];
get_decompose_award3(700133) ->
    [{16014, 4}, {10450, 10000}];
get_decompose_award3(700143) ->
    [{16015, 4}, {10450, 10000}];
get_decompose_award3(700153) ->
    [{16016, 4}, {10450, 10000}];
get_decompose_award3(700163) ->
    [{16017, 4}, {10450, 10000}];
get_decompose_award3(700173) ->
    [{16018, 4}, {10450, 10000}];
get_decompose_award3(700183) ->
    [{16019, 4}, {10450, 10000}];
get_decompose_award3(700193) ->
    [{16020, 4}, {10450, 10000}];
get_decompose_award3(700203) ->
    [{16021, 4}, {10450, 10000}];
get_decompose_award3(700213) ->
    [{16022, 4}, {10450, 10000}];
get_decompose_award3(700223) ->
    [{16023, 4}, {10450, 10000}];
get_decompose_award3(700233) ->
    [{16024, 4}, {10450, 10000}];
get_decompose_award3(700243) ->
    [{16025, 4}, {10450, 10000}];
get_decompose_award3(700253) ->
    [{16026, 4}, {10450, 10000}];
get_decompose_award3(700263) ->
    [{16027, 4}, {10450, 10000}];
get_decompose_award3(700273) ->
    [{16028, 4}, {10450, 10000}];
get_decompose_award3(700293) ->
    [{16029, 4}, {10450, 10000}];
get_decompose_award3(700303) ->
    [{16030, 4}, {10450, 10000}];
get_decompose_award3(700313) ->
    [{16031, 4}, {10450, 10000}];
get_decompose_award3(700323) ->
    [{16032, 4}, {10450, 10000}];
get_decompose_award3(750001) ->
    [{16033, 4}, {10450, 10000}];
get_decompose_award3(750101) ->
    [{16034, 4}, {10450, 10000}];
get_decompose_award3(750201) ->
    [{16035, 4}, {10450, 10000}];
get_decompose_award3(750401) ->
    [{16036, 4}, {10450, 10000}];
get_decompose_award3(700283) ->
    [{16037, 4}, {10450, 10000}];
get_decompose_award3(700363) ->
    [{16038, 4}, {10450, 10000}];
get_decompose_award3(700373) ->
    [{16039, 4}, {10450, 10000}];
get_decompose_award3(700383) ->
    [{16040, 4}, {10450, 10000}];
get_decompose_award3(700393) ->
    [{16041, 4}, {10450, 10000}];
get_decompose_award3(700403) ->
    [{16042, 4}, {10450, 10000}];
get_decompose_award3(700413) ->
    [{16043, 4}, {10450, 10000}];
get_decompose_award3(700423) ->
    [{16044, 4}, {10450, 10000}];
get_decompose_award3(700433) ->
    [{16045, 4}, {10450, 10000}];
get_decompose_award3(700443) ->
    [{16046, 4}, {10450, 10000}];
get_decompose_award3(700453) ->
    [{16047, 4}, {10450, 10000}];
get_decompose_award3(701003) ->
    [{16101, 4}, {10460, 10}];
get_decompose_award3(701013) ->
    [{16102, 4}, {10460, 10}];
get_decompose_award3(701023) ->
    [{16103, 4}, {10460, 10}];
get_decompose_award3(701033) ->
    [{16104, 4}, {10460, 10}];
get_decompose_award3(701043) ->
    [{16105, 4}, {10460, 10}];
get_decompose_award3(701053) ->
    [{16106, 4}, {10460, 10}];
get_decompose_award3(701063) ->
    [{16107, 4}, {10460, 10}];
get_decompose_award3(701073) ->
    [{16108, 4}, {10460, 10}];
get_decompose_award3(700005) ->
    [{16001, 9}, {10450, 30000}];
get_decompose_award3(700015) ->
    [{16002, 9}, {10450, 30000}];
get_decompose_award3(700025) ->
    [{16003, 9}, {10450, 30000}];
get_decompose_award3(700035) ->
    [{16004, 9}, {10450, 30000}];
get_decompose_award3(700045) ->
    [{16005, 9}, {10450, 30000}];
get_decompose_award3(700055) ->
    [{16006, 9}, {10450, 30000}];
get_decompose_award3(700065) ->
    [{16007, 9}, {10450, 30000}];
get_decompose_award3(700075) ->
    [{16008, 9}, {10450, 30000}];
get_decompose_award3(700085) ->
    [{16009, 9}, {10450, 30000}];
get_decompose_award3(700095) ->
    [{16010, 9}, {10450, 30000}];
get_decompose_award3(700105) ->
    [{16011, 9}, {10450, 30000}];
get_decompose_award3(700115) ->
    [{16012, 9}, {10450, 30000}];
get_decompose_award3(700125) ->
    [{16013, 9}, {10450, 30000}];
get_decompose_award3(700135) ->
    [{16014, 9}, {10450, 30000}];
get_decompose_award3(700145) ->
    [{16015, 9}, {10450, 30000}];
get_decompose_award3(700155) ->
    [{16016, 9}, {10450, 30000}];
get_decompose_award3(700165) ->
    [{16017, 9}, {10450, 30000}];
get_decompose_award3(700175) ->
    [{16018, 9}, {10450, 30000}];
get_decompose_award3(700185) ->
    [{16019, 9}, {10450, 30000}];
get_decompose_award3(700195) ->
    [{16020, 9}, {10450, 30000}];
get_decompose_award3(700205) ->
    [{16021, 9}, {10450, 30000}];
get_decompose_award3(700215) ->
    [{16022, 9}, {10450, 30000}];
get_decompose_award3(700225) ->
    [{16023, 9}, {10450, 30000}];
get_decompose_award3(700235) ->
    [{16024, 9}, {10450, 30000}];
get_decompose_award3(700245) ->
    [{16025, 9}, {10450, 30000}];
get_decompose_award3(700255) ->
    [{16026, 9}, {10450, 30000}];
get_decompose_award3(700265) ->
    [{16027, 9}, {10450, 30000}];
get_decompose_award3(700275) ->
    [{16028, 9}, {10450, 30000}];
get_decompose_award3(700295) ->
    [{16029, 9}, {10450, 30000}];
get_decompose_award3(700305) ->
    [{16030, 9}, {10450, 30000}];
get_decompose_award3(700315) ->
    [{16031, 9}, {10450, 30000}];
get_decompose_award3(700325) ->
    [{16032, 9}, {10450, 30000}];
get_decompose_award3(750002) ->
    [{16033, 9}, {10450, 30000}];
get_decompose_award3(750102) ->
    [{16034, 9}, {10450, 30000}];
get_decompose_award3(750202) ->
    [{16035, 9}, {10450, 30000}];
get_decompose_award3(750402) ->
    [{16036, 9}, {10450, 30000}];
get_decompose_award3(700285) ->
    [{16037, 9}, {10450, 30000}];
get_decompose_award3(700365) ->
    [{16038, 9}, {10450, 30000}];
get_decompose_award3(700375) ->
    [{16039, 9}, {10450, 30000}];
get_decompose_award3(700385) ->
    [{16040, 9}, {10450, 30000}];
get_decompose_award3(700395) ->
    [{16041, 9}, {10450, 30000}];
get_decompose_award3(700405) ->
    [{16042, 9}, {10450, 30000}];
get_decompose_award3(700415) ->
    [{16043, 9}, {10450, 30000}];
get_decompose_award3(700425) ->
    [{16044, 9}, {10450, 30000}];
get_decompose_award3(700435) ->
    [{16045, 9}, {10450, 30000}];
get_decompose_award3(700445) ->
    [{16046, 9}, {10450, 30000}];
get_decompose_award3(700455) ->
    [{16047, 9}, {10450, 30000}];
get_decompose_award3(701005) ->
    [{16101, 9}, {10460, 30}];
get_decompose_award3(701015) ->
    [{16102, 9}, {10460, 30}];
get_decompose_award3(701025) ->
    [{16103, 9}, {10460, 30}];
get_decompose_award3(701035) ->
    [{16104, 9}, {10460, 30}];
get_decompose_award3(701045) ->
    [{16105, 9}, {10460, 30}];
get_decompose_award3(701055) ->
    [{16106, 9}, {10460, 30}];
get_decompose_award3(701065) ->
    [{16107, 9}, {10460, 30}];
get_decompose_award3(701075) ->
    [{16108, 9}, {10460, 30}];
get_decompose_award3(701006) ->
    [{16101, 9}, {10460, 40}];
get_decompose_award3(701016) ->
    [{16102, 9}, {10460, 40}];
get_decompose_award3(701026) ->
    [{16103, 9}, {10460, 40}];
get_decompose_award3(701036) ->
    [{16104, 9}, {10460, 40}];
get_decompose_award3(701046) ->
    [{16105, 9}, {10460, 40}];
get_decompose_award3(701056) ->
    [{16106, 9}, {10460, 40}];
get_decompose_award3(701066) ->
    [{16107, 9}, {10460, 40}];
get_decompose_award3(701076) ->
    [{16108, 9}, {10460, 40}];
get_decompose_award3(700006) ->
    [{16001, 11}, {10450, 30000}];
get_decompose_award3(700016) ->
    [{16002, 11}, {10450, 30000}];
get_decompose_award3(700026) ->
    [{16003, 11}, {10450, 30000}];
get_decompose_award3(700036) ->
    [{16004, 11}, {10450, 30000}];
get_decompose_award3(700046) ->
    [{16005, 11}, {10450, 30000}];
get_decompose_award3(700056) ->
    [{16006, 11}, {10450, 30000}];
get_decompose_award3(700066) ->
    [{16007, 11}, {10450, 30000}];
get_decompose_award3(700076) ->
    [{16008, 11}, {10450, 30000}];
get_decompose_award3(700086) ->
    [{16009, 11}, {10450, 30000}];
get_decompose_award3(700096) ->
    [{16010, 11}, {10450, 30000}];
get_decompose_award3(700106) ->
    [{16011, 11}, {10450, 30000}];
get_decompose_award3(700116) ->
    [{16012, 11}, {10450, 30000}];
get_decompose_award3(700126) ->
    [{16013, 11}, {10450, 30000}];
get_decompose_award3(700136) ->
    [{16014, 11}, {10450, 30000}];
get_decompose_award3(700146) ->
    [{16015, 11}, {10450, 30000}];
get_decompose_award3(700156) ->
    [{16016, 11}, {10450, 30000}];
get_decompose_award3(700166) ->
    [{16017, 11}, {10450, 30000}];
get_decompose_award3(700176) ->
    [{16018, 11}, {10450, 30000}];
get_decompose_award3(700186) ->
    [{16019, 11}, {10450, 30000}];
get_decompose_award3(700196) ->
    [{16020, 11}, {10450, 30000}];
get_decompose_award3(700206) ->
    [{16021, 11}, {10450, 30000}];
get_decompose_award3(700216) ->
    [{16022, 11}, {10450, 30000}];
get_decompose_award3(700226) ->
    [{16023, 11}, {10450, 30000}];
get_decompose_award3(700236) ->
    [{16024, 11}, {10450, 30000}];
get_decompose_award3(700246) ->
    [{16025, 11}, {10450, 30000}];
get_decompose_award3(700256) ->
    [{16026, 11}, {10450, 30000}];
get_decompose_award3(700266) ->
    [{16027, 11}, {10450, 30000}];
get_decompose_award3(700276) ->
    [{16028, 11}, {10450, 30000}];
get_decompose_award3(700296) ->
    [{16029, 11}, {10450, 30000}];
get_decompose_award3(700306) ->
    [{16030, 11}, {10450, 30000}];
get_decompose_award3(700316) ->
    [{16031, 11}, {10450, 30000}];
get_decompose_award3(700326) ->
    [{16032, 11}, {10450, 30000}];
get_decompose_award3(750003) ->
    [{16033, 11}, {10450, 30000}];
get_decompose_award3(750103) ->
    [{16034, 11}, {10450, 30000}];
get_decompose_award3(750203) ->
    [{16035, 11}, {10450, 30000}];
get_decompose_award3(750403) ->
    [{16036, 11}, {10450, 30000}];
get_decompose_award3(700286) ->
    [{16037, 11}, {10450, 30000}];
get_decompose_award3(700366) ->
    [{16038, 11}, {10450, 30000}];
get_decompose_award3(700376) ->
    [{16039, 11}, {10450, 30000}];
get_decompose_award3(700386) ->
    [{16040, 11}, {10450, 30000}];
get_decompose_award3(700396) ->
    [{16041, 11}, {10450, 30000}];
get_decompose_award3(700406) ->
    [{16042, 11}, {10450, 30000}];
get_decompose_award3(700416) ->
    [{16043, 11}, {10450, 30000}];
get_decompose_award3(700426) ->
    [{16044, 11}, {10450, 30000}];
get_decompose_award3(700436) ->
    [{16045, 11}, {10450, 30000}];
get_decompose_award3(700446) ->
    [{16046, 11}, {10450, 30000}];
get_decompose_award3(700456) ->
    [{16047, 11}, {10450, 30000}];
get_decompose_award3(_) -> [].


