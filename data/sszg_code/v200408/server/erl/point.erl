-file("src/lib/point.erl", 1).

-module(point).

-lager_records([]).

-export([new/2, distance/2, square/1, check_range/3,
	 check_distance/3, check_distance/5, check_rectangle/3,
	 check_polygon/2, check_polygon2_init/1,
	 check_polygon2/2, radian/1, radian/2, direction/2,
	 offset/1, get_path/3, get_path/5, get_path_ex/5,
	 get_path_ex2/5, get_rect_xys/2, get_near_point/2,
	 get_line_xys/3, get_line_xys/4, get_block_line/4,
	 get_block_line_b/5, seg_in_rect/4]).

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

-file("src/lib/point.erl", 32).

new(X, Y) -> {X, Y}.

check_range({X1, Y1}, {X2, Y2}, R) ->
    abs(X1 - X2) =< R andalso abs(Y1 - Y2) =< R.

distance({X1, Y1}, {X2, Y2}) ->
    math:sqrt(square(abs(X2 - X1)) + square(abs(Y2 - Y1))).

check_distance({X1, Y1}, {X2, Y2}, D) ->
    check_distance(X1, Y1, X2, Y2, D);
check_distance(SubX, SubY, D) ->
    square(abs(SubX)) + square(abs(SubY)) =< D * D.

check_distance(X1, Y1, X2, Y2, D) ->
    square(abs(X1 - X2)) + square(abs(Y1 - Y2)) =< D * D.

check_rectangle({X1, Y1}, {LTX, LTY}, {RBX, RBY}) ->
    LTX =< X1 andalso
      X1 =< RBX andalso LTY =< Y1 andalso Y1 =< RBY.

check_polygon({X, Y}, Points) ->
    check_polygon_f1({X, Y}, Points, 0).

check_polygon_f1({X, Y}, [{X1, Y1}, {X2, Y2} | T],
		 OSlope) ->
    NSlope = (X2 - X1) * (Y - Y1) - (Y2 - Y1) * (X - X1),
    Slope = NSlope * OSlope,
    if Slope < 0 -> false;
       Slope == 0, OSlope == 0 ->
	   check_polygon_f1({X, Y}, [{X2, Y2} | T], NSlope);
       true -> check_polygon_f1({X, Y}, [{X2, Y2} | T], OSlope)
    end;
check_polygon_f1({_X, _Y}, _, _OSlope) -> true.

check_polygon2_init(Points) ->
    Len = length(Points),
    {_Index, A} = lists:foldl(fun ({X, Y}, {Index, A}) ->
				      {Index + 1, array:set(Index, {X, Y}, A)}
			      end,
			      {0, array:new(Len)}, Points),
    A.

check_polygon2({X, Y}, PointsArray) ->
    MaxSize = array:size(PointsArray),
    check_polygon2_f1({X, Y}, PointsArray, 0, MaxSize,
		      false).

check_polygon2_f1({_X, _Y}, _PointsArray, MaxSize,
		  MaxSize, IsIn) ->
    IsIn;
check_polygon2_f1({X, Y}, PointsArray, Index, MaxSize,
		  IsIn) ->
    Index0 = case Index of
	       0 -> MaxSize - 1;
	       _ -> Index - 1
	     end,
    {X0, Y0} = array:get(Index0, PointsArray),
    {X1, Y1} = array:get(Index, PointsArray),
    if (Y0 >= Y) and (Y1 < Y) or (Y1 >= Y) and (Y0 < Y),
       (X1 =< X) or (X0 =< X) ->
	   IsIn2 = IsIn xor
		     (X1 + (Y - Y1) / (Y0 - Y1) * (X0 - X1) < X),
	   check_polygon2_f1({X, Y}, PointsArray, Index + 1,
			     MaxSize, IsIn2);
       true ->
	   check_polygon2_f1({X, Y}, PointsArray, Index + 1,
			     MaxSize, IsIn)
    end.

cross_prod({Ax, Ay}, {Bx, By}, {Cx, Cy}) ->
    (Bx - Ax) * (Cy - Ay) - (By - Ay) * (Cx - Ax).

seg_in_rect({Ax, Ay}, {Bx, By}, {Cx, Cy}, {Dx, Dy}) ->
    max(Ax, Bx) >= min(Cx, Dx) andalso
      max(Cx, Dx) >= min(Ax, Bx) andalso
	max(Ay, By) >= min(Cy, Dy) andalso
	  max(Cy, Dy) >= min(Ay, By) andalso
	    cross_prod({Cx, Cy}, {Dx, Dy}, {Ax, Ay}) *
	      cross_prod({Cx, Cy}, {Bx, By}, {Dx, Dy})
	      >= 0
	      andalso
	      cross_prod({Ax, Ay}, {Bx, By}, {Cx, Cy}) *
		cross_prod({Ax, Ay}, {Dx, Dy}, {Bx, By})
		>= 0.

radian({X1, Y1}, {X2, Y2}) ->
    math:atan2(Y2 - Y1, X2 - X1).

radian(Dir) -> radian({0, 0}, offset(Dir)).

offset(0) -> {1, 0};
offset(1) -> {1, 1};
offset(2) -> {0, 1};
offset(3) -> {-1, 1};
offset(4) -> {-1, 0};
offset(5) -> {-1, -1};
offset(6) -> {0, -1};
offset(7) -> {1, -1}.

direction(P1, P2) ->
    Offset = math:pi() / 4,
    OffsetHalf = Offset / 2,
    R = case radian(P1, P2) of
	  TmpR when TmpR < 0 -> TmpR + math:pi() + math:pi();
	  TmpR -> TmpR
	end,
    if R =< OffsetHalf -> 0;
       R =< OffsetHalf + Offset -> 1;
       R =< OffsetHalf + Offset * 2 -> 2;
       R =< OffsetHalf + Offset * 3 -> 3;
       R =< OffsetHalf + Offset * 4 -> 4;
       R =< OffsetHalf + Offset * 5 -> 5;
       R =< OffsetHalf + Offset * 6 -> 6;
       R =< OffsetHalf + Offset * 7 -> 7;
       true -> 0
    end.

get_path({SX, SY}, {EX, EY}, Offset) ->
    get_path(SX, SY, EX, EY, Offset).

get_path(SX, SY, EX, EY, Offset) when Offset > 0 ->
    get_path(SX, SY, EX, EY, Offset, []).

get_path(EX, EY, EX, EY, _Offset, XyPath) ->
    lists:reverse(XyPath);
get_path(SX, SY, EX, EY, Offset, XyPath) ->
    X = if SX < EX -> SX + Offset;
	   SX > EX -> SX - Offset;
	   true -> SX
	end,
    Y = if SY < EY -> SY + Offset;
	   SY > EY -> SY - Offset;
	   true -> SY
	end,
    X2 = if SX < EX, X > EX -> EX;
	    SX > EX, X < EX -> EX;
	    true -> X
	 end,
    Y2 = if SY < EY, Y > EY -> EY;
	    SY > EY, Y < EY -> EY;
	    true -> Y
	 end,
    if X2 == EX, Y2 == EY ->
	   lists:reverse([{EX, EY} | XyPath]);
       true ->
	   get_path(X2, Y2, EX, EY, Offset, [{X2, Y2} | XyPath])
    end.

get_path_ex(SX, SY, EX, EY, Offset) ->
    D = distance({SX, SY}, {EX, EY}),
    if D =< Offset -> [{EX, EY}];
       true ->
	   Rad = radian({SX, SY}, {EX, EY}),
	   M = matrix:rotate(matrix:new(), Rad, {SX, SY}),
	   get_path_ex_f1(Offset, D, M, Offset, SX, SY, EX, EY, [])
    end.

get_path_ex_f1(OffsetX, D, _M, _Offset, _SX, _SY, EX,
	       EY, XyPath)
    when OffsetX >= D ->
    lists:reverse([{EX, EY} | XyPath]);
get_path_ex_f1(OffsetX, D, M, Offset, SX, SY, EX, EY,
	       XyPath) ->
    {TmpX, TmpY} = matrix:transform_point(M,
					  {SX + OffsetX, SY}),
    RealX = trunc(TmpX),
    RealY = trunc(TmpY),
    if RealX == EX, RealY == EY ->
	   lists:reverse([{EX, EY} | XyPath]);
       true ->
	   get_path_ex_f1(OffsetX + Offset, D, M, Offset, SX, SY,
			  EX, EY, [{RealX, RealY} | XyPath])
    end.

get_path_ex2(SX, SY, EX, EY, Offset) when Offset > 0 ->
    XX = abs(SX - EX),
    YY = abs(SY - EY),
    {Offset1, Offset2} = case XX > YY of
			   true -> {Offset, round(Offset * YY / XX)};
			   false when YY > 0 ->
			       {round(Offset * XX / YY), Offset};
			   _Else -> {Offset, Offset}
			 end,
    get_path_ex2_f1(SX, SY, EX, EY, Offset1, Offset2, []).

get_path_ex2_f1(EX, EY, EX, EY, _Offset, _Offset2,
		XyPath) ->
    lists:reverse(XyPath);
get_path_ex2_f1(SX, SY, EX, EY, Offset, Offset2,
		XyPath) ->
    X = if SX < EX -> min(EX, SX + Offset);
	   SX > EX -> max(EX, SX - Offset);
	   true -> SX
	end,
    Y = if SY < EY -> min(EY, SY + Offset2);
	   SY > EY -> max(EY, SY - Offset2);
	   true -> SY
	end,
    get_path_ex2_f1(X, Y, EX, EY, Offset, Offset2,
		    [{X, Y} | XyPath]).

get_rect_xys({LTX, LTY}, {BRX, BRY})
    when LTX =< BRX, LTY =< BRY ->
    get_rect_xys_f1(LTX, LTY, BRX, BRY, LTX, []).

get_rect_xys_f1(_LTX, LTY, _BRX, BRY, _OldLTX, XYList)
    when LTY > BRY ->
    XYList;
get_rect_xys_f1(LTX, LTY, BRX, BRY, OldLTX, XYList)
    when LTX > BRX ->
    get_rect_xys_f1(OldLTX, LTY + 1, BRX, BRY, OldLTX,
		    XYList);
get_rect_xys_f1(LTX, LTY, BRX, BRY, OldLTX, XYList) ->
    get_rect_xys_f1(LTX + 1, LTY, BRX, BRY, OldLTX,
		    [{LTX, LTY} | XYList]).

get_near_point(Xy, []) -> Xy;
get_near_point(Xy, [Xy2 | XyList]) ->
    get_near_point_f1(Xy, XyList, distance(Xy, Xy2), Xy2).

get_near_point_f1(_Xy, [], _Distance, NearXy) -> NearXy;
get_near_point_f1(Xy, [Xy2 | XYList], Distance,
		  NearXy) ->
    case Distance2 = distance(Xy, Xy2) < Distance of
      true -> get_near_point_f1(Xy, XYList, Distance2, Xy2);
      false -> get_near_point_f1(Xy, XYList, Distance, NearXy)
    end.

get_line_xys({X, Y}, Num, Type) ->
    get_line_xys({X, Y}, Num, Type, 3).

get_line_xys({X, Y}, Num, Type, Interval) ->
    X1 = max(Interval * Num, X),
    Y1 = max(Interval * Num, Y),
    get_line_xys_1({X1, Y1}, Num, Type, Interval, []).

get_line_xys_1(_Xy, 0, _Type, _Interval, T) -> T;
get_line_xys_1({X, Y}, Num, Type, Interval, T) ->
    {Xd, Yd} = offset(Type),
    X1 = X + Xd * Interval,
    Y1 = Y + Yd * Interval,
    get_line_xys_1({X1, Y1}, Num - 1, Type, Interval,
		   [{X1, Y1} | T]).

get_block_line(SX, SY, EX, EY) ->
    OffsetX = (EX - SX) div max(1, abs(EX - SX)),
    OffsetY = (EY - SY) div max(1, abs(EY - SY)),
    get_block_line_f1(SX, SY, EX, EY, OffsetX, OffsetY,
		      [{SX, SY}]).

get_block_line_f1(EX, EY, EX, EY, _OffsetX, _OffsetY,
		  List) ->
    List;
get_block_line_f1(SX, SY, EX, EY, OffsetX, OffsetY,
		  List) ->
    if abs(SX - EX) > abs(SY - EY) ->
	   get_block_line_f1(SX + OffsetX, SY, EX, EY, OffsetX,
			     OffsetY, [{SX + OffsetX, SY} | List]);
       true ->
	   get_block_line_f1(SX, SY + OffsetY, EX, EY, OffsetX,
			     OffsetY, [{SX, SY + OffsetY} | List])
    end.

get_block_line_b(SX, SY, EX, EY, Long) when Long < 0 ->
    XYList = get_path_ex(SX, SY, EX, EY, 1),
    lists:append([[{X, Y0} || Y0 <- lists:seq(Y + Long, Y)]
		  || {X, Y} <- XYList]);
get_block_line_b(SX, SY, EX, EY, Long) ->
    XYList = get_path_ex(SX, SY, EX, EY, 1),
    lists:append([[{X, Y0} || Y0 <- lists:seq(Y, Y + Long)]
		  || {X, Y} <- XYList]).

square(0) -> 0;
square(1) -> 1;
square(2) -> 4;
square(3) -> 9;
square(4) -> 16;
square(5) -> 25;
square(6) -> 36;
square(7) -> 49;
square(8) -> 64;
square(9) -> 81;
square(10) -> 100;
square(11) -> 121;
square(12) -> 144;
square(13) -> 169;
square(14) -> 196;
square(15) -> 225;
square(16) -> 256;
square(17) -> 289;
square(18) -> 324;
square(19) -> 361;
square(20) -> 400;
square(21) -> 441;
square(22) -> 484;
square(23) -> 529;
square(24) -> 576;
square(25) -> 625;
square(26) -> 676;
square(27) -> 729;
square(28) -> 784;
square(29) -> 841;
square(30) -> 900;
square(31) -> 961;
square(32) -> 1024;
square(33) -> 1089;
square(34) -> 1156;
square(35) -> 1225;
square(36) -> 1296;
square(37) -> 1369;
square(38) -> 1444;
square(39) -> 1521;
square(40) -> 1600;
square(41) -> 1681;
square(42) -> 1764;
square(43) -> 1849;
square(44) -> 1936;
square(45) -> 2025;
square(46) -> 2116;
square(47) -> 2209;
square(48) -> 2304;
square(49) -> 2401;
square(50) -> 2500;
square(I) -> I * I.


