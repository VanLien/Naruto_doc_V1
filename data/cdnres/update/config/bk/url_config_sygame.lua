UPDATE_TRY_VERSION_MAX = 4
UPDATE_VERSION_MAX = 4
VerPath = {
["1"] = {name="gmryansygame20180117030150m740490v1", size=13393397},
["2"] = {name="gmryansygame20180117042056m057537v2", size=34640},
["3"] = {name="gmryansygame20180117220219m339496v3", size=527847},
["4"] = {name="gmryansygame20180118210010m170728v4", size=3700446},
}
VerMergePath = {
}
----------------------- 公共函数 ----------
-- CDN_URL = "http://cdnres.jstm.shiyuegame.com"
-- CDN_URL = "https://cdn.huanxiang.shiyue.cn"
cc.FileUtils:getInstance():purgeCachedEntries()
MOVE_CREATE_BUILD = true
CDN_URL = "http://cdnres.huangxiang.shiyuegame.com" 
REG_URL = "http://register.huanxiang.shiyuegame.com" 
CDN_RES_URL = CDN_URL .. "/update/update_allres4"
NEED_CHECK_CLOSE=true -- 客户端检查维护状态

-- --------------------------------------------------+
-- 非打包热更新处理
-- @author whjing2011@gmail.com
-- --------------------------------------------------*/

-- urlConfig加载完成调用 
function webFunc_urlConfigEnd()
end

-- 加载模块完成 初始化instance调用开始时调用 
function webFunc_initInstanceStart()
end

-- 加载模块完成 初始化instance调用完成时调用 
function webFunc_initInstanceEnd()
end

-- 游戏开时完毕时调用 
function webFunc_GameStart()
    Config.HolidayRandData.data_reward[1] = {id=1, base_id=81101, num=1, group=1, rand=25, l_can=0, is_notice=1, is_worth=1}
    Config.HolidayRandData.data_reward[11] = {id=11, base_id=81103, num=1, group=2, rand=50, l_can=5, is_notice=1, is_worth=1}
    Config.HolidayRandData.data_reward[21] = {id=21, base_id=81104, num=1, group=3, rand=25, l_can=5, is_notice=1, is_worth=1}

    Config.QuestData.data_get[34600] = {id=34600, name="巨龙巢穴", lev=12, group=52, layer=1, type=1, desc="完成巨龙巢穴任务", hide=0, auto_accept=1, commit_type=1, progress={{cli_label="evt_commit_quest",target=0,target_val=7,param={{'group',52,2}}}}, extra={}, commit_rewards={{record_name="gain",label="item_base_id",val={{10200,1,2}}},{record_name="gain",label="item_base_id",val={{10211,1,1}}},{record_name="gain",label="coin",val=20000},{record_name="gain",label="gold",val=80}}, res="quest_item_juqing", chapter_desc="勇士们，向着巨龙的巢穴前进吧，让恶龙见识一下勇士的魔法吧"}

    Config.DayGoalsData.data_growthtarget = {
        [7] = {{goal_id = 17010, day = 7, target_type = 1, type_name = "战力提升", desc = "总战力达到10000", progress = {{cli_label = "evt_power", target = 3, target_val = 1, param = {{'power', 10000}}}}, show_icon = "summon", award1 = {{2, 20}, {10, 1000}}, lev = 1},
            {goal_id = 17020, day = 7, target_type = 1, type_name = "战力提升", desc = "总战力达到30000", progress = {{cli_label = "evt_power", target = 3, target_val = 1, param = {{'power', 30000}}}}, show_icon = "summon", award1 = {{2, 20}, {10, 2000}}, lev = 1},
            {goal_id = 17030, day = 7, target_type = 1, type_name = "战力提升", desc = "总战力达到50000", progress = {{cli_label = "evt_power", target = 3, target_val = 1, param = {{'power', 50000}}}}, show_icon = "summon", award1 = {{2, 20}, {10, 5000}}, lev = 1},
            {goal_id = 17040, day = 7, target_type = 1, type_name = "战力提升", desc = "总战力达到100000", progress = {{cli_label = "evt_power", target = 3, target_val = 1, param = {{'power', 100000}}}}, show_icon = "summon", award1 = {{2, 20}, {10201, 1}}, lev = 1},
            {goal_id = 17050, day = 7, target_type = 1, type_name = "战力提升", desc = "总战力达到120000", progress = {{cli_label = "evt_power", target = 3, target_val = 1, param = {{'power', 120000}}}}, show_icon = "summon", award1 = {{2, 20}, {10201, 1}}, lev = 1},
            {goal_id = 17060, day = 7, target_type = 2, type_name = "联盟红包", desc = "联盟领取红包5次", progress = {{cli_label = "evt_guild_red_packet_reward", target = 0, target_val = 5, param = {}}}, show_icon = "guild_redbag", award1 = {{2, 20}, {10, 1000}}, lev = 17},
            {goal_id = 17070, day = 7, target_type = 2, type_name = "联盟红包", desc = "联盟领取红包8次", progress = {{cli_label = "evt_guild_red_packet_reward", target = 0, target_val = 8, param = {}}}, show_icon = "guild_redbag", award1 = {{2, 20}, {10, 1000}}, lev = 17},
            {goal_id = 17080, day = 7, target_type = 2, type_name = "联盟红包", desc = "联盟领取红包10次", progress = {{cli_label = "evt_guild_red_packet_reward", target = 0, target_val = 10, param = {}}}, show_icon = "guild_redbag", award1 = {{2, 20}, {10, 1000}}, lev = 17},
            {goal_id = 17090, day = 7, target_type = 2, type_name = "联盟红包", desc = "联盟领取红包15次", progress = {{cli_label = "evt_guild_red_packet_reward", target = 0, target_val = 15, param = {}}}, show_icon = "guild_redbag", award1 = {{2, 20}, {10, 1000}}, lev = 17},
            {goal_id = 17100, day = 7, target_type = 2, type_name = "联盟红包", desc = "联盟领取红包20次", progress = {{cli_label = "evt_guild_red_packet_reward", target = 0, target_val = 20, param = {}}}, show_icon = "guild_redbag", award1 = {{2, 20}, {10, 1000}}, lev = 17}
        },
        [6] = {{goal_id = 14080, day = 6, target_type = 1, type_name = "远征挑战", desc = "累计参与远征关卡30次", progress = {{cli_label = "evt_expedition", target = 0, target_val = 30, param = {}}}, show_icon = "expedition", award1 = {{30111, 2}, {2, 20}}, lev = 26},
            {goal_id = 14081, day = 6, target_type = 1, type_name = "远征挑战", desc = "累计参与远征关卡45次", progress = {{cli_label = "evt_expedition", target = 0, target_val = 45, param = {}}}, show_icon = "expedition", award1 = {{30111, 2}, {2, 20}}, lev = 26},
            {goal_id = 14090, day = 6, target_type = 1, type_name = "远征挑战", desc = "累计参与远征关卡60次", progress = {{cli_label = "evt_expedition", target = 0, target_val = 60, param = {}}}, show_icon = "expedition", award1 = {{30111, 2}, {2, 20}}, lev = 26},
            {goal_id = 14110, day = 6, target_type = 1, type_name = "远征挑战", desc = "消耗远征积分200", progress = {{cli_label = "evt_loss_expedition", target = 0, target_val = 200, param = {}}}, show_icon = "expedition_mall", award1 = {{10200, 1}, {2, 20}}, lev = 26},
            {goal_id = 14120, day = 6, target_type = 1, type_name = "远征挑战", desc = "消耗远征积分500", progress = {{cli_label = "evt_loss_expedition", target = 0, target_val = 500, param = {}}}, show_icon = "expedition_mall", award1 = {{10200, 1}, {2, 20}}, lev = 26},
            {goal_id = 14130, day = 6, target_type = 1, type_name = "远征挑战", desc = "消耗远征积分1000", progress = {{cli_label = "evt_loss_expedition", target = 0, target_val = 1000, param = {}}}, show_icon = "expedition_mall", award1 = {{10211, 1}, {2, 20}}, lev = 26},
            {goal_id = 14131, day = 6, target_type = 1, type_name = "远征挑战", desc = "消耗远征积分2000", progress = {{cli_label = "evt_loss_expedition", target = 0, target_val = 2000, param = {}}}, show_icon = "expedition_mall", award1 = {{30110, 3}, {2, 20}}, lev = 26},
            {goal_id = 15011, day = 6, target_type = 2, type_name = "段位对决", desc = "挑战24场段位赛", progress = {{cli_label = "evt_rank_match_fight", target = 0, target_val = 24, param = {}}}, show_icon = "rank_match_fight", award1 = {{2, 20}, {10, 1000}}, lev = 30},
            {goal_id = 15021, day = 6, target_type = 2, type_name = "段位对决", desc = "挑战30场段位赛", progress = {{cli_label = "evt_rank_match_fight", target = 0, target_val = 30, param = {}}}, show_icon = "rank_match_fight", award1 = {{2, 20}, {10, 1000}}, lev = 30},
            {goal_id = 15031, day = 6, target_type = 2, type_name = "段位对决", desc = "挑战36场段位赛", progress = {{cli_label = "evt_rank_match_fight", target = 0, target_val = 36, param = {}}}, show_icon = "rank_match_fight", award1 = {{2, 20}, {10, 1000}}, lev = 30},
            {goal_id = 15040, day = 6, target_type = 2, type_name = "段位对决", desc = "段位赛段位达到青铜", progress = {{cli_label = "evt_rank_match_rank", target = 2, target_val = 1, param = {}}}, show_icon = "rank_match_fight", award1 = {{2, 20}, {10, 1000}}, lev = 30},
            {goal_id = 15050, day = 6, target_type = 2, type_name = "段位对决", desc = "段位赛段位达到白银", progress = {{cli_label = "evt_rank_match_rank", target = 3, target_val = 1, param = {}}}, show_icon = "rank_match_fight", award1 = {{2, 30}, {10, 1500}}, lev = 30},
            {goal_id = 15060, day = 6, target_type = 2, type_name = "段位对决", desc = "段位赛段位达到黄金", progress = {{cli_label = "evt_rank_match_rank", target = 4, target_val = 1, param = {}}}, show_icon = "rank_match_fight", award1 = {{2, 50}, {10, 3000}}, lev = 30},
            {goal_id = 15070, day = 6, target_type = 2, type_name = "段位对决", desc = "段位赛段位达到铂金", progress = {{cli_label = "evt_rank_match_rank", target = 5, target_val = 1, param = {}}}, show_icon = "rank_match_fight", award1 = {{30110, 3}, {2, 100}}, lev = 30}
        },
        [5] = {{goal_id = 12011, day = 5, target_type = 1, type_name = "凤凰神殿", desc = "挑战6次凤凰神殿", progress = {{cli_label = "evt_dungeon_enter", target = 5, target_val = 6, param = {}}}, show_icon = "titan", award1 = {{2, 10}, {10, 1000}}, lev = 28},
            {goal_id = 12021, day = 5, target_type = 1, type_name = "凤凰神殿", desc = "挑战8次凤凰神殿", progress = {{cli_label = "evt_dungeon_enter", target = 5, target_val = 8, param = {}}}, show_icon = "titan", award1 = {{2, 20}, {10, 1000}}, lev = 28},
            {goal_id = 12032, day = 5, target_type = 1, type_name = "凤凰神殿", desc = "挑战10次凤凰神殿", progress = {{cli_label = "evt_dungeon_enter", target = 5, target_val = 10, param = {}}}, show_icon = "titan", award1 = {{2, 20}, {10, 1500}}, lev = 28},
            {goal_id = 12033, day = 5, target_type = 1, type_name = "凤凰神殿", desc = "挑战12次凤凰神殿", progress = {{cli_label = "evt_dungeon_enter", target = 5, target_val = 12, param = {}}}, show_icon = "titan", award1 = {{2, 30}, {10, 1500}}, lev = 28},
            {goal_id = 12040, day = 5, target_type = 1, type_name = "凤凰神殿", desc = "凤凰神殿累计伤害100000", progress = {{cli_label = "evt_titan", target = 0, target_val = 100000, param = {'dps'}}}, show_icon = "titan", award1 = {{2, 20}, {10, 1000}}, lev = 28},
            {goal_id = 12050, day = 5, target_type = 1, type_name = "凤凰神殿", desc = "凤凰神殿累计伤害200000", progress = {{cli_label = "evt_titan", target = 0, target_val = 200000, param = {'dps'}}}, show_icon = "titan", award1 = {{2, 50}, {10, 5000}}, lev = 28},
            {goal_id = 12060, day = 5, target_type = 1, type_name = "凤凰神殿", desc = "凤凰神殿累计伤害400000", progress = {{cli_label = "evt_titan", target = 0, target_val = 400000, param = {'dps'}}}, show_icon = "titan", award1 = {{2, 50}, {10, 5000}}, lev = 28},
            {goal_id = 12061, day = 5, target_type = 1, type_name = "凤凰神殿", desc = "凤凰神殿累计伤害800000", progress = {{cli_label = "evt_titan", target = 0, target_val = 800000, param = {'dps'}}}, show_icon = "titan", award1 = {{2, 50}, {10, 5000}}, lev = 28},
            {goal_id = 12062, day = 5, target_type = 1, type_name = "凤凰神殿", desc = "凤凰神殿累计伤害1500000", progress = {{cli_label = "evt_titan", target = 0, target_val = 1500000, param = {'dps'}}}, show_icon = "titan", award1 = {{2, 50}, {10, 5000}}, lev = 28},
            {goal_id = 12071, day = 5, target_type = 2, type_name = "龙之巢穴", desc = "挑战6次巨龙", progress = {{cli_label = "evt_dungeon_enter", target = 6, target_val = 6, param = {}}}, show_icon = "dragon", award1 = {{2, 10}, {10, 1000}}, lev = 24},
            {goal_id = 12081, day = 5, target_type = 2, type_name = "龙之巢穴", desc = "挑战8次巨龙", progress = {{cli_label = "evt_dungeon_enter", target = 6, target_val = 8, param = {}}}, show_icon = "dragon", award1 = {{2, 20}, {10, 1000}}, lev = 24},
            {goal_id = 12092, day = 5, target_type = 2, type_name = "龙之巢穴", desc = "挑战10次巨龙", progress = {{cli_label = "evt_dungeon_enter", target = 6, target_val = 10, param = {}}}, show_icon = "dragon", award1 = {{2, 20}, {10, 1500}}, lev = 24},
            {goal_id = 12093, day = 5, target_type = 2, type_name = "龙之巢穴", desc = "挑战12次巨龙", progress = {{cli_label = "evt_dungeon_enter", target = 6, target_val = 12, param = {}}}, show_icon = "dragon", award1 = {{2, 30}, {10, 1500}}, lev = 24},
            {goal_id = 12100, day = 5, target_type = 2, type_name = "龙之巢穴", desc = "通关冒险巨龙", progress = {{cli_label = "evt_dungeon_pass", target = 6, target_val = 1, param = {{'difficulty', 3}}}}, show_icon = "dragon", award1 = {{2, 100}, {10, 10000}}, lev = 24},
            {goal_id = 12110, day = 5, target_type = 2, type_name = "龙之巢穴", desc = "通关困难巨龙", progress = {{cli_label = "evt_dungeon_pass", target = 6, target_val = 1, param = {{'difficulty', 4}}}}, show_icon = "dragon", award1 = {{2, 100}, {10, 10000}}, lev = 24}
        },
        [4] = {{goal_id = 13061, day = 4, target_type = 1, type_name = "联盟发展", desc = "联盟许愿3次", progress = {{cli_label = "evt_guild_wish", target = 0, target_val = 3, param = {}}}, show_icon = "guild_wish", award1 = {{2, 20}, {10, 1000}}, lev = 17},
            {goal_id = 13072, day = 4, target_type = 1, type_name = "联盟发展", desc = "联盟许愿5次", progress = {{cli_label = "evt_guild_wish", target = 0, target_val = 5, param = {}}}, show_icon = "guild_wish", award1 = {{2, 20}, {10, 1000}}, lev = 17},
            {goal_id = 13073, day = 4, target_type = 1, type_name = "联盟发展", desc = "联盟许愿7次", progress = {{cli_label = "evt_guild_wish", target = 0, target_val = 7, param = {}}}, show_icon = "guild_wish", award1 = {{2, 20}, {10, 1000}}, lev = 17},
            {goal_id = 13080, day = 4, target_type = 1, type_name = "联盟发展", desc = "联盟碎片捐献5次", progress = {{cli_label = "evt_guild_wish_donate", target = 0, target_val = 5, param = {}}}, show_icon = "guild_wish", award1 = {{30111, 5}, {2, 20}}, lev = 17},
            {goal_id = 13090, day = 4, target_type = 1, type_name = "联盟发展", desc = "联盟碎片捐献10次", progress = {{cli_label = "evt_guild_wish_donate", target = 0, target_val = 10, param = {}}}, show_icon = "guild_wish", award1 = {{30111, 10}, {2, 20}}, lev = 17},
            {goal_id = 13100, day = 4, target_type = 1, type_name = "联盟发展", desc = "联盟高级捐献1次", progress = {{cli_label = "evt_guild_donate", target = 2, target_val = 1, param = {'type'}}}, show_icon = "guild_tech", award1 = {{2, 20}, {10, 1000}}, lev = 17},
            {goal_id = 13110, day = 4, target_type = 1, type_name = "联盟发展", desc = "联盟高级捐献3次", progress = {{cli_label = "evt_guild_donate", target = 2, target_val = 3, param = {'type'}}}, show_icon = "guild_tech", award1 = {{2, 20}, {10, 1000}}, lev = 17},
            {goal_id = 13120, day = 4, target_type = 1, type_name = "联盟发展", desc = "联盟至尊捐献3次", progress = {{cli_label = "evt_guild_donate", target = 3, target_val = 3, param = {'type'}}}, show_icon = "guild_tech", award1 = {{2, 150}, {10, 2000}}, lev = 17},
            {goal_id = 15080, day = 4, target_type = 2, type_name = "试炼塔", desc = "通关试练塔达到10层", progress = {{cli_label = "evt_dungeon_pass", target = 4, target_val = 1, param = {{'floor', 10}}}}, show_icon = "trial", award1 = {{2, 20}, {10, 1000}}, lev = 18},
            {goal_id = 15090, day = 4, target_type = 2, type_name = "试炼塔", desc = "通关试练塔达到20层", progress = {{cli_label = "evt_dungeon_pass", target = 4, target_val = 1, param = {{'floor', 20}}}}, show_icon = "trial", award1 = {{2, 20}, {10200, 1}}, lev = 18},
            {goal_id = 15100, day = 4, target_type = 2, type_name = "试炼塔", desc = "通关试练塔达到30层", progress = {{cli_label = "evt_dungeon_pass", target = 4, target_val = 1, param = {{'floor', 30}}}}, show_icon = "trial", award1 = {{2, 50}, {10200, 3}}, lev = 18},
            {goal_id = 15110, day = 4, target_type = 2, type_name = "试炼塔", desc = "通关试练塔达到35层", progress = {{cli_label = "evt_dungeon_pass", target = 4, target_val = 1, param = {{'floor', 35}}}}, show_icon = "trial", award1 = {{2, 80}, {10201, 1}}, lev = 18},
            {goal_id = 15120, day = 4, target_type = 2, type_name = "试炼塔", desc = "通关试练塔达到40层", progress = {{cli_label = "evt_dungeon_pass", target = 4, target_val = 1, param = {{'floor', 40}}}}, show_icon = "trial", award1 = {{2, 100}, {10211, 1}}, lev = 18}
        },
        [3] = {{goal_id = 16010, day = 3, target_type = 1, type_name = "装备强化", desc = "强化6件+9装备", progress = {{cli_label = "evt_eqm_enhance", target = 9, target_val = 6, param = {'lev_num'}}}, show_icon = "partner_jinjie", award1 = {{2, 20}, {10, 1000}}, lev = 1},
            {goal_id = 16020, day = 3, target_type = 1, type_name = "装备强化", desc = "强化12件+6装备", progress = {{cli_label = "evt_eqm_enhance", target = 6, target_val = 12, param = {'lev_num'}}}, show_icon = "partner_jinjie", award1 = {{2, 20}, {10, 2000}}, lev = 1},
            {goal_id = 16030, day = 3, target_type = 1, type_name = "装备强化", desc = "强化12件+9装备", progress = {{cli_label = "evt_eqm_enhance", target = 9, target_val = 12, param = {'lev_num'}}}, show_icon = "partner_jinjie", award1 = {{2, 20}, {10, 3000}}, lev = 1},
            {goal_id = 16040, day = 3, target_type = 1, type_name = "装备强化", desc = "强化18件+9装备", progress = {{cli_label = "evt_eqm_enhance", target = 9, target_val = 18, param = {'lev_num'}}}, show_icon = "partner_jinjie", award1 = {{2, 20}, {10, 4000}}, lev = 1},
            {goal_id = 16050, day = 3, target_type = 1, type_name = "装备强化", desc = "强化6件+12装备", progress = {{cli_label = "evt_eqm_enhance", target = 12, target_val = 6, param = {'lev_num'}}}, show_icon = "partner_jinjie", award1 = {{2, 50}, {10, 5000}}, lev = 1},
            {goal_id = 16060, day = 3, target_type = 2, type_name = "装备副本", desc = "累计参加10次装备副本", progress = {{cli_label = "evt_dungeon_enter", target = 1, target_val = 10, param = {}}}, show_icon = "zhuangbeifb", award1 = {{2, 20}, {10, 1000}}, lev = 25},
            {goal_id = 16070, day = 3, target_type = 2, type_name = "装备副本", desc = "累计参加20次装备副本", progress = {{cli_label = "evt_dungeon_enter", target = 1, target_val = 20, param = {}}}, show_icon = "zhuangbeifb", award1 = {{2, 20}, {10, 1000}}, lev = 25},
            {goal_id = 16080, day = 3, target_type = 2, type_name = "装备副本", desc = "累计参加30次装备副本", progress = {{cli_label = "evt_dungeon_enter", target = 1, target_val = 30, param = {}}}, show_icon = "zhuangbeifb", award1 = {{2, 20}, {10, 1000}}, lev = 25},
            {goal_id = 16090, day = 3, target_type = 2, type_name = "装备副本", desc = "累计参加40次装备副本", progress = {{cli_label = "evt_dungeon_enter", target = 1, target_val = 40, param = {}}}, show_icon = "zhuangbeifb", award1 = {{2, 40}, {10, 1000}}, lev = 25},
            {goal_id = 16091, day = 3, target_type = 2, type_name = "装备副本", desc = "累计参加60次装备副本", progress = {{cli_label = "evt_dungeon_enter", target = 1, target_val = 60, param = {}}}, show_icon = "zhuangbeifb", award1 = {{2, 40}, {10, 1000}}, lev = 25}
        },
        [2] = {{goal_id = 13010, day = 2, target_type = 1, type_name = "英雄提升", desc = "拥有6个2星英雄", progress = {{cli_label = "evt_partner", target = 0, target_val = 6, param = {{'star', 2}}}}, show_icon = "summon", award1 = {{30111, 2}, {10, 1000}}, lev = 1},
            {goal_id = 13020, day = 2, target_type = 1, type_name = "英雄提升", desc = "拥有8个2星英雄", progress = {{cli_label = "evt_partner", target = 0, target_val = 8, param = {{'star', 2}}}}, show_icon = "summon", award1 = {{30111, 3}, {10, 1000}}, lev = 1},
            {goal_id = 13030, day = 2, target_type = 1, type_name = "英雄提升", desc = "拥有4个3星英雄", progress = {{cli_label = "evt_partner", target = 0, target_val = 4, param = {{'star', 3}}}}, show_icon = "summon", award1 = {{30110, 2}, {10, 1000}}, lev = 1},
            {goal_id = 13040, day = 2, target_type = 1, type_name = "英雄提升", desc = "拥有6个3星英雄", progress = {{cli_label = "evt_partner", target = 0, target_val = 6, param = {{'star', 3}}}}, show_icon = "summon", award1 = {{30110, 3}, {10, 2000}}, lev = 1},
            {goal_id = 13050, day = 2, target_type = 1, type_name = "英雄提升", desc = "2个4星英雄", progress = {{cli_label = "evt_partner", target = 0, target_val = 2, param = {{'star', 4}}}}, show_icon = "partner_jinjie", award1 = {{30110, 3}, {10, 2000}}, lev = 1},
            {goal_id = 14010, day = 2, target_type = 2, type_name = "竞技风云", desc = "挑战10次竞技场", progress = {{cli_label = "evt_arena_fight", target = 0, target_val = 10, param = {}}}, show_icon = "arena", award1 = {{2, 20}, {10302, 5}}, lev = 16},
            {goal_id = 14020, day = 2, target_type = 2, type_name = "竞技风云", desc = "挑战20次竞技场", progress = {{cli_label = "evt_arena_fight", target = 0, target_val = 20, param = {}}}, show_icon = "arena", award1 = {{2, 20}, {10302, 5}}, lev = 16},
            {goal_id = 14030, day = 2, target_type = 2, type_name = "竞技风云", desc = "挑战30次竞技场", progress = {{cli_label = "evt_arena_fight", target = 0, target_val = 30, param = {}}}, show_icon = "arena", award1 = {{2, 20}, {10302, 5}}, lev = 16},
            {goal_id = 14040, day = 2, target_type = 2, type_name = "竞技风云", desc = "竞技场排名前500", progress = {{cli_label = "evt_arena_fight_result", target = 500, target_val = 1, param = {}}}, show_icon = "arena", award1 = {{2, 20}, {10200, 1}}, lev = 16},
            {goal_id = 14050, day = 2, target_type = 2, type_name = "竞技风云", desc = "竞技场排名前200", progress = {{cli_label = "evt_arena_fight_result", target = 200, target_val = 1, param = {}}}, show_icon = "arena", award1 = {{2, 30}, {10200, 2}}, lev = 16},
            {goal_id = 14060, day = 2, target_type = 2, type_name = "竞技风云", desc = "竞技场排名前50", progress = {{cli_label = "evt_arena_fight_result", target = 50, target_val = 1, param = {}}}, show_icon = "arena", award1 = {{2, 50}, {10200, 5}}, lev = 16},
            {goal_id = 14070, day = 2, target_type = 2, type_name = "竞技风云", desc = "竞技场排名前5", progress = {{cli_label = "evt_arena_fight_result", target = 5, target_val = 1, param = {}}}, show_icon = "arena", award1 = {{2, 200}, {10201, 1}}, lev = 16}
        },
        [1] = {{goal_id = 11010, day = 1, target_type = 1, type_name = "副本挑战", desc = "通关迷雾森林", progress = {{cli_label = "evt_dungeon_pass", target = 3, target_val = 1, param = {{'chapter', 10106}}}}, show_icon = "juqing", award1 = {{2, 20}, {10, 1000}}, lev = 1},
            {goal_id = 11020, day = 1, target_type = 1, type_name = "副本挑战", desc = "通关帕兰诺平原", progress = {{cli_label = "evt_dungeon_pass", target = 3, target_val = 1, param = {{'chapter', 10208}}}}, show_icon = "juqing", award1 = {{2, 20}, {10, 1000}}, lev = 1},
            {goal_id = 11030, day = 1, target_type = 1, type_name = "副本挑战", desc = "通关安格玛山脉", progress = {{cli_label = "evt_dungeon_pass", target = 3, target_val = 1, param = {{'chapter', 10308}}}}, show_icon = "juqing", award1 = {{2, 20}, {10, 1000}}, lev = 1},
            {goal_id = 11040, day = 1, target_type = 1, type_name = "副本挑战", desc = "通关图拉蒙神庙", progress = {{cli_label = "evt_dungeon_pass", target = 3, target_val = 1, param = {{'chapter', 10508}}}}, show_icon = "juqing", award1 = {{2, 20}, {10, 1000}}, lev = 1},
            {goal_id = 11050, day = 1, target_type = 1, type_name = "副本挑战", desc = "通关永歌森林", progress = {{cli_label = "evt_dungeon_pass", target = 3, target_val = 1, param = {{'chapter', 10608}}}}, show_icon = "juqing", award1 = {{2, 20}, {10, 1000}}, lev = 1},
            {goal_id = 11060, day = 1, target_type = 1, type_name = "副本挑战", desc = "通关地下地心峡谷", progress = {{cli_label = "evt_dungeon_pass", target = 3, target_val = 1, param = {{'chapter', 20305}}}}, show_icon = "juqing", award1 = {{2, 20}, {10, 1000}}, lev = 1},
            {goal_id = 11070, day = 1, target_type = 1, type_name = "副本挑战", desc = "通关地下宫殿禁地", progress = {{cli_label = "evt_dungeon_pass", target = 3, target_val = 1, param = {{'chapter', 20505}}}}, show_icon = "juqing", award1 = {{2, 20}, {10, 1000}}, lev = 1},
            {goal_id = 11080, day = 1, target_type = 1, type_name = "副本挑战", desc = "通关地下恶魔囚笼", progress = {{cli_label = "evt_dungeon_pass", target = 3, target_val = 1, param = {{'chapter', 20605}}}}, show_icon = "juqing", award1 = {{2, 20}, {10, 1000}}, lev = 1},
            {goal_id = 11090, day = 1, target_type = 2, type_name = "英雄提升", desc = "12个宝物进阶到蓝色", progress = {{cli_label = "evt_partner_upgrade_treasure", target = 0, target_val = 12, param = {{'quality', 3}}}}, show_icon = "partner_jinjie", award1 = {{30031, 6}, {10, 1000}}, lev = 1},
            {goal_id = 11100, day = 1, target_type = 2, type_name = "英雄提升", desc = "12个宝物进阶到蓝色+1", progress = {{cli_label = "evt_partner_upgrade_treasure", target = 0, target_val = 12, param = {{'quality', 4}}}}, show_icon = "partner_jinjie", award1 = {{30032, 6}, {10, 1000}}, lev = 1},
            {goal_id = 11110, day = 1, target_type = 2, type_name = "英雄提升", desc = "1个英雄进阶至蓝+1品质", progress = {{cli_label = "evt_partner", target = 0, target_val = 1, param = {{'quality', 4}}}}, show_icon = "partner_jinjie", award1 = {{30031, 4}, {10, 1000}}, lev = 1},
            {goal_id = 11120, day = 1, target_type = 2, type_name = "英雄提升", desc = "3个英雄进阶至蓝+1品质", progress = {{cli_label = "evt_partner", target = 0, target_val = 3, param = {{'quality', 4}}}}, show_icon = "partner_jinjie", award1 = {{30032, 4}, {10, 1000}}, lev = 1},
            {goal_id = 11130, day = 1, target_type = 2, type_name = "英雄提升", desc = "2个英雄进阶至蓝+2品质", progress = {{cli_label = "evt_partner", target = 0, target_val = 2, param = {{'quality', 5}}}}, show_icon = "partner_jinjie", award1 = {{30033, 4}, {10, 1000}}, lev = 1},
            {goal_id = 11140, day = 1, target_type = 2, type_name = "英雄提升", desc = "3个英雄进阶至蓝+2品质", progress = {{cli_label = "evt_partner", target = 0, target_val = 3, param = {{'quality', 5}}}}, show_icon = "partner_jinjie", award1 = {{30033, 4}, {10, 1000}}, lev = 1}
        }
    } 
    if BattleSceneNewView then
        function BattleSceneNewView:watchRecordPVPUI(fight_type,data)
            if HeroConst.isNeedRoleNameTitle(fight_type)
            or self.ctrl:getWatchReplayStatus()
            then
                local info = BattleController:getInstance():getModel():getEnemyInfo()
                if not self.pvp_info_view then
                    self.pvp_view_size = cc.size(SCREEN_WIDTH,100)
                    self.pvp_info_view = ccui.Widget:create()
                    self.pvp_info_view:setContentSize(self.pvp_view_size)
                    self.pvp_info_view:setAnchorPoint(cc.p(0,1))
                    --self.pvp_info_view:setScale(display.getMaxScale())
                    self.pvp_info_view:setPosition(display.getLeft(self), display.getTop(self))
                    self.pvp_info_view:setCascadeOpacityEnabled(true)
                    self.ui_main_layer:addChild(self.pvp_info_view)
                    local left_name_bg = createSprite(PathTool.getResFrame("battle", "battle_name_title"),535, 88, self.pvp_info_view, cc.p(1, 1))
                    local right_name_bg = createSprite(PathTool.getResFrame("battle", "battle_name_title"),940, 88,self.pvp_info_view, cc.p(1, 1))
                    local sp_left = createSprite(PathTool.getResFrame("battle", "battle_vs_title"),display.left + 358.5, self.pvp_view_size.height, self.pvp_info_view, cc.p(0, 1))
                    local sp_right = createSprite(PathTool.getResFrame("battle", "battle_vs_title"),665, self.pvp_view_size.height, self.pvp_info_view, cc.p(1, 1))
                    sp_right:setScaleX(-1)
                    local sp_left_lian = createSprite(PathTool.getResFrame("battle", "battle_vs_title_lian"),275, 70, sp_left, cc.p(1, 1))
                    local sp_right_lian = createSprite(PathTool.getResFrame("battle", "battle_vs_title_lian"),275,70, sp_right, cc.p(1, 1))
                    local sp_vs = createSprite(PathTool.getResFrame("battle", "battle_vs"),self.pvp_info_view:getContentSize().width/2 + 20,120, self.pvp_info_view, cc.p(0.5, 1))
                    sp_vs:setScale(0.5)
                    self.left_name = createLabel(18,Config.ColorData.data_color3[1],Config.ColorData.data_color3[9],left_name_bg:getContentSize().width/2,left_name_bg:getContentSize().height/2,data.actor_role_name,left_name_bg,2,cc.p(0.5,0.5))
                    self.right_name = createLabel(18,Config.ColorData.data_color3[1],Config.ColorData.data_color3[9],right_name_bg:getContentSize().width/2,right_name_bg:getContentSize().height/2,data.target_role_name,right_name_bg,2,cc.p(0.5,0.5))
                    if info then
                        self.right_name:setString(transformNameByServ(data.target_role_name,info.srv_id))	
                    end
                end
                if data then
                    if	HeroConst.isNeedChangeRoleNameTitle(fight_type) and not self.ctrl:getWatchReplayStatus() then
                        local rol_vo = RoleController:getInstance():getRoleVo()
                        if rol_vo.name ~= data.actor_role_name then
                            if info then
                                self.right_name:setString(transformNameByServ(data.actor_role_name,info.srv_id))
                            else
                                self.right_name:setString(data.actor_role_name)
                            end
                            self.left_name:setString(data.target_role_name)
                        else
                            self.right_name:setString(transformNameByServ(data.target_role_name,info.srv_id))
                            self.left_name:setString(data.actor_role_name)
                        end
                    end 
                end
            end
        end
    end

    if BattleModel then
        local battleModel = BattleController:getInstance():getModel()
        function battleModel:addBattleRole(data, combat_type, sceneID, current_wave, total_wave,is_next,is_spec_add)
            self.ready_wait = self.ready_wait + 1
            data.is_main_role = data.pos == self.battle_role_id
            local role = BattleRole.New(data, combat_type, sceneID, current_wave, total_wave)
            if not is_next and not is_spec_add and next(self.all_object or {}) ~= nil and self.all_object and self.all_object[role.pos]  then
                local delete_role  = self.all_object[role.pos]
                if delete_role then
                    if delete_role.tips_list then
                        delete_role.tips_list = {}
                    end
                    if delete_role.spine_renderer and not tolua.isnull(delete_role.spine_renderer.root) then
                        delete_role.spine_renderer:realrelease(true)
                        delete_role.spine_renderer:cleanAllBuffIcon(delete_role.buff_list)
                        SkillAct.clearAllEffect(role.spine_renderer)
                    end
                    self.all_object[role.pos] = nil
                end
            end
            if next(self.all_object or {}) ~= nil and self.all_object then
                self.all_object[role.pos] = role
            end
            --self:updataCurSkillData(data)
        end
        function battleModel:addRoleList(list, attacker)
            if nil == list or #list == 0 then return end
            if attacker then
            end
            self.is_not_special_born = true
            for index, v in ipairs(list or {}) do
                v.special_born = true
                if self.skill_cooldown_info[v.pos] == nil then --主要是召唤出来更新乙方技能
                    self.skill_cooldown_info[v.pos] = {}
                end 
                for i,v1 in ipairs(v.skills) do
                    table.insert(self.skill_cooldown_info[v.pos], v1)
                end
                local have_same = false
                for i = index + 1, #list do
                    if list[i].pos == v.pos then
                        have_same = true
                    end
                end
                if not have_same then
                    self:addBattleRole(v, self.fight_type,self.sceneID,self.fight_round,self.total_wave,false,false)
                end
            end
            list = {}       -- 列表置空，可能和多次剧情创建有关
        end
    end
end


CDN_PATH_BASE = CDN_URL.."/update/update_all/"

URL_PATH_ALL = {}
URL_PATH_ALL.other = { 
    update = CDN_URL.."/update/update_android_sygame",
    register = REG_URL 
}
URL_PATH_ALL.get = function(platform)
    local data = URL_PATH_ALL[platform] or URL_PATH_ALL["other"]
    return data
end

function get_servers_url(account, platform, channelid, srvid, start, num)
    return string.format("%s/index.php/server/lists2?account=%s&platform=%s&chanleId=%s&srvid=%s&start=%s&num=%s", URL_PATH.register, account, platform, channelid or '', srvid or '', start or 0, num or 0)
end

function get_notice_url(days, loginData)
	local host = REAL_LOGIN_DATA and REAL_LOGIN_DATA.host or loginData.host
    local channel = LoginPlatForm:getInstance():getChannel()
    return string.format("http://%s/api.php/local/local/notice/?channel=%s&time=%s", host, channel, os.time())
end

UPDATE_MODE_BY_INC = true
INC_VER_DOWNLOAD_PRO_MAX = 8
--IS_CLIPPING_GAME = true

