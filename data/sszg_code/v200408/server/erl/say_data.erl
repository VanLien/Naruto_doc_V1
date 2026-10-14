-file("src/mod/data/say_data.erl", 1).

-module(say_data).

-lager_records([{violators_record, [id, name, lists]},
		{say_history, [id, clear_time, lists]},
		{say_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{say_frame, [ver, base_id, expire_time]},
		{m_say, [ver, used, frames]},
		{say_subtitle_msg, [id, role_id, name, msg, time]},
		{say_subtitle_role, [pid, conn_pid, type]},
		{say_msg, [len, msg, tick]},
		{say_send,
		 [id, name, sex, career, lev, face_id, vip_lev, capacity,
		  head_bid, chat_bubble, msg_list, face_update_time,
		  face_file]},
		{say_mon,
		 [rid, srv_id, name, ctime, lev, vip_lev, msg,
		  remark]}]).

-export([get/1, const/1]).

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

-file("src/mod/data/say_data.erl", 11).

-file("inc/say.hrl", 1).

-record(say_mon,
	{rid = 0  :: pos_integer(), srv_id = <<>>  :: binary(),
	 name = <<>>  :: bitstring(),
	 ctime = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 msg = <<>>  :: binary(), remark = <<>>  :: binary()}).

-record(say_send,
	{id = {0, <<>>}, name = <<>>, sex = 0, career = 0,
	 lev = 0, face_id = 0, vip_lev = 0, capacity = 0,
	 head_bid = 0, chat_bubble = 0, msg_list = [],
	 face_update_time = 0, face_file = <<>>}).

-record(say_msg, {len = 0, msg = <<>>, tick = 0}).

-record(say_subtitle_role,
	{pid = 0  :: 0 | pid(), conn_pid = 0  :: 0 | pid(),
	 type = 0  :: integer()}).

-record(say_subtitle_msg,
	{id = 0  :: non_neg_integer(),
	 role_id = {0, <<>>}  ::
	     {non_neg_integer(), bitstring()},
	 name = <<>>  :: bitstring(), msg = <<>>  :: bitstring(),
	 time = 0  :: non_neg_integer()}).

-record(m_say, {ver = 1, used = 0, frames = []}).

-record(say_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(say_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-record(say_history,
	{id = {0, <<>>}, clear_time = 0, lists = []}).

-record(violators_record,
	{id = {0, <<>>}, name = <<>>, lists = []}).

-file("src/mod/data/say_data.erl", 12).

get(1000) ->
    #say_frame_data{base_id = 1000,
		    name = lang:get(<<"聊天气泡"/utf8>>), group = 100,
		    expire_type = 0};
get(1001) ->
    #say_frame_data{base_id = 1001,
		    name = lang:get(<<"无人能挡"/utf8>>), group = 101,
		    expire_type = 1, expire_time = 10080};
get(1002) ->
    #say_frame_data{base_id = 1002,
		    name = lang:get(<<"荣耀冠军"/utf8>>), group = 102,
		    expire_type = 1, expire_time = 1440};
get(1003) ->
    #say_frame_data{base_id = 1003,
		    name = lang:get(<<"天梯宗师"/utf8>>), group = 103,
		    expire_type = 1, expire_time = 10080};
get(1004) ->
    #say_frame_data{base_id = 1004,
		    name = lang:get(<<"首席霸主"/utf8>>), group = 104,
		    loss = [{50104, 1}], expire_type = 1,
		    expire_time = 10080, is_panel = 1};
get(1100) ->
    #say_frame_data{base_id = 1100,
		    name = lang:get(<<"任性宝宝"/utf8>>), group = 110,
		    loss = [{50100, 1}], overlap = 1, expire_type = 1,
		    expire_time = 10080, is_panel = 1};
get(1101) ->
    #say_frame_data{base_id = 1101,
		    name = lang:get(<<"任性宝宝"/utf8>>), group = 110,
		    loss = [{50101, 1}], overlap = 1, expire_type = 1,
		    expire_time = 21600, is_panel = 1};
get(1102) ->
    #say_frame_data{base_id = 1102,
		    name = lang:get(<<"任性宝宝"/utf8>>), group = 110,
		    loss = [{50102, 1}], overlap = 1, expire_type = 1,
		    expire_time = 43200, is_panel = 1};
get(1103) ->
    #say_frame_data{base_id = 1103,
		    name = lang:get(<<"任性宝宝"/utf8>>), group = 110,
		    loss = [{50103, 1}], overlap = 1, expire_type = 1,
		    expire_time = 129600, is_panel = 1};
get(_Info) ->
    logger:data_error("get_data_not_exist===>~w", [_Info],
		      say_data, 98),
    undefined.

const(default_bubble) -> 1000;
const(say_repeak_vip) -> 4;
const(say_repeak_lev) -> 80;
const(say_repeak_span) -> 15;
const(say_repeak_num) -> 3;
const(say_repeak_similar) -> 60;
const(say_repeak_time) -> 10;
const(say_string_length) -> 200;
const(cooldown_same_province) -> 5;
const(cooldown_cross_service) -> 10;
const(cooldown_world) -> 10;
const(cooldown_guild) -> 5;
const(cooldown_team) -> 3;
const(at_condition) -> 30;
const(_Info) ->
    logger:data_error("const_data_not_exist===>~w", [_Info],
		      say_data, 114),
    undefined.


