-file("src/lib/file_util.erl", 1).

-module(file_util).

-lager_records([{file_descriptor, [module, data]},
		{file_info,
		 [size, type, access, atime, mtime, ctime, mode, links,
		  major_device, minor_device, inode, uid, gid]}]).

-export([is_file/1, is_dir/1, get_file_type/1,
	 get_files/2]).

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

-file("src/lib/file_util.erl", 14).

-file("/usr/local/lib/erlang/lib/kernel-5.2/include/"
      "file.hrl",
      1).

-record(file_info,
	{size  :: non_neg_integer() | undefined,
	 type  ::
	     device | directory | other | regular | symlink |
	     undefined,
	 access  :: read | write | read_write | none | undefined,
	 atime  ::
	     file:date_time() | non_neg_integer() | undefined,
	 mtime  ::
	     file:date_time() | non_neg_integer() | undefined,
	 ctime  ::
	     file:date_time() | non_neg_integer() | undefined,
	 mode  :: non_neg_integer() | undefined,
	 links  :: non_neg_integer() | undefined,
	 major_device  :: non_neg_integer() | undefined,
	 minor_device  :: non_neg_integer() | undefined,
	 inode  :: non_neg_integer() | undefined,
	 uid  :: non_neg_integer() | undefined,
	 gid  :: non_neg_integer() | undefined}).

-record(file_descriptor,
	{module  :: module(), data  :: term()}).

-file("src/lib/file_util.erl", 16).

get_file_type(FileName) ->
    case file:read_file_info(FileName) of
      {ok, #file_info{type = Type}} -> Type;
      _ -> undefined
    end.

is_file(FileName) -> get_file_type(FileName) == regular.

is_dir(FileName) ->
    get_file_type(FileName) == directory.

get_files(DirName, Opt) ->
    case file:list_dir(DirName) of
      {ok, Files} ->
	  {ExtIs, ExtensionList} = case lists:keyfind(ext, 1, Opt)
				       of
				     false -> {true, []};
				     {_, Tmp, Tmp2} -> {Tmp, Tmp2}
				   end,
	  {RegexpIs, RegexpList} = case lists:keyfind(regexp, 1,
						      Opt)
				       of
				     false -> {true, []};
				     {_, Tmp3, Tmp4} -> {Tmp3, Tmp4}
				   end,
	  do_get_files(Files, DirName, [],
		       list_util:find([file, dir], Opt, all),
		       lists:member(recursive, Opt), ExtIs, ExtensionList,
		       RegexpIs, RegexpList);
      _ -> []
    end.

do_get_files([], _BaseDir, Res, _Type, _, _, _, _, _) ->
    Res;
do_get_files([DirName | T], BaseDir, Res, Type,
	     Recursive, ExtIs, ExtensionList, RegexpIs,
	     RegexpList) ->
    FileName = BaseDir ++ "/" ++ DirName,
    case get_file_type(FileName) of
      regular when Type == all orelse Type == file ->
	  NewRes = do_get_files_filter(FileName, Res, ExtIs,
				       ExtensionList, RegexpIs, RegexpList),
	  do_get_files(T, BaseDir, NewRes, Type, Recursive, ExtIs,
		       ExtensionList, RegexpIs, RegexpList);
      directory ->
	  NewRes = if Type == all orelse Type == dir ->
			  do_get_files_filter(FileName, Res, ExtIs,
					      ExtensionList, RegexpIs,
					      RegexpList);
		      true -> Res
		   end,
	  case Recursive of
	    true ->
		case file:list_dir(FileName) of
		  {ok, Files} ->
		      NewRes2 = do_get_files(Files, FileName, NewRes, Type,
					     Recursive, ExtIs, ExtensionList,
					     RegexpIs, RegexpList),
		      do_get_files(T, BaseDir, NewRes2, Type, Recursive,
				   ExtIs, ExtensionList, RegexpIs, RegexpList);
		  _ ->
		      do_get_files(T, BaseDir, NewRes, Type, Recursive, ExtIs,
				   ExtensionList, RegexpIs, RegexpList)
		end;
	    false ->
		do_get_files(T, BaseDir, NewRes, Type, Recursive, ExtIs,
			     ExtensionList, RegexpIs, RegexpList)
	  end;
      _ ->
	  do_get_files(T, BaseDir, Res, Type, Recursive, ExtIs,
		       ExtensionList, RegexpIs, RegexpList)
    end.

do_get_files_filter(FileName, Res, ExtIs, ExtensionList,
		    RegexpIs, RegexpList) ->
    case (ExtensionList == [] orelse
	    lists:member(filename:extension(FileName),
			 ExtensionList)
	      == ExtIs)
	   andalso
	   (RegexpList == [] orelse
	      regexp(FileName, RegexpList) == RegexpIs)
	of
      false -> Res;
      true -> [FileName | Res]
    end.

regexp(_Text, []) -> false;
regexp(Text, [H | L]) ->
    case re:run(Text, H,
		[{capture, none}, caseless, unicode])
	of
      match -> true;
      _ -> regexp(Text, L)
    end.


