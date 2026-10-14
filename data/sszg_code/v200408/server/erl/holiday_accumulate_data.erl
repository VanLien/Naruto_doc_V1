-file("data/holiday_accumulate_data.erl", 1).

-file("src/mod/data/holiday_accumulate_data.erl", 1).

-module(holiday_accumulate_data).

-lager_records([]).

-export([get_const/1, get/1]).

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

-file("src/mod/data/holiday_accumulate_data.erl", 11).

get_const(_) -> undefined.

get(1) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {10001, 250}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10403, 2}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10002, 8}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 8}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)}];
get(2) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38080, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 300}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 100}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(3) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(4) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(5) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(6) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(7) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(8) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(9) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(10) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(11) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(12) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(13) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(14) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(15) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(16) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(17) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(18) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(19) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(20) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(21) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(22) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(23) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(24) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(25) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(26) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(27) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(28) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(29) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(30) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(31) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(32) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(33) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(34) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(35) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(36) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(37) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(38) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(39) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(40) ->
    [{1, 6, [{1, 200000}, {22, 100000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>1</d"
		 "iv> ngày nhận"/utf8>>)},
     {2, 6, [{1, 400000}, {22, 200000}, {10450, 200}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>2</d"
		 "iv> ngày nhận"/utf8>>)},
     {3, 6, [{1, 600000}, {22, 300000}, {10403, 3}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>3</d"
		 "iv> ngày nhận"/utf8>>)},
     {4, 6, [{1, 800000}, {22, 400000}, {37001, 5}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>4</d"
		 "iv> ngày nhận"/utf8>>)},
     {5, 6, [{1, 1000000}, {22, 500000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>5</d"
		 "iv> ngày nhận"/utf8>>)},
     {6, 6, [{1, 1200000}, {22, 600000}, {38081, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>6</d"
		 "iv> ngày nhận"/utf8>>)},
     {7, 6, [{1, 1400000}, {22, 700000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>7</d"
		 "iv> ngày nhận"/utf8>>)},
     {8, 6, [{1, 1600000}, {22, 800000}, {38091, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>8</d"
		 "iv> ngày nhận"/utf8>>)},
     {9, 6, [{1, 1800000}, {22, 900000}, {10450, 500}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>9</d"
		 "iv> ngày nhận"/utf8>>)},
     {10, 6, [{1, 2000000}, {22, 1000000}, {14001, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>10</"
		 "div> ngày nhận"/utf8>>)},
     {11, 6, [{1, 2200000}, {22, 1100000}, {37001, 12}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>11</"
		 "div> ngày nhận"/utf8>>)},
     {12, 6, [{1, 2400000}, {22, 1200000}, {37002, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>12</"
		 "div> ngày nhận"/utf8>>)},
     {13, 6, [{1, 2600000}, {22, 1300000}, {29905, 50}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>13</"
		 "div> ngày nhận"/utf8>>)},
     {14, 6, [{1, 2800000}, {22, 1400000}, {72001, 150}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>14</"
		 "div> ngày nhận"/utf8>>)},
     {15, 6, [{1, 3000000}, {22, 1500000}, {39040, 1}],
      lang:get(<<"Tích luỹ nạp nè <div fontcolor=#0x1c820a>15</"
		 "div> ngày nhận"/utf8>>)}];
get(_) -> [].


