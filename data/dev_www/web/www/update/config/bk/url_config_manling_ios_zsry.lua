UPDATE_TRY_VERSION_MAX = 44
UPDATE_VERSION_MAX = 44
VerPath = {
["1"] = {name="yhdliomanling20171026011234m845556v1", size=13538330},
["2"] = {name="yhdliomanling20171030232419m516901v2", size=4355035},
["3"] = {name="yhdliomanling20171102231638m166763v3", size=12518723},
["4"] = {name="yhdliomanling20171104191221m416852v4", size=2374866},
["5"] = {name="yhdliomanling20171109233216m429600v5", size=12110733},
["6"] = {name="yhdliomanling20171110095255m030666v6", size=48469},
["7"] = {name="yhdliomanling20171115052557m063147v7", size=11268044},
["8"] = {name="yhdliomanling20171115072258m950843v8", size=17936},
["9"] = {name="yhdliomanling20171115204942m603239v9", size=155987},
["10"] = {name="yhdliomanling20171121225115m950671v10", size=18423750},
["11"] = {name="yhdliomanling20171128210422m496323v11", size=6740107},
["12"] = {name="yhdliomanling20171202155425m466036v12", size=452900},
["13"] = {name="yhdliomanling20171205221157m264834v13", size=4516348},
["14"] = {name="yhdliomanling20171211181618m550930v14", size=120228},
["15"] = {name="yhdliomanling20171217111237m099495v15", size=131201},
["16"] = {name="yhdliomanling20171220211117m952329v16", size=26955533},
["17"] = {name="yhdliomanling20171221075915m218344v17", size=4258959},
["18"] = {name="yhdliomanling20171221094913m720848v18", size=1820450},
["19"] = {name="yhdliomanling20171227104416m759944v19", size=466413},
["20"] = {name="yhdliomanling20180104201934m133284v20", size=161576},
["21"] = {name="yhdliomanling20180111212427m145033v21", size=127616},
["22"] = {name="yhdliomanling20180118172031m843175v22", size=128585},
["23"] = {name="yhdliomanling20180125190051m660193v23", size=96910453},
["24"] = {name="yhdliomanling20180126164756m407272v24", size=147152},
["25"] = {name="yhdliomanling20180202063228m312878v25", size=5420456},
["26"] = {name="yhdliomanling20180211193135m888241v26", size=9173754},
["27"] = {name="yhdliomanling20180227202532m404025v27", size=2540870},
["28"] = {name="yhdliomanling20180307141752m506665v28", size=5070473},
["29"] = {name="yhdliomanling20180314150646m326592v29", size=1690102},
["30"] = {name="yhdliomanling20180321152840m148260v30", size=4678786},
["31"] = {name="yhdliomanling20180328130617m455457v31", size=1578058},
["32"] = {name="yhdliomanling20180328215757m701758v32", size=70935},
["33"] = {name="yhdliomanling20180404094830m919398v33", size=439321},
["34"] = {name="yhdliomanling20180411210134m557233v34", size=333781},
["35"] = {name="yhdliomanling20180418135532m564922v35", size=7819809},
["36"] = {name="yhdliomanling20180418144749m805042v36", size=41659},
["37"] = {name="yhdliomanling20180420185233m408950v37", size=107849},
["38"] = {name="yhdliomanling20180423201207m137981v38", size=9540},
["39"] = {name="yhdliomanling20180426001240m027077v39", size=173293},
["40"] = {name="yhdliomanling20180427144737m672137v40", size=6167010},
["41"] = {name="yhdliomanling20180427184202m685188v41", size=193279},
["42"] = {name="yhdliomanling20180509212226m838615v42", size=245697},
["43"] = {name="yhdliomanling20180523211914m623658v43", size=172422},
["44"] = {name="yhdliomanling20180530100736m552050v44", size=35735},
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
CDN_RES_URL = CDN_URL .. "/update/update_allres"
CDN_RES_GY_URL = CDN_URL .. "/update/update_allres_sy2"
NEED_CHECK_CLOSE=true -- 客户端检查维护状态
RESOURCES_DOWNLOAD_PRO      = 3                    -- 用于边玩边下闲时下载进程数
RESOURCES_DOWNLOAD_PRO_MAX  = 5

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
    if ChatController then 
        function ChatController:getIsRealName()
            return self.is_real_name or 2
        end
    end

    if ActionZeroGiftView then
    	function ActionZeroGiftView:createItem( id )
		    if Config.DayBargainData.data_info[id] == nil then return end 
		    if id == 10 then
		        self.tips_again:setVisible(true)
		    else
		        self.tips_again:setVisible(false)
		    end
		    if self.item_list then
		        for k,v in pairs(self.item_list) do
		            if v and v["DeleteMe"] then
		                v:DeleteMe()
		            end
		        end
		    end
		    self.item_list = {}
			self.goods_scroll:removeAllChildren()
		    local item_effect_list = Config.DayBargainData.data_info[id].effect_list
		    for k,v in pairs(item_effect_list) do
		        self.item_effect_list[v[1]] = v[2]
		    end

			local render_list = Config.DayBargainData.data_info[id].award
		    if render_list then
		    	local sum = #render_list
		        local start_x = 52
		        local _y = (self.goods_scroll:getContentSize().height) * 0.5
		        local max_width = (sum) * ( 109) 
		        max_width = math.max( max_width , self.goods_scroll:getContentSize().width )
		        self.goods_scroll:setInnerContainerSize(cc.size(max_width, self.goods_scroll:getContentSize().height)) 

		    	for i=1,sum do
		    		local item = GoodsItem.New(self.goods_scroll)
		    		item:setData(Config.ItemData.data_get_data(render_list[i][1]))
		    		item:setNum(render_list[i][2])
		    		item:setAnchorPoint(cc.p(0,0.5))
		            if sum == 3 then
		                item:setPosition(68+(i - 1) * (86+25),_y)
		            else
		    		  item:setPosition( 15+(i - 1) * (86+25),_y)
		            end
		    		item:setScale(0.9)
		    		item:setDefaultTip()
		    		self.item_list[i] = item
		            if self.item_effect_list[render_list[i][1]] then
		                item:playOtherEffect()
		            end
		    	end
		    end

		    local return_award = Config.DayBargainData.data_info[id].return_award
		    local day = Config.DayBargainData.data_info[id].return_day
		    if day and return_award then
		        self.tips:setString(string.format(self.ctrl:getString("zero_gift_desc_1"),return_award[1][2],PathTool.getItemRes(Config.ItemData.data_get_data(return_award[1][1]).icon)))
		        self.count_label:setString(string.format(self.ctrl:getString("zero_gift_desc_2"),return_award[1][2]*day,PathTool.getItemRes(Config.ItemData.data_get_data(return_award[1][1]).icon)))
		    end

		        local time 
		        if self.data[id] then
		            time = self.data[id].time-GameNet:getInstance():getTime()
		            self.rest_time:setString(self.ctrl:getString("zero_rest_time"))
		            self.rest_time_val:setVisible(true)
		            self.reward_tips:setVisible(false)
		            self.rest_time_val:setString(TimeTool.GetTimeFormatDayIIIIII(time))
		             
		        end
		        if self.buy_data[id] then
		            self.rest_time_val:setVisible(false)
		            self.rest_time:setString(self.ctrl:getString("zero_award"))
		            self.reward_tips:setVisible(true)
		            self.reward_tips:setString(string.format(self.ctrl:getString("zero_gift_desc_3"),return_award[1][2],PathTool.getItemRes(Config.ItemData.data_get_data(return_award[1][1]).icon)))
		        end

		    if tableLen(self.buy_data) == 0 and tableLen(self.data) == 0 then
		        setChildUnEnabled(true,self.confirm_btn)
		        self.confirm_label:setString(self.ctrl:getString("zero_gift_desc_4"))
		        -- self.count_label:setString("0/0")
		        self.count:setString("0/0")
		    elseif self.buy_data and self.buy_data[30]==nil and self.data[30]==nil and self.cur_selected.id == 30 then
		        setChildUnEnabled(true,self.confirm_btn)
		        self.confirm_label:setString(self.ctrl:getString("zero_gift_desc_4"))
		        self.count:setString("0/0")
		    end

		    local money = Config.DayBargainData.data_info[id].charge_num
		    if money then
		        loadSpriteTexture(self.title,PathTool.getActionZeroGiftRes("txt_cn_zero_gift_title"..money), LOADTEXT_TYPE)        
		        local res = PathTool.getActionZeroGiftRes("action_zero"..money)
		        loadSpriteTexture(self.item_show,res, LOADTEXT_TYPE)
		        table.insert(self.res_list,res)
		    end

		    self:updateMessage(self.buy_data[self.cur_selected.id])
		end


		function ActionZeroGiftView:register_event()
			if self.close_btn then
		        self.close_btn:addTouchEventListener(function(sender, event_type) 
		            if event_type == ccui.TouchEventType.ended then
		               playCloseSound()
		                if self.ctrl:getLoginZeroRed() then
		                    self.ctrl:setLoginZeroRed(false)
		                    MainuiController:getInstance():setFunctionTipsStatus(MainuiController.icon.zero_gift, false)
		                end
		               self.ctrl:openActionZeroGiftView(false)
		            end
		        end)
		    end

		    if self.btn10 then
		    	self.btn10:addTouchEventListener(function ( sender, event_type )
		    		if event_type == ccui.TouchEventType.ended then
		               playButtonSound2()
		               self:changeTabBarIndex(sender.index)
		            end
		    	end)
		    end

		    if self.btn20 then
		    	self.btn20:addTouchEventListener(function ( sender, event_type )
		    		if event_type == ccui.TouchEventType.ended then
		               playButtonSound2()
		               self:changeTabBarIndex(sender.index)
		            end
		    	end)
		    end

		    if self.btn30 then
		        self.btn30:addTouchEventListener(function ( sender, event_type )
		            if event_type == ccui.TouchEventType.ended then
		               playButtonSound2()
		               self:changeTabBarIndex(sender.index)
		            end
		        end)
		    end

		    if self.btn40 then
		        self.btn40:addTouchEventListener(function ( sender, event_type )
		            if event_type == ccui.TouchEventType.ended then
		               playButtonSound2()
		               self:changeTabBarIndex(sender.index)
		            end
		        end)
		    end

		    if self.role_vo ~= nil then
		        if self.role_update_event == nil then
		            self.role_update_event = self.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function(key, value)
		                if key == "vip_lev" then
		                    self.can_buy_again = (self.role_vo.vip_lev >= Config.DayBargainData.data_const.vip_lev.val)
		                end
		            end)
		        end
		    end

		    if self.confirm_btn then
		    	self.confirm_btn:addTouchEventListener(function ( sender, event_type )
		    		if event_type == ccui.TouchEventType.ended then
		               playButtonSound2()
		                if self.cur_selected then
		                    if self.is_buy then
		                        print("=============self.cur_selected.id=====",self.cur_selected.id)
		                        if self.can_buy_again and #self.vip_list == 0 and self.data[10] and self.cur_selected.id == 10 and self.buy_data[10].status == 1 then
		                            local config = Config.ChargeData.data_charge_data[Config.DayBargainData.data_info[self.cur_selected.id].charge_id]
		                            if config then
		                                sdkOnPay(config.val,nil,config.id,config.name) 
		                            end
		                        elseif self.can_buy_again and #self.vip_list == 0 and self.data[10] and self.cur_selected.id == 10 and self.buy_data[10] ==nil then
		                            local config = Config.ChargeData.data_charge_data[Config.DayBargainData.data_info[self.cur_selected.id].charge_id]
		                            if config then
		                                sdkOnPay(config.val,nil,config.id,config.name) 
		                            end
		                        else
		                            self.ctrl:getBargainGift(self.cur_selected.id)
		                        end
		                    else
		                        if tableLen(self.data)==0 and tableLen(self.buy_data)==0 then --全部购买完领完
		                            message(self.ctrl:getString("zero_gift_alert"))
		                        elseif self.buy_data and self.buy_data[30]==nil and self.data[30]==nil and self.cur_selected.id == 30 then--领完了还没有购买第二次128
		                            message(self.ctrl:getString("zero_gift_alert"))
		                        else
		                            local config = Config.ChargeData.data_charge_data[Config.DayBargainData.data_info[self.cur_selected.id].charge_id]
		                            if config then
		                                sdkOnPay(config.val,nil,config.id,config.name) 
		                            end
		                        end
		                    end
		                end
		            end
		    	end)
		    end

		    if self.info_event == nil then
		        self.info_event = GlobalEvent:getInstance():Bind(ActionEvent.BARGAIN_INFO,function ( data )
		            Debug.info(data)
		            self.bargain_list = data.bargain_list
		            self.vip_list = data.vip_list
		            self.buy_list = data.bargain_buy_list
		            if data and data["bargain_list"] then
		                local show_list = {}
		                if  #data.bargain_list>0 then
		                    self.data = {}
		                    for k,v in pairs(data.bargain_list) do
		                        if self.ctrl:getLoginZeroRed() then
		                            self.btn_list[v.id].red_point:setVisible(true)
		                        end
		                        self.data[v.id] = v
		                        table.insert(show_list,v)
		                    end   
		                else
		                    self.data = {}               
		                end


		                if #data.bargain_buy_list>0 then
		                        self.buy_data = {}
		                        local count = 0
		                        for k,v in pairs(data.bargain_buy_list) do
		                            self.buy_data[v.id] = v
		                            table.insert(show_list,v)
		                        end
		                    self:setRedPoint(data.bargain_buy_list)
		                else
		                    self.buy_data = {}
		                end


		                --全部领完
		                if #data.bargain_list==0 and #data.bargain_buy_list==0 then
		                    self.data = {}
		                    self.buy_data = {}
		                    self.confirm_label:setString(self.ctrl:getString("zero_gift_desc_4"))
		                    self.btn_effect:setVisible(false)
		                    if Config.DayBargainData.data_info[self.index] then
		                        self.count:setString("(0/"..Config.DayBargainData.data_info[self.index].return_day..")")
		                    end
		                    setChildUnEnabled(true,self.confirm_btn)
		                    for k,v in pairs(self.btn_list) do
		                        v.red_point:setVisible(false)
		                    end
		                end

		                local sort_func = SortTools.tableLowerSorter({"id"})
		                table.sort(show_list, sort_func)
		                if show_list ~=nil and #show_list>0 then
		                    if self.cur_selected == nil then
		                        self:changeTabBarIndex(show_list[1].id)
		                    else
		                        local count = 0
		                        local len = #show_list
		                        for k,v in pairs(show_list) do
		                            if v.id ~= self.cur_selected.id then
		                                count = count+1
		                            end
		                            if count == len then
		                                self:changeTabBarIndex(show_list[1].id)
		                            else
		                                self:changeTabBarIndex(self.cur_selected.id)
		                            end
		                        end
		                        
		                    end
		                end
		                self:adjustTabPos(show_list)

		                
		            end
		        end)
		    end

		end

		function ActionZeroGiftView:updateMessage( data )
		    if data then
		        --已经买了
		        self.is_buy = true
		        local config = Config.DayBargainData.data_info[data.id]
		        local day = config.return_day
		        if self.is_buy and self.can_buy_again and #self.vip_list == 0 and data.id == 10 and self.data[10] and (data.status == 1 or self.buy_data[10]==nil) then
		            setChildUnEnabled(false,self.confirm_btn)
		            self.confirm_label:setString(self.ctrl:getString("direct_purchase_label_0"))
		            if config and data.end_day and data.status then
		                self.count:setString("("..data.end_day.."/"..day..")")
		            end
		            return
		        end
		        
		        if config and data.end_day and data.status then
		            
		            if data.id ~=10 then
		                self.count:setString("("..data.end_day.."/"..day..")")
		            else
		                if #self.vip_list >0 and self.data[10] then
		                    self.count:setString("("..data.end_day.."/14)")
		                else
		                    self.count:setString("("..data.end_day.."/"..day..")")
		                end
		            end
		            setChildUnEnabled(data.status==1,self.confirm_btn)
		            setChildUnEnabled(data.status==1,self.confirm_label)
		            if data.status ==1 then
		                self.confirm_label:setString(self.ctrl:getString("zero_gift_desc_4"))
		                self.btn_effect:setVisible(false)
		            elseif data.status == 0 then            
		                self.confirm_label:setString(self.ctrl:getString("can_get"))
		                self.btn_effect:setVisible(true)
		            end
		        end
		    else
		        --没买的
		        local config = Config.DayBargainData.data_info[self.cur_selected.id]
		        if config then
		            self.count:setString("("..config.return_day.."/"..config.return_day..")")
		        end
		        self.is_buy = false
		        --self.confirm_btn:setTitleText(self.ctrl:getString("direct_purchase_label_0"))
		        setChildUnEnabled(false,self.confirm_btn)
		        self.confirm_label:setString(self.ctrl:getString("direct_purchase_label_0"))
		        self.btn_effect:setVisible(false)
		    end
		end

		function ActionZeroGiftView:close_callback()
			if self.item_list then
				for k,v in pairs(self.item_list) do
					if v and v["DeleteMe"] then
						v:DeleteMe()
					end
				end
			end
		    self.item_list = nil

		    if self.info_event then
		        self.info_event = GlobalEvent:getInstance():UnBind(self.info_event)
		        self.info_event = nil
		    end

		    if self.role_vo ~= nil then
		        if self.role_update_event ~= nil then
		            self.role_vo:UnBind(self.role_update_event)
		            self.role_update_event = nil
		        end
		        self.role_vo = nil
		    end

		    if self.res_list then
		        for k,v in pairs(self.res_list) do
		            if v ~= "" then
		                display.removeImage(v)
		            end
		        end
		    end

			self:removeAllChildren()
		    local plist,prvCcz = PathTool.getTargetRes("action_zero_gift","actionzerogift",true)
		    display.removeSpriteFrames(plist, prvCcz)
		    self.ctrl:openActionZeroGiftView(false)
		end
    end
end




CDN_PATH_BASE = CDN_URL.."/update/update_all/"
USE_RMB_FEN = true
UPDATE_MODE_BY_INC = true
INC_VER_DOWNLOAD_PRO_MAX = 8

URL_PATH_ALL = {}
URL_PATH_ALL.other = { 
    update = CDN_URL.."/update/update_ios_manling",
    register = REG_URL 
}
URL_PATH_ALL.get = function(platform)
    if IS_VERIFYIOS then
        FINAL_CHANNEL = "verifyios"          -- 最终渠道
    end
    local data = URL_PATH_ALL[platform] or URL_PATH_ALL["other"]
    return data
end

function get_servers_url(account, platform, channelid, srvid, start, num)
    if IS_VERIFYIOS then
        platform = "verifyios"
        channelid = "verifyios"
    end
    return string.format("%s/index.php/server/lists2?account=%s&platform=%s&chanleId=%s&srvid=%s&start=%s&num=%s", URL_PATH.register, account, platform, channelid or '', srvid or '', start or 0, num or 0)
end

function get_notice_url(days, loginData)
	local host = REAL_LOGIN_DATA and REAL_LOGIN_DATA.host or loginData.host
    local channel = LoginPlatForm:getInstance():getChannel()
    return string.format("http://%s/api.php/local/local/notice/?channel=%s&time=%s", host, channel, os.time())
end


function PAY_ID_FUNC(id, money)
local list = {
    [3] = "zsrongy.6",
    [4] = "zsrongy.30",
    [20] = "zsrongy.68",
    [5] = "zsrongy.98",
    [21] = "zsrongy.128",
    [6] = "zsrongy.198",
    [7] = "zsrongy.328",
    [8] = "zsrongy.648",
    [1] = "zsrongy.yk30",
    [2] = "zsrongy.yk68",
    [100] = "zsrongy.lh88",
    [10] = "zsrongy.lh6",
    [11] = "zsrongy.lh12",
    [12] = "zsrongy.lh30",
    [13] = "zsrongy.lh45",
    [14] = "zsrongy.lh198",
    [15] = "zsrongy.lih30",
    [16] = "zsrongy.lh128",
    [17] = "zsrongy.98",
    [18] = "zsrongy.lh128",
    [19] = "zsrongy.lh1",
    [25] = "zsrongy.lh18",
    [26] = "zsrongy.lih128",
    [27] = "zsrongy.lh198",
    [28] = "zsrongy.lh328",
    [29] = "zsrongy.lh648",
    [150] = "zsrongy.lih12",
    [151] = "zsrongy.lih30",
    [152] = "zsrongy.lihe128",
    [153] = "zsrongy.lihe198",
    [154] = "zsrongy.lih328",
}
    return list[id] or string.format("zsrongy.%s", money)
end

SPECAIL_SCENE = true

-- 众神荣耀
-- -- if cc.GameDevice:callFunc("package_version",'',0,0,'') == "1.0.0" then
-- if BUILD_VERSION >= 1 then
--     UPDATE_SKIP = true
--     IS_VERIFYIOS = true
--     VERIFYIOS_SERVER_NAME = GAME_NAME
--     cc.FileUtils:getInstance():addSearchPath("res_verifyios", true)
-- end
-- function webFunc_GameStart()
--     if LoginController ~= nil then
--         local controller = LoginController:getInstance()
--         function controller:request10101Create(name, sex, career, platform)
--             local function send_create()
--                 local protocal = {}
--                 protocal.sex = sex or 0
--                 protocal.name = name or ""
--                protocal.career = career or 0
--                 protocal.playform = LoginPlatForm:getInstance():getChannel()
--                 self:SendProtocal(10101, protocal)
--             end
-- --            if CHANNEL_NAME == "mlios_zsry" then
--                 local msg = "您好，此应用暂时无法注册，请前往应用商店下载《彼方大陆》进入游戏。详细内容可咨询客服微信公众号：mlgame"
--                 CommonAlert.show(msg, self:getString("confirm"), function()
--                     sdkCallFunc("openUrl", "itms://itunes.apple.com/cn/app/%E5%BD%BC%E6%96%B9%E5%A4%A7%E9%99%86-%E5%A5%87%E8%BF%B9%E8%A7%89%E9%86%92/id1288444349?mt=8")
--                 end, nil, nil, CommonAlert.type.common, nil, nil, 22)
-- --            else
-- --                send_create()
-- --            end
--         end
--     end
-- end

