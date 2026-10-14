UPDATE_TRY_VERSION_MAX = 32
UPDATE_VERSION_MAX = 32
VerPath = {
["1"] = {name="yhdliosygame20180122153826m428866v1", size=16737546},
["2"] = {name="yhdliosygame20180122200817m020271v2", size=35276},
["3"] = {name="yhdliosygame20180125190239m498116v3", size=6384526},
["4"] = {name="yhdliosygame20180126165027m432907v4", size=147152},
["5"] = {name="yhdliosygame20180130105409m123601v5", size=30253},
["6"] = {name="yhdliosygame20180130111622m629367v6", size=33401},
["7"] = {name="yhdliosygame20180202061022m624864v7", size=5387077},
["8"] = {name="yhdliosygame20180211154510m593238v8", size=9173737},
["9"] = {name="yhdliosygame20180211170340m974890v9", size=4622},
["10"] = {name="yhdliosygame20180227095500m010179v10", size=2339373},
["11"] = {name="yhdliosygame20180227202621m329929v11", size=287346},
["12"] = {name="yhdliosygame20180307091755m065297v12", size=5070473},
["13"] = {name="yhdliosygame20180313221403m979562v13", size=1690102},
["14"] = {name="yhdliosygame20180320210317m898233v14", size=4660224},
["15"] = {name="yhdliosygame20180321152900m738794v15", size=75010},
["16"] = {name="yhdliosygame20180327215425m683208v16", size=1576505},
["17"] = {name="yhdliosygame20180328130128m216201v17", size=1575},
["18"] = {name="yhdliosygame20180328215819m520590v18", size=70935},
["19"] = {name="yhdliosygame20180403212142m020892v19", size=439321},
["20"] = {name="yhdliosygame20180411210006m578201v20", size=333781},
["21"] = {name="yhdliosygame20180418093527m221612v21", size=7819809},
["22"] = {name="yhdliosygame20180418144803m544175v22", size=41659},
["23"] = {name="yhdliosygame20180420185319m235605v23", size=107849},
["24"] = {name="yhdliosygame20180423201316m884574v24", size=9540},
["25"] = {name="yhdliosygame20180426000327m716237v25", size=173293},
["26"] = {name="yhdliosygame20180427104147m050961v26", size=5528406},
["27"] = {name="yhdliosygame20180427115923m370338v27", size=701996},
["28"] = {name="yhdliosygame20180427184035m716917v28", size=193279},
["29"] = {name="yhdliosygame20180509212054m269543v29", size=245697},
["30"] = {name="yhdliosygame20180523212003m498802v30", size=172422},
["31"] = {name="yhdliosygame20180530100544m676570v31", size=35735},
["32"] = {name="yhdliosygame20180709185914m430187v32", size=154484},
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

URL_PATH_ALL = {}
URL_PATH_ALL.other = { 
    update = CDN_URL.."/update/update_ios_sygame",
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

USE_RMB_FEN = false
UPDATE_MODE_BY_INC = true
INC_VER_DOWNLOAD_PRO_MAX = 8


function PAY_ID_FUNC(id, money)
local list = {
    [3]='com.gmry.hx.6',
    [150]='com.gmry.hx.12',
    [1]='com.gmry.hx.30',
    [4]='com.gmry.hx1.30',
    [2]='com.gmry.hx.68',
    [20]='com.gmry.hx1.68',
    [100]='com.gmry.hx.88',
    [5]='com.gmry.hx.98',
    [21]='com.gmry.hx.128',
    [6]='com.gmry.hx.198',
    [7]='com.gmry.hx.328',
    [8]='com.gmry.hx.648',
    [12]='com.gmry.hx2.30',
    [16]='com.gmry.hx2.128',
    [17]='com.gmry.hx2.98',
    [18]='com.gmry.hx3.128',
    [26]='com.gmry.hx4.128',
    [27]='com.gmry.hx2.198',
    [28]='com.gmry.hx2.328',
    [29]='com.gmry.hx2.648',
    [151]='com.gmry.hx3.30',
    [152]='com.gmry.hx5.128',
    [153]='com.gmry.hx3.198',
    [154]='com.gmry.hx3.328',
}
    return list[id] or string.format("com.gmry.hx.%s", money)
end

-- 光明荣耀
-- -- if cc.GameDevice:callFunc("package_version",'',0,0,'') == "1.0.0" then
-- if BUILD_VERSION >= 5 then
--     UPDATE_SKIP = true
--     IS_VERIFYIOS = true
--     VERIFYIOS_SERVER_NAME = GAME_NAME
--     USE_VERIFYIOS_SCENE = false
--     cc.FileUtils:getInstance():addSearchPath("res_verifyios", true)
--     FINAL_SERVERS = {platform = 'verifyios', zone_id = 3, name = GAME_NAME, host = 's3.verifyios.huanxiang.shiyuegame.com', port = '10003', begin_time = 0}
--     IS_NEED_REAL_NAME = false
-- end
