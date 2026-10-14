UPDATE_TRY_VERSION_MAX = 17
UPDATE_VERSION_MAX = 17
VerPath = {
["1"] = {name="gmryanrelease320180113184044m931529v1", size=113783},
["2"] = {name="gmryanrelease320180115125307m092050v2", size=610789},
["3"] = {name="gmryanrelease320180115131227m143788v3", size=4454169},
["4"] = {name="gmryanrelease320180115143032m828064v4", size=66442},
["5"] = {name="gmryanrelease320180115195325m138311v5", size=2502113},
["6"] = {name="gmryanrelease320180115215853m282985v6", size=977924},
["7"] = {name="gmryanrelease320180116114929m129406v7", size=715597},
["8"] = {name="gmryanrelease320180116125224m792476v8", size=3087181},
["9"] = {name="gmryanrelease320180116233903m403647v9", size=14833315},
["10"] = {name="gmryanrelease320180117022033m046245v10", size=744814},
["11"] = {name="gmryanrelease320180117023845m688502v11", size=6018},
["12"] = {name="gmryanrelease320180117040737m765657v12", size=31825},
["13"] = {name="gmryanrelease320180117041812m117914v13", size=2837},
["14"] = {name="gmryanrelease320180117204436m613532v14", size=527847},
["15"] = {name="gmryanrelease320180118204439m601872v15", size=3700446},
["16"] = {name="zsryanrelease320180411005819m345263v16", size=1361419},
["17"] = {name="zsryanrelease320180411013352m998843v17", size=177761},
}
VerMergePath = {
}
cc.FileUtils:getInstance():purgeCachedEntries()
MOVE_CREATE_BUILD = true
CDN_URL = "http://cdnres.huangxiang.shiyuegame.com" 
REG_URL = "http://register.huanxiang.shiyuegame.com" 
CDN_RES_URL = CDN_URL .. "/update/update_allres3"
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
    game_print("=======LoginView")
    LoginView.config1 = LoginView.config
    function LoginView:config()
        self:config1()
        local notice_tab = {"审批文号: 新广出审[2017]10057号"
        ,"出版物号: 出版ISBN:978-7-498-02852-5"
        ,"备案文号: 文网游备字〔2017〕Ｍ-SLG 0476号"
        ,"游戏著作权人: 上海其趣网络科技有限公司"
        ,"出版服务单位: 上海同济大学电子音像出版社有限公司"}
        for i=5, 1, -1 do
            desc = notice_tab[i]
            if desc ~= nil and desc ~= "" then
                local label = createLabel(18, 1, 2, 10, (display.getBottom(self) + 10)+(5-i)*22, desc, self, nil, cc.p(0, 0))
            end
        end
    end
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
end



CDN_PATH_BASE = CDN_URL.."/update/update_all/"
UPDATE_MODE_BY_INC = true
INC_VER_DOWNLOAD_PRO_MAX = 8

URL_PATH_ALL = {}
URL_PATH_ALL.other = { 
    update = CDN_URL.."/update/update_android_release3",
    register = REG_URL 
}
URL_PATH_ALL.get = function(platform)
    local data = URL_PATH_ALL[platform] or URL_PATH_ALL["other"]
    return data
end

function get_servers_url(account, platform, channelid, srvid, start, num)
    if TEST_APK then
        return string.format("http://cdn.demo.zsyz.shiyuegame.com/api/server_release3.php?account=%s&platform=%s&chanleId=%s&srvid=%s", register, account, platform, DEF_CHANNEL or 'release', srvid)
    end
    if TEST_REG then
        return string.format("http://register.yhdl.shiyuegame.com/index.php/server/lists2?account=%s&platform=%s&chanleId=%s&srvid=%s&start=%s&num=%s", account, platform, channelid or '', srvid or '', start or 0, num or 0)
    end
    if TEST_FLAG then
        return string.format("%s/index.php/server/lists2?account=%s&platform=%s&chanleId=%s&srvid=%s&start=%s&num=%s", URL_PATH.register, account, platform, channelid or '', srvid or '', start or 0, num or 0)
    end
    return string.format("%s/index.php/server/all2?account=%s&platform=%s&chanleId=%s&srvid=%s&start=%s&num=%s", URL_PATH.register, account, platform, channelid or '', srvid or '', start or 0, num or 0)
end

function get_notice_url(days, loginData)
	local host = REAL_LOGIN_DATA and REAL_LOGIN_DATA.host or loginData.host
    local channel = LoginPlatForm:getInstance():getChannel()
    return string.format("http://%s/api.php/local/local/notice/?channel=%s&time=%s", host, channel, os.time())
end

IS_CLIPPING_GAME = false
FINAL_SERVERS = {platform = 'release', zone_id = 2, name = GAME_NAME, host = 's2.release.huanxiang.shiyuegame.com', port = '9612', begin_time = 0}

