-file("src/sys_lib.erl", 1).

-module(sys_lib).

-lager_records([]).

-export([srv_id/0, srv_full_id/0, is_local/1,
	 server_type/0, role_num/0, send_mail/2, is_dev/0]).

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

-file("src/sys_lib.erl", 14).

srv_id() ->
    case sys_env:get(server_id) of
      Bin when is_binary(Bin) -> Bin;
      L when is_list(L) ->
	  case is_binary(L) of
	    false -> list_to_binary(L);
	    true -> L
	  end;
      _ -> exit(bad_server_id)
    end.

srv_full_id() ->
    case sys_env:get(server_full_id) of
      [Bin | _] = FullID when is_binary(Bin) -> FullID;
      [L | _] = FullID when is_list(L) ->
	  [case is_binary(X) of
	     false -> list_to_binary(X);
	     true -> X
	   end
	   || X <- FullID];
      _ -> exit(bad_server_full_id)
    end.

is_local({_, SrvId}) -> is_local(SrvId);
is_local(<<>>) -> true;
is_local(SrvId) -> lists:member(SrvId, srv_full_id()).

server_type() -> sys_env:get(server_type).

role_num() -> ets:info(role_online, size).

send_mail(Title, Content) ->
    Cmd =
	util:format("sendEmail -f sendmailtoqq@163.com -t "
		    "receivetomail@163.com -s smtp.163.com "
		    "-xu sendmailtoqq -xp wei1987 -u \"~s\" "
		    "-m \"~s\"",
		    [Title, Content]),
    os:cmd(binary_to_list(Cmd)).

is_dev() ->
    case get(is_dev) of
      undefined ->
	  IS = sys_env:get(server_key) == "abc",
	  put(is_dev, IS),
	  IS;
      Bool -> Bool
    end.


