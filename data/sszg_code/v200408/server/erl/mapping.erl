-file("src/mapping.erl", 1).

-module(mapping).

-lager_records([]).

-export([parser_mod/1, module/2]).

-compile({inline, [{code, 2}]}).

-spec parser_mod(pos_integer()) -> {ok, atom()} |
				   {error, term()}.

parser_mod(Code) ->
    case module(game_server, Code) of
      {ok, _, _Caller, Parser, _Mod} -> {ok, Parser};
      _Err -> _Err
    end.

-spec module(Type, Cmd) -> {ok, NeedAuth, Caller,
			    Parser, ModName} |
			   {ok, Parser, ModName} | {error, Reason} when Type ::
									    game_server |
									    monitor |
									    tester,
									Cmd ::
									    pos_integer(),
									NeedAuth ::
									    boolean(),
									Caller ::
									    connector |
									    object,
									Parser ::
									    atom(),
									ModName ::
									    atom(),
									Reason ::
									    term().

module(Type, Cmd) -> code(Type, trunc(Cmd / 100)).

code(game_server, 11) ->
    {ok, false, connector, proto_11, conn_login_rpc};
code(game_server, 12) ->
    {ok, false, connector, proto_12, test_tcp_rpc};
code(game_server, 101) ->
    {ok, true, connector, proto_101, login_rpc};
code(game_server, 102) ->
    {ok, true, object, proto_102, map_rpc};
code(game_server, 103) ->
    {ok, true, object, proto_103, role_rpc};
code(game_server, 104) ->
    {ok, true, object, proto_104, quest_rpc};
code(game_server, 105) ->
    {ok, true, object, proto_105, item_rpc};
code(game_server, 108) ->
    {ok, true, object, proto_108, mail_rpc};
code(game_server, 109) ->
    {ok, true, object, proto_109, misc_rpc};
code(game_server, 110) ->
    {ok, true, object, proto_110, partner_rpc};
code(game_server, 111) ->
    {ok, true, object, proto_111, drama_rpc};
code(game_server, 112) ->
    {ok, true, object, proto_112, formation_rpc};
code(game_server, 113) ->
    {ok, true, object, proto_113, star_rpc};
code(game_server, 127) ->
    {ok, true, object, proto_127, say_rpc};
code(game_server, 129) ->
    {ok, true, object, proto_129, rank_rpc};
code(game_server, 130) ->
    {ok, true, object, proto_130, dungeon_rpc};
code(game_server, 133) ->
    {ok, true, object, proto_133, sns_rpc};
code(game_server, 134) ->
    {ok, true, object, proto_134, exchange_rpc};
code(game_server, 135) ->
    {ok, true, object, proto_135, guild_rpc};
code(game_server, 136) ->
    {ok, true, object, proto_136, day_goal_rpc};
code(game_server, 141) ->
    {ok, true, object, proto_141, checkin_rpc};
code(game_server, 164) ->
    {ok, true, object, proto_164, feat_rpc};
code(game_server, 166) ->
    {ok, true, object, proto_166, holiday_rpc};
code(game_server, 167) ->
    {ok, true, object, proto_167, vip_rpc};
code(game_server, 168) ->
    {ok, true, object, proto_168, misc_rpc};
code(game_server, 169) ->
    {ok, true, object, proto_169, guild_quest_rpc};
code(game_server, 198) ->
    {ok, true, object, proto_198, invite_code_rpc};
code(game_server, 199) ->
    {ok, true, object, proto_199, replay_hall_rpc};
code(game_server, 200) ->
    {ok, true, object, proto_200, combat_rpc};
code(game_server, 202) ->
    {ok, true, object, proto_202, arena_rpc};
code(game_server, 203) ->
    {ok, true, object, proto_203, activity_rpc};
code(game_server, 206) ->
    {ok, true, object, proto_206, adventure_rpc};
code(game_server, 207) ->
    {ok, true, object, proto_207, primus_rpc};
code(game_server, 210) ->
    {ok, true, object, proto_210, charge_rpc};
code(game_server, 211) ->
    {ok, true, object, proto_211, login_days_rpc};
code(game_server, 212) ->
    {ok, true, object, proto_212, lev_gift_rpc};
code(game_server, 213) ->
    {ok, true, object, proto_213, guild_dun_rpc};
code(game_server, 214) ->
    {ok, true, object, proto_214, zs_war_rpc};
code(game_server, 215) ->
    {ok, true, object, proto_215, avatar_rpc};
code(game_server, 221) ->
    {ok, true, object, proto_221, group_control_rpc};
code(game_server, 222) ->
    {ok, true, object, proto_222, halidom_rpc};
code(game_server, 227) ->
    {ok, true, object, proto_227, days_rank_rpc};
code(game_server, 231) ->
    {ok, true, object, proto_231, secret_dun_rpc};
code(game_server, 232) ->
    {ok, true, object, proto_232, recruit_rpc};
code(game_server, 233) ->
    {ok, true, object, proto_233, honor_rpc};
code(game_server, 234) ->
    {ok, true, object, proto_234, power_gift_rpc};
code(game_server, 235) ->
    {ok, true, object, proto_235, market_rpc};
code(game_server, 236) ->
    {ok, true, object, proto_236, convert_rpc};
code(game_server, 237) ->
    {ok, true, object, proto_237, guild_skill_rpc};
code(game_server, 238) ->
    {ok, true, object, proto_238, shipping_rpc};
code(game_server, 239) ->
    {ok, true, object, proto_239, endless_rpc};
code(game_server, 241) ->
    {ok, true, object, proto_241, hallows_rpc};
code(game_server, 242) ->
    {ok, true, object, proto_242, guild_war_rpc};
code(game_server, 243) ->
    {ok, true, object, proto_243, sky_ladder_rpc};
code(game_server, 245) ->
    {ok, true, object, proto_245, privilege_rpc};
code(game_server, 246) ->
    {ok, true, object, proto_246, questionnaire_rpc};
code(game_server, 247) ->
    {ok, true, object, proto_247, month_fund_rpc};
code(game_server, 248) ->
    {ok, true, object, proto_248, holiday_lanterm_rpc};
code(game_server, 249) ->
    {ok, true, object, proto_249, arena_elite_rpc};
code(game_server, 250) ->
    {ok, true, object, proto_250, element_temple_rpc};
code(game_server, 251) ->
    {ok, true, object, proto_251, welfare_rpc};
code(game_server, 252) ->
    {ok, true, object, proto_252, dungeon_heaven_rpc};
code(game_server, 253) ->
    {ok, true, object, proto_253, holiday_war_order_rpc};
code(game_server, 254) ->
    {ok, true, object, proto_254, holiday_boss_rpc};
code(game_server, 255) ->
    {ok, true, object, proto_255, holiday_holy_eqm_rpc};
code(game_server, 256) ->
    {ok, true, object, proto_256, arena_cluster_rpc};
code(game_server, 257) ->
    {ok, true, object, proto_257, holiday_snatch_rpc};
code(game_server, 258) ->
    {ok, true, object, proto_258, role_room_rpc};
code(game_server, 259) ->
    {ok, true, object, proto_259, holiday_return_rpc};
code(game_server, 260) ->
    {ok, true, object, proto_260, home_rpc};
code(game_server, 261) ->
    {ok, true, object, proto_261, home_pet_rpc};
code(game_server, 262) ->
    {ok, true, object, proto_262,
     arena_cluster_champion_rpc};
code(game_server, 263) ->
    {ok, true, object, proto_263,
     holiday_personal_gift_rpc};
code(game_server, 264) ->
    {ok, true, object, proto_264, resonate_rpc};
code(game_server, 265) ->
    {ok, true, object, proto_265, sprite_rpc};
code(game_server, 266) ->
    {ok, true, object, proto_266, holiday_skin_draw_rpc};
code(game_server, 267) ->
    {ok, true, object, proto_267, holiday_term_begins_rpc};
code(game_server, 268) ->
    {ok, true, object, proto_268, guild_secret_area_rpc};
code(game_server, 269) ->
    {ok, true, object, proto_269, guild_marketplace_rpc};
code(game_server, 270) ->
    {ok, true, object, proto_270, holiday_petard_rpc};
code(game_server, 271) ->
    {ok, true, object, proto_271, encounter_rpc};
code(game_server, 272) ->
    {ok, true, object, proto_272, arena_team_rpc};
code(game_server, 273) ->
    {ok, true, object, proto_273, holiday_merge_goal_rpc};
code(game_server, 274) ->
    {ok, true, object, proto_274, monopoly_maps_rpc};
code(game_server, 275) ->
    {ok, true, object, proto_275, monopoly_dungeons_rpc};
code(game_server, 276) ->
    {ok, true, object, proto_276, training_camp_rpc};
code(game_server, 277) ->
    {ok, true, object, proto_277, arena_peak_champion_rpc};
code(game_server, 278) ->
    {ok, true, object, proto_278, holiday_fire_gift_rpc};
code(game_server, 279) ->
    {ok, true, object, proto_279, holiday_return_new_rpc};
code(game_server, 280) ->
    {ok, true, object, proto_280,
     holiday_personal_fire_gift_rpc};
code(game_server, 281) ->
    {ok, true, object, proto_281,
     holiday_charge_rebate_rpc};
code(game_server, 282) ->
    {ok, true, object, proto_282, holiday_nian_rpc};
code(game_server, 283) ->
    {ok, true, object, proto_283,
     holiday_optional_lottery_rpc};
code(game_server, 284) ->
    {ok, true, object, proto_284, holiday_lucky_dog_rpc};
code(game_server, 285) ->
    {ok, true, object, proto_285, holiday_valentines_rpc};
code(game_server, 286) ->
    {ok, true, object, proto_286, planes_rpc};
code(game_server, 287) ->
    {ok, true, object, proto_287,
     holiday_new_war_order_rpc};
code(game_server, 288) ->
    {ok, true, object, proto_288,
     holiday_valentine_boss_rpc};
code(game_server, 289) ->
    {ok, true, object, proto_289, personal_push_gift_rpc};
code(game_server, 290) ->
    {ok, true, object, proto_290, holiday_arena_team_rpc};
code(game_server, 291) ->
    {ok, true, object, proto_291,
     holiday_practise_tower_rpc};
code(tester, 127) -> {ok, undefined, undefined};
code(tester, Code) ->
    {ok, _, _, ProtoMod, _} = code(game_server, Code),
    {ok, ProtoMod, test_rpc};
code(Type, Code) ->
    {error, {unknow_mapping, Type, Code}}.


