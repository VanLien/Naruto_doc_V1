-file("data/checkin_data.erl", 1).

-file("src/mod/data/checkin_data.erl", 1).

-module(checkin_data).

-lager_records([{m_energy, [ver, next_time, netx_type]},
		{checkin_data, [month, day, gain_reward, rewards]},
		{m_checkin, [ver, last_time, day, status]}]).

-export([get/1, get_type/0, get_energy/1, get_time/1,
	 get_expend/1, const/1]).

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

-file("src/mod/data/checkin_data.erl", 15).

-file("inc/checkin.hrl", 1).

-record(m_checkin,
	{ver = 1, last_time = 0, day = 0, status = 0}).

-record(checkin_data,
	{month = 0, day = 0, gain_reward = 1, rewards = []}).

-record(m_energy,
	{ver = 1, next_time = 0, netx_type = 0}).

-file("src/mod/data/checkin_data.erl", 16).

get({1, 1}) ->
    #checkin_data{month = 1, day = 1,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 2}) ->
    #checkin_data{month = 1, day = 2,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 3}) ->
    #checkin_data{month = 1, day = 3,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 4}) ->
    #checkin_data{month = 1, day = 4,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 5}) ->
    #checkin_data{month = 1, day = 5,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 6}) ->
    #checkin_data{month = 1, day = 6,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 7}) ->
    #checkin_data{month = 1, day = 7,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 8}) ->
    #checkin_data{month = 1, day = 8,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 9}) ->
    #checkin_data{month = 1, day = 9,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 10}) ->
    #checkin_data{month = 1, day = 10,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 11}) ->
    #checkin_data{month = 1, day = 11,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 12}) ->
    #checkin_data{month = 1, day = 12,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 13}) ->
    #checkin_data{month = 1, day = 13,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 14}) ->
    #checkin_data{month = 1, day = 14,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 15}) ->
    #checkin_data{month = 1, day = 15,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 16}) ->
    #checkin_data{month = 1, day = 16,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 17}) ->
    #checkin_data{month = 1, day = 17,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 18}) ->
    #checkin_data{month = 1, day = 18,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 19}) ->
    #checkin_data{month = 1, day = 19,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 20}) ->
    #checkin_data{month = 1, day = 20,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 21}) ->
    #checkin_data{month = 1, day = 21,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 22}) ->
    #checkin_data{month = 1, day = 22,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 23}) ->
    #checkin_data{month = 1, day = 23,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 24}) ->
    #checkin_data{month = 1, day = 24,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 25}) ->
    #checkin_data{month = 1, day = 25,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 26}) ->
    #checkin_data{month = 1, day = 26,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 27}) ->
    #checkin_data{month = 1, day = 27,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 28}) ->
    #checkin_data{month = 1, day = 28,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 29}) ->
    #checkin_data{month = 1, day = 29,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 30}) ->
    #checkin_data{month = 1, day = 30,
		  rewards = [{10090, 30}], gain_reward = 1};
get({1, 31}) ->
    #checkin_data{month = 1, day = 31,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 1}) ->
    #checkin_data{month = 2, day = 1,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 2}) ->
    #checkin_data{month = 2, day = 2,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 3}) ->
    #checkin_data{month = 2, day = 3,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 4}) ->
    #checkin_data{month = 2, day = 4,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 5}) ->
    #checkin_data{month = 2, day = 5,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 6}) ->
    #checkin_data{month = 2, day = 6,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 7}) ->
    #checkin_data{month = 2, day = 7,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 8}) ->
    #checkin_data{month = 2, day = 8,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 9}) ->
    #checkin_data{month = 2, day = 9,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 10}) ->
    #checkin_data{month = 2, day = 10,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 11}) ->
    #checkin_data{month = 2, day = 11,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 12}) ->
    #checkin_data{month = 2, day = 12,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 13}) ->
    #checkin_data{month = 2, day = 13,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 14}) ->
    #checkin_data{month = 2, day = 14,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 15}) ->
    #checkin_data{month = 2, day = 15,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 16}) ->
    #checkin_data{month = 2, day = 16,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 17}) ->
    #checkin_data{month = 2, day = 17,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 18}) ->
    #checkin_data{month = 2, day = 18,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 19}) ->
    #checkin_data{month = 2, day = 19,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 20}) ->
    #checkin_data{month = 2, day = 20,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 21}) ->
    #checkin_data{month = 2, day = 21,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 22}) ->
    #checkin_data{month = 2, day = 22,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 23}) ->
    #checkin_data{month = 2, day = 23,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 24}) ->
    #checkin_data{month = 2, day = 24,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 25}) ->
    #checkin_data{month = 2, day = 25,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 26}) ->
    #checkin_data{month = 2, day = 26,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 27}) ->
    #checkin_data{month = 2, day = 27,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 28}) ->
    #checkin_data{month = 2, day = 28,
		  rewards = [{10090, 30}], gain_reward = 1};
get({2, 29}) ->
    #checkin_data{month = 2, day = 29,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 1}) ->
    #checkin_data{month = 3, day = 1,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 2}) ->
    #checkin_data{month = 3, day = 2,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 3}) ->
    #checkin_data{month = 3, day = 3,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 4}) ->
    #checkin_data{month = 3, day = 4,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 5}) ->
    #checkin_data{month = 3, day = 5,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 6}) ->
    #checkin_data{month = 3, day = 6,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 7}) ->
    #checkin_data{month = 3, day = 7,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 8}) ->
    #checkin_data{month = 3, day = 8,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 9}) ->
    #checkin_data{month = 3, day = 9,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 10}) ->
    #checkin_data{month = 3, day = 10,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 11}) ->
    #checkin_data{month = 3, day = 11,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 12}) ->
    #checkin_data{month = 3, day = 12,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 13}) ->
    #checkin_data{month = 3, day = 13,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 14}) ->
    #checkin_data{month = 3, day = 14,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 15}) ->
    #checkin_data{month = 3, day = 15,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 16}) ->
    #checkin_data{month = 3, day = 16,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 17}) ->
    #checkin_data{month = 3, day = 17,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 18}) ->
    #checkin_data{month = 3, day = 18,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 19}) ->
    #checkin_data{month = 3, day = 19,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 20}) ->
    #checkin_data{month = 3, day = 20,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 21}) ->
    #checkin_data{month = 3, day = 21,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 22}) ->
    #checkin_data{month = 3, day = 22,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 23}) ->
    #checkin_data{month = 3, day = 23,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 24}) ->
    #checkin_data{month = 3, day = 24,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 25}) ->
    #checkin_data{month = 3, day = 25,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 26}) ->
    #checkin_data{month = 3, day = 26,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 27}) ->
    #checkin_data{month = 3, day = 27,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 28}) ->
    #checkin_data{month = 3, day = 28,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 29}) ->
    #checkin_data{month = 3, day = 29,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 30}) ->
    #checkin_data{month = 3, day = 30,
		  rewards = [{10090, 30}], gain_reward = 1};
get({3, 31}) ->
    #checkin_data{month = 3, day = 31,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 1}) ->
    #checkin_data{month = 4, day = 1,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 2}) ->
    #checkin_data{month = 4, day = 2,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 3}) ->
    #checkin_data{month = 4, day = 3,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 4}) ->
    #checkin_data{month = 4, day = 4,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 5}) ->
    #checkin_data{month = 4, day = 5,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 6}) ->
    #checkin_data{month = 4, day = 6,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 7}) ->
    #checkin_data{month = 4, day = 7,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 8}) ->
    #checkin_data{month = 4, day = 8,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 9}) ->
    #checkin_data{month = 4, day = 9,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 10}) ->
    #checkin_data{month = 4, day = 10,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 11}) ->
    #checkin_data{month = 4, day = 11,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 12}) ->
    #checkin_data{month = 4, day = 12,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 13}) ->
    #checkin_data{month = 4, day = 13,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 14}) ->
    #checkin_data{month = 4, day = 14,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 15}) ->
    #checkin_data{month = 4, day = 15,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 16}) ->
    #checkin_data{month = 4, day = 16,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 17}) ->
    #checkin_data{month = 4, day = 17,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 18}) ->
    #checkin_data{month = 4, day = 18,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 19}) ->
    #checkin_data{month = 4, day = 19,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 20}) ->
    #checkin_data{month = 4, day = 20,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 21}) ->
    #checkin_data{month = 4, day = 21,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 22}) ->
    #checkin_data{month = 4, day = 22,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 23}) ->
    #checkin_data{month = 4, day = 23,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 24}) ->
    #checkin_data{month = 4, day = 24,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 25}) ->
    #checkin_data{month = 4, day = 25,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 26}) ->
    #checkin_data{month = 4, day = 26,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 27}) ->
    #checkin_data{month = 4, day = 27,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 28}) ->
    #checkin_data{month = 4, day = 28,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 29}) ->
    #checkin_data{month = 4, day = 29,
		  rewards = [{10090, 30}], gain_reward = 1};
get({4, 30}) ->
    #checkin_data{month = 4, day = 30,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 1}) ->
    #checkin_data{month = 5, day = 1,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 2}) ->
    #checkin_data{month = 5, day = 2,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 3}) ->
    #checkin_data{month = 5, day = 3,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 4}) ->
    #checkin_data{month = 5, day = 4,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 5}) ->
    #checkin_data{month = 5, day = 5,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 6}) ->
    #checkin_data{month = 5, day = 6,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 7}) ->
    #checkin_data{month = 5, day = 7,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 8}) ->
    #checkin_data{month = 5, day = 8,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 9}) ->
    #checkin_data{month = 5, day = 9,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 10}) ->
    #checkin_data{month = 5, day = 10,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 11}) ->
    #checkin_data{month = 5, day = 11,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 12}) ->
    #checkin_data{month = 5, day = 12,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 13}) ->
    #checkin_data{month = 5, day = 13,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 14}) ->
    #checkin_data{month = 5, day = 14,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 15}) ->
    #checkin_data{month = 5, day = 15,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 16}) ->
    #checkin_data{month = 5, day = 16,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 17}) ->
    #checkin_data{month = 5, day = 17,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 18}) ->
    #checkin_data{month = 5, day = 18,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 19}) ->
    #checkin_data{month = 5, day = 19,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 20}) ->
    #checkin_data{month = 5, day = 20,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 21}) ->
    #checkin_data{month = 5, day = 21,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 22}) ->
    #checkin_data{month = 5, day = 22,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 23}) ->
    #checkin_data{month = 5, day = 23,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 24}) ->
    #checkin_data{month = 5, day = 24,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 25}) ->
    #checkin_data{month = 5, day = 25,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 26}) ->
    #checkin_data{month = 5, day = 26,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 27}) ->
    #checkin_data{month = 5, day = 27,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 28}) ->
    #checkin_data{month = 5, day = 28,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 29}) ->
    #checkin_data{month = 5, day = 29,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 30}) ->
    #checkin_data{month = 5, day = 30,
		  rewards = [{10090, 30}], gain_reward = 1};
get({5, 31}) ->
    #checkin_data{month = 5, day = 31,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 1}) ->
    #checkin_data{month = 6, day = 1,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 2}) ->
    #checkin_data{month = 6, day = 2,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 3}) ->
    #checkin_data{month = 6, day = 3,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 4}) ->
    #checkin_data{month = 6, day = 4,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 5}) ->
    #checkin_data{month = 6, day = 5,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 6}) ->
    #checkin_data{month = 6, day = 6,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 7}) ->
    #checkin_data{month = 6, day = 7,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 8}) ->
    #checkin_data{month = 6, day = 8,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 9}) ->
    #checkin_data{month = 6, day = 9,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 10}) ->
    #checkin_data{month = 6, day = 10,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 11}) ->
    #checkin_data{month = 6, day = 11,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 12}) ->
    #checkin_data{month = 6, day = 12,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 13}) ->
    #checkin_data{month = 6, day = 13,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 14}) ->
    #checkin_data{month = 6, day = 14,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 15}) ->
    #checkin_data{month = 6, day = 15,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 16}) ->
    #checkin_data{month = 6, day = 16,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 17}) ->
    #checkin_data{month = 6, day = 17,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 18}) ->
    #checkin_data{month = 6, day = 18,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 19}) ->
    #checkin_data{month = 6, day = 19,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 20}) ->
    #checkin_data{month = 6, day = 20,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 21}) ->
    #checkin_data{month = 6, day = 21,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 22}) ->
    #checkin_data{month = 6, day = 22,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 23}) ->
    #checkin_data{month = 6, day = 23,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 24}) ->
    #checkin_data{month = 6, day = 24,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 25}) ->
    #checkin_data{month = 6, day = 25,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 26}) ->
    #checkin_data{month = 6, day = 26,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 27}) ->
    #checkin_data{month = 6, day = 27,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 28}) ->
    #checkin_data{month = 6, day = 28,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 29}) ->
    #checkin_data{month = 6, day = 29,
		  rewards = [{10090, 30}], gain_reward = 1};
get({6, 30}) ->
    #checkin_data{month = 6, day = 30,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 1}) ->
    #checkin_data{month = 7, day = 1,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 2}) ->
    #checkin_data{month = 7, day = 2,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 3}) ->
    #checkin_data{month = 7, day = 3,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 4}) ->
    #checkin_data{month = 7, day = 4,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 5}) ->
    #checkin_data{month = 7, day = 5,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 6}) ->
    #checkin_data{month = 7, day = 6,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 7}) ->
    #checkin_data{month = 7, day = 7,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 8}) ->
    #checkin_data{month = 7, day = 8,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 9}) ->
    #checkin_data{month = 7, day = 9,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 10}) ->
    #checkin_data{month = 7, day = 10,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 11}) ->
    #checkin_data{month = 7, day = 11,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 12}) ->
    #checkin_data{month = 7, day = 12,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 13}) ->
    #checkin_data{month = 7, day = 13,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 14}) ->
    #checkin_data{month = 7, day = 14,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 15}) ->
    #checkin_data{month = 7, day = 15,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 16}) ->
    #checkin_data{month = 7, day = 16,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 17}) ->
    #checkin_data{month = 7, day = 17,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 18}) ->
    #checkin_data{month = 7, day = 18,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 19}) ->
    #checkin_data{month = 7, day = 19,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 20}) ->
    #checkin_data{month = 7, day = 20,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 21}) ->
    #checkin_data{month = 7, day = 21,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 22}) ->
    #checkin_data{month = 7, day = 22,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 23}) ->
    #checkin_data{month = 7, day = 23,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 24}) ->
    #checkin_data{month = 7, day = 24,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 25}) ->
    #checkin_data{month = 7, day = 25,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 26}) ->
    #checkin_data{month = 7, day = 26,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 27}) ->
    #checkin_data{month = 7, day = 27,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 28}) ->
    #checkin_data{month = 7, day = 28,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 29}) ->
    #checkin_data{month = 7, day = 29,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 30}) ->
    #checkin_data{month = 7, day = 30,
		  rewards = [{10090, 30}], gain_reward = 1};
get({7, 31}) ->
    #checkin_data{month = 7, day = 31,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 1}) ->
    #checkin_data{month = 8, day = 1,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 2}) ->
    #checkin_data{month = 8, day = 2,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 3}) ->
    #checkin_data{month = 8, day = 3,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 4}) ->
    #checkin_data{month = 8, day = 4,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 5}) ->
    #checkin_data{month = 8, day = 5,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 6}) ->
    #checkin_data{month = 8, day = 6,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 7}) ->
    #checkin_data{month = 8, day = 7,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 8}) ->
    #checkin_data{month = 8, day = 8,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 9}) ->
    #checkin_data{month = 8, day = 9,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 10}) ->
    #checkin_data{month = 8, day = 10,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 11}) ->
    #checkin_data{month = 8, day = 11,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 12}) ->
    #checkin_data{month = 8, day = 12,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 13}) ->
    #checkin_data{month = 8, day = 13,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 14}) ->
    #checkin_data{month = 8, day = 14,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 15}) ->
    #checkin_data{month = 8, day = 15,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 16}) ->
    #checkin_data{month = 8, day = 16,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 17}) ->
    #checkin_data{month = 8, day = 17,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 18}) ->
    #checkin_data{month = 8, day = 18,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 19}) ->
    #checkin_data{month = 8, day = 19,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 20}) ->
    #checkin_data{month = 8, day = 20,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 21}) ->
    #checkin_data{month = 8, day = 21,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 22}) ->
    #checkin_data{month = 8, day = 22,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 23}) ->
    #checkin_data{month = 8, day = 23,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 24}) ->
    #checkin_data{month = 8, day = 24,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 25}) ->
    #checkin_data{month = 8, day = 25,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 26}) ->
    #checkin_data{month = 8, day = 26,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 27}) ->
    #checkin_data{month = 8, day = 27,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 28}) ->
    #checkin_data{month = 8, day = 28,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 29}) ->
    #checkin_data{month = 8, day = 29,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 30}) ->
    #checkin_data{month = 8, day = 30,
		  rewards = [{10090, 30}], gain_reward = 1};
get({8, 31}) ->
    #checkin_data{month = 8, day = 31,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 1}) ->
    #checkin_data{month = 9, day = 1,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 2}) ->
    #checkin_data{month = 9, day = 2,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 3}) ->
    #checkin_data{month = 9, day = 3,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 4}) ->
    #checkin_data{month = 9, day = 4,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 5}) ->
    #checkin_data{month = 9, day = 5,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 6}) ->
    #checkin_data{month = 9, day = 6,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 7}) ->
    #checkin_data{month = 9, day = 7,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 8}) ->
    #checkin_data{month = 9, day = 8,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 9}) ->
    #checkin_data{month = 9, day = 9,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 10}) ->
    #checkin_data{month = 9, day = 10,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 11}) ->
    #checkin_data{month = 9, day = 11,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 12}) ->
    #checkin_data{month = 9, day = 12,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 13}) ->
    #checkin_data{month = 9, day = 13,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 14}) ->
    #checkin_data{month = 9, day = 14,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 15}) ->
    #checkin_data{month = 9, day = 15,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 16}) ->
    #checkin_data{month = 9, day = 16,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 17}) ->
    #checkin_data{month = 9, day = 17,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 18}) ->
    #checkin_data{month = 9, day = 18,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 19}) ->
    #checkin_data{month = 9, day = 19,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 20}) ->
    #checkin_data{month = 9, day = 20,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 21}) ->
    #checkin_data{month = 9, day = 21,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 22}) ->
    #checkin_data{month = 9, day = 22,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 23}) ->
    #checkin_data{month = 9, day = 23,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 24}) ->
    #checkin_data{month = 9, day = 24,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 25}) ->
    #checkin_data{month = 9, day = 25,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 26}) ->
    #checkin_data{month = 9, day = 26,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 27}) ->
    #checkin_data{month = 9, day = 27,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 28}) ->
    #checkin_data{month = 9, day = 28,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 29}) ->
    #checkin_data{month = 9, day = 29,
		  rewards = [{10090, 30}], gain_reward = 1};
get({9, 30}) ->
    #checkin_data{month = 9, day = 30,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 1}) ->
    #checkin_data{month = 10, day = 1,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 2}) ->
    #checkin_data{month = 10, day = 2,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 3}) ->
    #checkin_data{month = 10, day = 3,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 4}) ->
    #checkin_data{month = 10, day = 4,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 5}) ->
    #checkin_data{month = 10, day = 5,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 6}) ->
    #checkin_data{month = 10, day = 6,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 7}) ->
    #checkin_data{month = 10, day = 7,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 8}) ->
    #checkin_data{month = 10, day = 8,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 9}) ->
    #checkin_data{month = 10, day = 9,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 10}) ->
    #checkin_data{month = 10, day = 10,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 11}) ->
    #checkin_data{month = 10, day = 11,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 12}) ->
    #checkin_data{month = 10, day = 12,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 13}) ->
    #checkin_data{month = 10, day = 13,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 14}) ->
    #checkin_data{month = 10, day = 14,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 15}) ->
    #checkin_data{month = 10, day = 15,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 16}) ->
    #checkin_data{month = 10, day = 16,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 17}) ->
    #checkin_data{month = 10, day = 17,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 18}) ->
    #checkin_data{month = 10, day = 18,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 19}) ->
    #checkin_data{month = 10, day = 19,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 20}) ->
    #checkin_data{month = 10, day = 20,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 21}) ->
    #checkin_data{month = 10, day = 21,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 22}) ->
    #checkin_data{month = 10, day = 22,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 23}) ->
    #checkin_data{month = 10, day = 23,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 24}) ->
    #checkin_data{month = 10, day = 24,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 25}) ->
    #checkin_data{month = 10, day = 25,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 26}) ->
    #checkin_data{month = 10, day = 26,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 27}) ->
    #checkin_data{month = 10, day = 27,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 28}) ->
    #checkin_data{month = 10, day = 28,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 29}) ->
    #checkin_data{month = 10, day = 29,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 30}) ->
    #checkin_data{month = 10, day = 30,
		  rewards = [{10090, 30}], gain_reward = 1};
get({10, 31}) ->
    #checkin_data{month = 10, day = 31,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 1}) ->
    #checkin_data{month = 11, day = 1,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 2}) ->
    #checkin_data{month = 11, day = 2,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 3}) ->
    #checkin_data{month = 11, day = 3,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 4}) ->
    #checkin_data{month = 11, day = 4,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 5}) ->
    #checkin_data{month = 11, day = 5,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 6}) ->
    #checkin_data{month = 11, day = 6,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 7}) ->
    #checkin_data{month = 11, day = 7,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 8}) ->
    #checkin_data{month = 11, day = 8,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 9}) ->
    #checkin_data{month = 11, day = 9,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 10}) ->
    #checkin_data{month = 11, day = 10,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 11}) ->
    #checkin_data{month = 11, day = 11,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 12}) ->
    #checkin_data{month = 11, day = 12,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 13}) ->
    #checkin_data{month = 11, day = 13,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 14}) ->
    #checkin_data{month = 11, day = 14,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 15}) ->
    #checkin_data{month = 11, day = 15,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 16}) ->
    #checkin_data{month = 11, day = 16,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 17}) ->
    #checkin_data{month = 11, day = 17,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 18}) ->
    #checkin_data{month = 11, day = 18,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 19}) ->
    #checkin_data{month = 11, day = 19,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 20}) ->
    #checkin_data{month = 11, day = 20,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 21}) ->
    #checkin_data{month = 11, day = 21,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 22}) ->
    #checkin_data{month = 11, day = 22,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 23}) ->
    #checkin_data{month = 11, day = 23,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 24}) ->
    #checkin_data{month = 11, day = 24,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 25}) ->
    #checkin_data{month = 11, day = 25,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 26}) ->
    #checkin_data{month = 11, day = 26,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 27}) ->
    #checkin_data{month = 11, day = 27,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 28}) ->
    #checkin_data{month = 11, day = 28,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 29}) ->
    #checkin_data{month = 11, day = 29,
		  rewards = [{10090, 30}], gain_reward = 1};
get({11, 30}) ->
    #checkin_data{month = 11, day = 30,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 1}) ->
    #checkin_data{month = 12, day = 1,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 2}) ->
    #checkin_data{month = 12, day = 2,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 3}) ->
    #checkin_data{month = 12, day = 3,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 4}) ->
    #checkin_data{month = 12, day = 4,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 5}) ->
    #checkin_data{month = 12, day = 5,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 6}) ->
    #checkin_data{month = 12, day = 6,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 7}) ->
    #checkin_data{month = 12, day = 7,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 8}) ->
    #checkin_data{month = 12, day = 8,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 9}) ->
    #checkin_data{month = 12, day = 9,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 10}) ->
    #checkin_data{month = 12, day = 10,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 11}) ->
    #checkin_data{month = 12, day = 11,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 12}) ->
    #checkin_data{month = 12, day = 12,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 13}) ->
    #checkin_data{month = 12, day = 13,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 14}) ->
    #checkin_data{month = 12, day = 14,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 15}) ->
    #checkin_data{month = 12, day = 15,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 16}) ->
    #checkin_data{month = 12, day = 16,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 17}) ->
    #checkin_data{month = 12, day = 17,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 18}) ->
    #checkin_data{month = 12, day = 18,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 19}) ->
    #checkin_data{month = 12, day = 19,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 20}) ->
    #checkin_data{month = 12, day = 20,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 21}) ->
    #checkin_data{month = 12, day = 21,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 22}) ->
    #checkin_data{month = 12, day = 22,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 23}) ->
    #checkin_data{month = 12, day = 23,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 24}) ->
    #checkin_data{month = 12, day = 24,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 25}) ->
    #checkin_data{month = 12, day = 25,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 26}) ->
    #checkin_data{month = 12, day = 26,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 27}) ->
    #checkin_data{month = 12, day = 27,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 28}) ->
    #checkin_data{month = 12, day = 28,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 29}) ->
    #checkin_data{month = 12, day = 29,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 30}) ->
    #checkin_data{month = 12, day = 30,
		  rewards = [{10090, 30}], gain_reward = 1};
get({12, 31}) ->
    #checkin_data{month = 12, day = 31,
		  rewards = [{10090, 30}], gain_reward = 1};
get(_Info) ->
    logger:data_error("get_data_not_exist===>~w", [_Info],
		      checkin_data, 2579),
    undefined.

get_type() -> [].

get_energy(_Info) ->
    logger:data_error("get_energy_data_not_exist===>~w",
		      [_Info], checkin_data, 2584),
    undefined.

get_time(_Info) ->
    logger:data_error("get_time_data_not_exist===>~w",
		      [_Info], checkin_data, 2587),
    undefined.

get_expend(_Info) ->
    logger:data_error("get_expend_data_not_exist===>~w",
		      [_Info], checkin_data, 2590),
    undefined.

const(checkin_rules) -> 0;
const(_Info) ->
    logger:data_error("const_data_not_exist===>~w", [_Info],
		      checkin_data, 2593),
    undefined.


