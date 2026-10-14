UPDATE_TRY_VERSION_MAX = 0
UPDATE_VERSION_MAX = 0
VerPath = {
}
VerMergePath = {
}
----------------------- 公共函数 ----------
-- CDN_URL = "http://cdnres.jstm.shiyuegame.com"
-- CDN_URL = "https://cdn.huanxiang.shiyue.cn"
cc.FileUtils:getInstance():purgeCachedEntries()
MOVE_CREATE_BUILD = true
CDN_URL = "http://127.0.0.1" 
REG_URL = "http://register.huanxiang.shiyuegame.com" 
CDN_RES_GY_URL = CDN_URL .. "/update/update_allres_gy"
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
    if BugPanel then
        function BugPanel:open_callback()
            local bg = self.root_wnd:getChildByName("bg")
            bg:setScale(display.getMaxScale())
            self.main_panel = self.root_wnd:getChildByName("main_panel")
            self.close_btn = self.main_panel:getChildByName("close_btn")

            self.ok_btn = self.main_panel:getChildByName("ok_btn")
            self.ok_btn:setTitleText(self.ctrl:getString("btn_notice"))
            self.ok_btn.label = self.ok_btn:getTitleRenderer()
            if self.ok_btn.label ~= nil then
                self.ok_btn.label:enableOutline(Config.ColorData.data_color4[80], 1)
            end

            for i=1,2 do 
                local btn = self.main_panel:getChildByName("tab_btn_"..i)
                local label = self.main_panel:getChildByName("tab_label_"..i)
                self.btn_list[i] = btn
                btn:setTouchEnabled(true)
                self.btn_list[i].index = i
                self.label_list[i] = label
                label:setString(self.ctrl:getString("tab_btn_"..i))
            end

            --各种文本
            local edit_box_title = self.main_panel:getChildByName("edit_box_title")
            edit_box_title:setString(self.ctrl:getString("edit_box_title"))
            local edit_box_content = self.main_panel:getChildByName("edit_box_content")
            edit_box_content:setString(self.ctrl:getString("edit_box_content"))

            local player_label = createLabel(20,Config.ColorData.data_color4[58],nil,55,420,self.ctrl:getString("bug_player_label"),self.main_panel,nil, cc.p(0,0))
            local desc_label = createRichLabel(20, Config.ColorData.data_color4[58], cc.p(0,0), cc.p(100,335), 6, nil, 580)
            self.main_panel:addChild(desc_label)
            local str =string.format("欢迎进驻《%s》如果您在游戏中发现BUG或游戏建议均可获得一定额度的<div fontcolor=#289b14>钻石奖励</div>。感谢您对游戏的支持，祝您游戏愉快！",GAME_NAME)
            -- if PLATFORM_NAME == "manling" or PLATFORM_NAME == "mlios" then 
            --     str =string.format(self.ctrl:getString("msg_bug_label_2"),GAME_NAME)
            -- end
            desc_label:setString(str)
            --创建输入框
            --标题输入框
            local res = PathTool.getResFrame("common2","common_alpha")
            self.edit_title = createEditBox(self.main_panel, res,cc.size(300,30), nil, 20, nil, 20, self.default_title_msg, nil, nil, LOADTEXT_TYPE_PLIST)
            self.edit_title:setAnchorPoint(cc.p(0,0))
            self.edit_title:setPlaceholderFontColor(Config.ColorData.data_color4[63])
            self.edit_title:setFontColor(Config.ColorData.data_color4[66])
            self.edit_title:setPosition(cc.p(320,285))
            self.edit_title:setMaxLength(40)

            self.label_content = createRichLabel(20, Config.ColorData.data_color4[66], cc.p(0,1), cc.p(320,280), 6, nil, 300)
            self.label_content:setString(self.default_content_msg)
            self.main_panel:addChild(self.label_content)
            --内容输入框
            self.edit_content = createEditBox(self.main_panel, res,cc.size(320,140), nil, 20, nil, 20, "", nil, nil, LOADTEXT_TYPE_PLIST)
            self.edit_content:setAnchorPoint(cc.p(0,1))
            self.edit_content:setPlaceholderFontColor(Config.ColorData.data_color4[63])
            self.edit_content:setFontColor(Config.ColorData.data_color4[66])
            self.edit_content:setPosition(cc.p(320,275))
            local function editBoxTextEventHandle(strEventName,pSender)
                if strEventName == "return" or strEventName == "ended" then
                    if self.begin_change_label then  
                        self.begin_change_label = false
                        self.label_content:setVisible(true)
                        local str = pSender:getText()
                        pSender:setText("")  
                        if str ~= "" and str ~= self.content_str then
                            self.content_str = str
                            self.label_content:setString(str)
                        end 
                    end
                elseif strEventName == "began" then
                    if not self.begin_change_label then
                        self.label_content:setVisible(false)
                        self.begin_change_label = true
                    end
                elseif strEventName == "changed" then

                end
            end
            self.edit_content:registerScriptEditBoxHandler(editBoxTextEventHandle)

            self:changeIndex(1)
        end
    end

    if PartnerCalculate then
        --找出星数一致的装备数量,返回数组，剔除了上锁的装备,改成用品质色
        function PartnerCalculate.getEquipArrayByStar(star)
            star = star or 1
            local equip_list = PartnerController:getInstance():getModel():getEquipList() or {}
            local equip_array = Array.New()

            for key,set_list in pairs(equip_list) do 
                if set_list and next(set_list) ~= nil then
                    for i ,info in pairs(set_list) do 
                        local item = Config.ItemData.data_get_data(info.base_id)
                        
                        if item.eqm_star == star and info.bind == 1 then 
                            equip_array:PushBack(info)
                        end
                    end
                end
            end
            return equip_array
        end
    end
    if PartnerCalculate then
        --找出星数一致的装备数量，被累加相应的价格，剔除了上锁的装备
        function PartnerCalculate.getEquipNumByStar(star)
            star = star or 1
            local equip_list = PartnerController:getInstance():getModel():getEquipList() or {}
            local num = 0
            local price = 0
            local wash_num = 0
            for key,set_list in pairs(equip_list) do 
                if set_list and next(set_list) ~= nil then
                    for i ,info in pairs(set_list) do 
                        local item = Config.ItemData.data_get_data(info.base_id)
                        
                        if item.eqm_star == star and info.bind ==1 then 
                            num = num +1
                            price = info.price +price
                            --洗练
                            if Config.PartnerEqmData.data_partner_sell[item.eqm_star] then
                                local config = Config.PartnerEqmData.data_partner_sell[item.eqm_star]
                                if config then
                                    for i,v in pairs(config) do
                                        if v and v.strength_lev and v.strength_lev == info.enchant then
                                            wash_num = wash_num + v.item_num
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            return num,price,wash_num
        end
    end

    if PartnerCalculate then
        --找出星数一致的装备数量,返回数组，剔除了上锁的装备,改成用品质色
        function PartnerCalculate.getEquipArrayByStar(star)
            star = star or 1
            local equip_list = PartnerController:getInstance():getModel():getEquipList() or {}
            local equip_array = Array.New()

            for key,set_list in pairs(equip_list) do 
                if set_list and next(set_list) ~= nil then
                    for i ,info in pairs(set_list) do 
                        local item = Config.ItemData.data_get_data(info.base_id)
                        
                        if item.eqm_star == star and info.bind == 1 then 
                            equip_array:PushBack(info)
                        end
                    end
                end
            end
            return equip_array
        end
    end
    if PartnerCalculate then
        --找出星数一致的装备数量，被累加相应的价格，剔除了上锁的装备
        function PartnerCalculate.getEquipNumByStar(star)
            star = star or 1
            local equip_list = PartnerController:getInstance():getModel():getEquipList() or {}
            local num = 0
            local price = 0
            local wash_num = 0
            for key,set_list in pairs(equip_list) do 
                if set_list and next(set_list) ~= nil then
                    for i ,info in pairs(set_list) do 
                        local item = Config.ItemData.data_get_data(info.base_id)
                        
                        if item.eqm_star == star and info.bind ==1 then 
                            num = num +1
                            price = info.price +price
                            --洗练
                            if Config.PartnerEqmData.data_partner_sell[item.eqm_star] then
                                local config = Config.PartnerEqmData.data_partner_sell[item.eqm_star]
                                if config then
                                    for i,v in pairs(config) do
                                        if v and v.strength_lev and v.strength_lev == info.enchant then
                                            wash_num = wash_num + v.item_num
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            return num,price,wash_num
        end
    end
end



CDN_PATH_BASE = CDN_URL.."/update/update_all/"

URL_PATH_ALL = {}
URL_PATH_ALL.other = { 
    update = CDN_URL.."/update/update_android_test",
    register = "http://cdn.demo.zsyz.shiyuegame.com" 
}
URL_PATH_ALL.get = function(platform)
    local data = URL_PATH_ALL[platform] or URL_PATH_ALL["other"]
    return data
end

function get_servers_url(account, platform, channelid, srvid, start, num)
    return string.format("%s/api/dev2.php?account=%s&platform=%s&chanleId=%s&srvid=%s", URL_PATH.register, account, platform, DEF_CHANNEL or 'dev', srvid)
end

function get_notice_url(days, loginData)
	local host = REAL_LOGIN_DATA and REAL_LOGIN_DATA.host or loginData.host
    local channel = LoginPlatForm:getInstance():getChannel()
    return string.format("http://%s/api.php/local/local/notice/?channel=%s&time=%s", host, channel, os.time())
end

