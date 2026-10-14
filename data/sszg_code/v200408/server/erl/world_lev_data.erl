-file("src/mod/data/world_lev_data.erl", 1).

-module(world_lev_data).

-lager_records([]).

-export([get_const/1, list_rank/0]).

-file("inc/common.hrl", 1).

-file("inc/lib_log.hrl", 1).

-file("inc/common.hrl", 109).

-type p() :: string().

-type z() :: non_neg_integer().

-type srv_id() :: bitstring().

-type role_id() :: {pos_integer(), srv_id()}.

-type guild_id() :: {pos_integer(), srv_id()}.

-type unit_id() :: {pos_integer(), pos_integer()}.

-type pos() :: {pos_integer(), non_neg_integer(),
		non_neg_integer()}.

-file("src/mod/data/world_lev_data.erl", 11).

get_const(worldlev_number) -> 1;
get_const(worldlev_des) -> 0;
get_const(_) -> undefined.

list_rank() -> [{1, 10, 800}, {11, 50, 200}].


