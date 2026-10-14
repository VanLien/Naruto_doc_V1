UPDATE_TRY_VERSION_MAX = 11
UPDATE_VERSION_MAX = 11
VerPath = {
["1"] = {name="gmryiorelease320180113184028m839087v1", size=586309},
["2"] = {name="gmryiorelease320180115161231m652466v2", size=7457427},
["3"] = {name="gmryiorelease320180115174959m896855v3", size=413861},
["4"] = {name="gmryiorelease320180115192747m107894v4", size=585197},
["5"] = {name="gmryiorelease320180115215924m011907v5", size=1269710},
["6"] = {name="gmryiorelease320180116115014m855034v6", size=837573},
["7"] = {name="gmryiorelease320180116125201m218551v7", size=3112166},
["8"] = {name="gmryiorelease320180116233814m912390v8", size=15339668},
["9"] = {name="gmryiorelease320180117022059m566239v9", size=853688},
["10"] = {name="gmryiorelease320180117023919m956527v10", size=5850},
["11"] = {name="gmryiorelease320180117204354m932469v11", size=726175},
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
end


CDN_PATH_BASE = CDN_URL.."/update/update_all/"
UPDATE_MODE_BY_INC = true
INC_VER_DOWNLOAD_PRO_MAX = 8

URL_PATH_ALL = {}
URL_PATH_ALL.other = { 
    update = CDN_URL.."/update/update_ios_release3",
    register = REG_URL 
}
URL_PATH_ALL.get = function(platform)
    local data = URL_PATH_ALL[platform] or URL_PATH_ALL["other"]
    return data
end

function get_servers_url(account, platform, channelid, srvid, start, num)
    return string.format("%s/index.php/server/all2?account=%s&platform=%s&chanleId=%s&srvid=%s&start=%s&num=%s", URL_PATH.register, account, platform, channelid or '', srvid or '', start or 0, num or 0)
end

function get_notice_url(days, loginData)
	local host = REAL_LOGIN_DATA and REAL_LOGIN_DATA.host or loginData.host
    local channel = LoginPlatForm:getInstance():getChannel()
    return string.format("http://%s/api.php/local/local/notice/?channel=%s&time=%s", host, channel, os.time())
end

