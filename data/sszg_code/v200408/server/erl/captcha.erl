-file("src/lib/captcha.erl", 1).

-module(captcha).

-lager_records([]).

-export([get/0, check/3, auth/2]).

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

-file("src/lib/captcha.erl", 15).

-spec check(monitor | rpc | cb_fun,
	    Cmd :: pos_integer(), Data :: tuple()) -> ok | false.

check(monitor, Cmd, Data) ->
    {Type, {Code, ImgBin}} = captcha:get(),
    put({captcha_key, Cmd},
	{monitor, Code, Data, 0, 0, date:unixtime()}),
    sys_conn:pack_send(10990, {Type, Cmd, ImgBin}),
    false;
check(rpc, Cmd, Data) ->
    case erase({captcha_auth, Cmd, Data}) of
      true -> ok;
      _ ->
	  {Type, {Code, ImgBin}} = captcha:get(),
	  put({captcha_key, Cmd},
	      {rpc, Code, Data, 0, 0, date:unixtime()}),
	  sys_conn:pack_send(10990, {Type, Cmd, ImgBin}),
	  false
    end;
check(cb_fun, Cmd, {Fun, Args}) ->
    check(cb_fun, Cmd, {undefined, Fun, Args});
check(cb_fun, Cmd, {Mod, Fun, Args}) ->
    {Type, {Code, ImgBin}} = captcha:get(),
    put({captcha_key, Cmd},
	{cb_fun, Code, {Mod, Fun, Args}, 0, 0,
	 date:unixtime()}),
    sys_conn:pack_send(10990, {Type, Cmd, ImgBin}),
    false.

-spec auth(Cmd :: pos_integer(),
	   Code :: non_neg_integer()) -> ok | false |
					 {false, 0..10, ImgBin :: binary()} |
					 {refresh, 0..10, ImgBin :: binary()} |
					 {ok, Data :: tuple()}.

auth(Cmd, Code) ->
    Now = date:unixtime(),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcaptcha61, _,
       {__Levelcaptcha61, __Tracescaptcha61}}
	  when __Levelcaptcha61 band 128 /= 0 orelse
		 __Tracescaptcha61 /= [] ->
	  lager:do_log(debug,
		       [{module, captcha}, {function, auth}, {line, 61},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("=====cmd=~w  code=~w ~w",
				     [Cmd, Code,
				      erlang:get({captcha_key, Cmd})]),
		       none, 4096, 128, __Levelcaptcha61, __Tracescaptcha61,
		       lager_event, __Pidcaptcha61);
      _ -> ok
    end,
    case erlang:get({captcha_key, Cmd}) of
      {Type, Code, Data, _N, _M, Time}
	  when Time + 60 >= Now ->
	  {ok, {Type, Data}};
      {_Type, _Code, _Data, _N, _M, Now} when Code =:= 0 ->
	  ok;
      {Type, _Code, Data, N, M, Time}
	  when Code =:= 0 andalso Now =/= Time ->
	  {ImgType, {NewCode, ImgBin}} = captcha:get(),
	  put({captcha_key, Cmd},
	      {Type, NewCode, Data, N, M + 1, Now}),
	  {refresh, ImgType, ImgBin};
      {_Type, _Code, _Data, N, _M, _Time} when N > 2 -> false;
      {Type, _Code, Data, N, _M, _Time} ->
	  {ImgType, {NewCode, ImgBin}} = captcha:get(),
	  put({captcha_key, Cmd},
	      {Type, NewCode, Data, N + 1, 0, Now}),
	  {false, ImgType, ImgBin};
      _ -> ok
    end.

-spec get() -> {Code, ImgBin} when Code ::
				       pos_integer(),
				   ImgBin :: binary().

get() ->
    Type = util:rand_list([0, 2, 3]), {Type, do(Type)}.

do(2) ->
    A = util:rand(1, 100),
    B = util:rand(1, 100),
    Code = A + B,
    Str = lists:concat([A, "+", B, "=?"]),
    ImgBin = img(Str, {18, 20}),
    {Code, ImgBin};
do(3) ->
    B = util:rand(1, 98),
    A = util:rand(B + 1, 99),
    Code = A - B,
    Str = lists:concat([A, "-", B, "=?"]),
    ImgBin = img(Str, {18, 20}),
    {Code, ImgBin};
do(0) ->
    Code = util:rand(1000, 9999),
    Str = integer_to_list(Code),
    {Code, img(Str, {28, 42})}.

img(String, XSpace) ->
    With = 160,
    Height = 50,
    Img = egd:create(With, Height),
    noise(point, 80, {With, Height}, Img),
    noise(line, 10, {With, Height}, Img),
    noise(rectangle, 5, {With, Height}, Img),
    P = {util:rand(5, 15), util:rand(10, 30)},
    lineup(String, Img, XSpace, P),
    Bin = egd:render(Img, png),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcaptcha130, _,
       {__Levelcaptcha130, __Tracescaptcha130}}
	  when __Levelcaptcha130 band 128 /= 0 orelse
		 __Tracescaptcha130 /= [] ->
	  lager:do_log(debug,
		       [{module, captcha}, {function, img}, {line, 130},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("====~w", [Img]), none, 4096, 128,
		       __Levelcaptcha130, __Tracescaptcha130, lager_event,
		       __Pidcaptcha130);
      _ -> ok
    end,
    erlang:unlink(Img),
    egd:destroy(Img),
    Bin.

lineup([], _Img, _XSpace, _P) -> ok;
lineup([H | T], Img, {X1, X2}, {X, Y} = P0) ->
    Color = egd:color({util:rand(0, 255), util:rand(0, 255),
		       util:rand(0, 255)}),
    Font = {util:rand(12, 14), util:rand(14, 16),
	    util:rand(1, 3)},
    draw([H], Img, P0, Font, Color),
    P = {X + util:rand(X1, X2), Y + util:rand(-5, 5)},
    lineup(T, Img, {X1, X2}, P).

noise(_Mod, 0, _, _Img) -> ok;
noise(Mod = point, N, {With, Height}, Img) ->
    Color = egd:color({util:rand(0, 255), util:rand(0, 255),
		       util:rand(0, 255)}),
    X = util:rand(1, With),
    Y = util:rand(1, Height),
    egd:rectangle(Img, {X, Y}, {X + 1, Y + 1}, Color),
    noise(Mod, N - 1, {With, Height}, Img);
noise(Mod = line, N, {With, Height}, Img) ->
    Color = egd:color({util:rand(0, 255), util:rand(0, 255),
		       util:rand(0, 255)}),
    X0 = util:rand(0, With),
    Y0 = util:rand(0, Height),
    X1 = util:rand(X0, X0 + 15),
    Y1 = util:rand(Y0 - 5, Y0 + 5),
    egd:line(Img, {X0, Y0}, {X1, Y1}, Color),
    noise(Mod, N - 1, {With, Height}, Img);
noise(Mod = rectangle, N, {With, Height}, Img) ->
    Color = egd:color({util:rand(0, 255), util:rand(0, 255),
		       util:rand(0, 255)}),
    X0 = util:rand(0, With),
    Y0 = util:rand(0, Height),
    R = util:rand(5, 12),
    egd:rectangle(Img, {X0, Y0}, {X0 + R, Y0 + R}, Color),
    noise(Mod, N - 1, {With, Height}, Img).

draw("0", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img, {X, Y}, {X + Wei, Y + H},
			Color),
    egd:filledRectangle(Img, {X, Y}, {X + W, Y + Wei},
			Color),
    egd:filledRectangle(Img, {X + W - Wei, Y},
			{X + W, Y + H}, Color),
    egd:filledRectangle(Img, {X, Y + H},
			{X + W, Y + H + Wei}, Color),
    ok;
draw("1", Img, {X, Y}, {_W, H, Wei}, Color) ->
    egd:filledRectangle(Img, {X, Y}, {X + Wei, Y + H + Wei},
			Color),
    ok;
draw("2", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img, {X, Y}, {X + W, Y + Wei},
			Color),
    egd:filledRectangle(Img, {X + W - Wei, Y},
			{X + W, Y + H / 2}, Color),
    egd:filledRectangle(Img, {X, Y + H / 2},
			{X + W, Y + H / 2 + Wei}, Color),
    egd:filledRectangle(Img, {X, Y + H / 2},
			{X + Wei, Y + H}, Color),
    egd:filledRectangle(Img, {X, Y + H},
			{X + W, Y + H + Wei}, Color),
    ok;
draw("3", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img, {X, Y}, {X + W, Y + Wei},
			Color),
    egd:filledRectangle(Img, {X + W - Wei, Y + Wei},
			{X + W, Y + H}, Color),
    egd:filledRectangle(Img, {X, Y + H / 2},
			{X + W, Y + H / 2 + Wei}, Color),
    egd:filledRectangle(Img, {X, Y + H},
			{X + W, Y + H + Wei}, Color),
    ok;
draw("4", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img, {X, Y}, {X + Wei, Y + H / 2},
			Color),
    egd:filledRectangle(Img, {X, Y + H / 2},
			{X + W, Y + H / 2 + Wei}, Color),
    egd:filledRectangle(Img, {X + W - Wei, Y},
			{X + W, Y + H + Wei}, Color),
    ok;
draw("5", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img, {X, Y}, {X + Wei, Y + H / 2},
			Color),
    egd:filledRectangle(Img, {X, Y}, {X + W, Y + Wei},
			Color),
    egd:filledRectangle(Img, {X + W - Wei, Y + H / 2},
			{X + W, Y + H}, Color),
    egd:filledRectangle(Img, {X, Y + H / 2},
			{X + W, Y + H / 2 + Wei}, Color),
    egd:filledRectangle(Img, {X, Y + H},
			{X + W, Y + H + Wei}, Color),
    ok;
draw("6", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img, {X, Y}, {X + Wei, Y + H},
			Color),
    egd:filledRectangle(Img, {X, Y}, {X + W, Y + Wei},
			Color),
    egd:filledRectangle(Img, {X + W - Wei, Y + H / 2},
			{X + W, Y + H}, Color),
    egd:filledRectangle(Img, {X, Y + H / 2},
			{X + W, Y + H / 2 + Wei}, Color),
    egd:filledRectangle(Img, {X, Y + H},
			{X + W, Y + H + Wei}, Color),
    ok;
draw("7", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img, {X, Y}, {X + W, Y + Wei},
			Color),
    egd:filledRectangle(Img, {X + W - Wei, Y + Wei},
			{X + W, Y + H + Wei}, Color),
    ok;
draw("8", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img, {X, Y}, {X + Wei, Y + H},
			Color),
    egd:filledRectangle(Img, {X, Y}, {X + W, Y + Wei},
			Color),
    egd:filledRectangle(Img, {X + W - Wei, Y},
			{X + W, Y + H}, Color),
    egd:filledRectangle(Img, {X, Y + H / 2},
			{X + W, Y + H / 2 + Wei}, Color),
    egd:filledRectangle(Img, {X, Y + H},
			{X + W, Y + H + Wei}, Color),
    ok;
draw("9", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img, {X, Y}, {X + Wei, Y + H / 2},
			Color),
    egd:filledRectangle(Img, {X, Y}, {X + W, Y + Wei},
			Color),
    egd:filledRectangle(Img, {X + W - Wei, Y},
			{X + W, Y + H}, Color),
    egd:filledRectangle(Img, {X, Y + H / 2},
			{X + W, Y + H / 2 + Wei}, Color),
    egd:filledRectangle(Img, {X, Y + H},
			{X + W, Y + H + Wei}, Color),
    ok;
draw("+", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img, {X, Y + H / 2},
			{X + W, Y + H / 2 + Wei}, Color),
    egd:filledRectangle(Img,
			{X + trunc(W / 2 - Wei / 2), Y + Wei},
			{X + trunc(W / 2 - Wei / 2) + Wei, Y + H}, Color),
    ok;
draw("-", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img, {X, Y + H / 2},
			{X + W, Y + H / 2 + Wei}, Color),
    ok;
draw("=", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img, {X, Y + H / 2 - Wei - 2},
			{X + W, Y + H / 2 - 2}, Color),
    egd:filledRectangle(Img, {X, Y + H / 2 + Wei},
			{X + W, Y + H / 2 + Wei * 2}, Color),
    ok;
draw("?", Img, {X, Y}, {W, H, Wei}, Color) ->
    egd:filledRectangle(Img, {X, Y + H / 2},
			{X + Wei, Y + H - Wei * 1.5}, Color),
    egd:filledRectangle(Img, {X, Y}, {X + W, Y + Wei},
			Color),
    egd:filledRectangle(Img, {X + W - Wei, Y},
			{X + W, Y + H / 2}, Color),
    egd:filledRectangle(Img, {X, Y + H / 2},
			{X + W, Y + H / 2 + Wei}, Color),
    egd:filledRectangle(Img, {X, Y + H},
			{X + Wei, Y + H + Wei}, Color),
    ok;
draw(_, _Img, _P, _F, _Color) -> ignore.


