-file("data/month_fund_data.erl", 1).

-file("data/month_fund_data.erl", 1).

-module(month_fund_data).

-export([get_const/1, fund_info/1, fund_list/0,
	 fund_open_time/1, fund_group/1, fund_reward/1,
	 fund_name/1, fund_val/1]).

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

-file("data/month_fund_data.erl", 17).

get_const(_) -> undefined.

fund_info(102) -> 101;
fund_info(103) -> 102;
fund_info(_) -> undefined.

fund_list() -> [101, 102].

fund_open_time(102) ->
    [{{reg_day, 1}, {reg_day, 3, 86399}},
     {{reg_day, 9}, {reg_day, 11, 86399}},
     {{reg_day, 17}, {reg_day, 19, 86399}},
     {{reg_day, 25}, {reg_day, 27, 86399}},
     {{reg_day, 31}, {reg_day, 32, 86399}},
     {{reg_day, 33}, {reg_day, 35, 86399}},
     {{reg_day, 36}, {reg_day, 41, 86399}},
     {{reg_day, 42}, {reg_day, 47, 86399}},
     {{reg_day, 48}, {reg_day, 52, 86399}},
     {{reg_day, 53}, {reg_day, 58, 86399}},
     {{reg_day, 59}, {reg_day, 64, 86399}},
     {{reg_day, 65}, {reg_day, 70, 86399}},
     {{reg_day, 71}, {reg_day, 76, 86399}},
     {{reg_day, 77}, {reg_day, 82, 86399}},
     {{reg_day, 83}, {reg_day, 88, 86399}},
     {{reg_day, 89}, {reg_day, 94, 86399}},
     {{reg_day, 95}, {reg_day, 100, 86399}},
     {{reg_day, 101}, {reg_day, 106, 86399}},
     {{reg_day, 107}, {reg_day, 112, 86399}},
     {{reg_day, 113}, {reg_day, 118, 86399}},
     {{reg_day, 119}, {reg_day, 124, 86399}},
     {{reg_day, 125}, {reg_day, 130, 86399}},
     {{reg_day, 131}, {reg_day, 136, 86399}},
     {{reg_day, 137}, {reg_day, 142, 86399}},
     {{reg_day, 143}, {reg_day, 148, 86399}},
     {{reg_day, 149}, {reg_day, 154, 86399}},
     {{reg_day, 155}, {reg_day, 160, 86399}},
     {{reg_day, 161}, {reg_day, 166, 86399}},
     {{reg_day, 167}, {reg_day, 172, 86399}},
     {{reg_day, 173}, {reg_day, 178, 86399}},
     {{reg_day, 179}, {reg_day, 184, 86399}},
     {{reg_day, 185}, {reg_day, 190, 86399}},
     {{reg_day, 191}, {reg_day, 196, 86399}},
     {{reg_day, 197}, {reg_day, 202, 86399}},
     {{reg_day, 203}, {reg_day, 208, 86399}},
     {{reg_day, 209}, {reg_day, 214, 86399}},
     {{reg_day, 215}, {reg_day, 220, 86399}},
     {{reg_day, 221}, {reg_day, 226, 86399}},
     {{reg_day, 227}, {reg_day, 232, 86399}},
     {{reg_day, 233}, {reg_day, 238, 86399}},
     {{reg_day, 239}, {reg_day, 244, 86399}},
     {{reg_day, 245}, {reg_day, 250, 86399}},
     {{reg_day, 251}, {reg_day, 256, 86399}},
     {{reg_day, 257}, {reg_day, 262, 86399}},
     {{reg_day, 263}, {reg_day, 268, 86399}},
     {{reg_day, 269}, {reg_day, 274, 86399}},
     {{reg_day, 275}, {reg_day, 280, 86399}},
     {{reg_day, 281}, {reg_day, 286, 86399}},
     {{reg_day, 287}, {reg_day, 292, 86399}},
     {{reg_day, 293}, {reg_day, 298, 86399}},
     {{reg_day, 299}, {reg_day, 304, 86399}},
     {{reg_day, 305}, {reg_day, 310, 86399}},
     {{reg_day, 311}, {reg_day, 316, 86399}},
     {{reg_day, 317}, {reg_day, 322, 86399}},
     {{reg_day, 323}, {reg_day, 328, 86399}},
     {{reg_day, 329}, {reg_day, 334, 86399}},
     {{reg_day, 335}, {reg_day, 340, 86399}},
     {{reg_day, 341}, {reg_day, 346, 86399}},
     {{reg_day, 347}, {reg_day, 352, 86399}},
     {{reg_day, 353}, {reg_day, 358, 86399}},
     {{reg_day, 359}, {reg_day, 364, 86399}},
     {{reg_day, 365}, {reg_day, 370, 86399}},
     {{reg_day, 371}, {reg_day, 376, 86399}},
     {{reg_day, 377}, {reg_day, 382, 86399}},
     {{reg_day, 383}, {reg_day, 388, 86399}},
     {{reg_day, 389}, {reg_day, 394, 86399}},
     {{reg_day, 395}, {reg_day, 400, 86399}},
     {{reg_day, 401}, {reg_day, 406, 86399}},
     {{reg_day, 407}, {reg_day, 412, 86399}},
     {{reg_day, 413}, {reg_day, 418, 86399}},
     {{reg_day, 419}, {reg_day, 424, 86399}},
     {{reg_day, 425}, {reg_day, 430, 86399}},
     {{reg_day, 431}, {reg_day, 436, 86399}},
     {{reg_day, 437}, {reg_day, 442, 86399}},
     {{reg_day, 443}, {reg_day, 448, 86399}},
     {{reg_day, 449}, {reg_day, 454, 86399}},
     {{reg_day, 455}, {reg_day, 460, 86399}},
     {{reg_day, 461}, {reg_day, 466, 86399}},
     {{reg_day, 467}, {reg_day, 472, 86399}},
     {{reg_day, 473}, {reg_day, 478, 86399}},
     {{reg_day, 479}, {reg_day, 484, 86399}},
     {{reg_day, 485}, {reg_day, 490, 86399}},
     {{reg_day, 491}, {reg_day, 496, 86399}},
     {{reg_day, 497}, {reg_day, 502, 86399}},
     {{reg_day, 503}, {reg_day, 508, 86399}},
     {{reg_day, 509}, {reg_day, 514, 86399}},
     {{reg_day, 515}, {reg_day, 520, 86399}},
     {{reg_day, 521}, {reg_day, 526, 86399}},
     {{reg_day, 527}, {reg_day, 532, 86399}},
     {{reg_day, 533}, {reg_day, 538, 86399}},
     {{reg_day, 539}, {reg_day, 544, 86399}},
     {{reg_day, 545}, {reg_day, 550, 86399}},
     {{reg_day, 551}, {reg_day, 556, 86399}},
     {{reg_day, 557}, {reg_day, 562, 86399}},
     {{reg_day, 563}, {reg_day, 568, 86399}},
     {{reg_day, 569}, {reg_day, 574, 86399}},
     {{reg_day, 575}, {reg_day, 580, 86399}},
     {{reg_day, 581}, {reg_day, 586, 86399}},
     {{reg_day, 587}, {reg_day, 592, 86399}},
     {{reg_day, 593}, {reg_day, 598, 86399}},
     {{reg_day, 599}, {reg_day, 604, 86399}},
     {{reg_day, 605}, {reg_day, 610, 86399}},
     {{reg_day, 611}, {reg_day, 616, 86399}},
     {{reg_day, 617}, {reg_day, 622, 86399}},
     {{reg_day, 623}, {reg_day, 628, 86399}},
     {{reg_day, 629}, {reg_day, 634, 86399}},
     {{reg_day, 635}, {reg_day, 640, 86399}},
     {{reg_day, 641}, {reg_day, 646, 86399}},
     {{reg_day, 647}, {reg_day, 652, 86399}},
     {{reg_day, 653}, {reg_day, 658, 86399}},
     {{reg_day, 659}, {reg_day, 664, 86399}},
     {{reg_day, 665}, {reg_day, 670, 86399}},
     {{reg_day, 671}, {reg_day, 676, 86399}},
     {{reg_day, 677}, {reg_day, 682, 86399}}];
fund_open_time(101) ->
    [{{reg_day, 1}, {reg_day, 3, 86399}},
     {{reg_day, 9}, {reg_day, 11, 86399}},
     {{reg_day, 17}, {reg_day, 19, 86399}},
     {{reg_day, 25}, {reg_day, 27, 86399}},
     {{reg_day, 31}, {reg_day, 32, 86399}},
     {{reg_day, 33}, {reg_day, 35, 86399}},
     {{reg_day, 36}, {reg_day, 41, 86399}},
     {{reg_day, 42}, {reg_day, 47, 86399}},
     {{reg_day, 48}, {reg_day, 52, 86399}},
     {{reg_day, 53}, {reg_day, 58, 86399}},
     {{reg_day, 59}, {reg_day, 64, 86399}},
     {{reg_day, 65}, {reg_day, 70, 86399}},
     {{reg_day, 71}, {reg_day, 76, 86399}},
     {{reg_day, 77}, {reg_day, 82, 86399}},
     {{reg_day, 83}, {reg_day, 88, 86399}},
     {{reg_day, 89}, {reg_day, 94, 86399}},
     {{reg_day, 95}, {reg_day, 100, 86399}},
     {{reg_day, 101}, {reg_day, 106, 86399}},
     {{reg_day, 107}, {reg_day, 112, 86399}},
     {{reg_day, 113}, {reg_day, 118, 86399}},
     {{reg_day, 119}, {reg_day, 124, 86399}},
     {{reg_day, 125}, {reg_day, 130, 86399}},
     {{reg_day, 131}, {reg_day, 136, 86399}},
     {{reg_day, 137}, {reg_day, 142, 86399}},
     {{reg_day, 143}, {reg_day, 148, 86399}},
     {{reg_day, 149}, {reg_day, 154, 86399}},
     {{reg_day, 155}, {reg_day, 160, 86399}},
     {{reg_day, 161}, {reg_day, 166, 86399}},
     {{reg_day, 167}, {reg_day, 172, 86399}},
     {{reg_day, 173}, {reg_day, 178, 86399}},
     {{reg_day, 179}, {reg_day, 184, 86399}},
     {{reg_day, 185}, {reg_day, 190, 86399}},
     {{reg_day, 191}, {reg_day, 196, 86399}},
     {{reg_day, 197}, {reg_day, 202, 86399}},
     {{reg_day, 203}, {reg_day, 208, 86399}},
     {{reg_day, 209}, {reg_day, 214, 86399}},
     {{reg_day, 215}, {reg_day, 220, 86399}},
     {{reg_day, 221}, {reg_day, 226, 86399}},
     {{reg_day, 227}, {reg_day, 232, 86399}},
     {{reg_day, 233}, {reg_day, 238, 86399}},
     {{reg_day, 239}, {reg_day, 244, 86399}},
     {{reg_day, 245}, {reg_day, 250, 86399}},
     {{reg_day, 251}, {reg_day, 256, 86399}},
     {{reg_day, 257}, {reg_day, 262, 86399}},
     {{reg_day, 263}, {reg_day, 268, 86399}},
     {{reg_day, 269}, {reg_day, 274, 86399}},
     {{reg_day, 275}, {reg_day, 280, 86399}},
     {{reg_day, 281}, {reg_day, 286, 86399}},
     {{reg_day, 287}, {reg_day, 292, 86399}},
     {{reg_day, 293}, {reg_day, 298, 86399}},
     {{reg_day, 299}, {reg_day, 304, 86399}},
     {{reg_day, 305}, {reg_day, 310, 86399}},
     {{reg_day, 311}, {reg_day, 316, 86399}},
     {{reg_day, 317}, {reg_day, 322, 86399}},
     {{reg_day, 323}, {reg_day, 328, 86399}},
     {{reg_day, 329}, {reg_day, 334, 86399}},
     {{reg_day, 335}, {reg_day, 340, 86399}},
     {{reg_day, 341}, {reg_day, 346, 86399}},
     {{reg_day, 347}, {reg_day, 352, 86399}},
     {{reg_day, 353}, {reg_day, 358, 86399}},
     {{reg_day, 359}, {reg_day, 364, 86399}},
     {{reg_day, 365}, {reg_day, 370, 86399}},
     {{reg_day, 371}, {reg_day, 376, 86399}},
     {{reg_day, 377}, {reg_day, 382, 86399}},
     {{reg_day, 383}, {reg_day, 388, 86399}},
     {{reg_day, 389}, {reg_day, 394, 86399}},
     {{reg_day, 395}, {reg_day, 400, 86399}},
     {{reg_day, 401}, {reg_day, 406, 86399}},
     {{reg_day, 407}, {reg_day, 412, 86399}},
     {{reg_day, 413}, {reg_day, 418, 86399}},
     {{reg_day, 419}, {reg_day, 424, 86399}},
     {{reg_day, 425}, {reg_day, 430, 86399}},
     {{reg_day, 431}, {reg_day, 436, 86399}},
     {{reg_day, 437}, {reg_day, 442, 86399}},
     {{reg_day, 443}, {reg_day, 448, 86399}},
     {{reg_day, 449}, {reg_day, 454, 86399}},
     {{reg_day, 455}, {reg_day, 460, 86399}},
     {{reg_day, 461}, {reg_day, 466, 86399}},
     {{reg_day, 467}, {reg_day, 472, 86399}},
     {{reg_day, 473}, {reg_day, 478, 86399}},
     {{reg_day, 479}, {reg_day, 484, 86399}},
     {{reg_day, 485}, {reg_day, 490, 86399}},
     {{reg_day, 491}, {reg_day, 496, 86399}},
     {{reg_day, 497}, {reg_day, 502, 86399}},
     {{reg_day, 503}, {reg_day, 508, 86399}},
     {{reg_day, 509}, {reg_day, 514, 86399}},
     {{reg_day, 515}, {reg_day, 520, 86399}},
     {{reg_day, 521}, {reg_day, 526, 86399}},
     {{reg_day, 527}, {reg_day, 532, 86399}},
     {{reg_day, 533}, {reg_day, 538, 86399}},
     {{reg_day, 539}, {reg_day, 544, 86399}},
     {{reg_day, 545}, {reg_day, 550, 86399}},
     {{reg_day, 551}, {reg_day, 556, 86399}},
     {{reg_day, 557}, {reg_day, 562, 86399}},
     {{reg_day, 563}, {reg_day, 568, 86399}},
     {{reg_day, 569}, {reg_day, 574, 86399}},
     {{reg_day, 575}, {reg_day, 580, 86399}},
     {{reg_day, 581}, {reg_day, 586, 86399}},
     {{reg_day, 587}, {reg_day, 592, 86399}},
     {{reg_day, 593}, {reg_day, 598, 86399}},
     {{reg_day, 599}, {reg_day, 604, 86399}},
     {{reg_day, 605}, {reg_day, 610, 86399}},
     {{reg_day, 611}, {reg_day, 616, 86399}},
     {{reg_day, 617}, {reg_day, 622, 86399}},
     {{reg_day, 623}, {reg_day, 628, 86399}},
     {{reg_day, 629}, {reg_day, 634, 86399}},
     {{reg_day, 635}, {reg_day, 640, 86399}},
     {{reg_day, 641}, {reg_day, 646, 86399}},
     {{reg_day, 647}, {reg_day, 652, 86399}},
     {{reg_day, 653}, {reg_day, 658, 86399}},
     {{reg_day, 659}, {reg_day, 664, 86399}},
     {{reg_day, 665}, {reg_day, 670, 86399}},
     {{reg_day, 671}, {reg_day, 676, 86399}},
     {{reg_day, 677}, {reg_day, 682, 86399}}];
fund_open_time(_) -> undefined.

fund_group({101, Lev, OpenTimestamp, BuyTime})
    when Lev >= 1 andalso
	   Lev =< 999 andalso
	     OpenTimestamp >= 0 andalso
	       OpenTimestamp =< 2000000000 andalso
		 BuyTime >= 0 andalso BuyTime =< 2000000000 ->
    1;
fund_group({101, Lev, OpenTimestamp, BuyTime})
    when Lev >= 1 andalso
	   Lev =< 999 andalso
	     OpenTimestamp >= 0 andalso
	       OpenTimestamp =< 2000000000 andalso
		 BuyTime >= 0 andalso BuyTime =< 2000000000 ->
    2;
fund_group({101, Lev, OpenTimestamp, BuyTime})
    when Lev >= 1 andalso
	   Lev =< 999 andalso
	     OpenTimestamp >= 0 andalso
	       OpenTimestamp =< 2000000000 andalso
		 BuyTime >= 0 andalso BuyTime =< 2000000000 ->
    5;
fund_group({101, Lev, OpenTimestamp, BuyTime})
    when Lev >= 1 andalso
	   Lev =< 999 andalso
	     OpenTimestamp >= 0 andalso
	       OpenTimestamp =< 2000000000 andalso
		 BuyTime >= 0 andalso BuyTime =< 2000000000 ->
    6;
fund_group({101, Lev, OpenTimestamp, BuyTime})
    when Lev >= 1 andalso
	   Lev =< 999 andalso
	     OpenTimestamp >= 0 andalso
	       OpenTimestamp =< 2000000000 andalso
		 BuyTime >= 0 andalso BuyTime =< 2000000000 ->
    5;
fund_group({101, Lev, OpenTimestamp, BuyTime})
    when Lev >= 1 andalso
	   Lev =< 999 andalso
	     OpenTimestamp >= 0 andalso
	       OpenTimestamp =< 2000000000 andalso
		 BuyTime >= 0 andalso BuyTime =< 2000000000 ->
    6;
fund_group({102, Lev, OpenTimestamp, BuyTime})
    when Lev >= 1 andalso
	   Lev =< 999 andalso
	     OpenTimestamp >= 0 andalso
	       OpenTimestamp =< 2000000000 andalso
		 BuyTime >= 0 andalso BuyTime =< 2000000000 ->
    3;
fund_group({102, Lev, OpenTimestamp, BuyTime})
    when Lev >= 1 andalso
	   Lev =< 999 andalso
	     OpenTimestamp >= 0 andalso
	       OpenTimestamp =< 2000000000 andalso
		 BuyTime >= 0 andalso BuyTime =< 2000000000 ->
    4;
fund_group({102, Lev, OpenTimestamp, BuyTime})
    when Lev >= 1 andalso
	   Lev =< 999 andalso
	     OpenTimestamp >= 0 andalso
	       OpenTimestamp =< 2000000000 andalso
		 BuyTime >= 0 andalso BuyTime =< 2000000000 ->
    7;
fund_group({102, Lev, OpenTimestamp, BuyTime})
    when Lev >= 1 andalso
	   Lev =< 999 andalso
	     OpenTimestamp >= 0 andalso
	       OpenTimestamp =< 2000000000 andalso
		 BuyTime >= 0 andalso BuyTime =< 2000000000 ->
    8;
fund_group({102, Lev, OpenTimestamp, BuyTime})
    when Lev >= 1 andalso
	   Lev =< 999 andalso
	     OpenTimestamp >= 0 andalso
	       OpenTimestamp =< 2000000000 andalso
		 BuyTime >= 0 andalso BuyTime =< 2000000000 ->
    7;
fund_group({102, Lev, OpenTimestamp, BuyTime})
    when Lev >= 1 andalso
	   Lev =< 999 andalso
	     OpenTimestamp >= 0 andalso
	       OpenTimestamp =< 2000000000 andalso
		 BuyTime >= 0 andalso BuyTime =< 2000000000 ->
    8;
fund_group(_Info) ->
    logger:data_error("fund_group_data_not_exist===>~w",
		      [_Info], month_fund_data, 43),
    undefined.

fund_reward({1, 1}) -> [{39039, 5}];
fund_reward({1, 2}) -> [{3, 5000000}];
fund_reward({1, 3}) -> [{59040, 2}];
fund_reward({1, 4}) -> [{39039, 5}];
fund_reward({1, 5}) -> [{3, 5000000}];
fund_reward({1, 6}) -> [{59040, 2}];
fund_reward({1, 7}) -> [{39039, 5}];
fund_reward({1, 8}) -> [{3, 5000000}];
fund_reward({1, 9}) -> [{59040, 2}];
fund_reward({1, 10}) -> [{39039, 5}];
fund_reward({1, 11}) -> [{3, 5000000}];
fund_reward({1, 12}) -> [{59040, 2}];
fund_reward({1, 13}) -> [{39039, 5}];
fund_reward({1, 14}) -> [{3, 5000000}];
fund_reward({1, 15}) -> [{59040, 2}];
fund_reward({1, 16}) -> [{39039, 5}];
fund_reward({1, 17}) -> [{3, 5000000}];
fund_reward({1, 18}) -> [{59040, 2}];
fund_reward({1, 19}) -> [{39039, 5}];
fund_reward({1, 20}) -> [{3, 5000000}];
fund_reward({1, 21}) -> [{59040, 2}];
fund_reward({1, 22}) -> [{39039, 5}];
fund_reward({1, 23}) -> [{3, 5000000}];
fund_reward({1, 24}) -> [{59040, 2}];
fund_reward({1, 25}) -> [{39039, 5}];
fund_reward({1, 26}) -> [{3, 5000000}];
fund_reward({1, 27}) -> [{59040, 2}];
fund_reward({1, 28}) -> [{39039, 5}];
fund_reward({1, 29}) -> [{3, 5000000}];
fund_reward({1, 30}) -> [{59040, 2}];
fund_reward({2, 1}) -> [{39039, 5}];
fund_reward({2, 2}) -> [{3, 5000000}];
fund_reward({2, 3}) -> [{59040, 2}];
fund_reward({2, 4}) -> [{39039, 5}];
fund_reward({2, 5}) -> [{3, 5000000}];
fund_reward({2, 6}) -> [{59040, 2}];
fund_reward({2, 7}) -> [{39039, 5}];
fund_reward({2, 8}) -> [{3, 5000000}];
fund_reward({2, 9}) -> [{59040, 2}];
fund_reward({2, 10}) -> [{39039, 5}];
fund_reward({2, 11}) -> [{3, 5000000}];
fund_reward({2, 12}) -> [{59040, 2}];
fund_reward({2, 13}) -> [{39039, 5}];
fund_reward({2, 14}) -> [{3, 5000000}];
fund_reward({2, 15}) -> [{59040, 2}];
fund_reward({2, 16}) -> [{39039, 5}];
fund_reward({2, 17}) -> [{3, 5000000}];
fund_reward({2, 18}) -> [{59040, 2}];
fund_reward({2, 19}) -> [{39039, 5}];
fund_reward({2, 20}) -> [{3, 5000000}];
fund_reward({2, 21}) -> [{59040, 2}];
fund_reward({2, 22}) -> [{39039, 5}];
fund_reward({2, 23}) -> [{3, 5000000}];
fund_reward({2, 24}) -> [{59040, 2}];
fund_reward({2, 25}) -> [{39039, 5}];
fund_reward({2, 26}) -> [{3, 5000000}];
fund_reward({2, 27}) -> [{59040, 2}];
fund_reward({2, 28}) -> [{39039, 5}];
fund_reward({2, 29}) -> [{3, 5000000}];
fund_reward({2, 30}) -> [{59040, 2}];
fund_reward({3, 1}) -> [{59040, 5}];
fund_reward({3, 2}) -> [{3, 10000000}];
fund_reward({3, 3}) -> [{59041, 2}];
fund_reward({3, 4}) -> [{59040, 5}];
fund_reward({3, 5}) -> [{3, 10000000}];
fund_reward({3, 6}) -> [{59041, 2}];
fund_reward({3, 7}) -> [{59040, 5}];
fund_reward({3, 8}) -> [{3, 10000000}];
fund_reward({3, 9}) -> [{59041, 2}];
fund_reward({3, 10}) -> [{59040, 5}];
fund_reward({3, 11}) -> [{3, 10000000}];
fund_reward({3, 12}) -> [{59041, 2}];
fund_reward({3, 13}) -> [{59040, 5}];
fund_reward({3, 14}) -> [{3, 10000000}];
fund_reward({3, 15}) -> [{59041, 2}];
fund_reward({3, 16}) -> [{59040, 5}];
fund_reward({3, 17}) -> [{3, 10000000}];
fund_reward({3, 18}) -> [{59041, 2}];
fund_reward({3, 19}) -> [{59040, 5}];
fund_reward({3, 20}) -> [{3, 10000000}];
fund_reward({3, 21}) -> [{59041, 2}];
fund_reward({3, 22}) -> [{59040, 5}];
fund_reward({3, 23}) -> [{3, 10000000}];
fund_reward({3, 24}) -> [{59041, 2}];
fund_reward({3, 25}) -> [{59040, 5}];
fund_reward({3, 26}) -> [{3, 10000000}];
fund_reward({3, 27}) -> [{59041, 2}];
fund_reward({3, 28}) -> [{59040, 5}];
fund_reward({3, 29}) -> [{3, 10000000}];
fund_reward({3, 30}) -> [{59041, 2}];
fund_reward({4, 1}) -> [{59040, 5}];
fund_reward({4, 2}) -> [{3, 10000000}];
fund_reward({4, 3}) -> [{59041, 2}];
fund_reward({4, 4}) -> [{59040, 5}];
fund_reward({4, 5}) -> [{3, 10000000}];
fund_reward({4, 6}) -> [{59041, 2}];
fund_reward({4, 7}) -> [{59040, 5}];
fund_reward({4, 8}) -> [{3, 10000000}];
fund_reward({4, 9}) -> [{59041, 2}];
fund_reward({4, 10}) -> [{59040, 5}];
fund_reward({4, 11}) -> [{3, 10000000}];
fund_reward({4, 12}) -> [{59041, 2}];
fund_reward({4, 13}) -> [{59040, 5}];
fund_reward({4, 14}) -> [{3, 10000000}];
fund_reward({4, 15}) -> [{59041, 2}];
fund_reward({4, 16}) -> [{59040, 5}];
fund_reward({4, 17}) -> [{3, 10000000}];
fund_reward({4, 18}) -> [{59041, 2}];
fund_reward({4, 19}) -> [{59040, 5}];
fund_reward({4, 20}) -> [{3, 10000000}];
fund_reward({4, 21}) -> [{59041, 2}];
fund_reward({4, 22}) -> [{59040, 5}];
fund_reward({4, 23}) -> [{3, 10000000}];
fund_reward({4, 24}) -> [{59041, 2}];
fund_reward({4, 25}) -> [{59040, 5}];
fund_reward({4, 26}) -> [{3, 10000000}];
fund_reward({4, 27}) -> [{59041, 2}];
fund_reward({4, 28}) -> [{59040, 5}];
fund_reward({4, 29}) -> [{3, 10000000}];
fund_reward({4, 30}) -> [{59041, 2}];
fund_reward({5, 1}) -> [{39039, 5}];
fund_reward({5, 2}) -> [{3, 5000000}];
fund_reward({5, 3}) -> [{59040, 2}];
fund_reward({5, 4}) -> [{39039, 5}];
fund_reward({5, 5}) -> [{3, 5000000}];
fund_reward({5, 6}) -> [{59040, 2}];
fund_reward({5, 7}) -> [{39039, 5}];
fund_reward({5, 8}) -> [{3, 5000000}];
fund_reward({5, 9}) -> [{59040, 2}];
fund_reward({5, 10}) -> [{39039, 5}];
fund_reward({5, 11}) -> [{3, 5000000}];
fund_reward({5, 12}) -> [{59040, 2}];
fund_reward({5, 13}) -> [{39039, 5}];
fund_reward({5, 14}) -> [{3, 5000000}];
fund_reward({5, 15}) -> [{59040, 2}];
fund_reward({5, 16}) -> [{39039, 5}];
fund_reward({5, 17}) -> [{3, 5000000}];
fund_reward({5, 18}) -> [{59040, 2}];
fund_reward({5, 19}) -> [{39039, 5}];
fund_reward({5, 20}) -> [{3, 5000000}];
fund_reward({5, 21}) -> [{59040, 2}];
fund_reward({5, 22}) -> [{39039, 5}];
fund_reward({5, 23}) -> [{3, 5000000}];
fund_reward({5, 24}) -> [{59040, 2}];
fund_reward({5, 25}) -> [{39039, 5}];
fund_reward({5, 26}) -> [{3, 5000000}];
fund_reward({5, 27}) -> [{59040, 2}];
fund_reward({5, 28}) -> [{39039, 5}];
fund_reward({5, 29}) -> [{3, 5000000}];
fund_reward({5, 30}) -> [{59040, 2}];
fund_reward({6, 1}) -> [{39039, 5}];
fund_reward({6, 2}) -> [{3, 5000000}];
fund_reward({6, 3}) -> [{59040, 2}];
fund_reward({6, 4}) -> [{39039, 5}];
fund_reward({6, 5}) -> [{3, 5000000}];
fund_reward({6, 6}) -> [{59040, 2}];
fund_reward({6, 7}) -> [{39039, 5}];
fund_reward({6, 8}) -> [{3, 5000000}];
fund_reward({6, 9}) -> [{59040, 2}];
fund_reward({6, 10}) -> [{39039, 5}];
fund_reward({6, 11}) -> [{3, 5000000}];
fund_reward({6, 12}) -> [{59040, 2}];
fund_reward({6, 13}) -> [{39039, 5}];
fund_reward({6, 14}) -> [{3, 5000000}];
fund_reward({6, 15}) -> [{59040, 2}];
fund_reward({6, 16}) -> [{39039, 5}];
fund_reward({6, 17}) -> [{3, 5000000}];
fund_reward({6, 18}) -> [{59040, 2}];
fund_reward({6, 19}) -> [{39039, 5}];
fund_reward({6, 20}) -> [{3, 5000000}];
fund_reward({6, 21}) -> [{59040, 2}];
fund_reward({6, 22}) -> [{39039, 5}];
fund_reward({6, 23}) -> [{3, 5000000}];
fund_reward({6, 24}) -> [{59040, 2}];
fund_reward({6, 25}) -> [{39039, 5}];
fund_reward({6, 26}) -> [{3, 5000000}];
fund_reward({6, 27}) -> [{59040, 2}];
fund_reward({6, 28}) -> [{39039, 5}];
fund_reward({6, 29}) -> [{3, 5000000}];
fund_reward({6, 30}) -> [{59040, 2}];
fund_reward({7, 1}) -> [{59040, 5}];
fund_reward({7, 2}) -> [{3, 10000000}];
fund_reward({7, 3}) -> [{59041, 2}];
fund_reward({7, 4}) -> [{59040, 5}];
fund_reward({7, 5}) -> [{3, 10000000}];
fund_reward({7, 6}) -> [{59041, 2}];
fund_reward({7, 7}) -> [{59040, 5}];
fund_reward({7, 8}) -> [{3, 10000000}];
fund_reward({7, 9}) -> [{59041, 2}];
fund_reward({7, 10}) -> [{59040, 5}];
fund_reward({7, 11}) -> [{3, 10000000}];
fund_reward({7, 12}) -> [{59041, 2}];
fund_reward({7, 13}) -> [{59040, 5}];
fund_reward({7, 14}) -> [{3, 10000000}];
fund_reward({7, 15}) -> [{59041, 2}];
fund_reward({7, 16}) -> [{59040, 5}];
fund_reward({7, 17}) -> [{3, 10000000}];
fund_reward({7, 18}) -> [{59041, 2}];
fund_reward({7, 19}) -> [{59040, 5}];
fund_reward({7, 20}) -> [{3, 10000000}];
fund_reward({7, 21}) -> [{59041, 2}];
fund_reward({7, 22}) -> [{59040, 5}];
fund_reward({7, 23}) -> [{3, 10000000}];
fund_reward({7, 24}) -> [{59041, 2}];
fund_reward({7, 25}) -> [{59040, 5}];
fund_reward({7, 26}) -> [{3, 10000000}];
fund_reward({7, 27}) -> [{59041, 2}];
fund_reward({7, 28}) -> [{59040, 5}];
fund_reward({7, 29}) -> [{3, 10000000}];
fund_reward({7, 30}) -> [{59041, 2}];
fund_reward({8, 1}) -> [{59040, 5}];
fund_reward({8, 2}) -> [{3, 10000000}];
fund_reward({8, 3}) -> [{59041, 2}];
fund_reward({8, 4}) -> [{59040, 5}];
fund_reward({8, 5}) -> [{3, 10000000}];
fund_reward({8, 6}) -> [{59041, 2}];
fund_reward({8, 7}) -> [{59040, 5}];
fund_reward({8, 8}) -> [{3, 10000000}];
fund_reward({8, 9}) -> [{59041, 2}];
fund_reward({8, 10}) -> [{59040, 5}];
fund_reward({8, 11}) -> [{3, 10000000}];
fund_reward({8, 12}) -> [{59041, 2}];
fund_reward({8, 13}) -> [{59040, 5}];
fund_reward({8, 14}) -> [{3, 10000000}];
fund_reward({8, 15}) -> [{59041, 2}];
fund_reward({8, 16}) -> [{59040, 5}];
fund_reward({8, 17}) -> [{3, 10000000}];
fund_reward({8, 18}) -> [{59041, 2}];
fund_reward({8, 19}) -> [{59040, 5}];
fund_reward({8, 20}) -> [{3, 10000000}];
fund_reward({8, 21}) -> [{59041, 2}];
fund_reward({8, 22}) -> [{59040, 5}];
fund_reward({8, 23}) -> [{3, 10000000}];
fund_reward({8, 24}) -> [{59041, 2}];
fund_reward({8, 25}) -> [{59040, 5}];
fund_reward({8, 26}) -> [{3, 10000000}];
fund_reward({8, 27}) -> [{59041, 2}];
fund_reward({8, 28}) -> [{59040, 5}];
fund_reward({8, 29}) -> [{3, 10000000}];
fund_reward({8, 30}) -> [{59041, 2}];
fund_reward(_Info) ->
    logger:data_error("fund_reward_data_not_exist===>~w",
		      [_Info], month_fund_data, 285),
    undefined.

fund_name(101) -> <<"Quy Trung Dang">>;
fund_name(102) -> <<"Quy Thuong Dang">>;
fund_name(_Info) ->
    logger:data_error("fund_name_data_not_exist===>~w",
		      [_Info], month_fund_data, 289),
    undefined.

fund_val(101) -> 100000;
fund_val(102) -> 250000;
fund_val(_Info) ->
    logger:data_error("fund_val_data_not_exist===>~w",
		      [_Info], month_fund_data, 293),
    undefined.


