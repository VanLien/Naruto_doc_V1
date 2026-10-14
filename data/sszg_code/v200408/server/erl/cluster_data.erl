-file("src/mod/data/cluster_data.erl", 1).

-module(cluster_data).

-lager_records([]).

-export([get_group/2]).

get_group(SysFlag, {_, SrvId}) ->
    do_get_group(sys_group(SysFlag), SrvId);
get_group(SysFlag, P) ->
    do_get_group(sys_group(SysFlag), P).

sys_group(guild_war) -> 0;
sys_group(_) -> 0.

do_get_group(0, "symlf") -> 1;
do_get_group(0, <<"symlf">>) -> 1;
do_get_group(0, <<"symlf_", _/binary>>) -> 1;
do_get_group(0, "local") -> 1;
do_get_group(0, <<"local">>) -> 1;
do_get_group(0, <<"local_", _/binary>>) -> 1;
do_get_group(_, _) -> 0.


