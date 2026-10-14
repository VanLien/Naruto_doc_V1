UPDATE_TRY_VERSION_MAX = 10
UPDATE_VERSION_MAX = 10
VerPath = {
["1"] = {name="yhdlanmltest20170914203454m762373v1", size=6974},
["2"] = {name="yhdlanmltest20170915153608m853244v2", size=21415},
["3"] = {name="yhdlanmltest20170918155422m580737v3", size=12233685},
["4"] = {name="yhdlanmltest20170919120257m464981v4", size=846076},
["5"] = {name="yhdlanmltest20170919204558m738087v5", size=268177},
["6"] = {name="yhdlanmltest20170920103320m703320v6", size=134012},
["7"] = {name="yhdlanmltest20170921121538m318858v7", size=17638},
["8"] = {name="zsryanmltest20180111011039m586817v8", size=31648526},
["9"] = {name="zsryanmltest20180111205846m702221v9", size=43883},
["10"] = {name="zsryanmltest20180411020728m757621v10", size=1197133},
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
    function sdkOnPay(money, buyNum, prodId, productName, productDesc)
        message("充值接口暂时关闭")
    end
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
    update = CDN_URL.."/update/update_android_mltest",
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

