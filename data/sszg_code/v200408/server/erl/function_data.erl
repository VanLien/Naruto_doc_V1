-file("src/mod/data/function_data.erl", 1).

-module(function_data).

-lager_records([]).

-export([holiday_ico/1, holiday_ico_list/0]).

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

-file("src/mod/data/function_data.erl", 11).

holiday_ico(_) -> 0.

holiday_ico_list() -> [].


