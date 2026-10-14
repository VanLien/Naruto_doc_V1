UPDATE_TRY_VERSION_MAX = 53
UPDATE_VERSION_MAX = 53
VerPath = {
["1"] = {name="yhdliosy20170910050827m337489v1", size=34523110},
["2"] = {name="yhdliosy20170916075902m998284v2", size=20536885},
["3"] = {name="yhdliosy20170916100347m977364v3", size=319140},
["4"] = {name="yhdliosy20170916121001m442058v4", size=6717},
["5"] = {name="yhdliosy20170918104731m096583v5", size=1734948},
["6"] = {name="yhdliosy20170922212554m035523v6", size=3729027},
["7"] = {name="yhdliosy20170922214843m520537v7", size=7004},
["8"] = {name="yhdliosy20170927225612m526333v8", size=25355060},
["9"] = {name="yhdliosy20170928013203m169860v9", size=314988},
["10"] = {name="yhdliosy20170928222814m825128v10", size=5117883},
["11"] = {name="yhdliosy20170929112329m196972v11", size=67917},
["12"] = {name="yhdliosy20170929153022m231705v12", size=61169},
["13"] = {name="yhdliosy20170929225153m195778v13", size=5443376},
["14"] = {name="yhdliosy20170929233541m292403v14", size=24592},
["15"] = {name="yhdliosy20171013084426m775867v15", size=11243315},
["16"] = {name="yhdliosy20171014182218m772448v16", size=1618643},
["17"] = {name="yhdliosy20171019062151m828465v17", size=24228812},
["18"] = {name="yhdliosy20171019082412m027323v18", size=43023},
["19"] = {name="yhdliosy20171019211014m236657v19", size=2380164},
["20"] = {name="yhdliosy20171024223034m189063v20", size=252581},
["21"] = {name="yhdliosy20171025225441m381460v21", size=16134668},
["22"] = {name="yhdliosy20171026010416m304507v22", size=2904221},
["23"] = {name="yhdliosy20171030232304m438895v23", size=4355035},
["24"] = {name="yhdliosy20171102230436m174117v24", size=12518723},
["25"] = {name="yhdliosy20171104191044m158587v25", size=2374866},
["26"] = {name="yhdliosy20171104194807m464017v26", size=6413017},
["27"] = {name="yhdliosy20171106091513m359087v27", size=24609},
["28"] = {name="yhdliosy20171109233050m693309v28", size=9345778},
["29"] = {name="yhdliosy20171110094912m649781v29", size=48469},
["30"] = {name="yhdliosy20171115052447m217868v30", size=11268044},
["31"] = {name="yhdliosy20171115071751m930842v31", size=17936},
["32"] = {name="yhdliosy20171115204749m389305v32", size=155987},
["33"] = {name="yhdliosy20171121091211m973749v33", size=15151839},
["34"] = {name="yhdliosy20171121225241m487138v34", size=5203765},
["35"] = {name="yhdliosy20171128035317m322952v35", size=6533052},
["36"] = {name="yhdliosy20171128210209m200993v36", size=694537},
["37"] = {name="yhdliosy20171202155207m617486v37", size=452900},
["38"] = {name="yhdliosy20171205045906m882833v38", size=4346662},
["39"] = {name="yhdliosy20171205220824m457036v39", size=672215},
["40"] = {name="yhdliosy20171211181452m130648v40", size=120228},
["41"] = {name="yhdliosy20171214185417m439637v41", size=130941},
["42"] = {name="yhdliosy20171217111035m734566v42", size=29114},
["43"] = {name="yhdliosy20171220111741m522139v43", size=36243542},
["44"] = {name="yhdliosy20171220152734m705382v44", size=4031624},
["45"] = {name="yhdliosy20171220210941m280779v45", size=2360283},
["46"] = {name="yhdliosy20171221075450m263314v46", size=4258959},
["47"] = {name="yhdliosy20171221094751m280084v47", size=1820450},
["48"] = {name="yhdliosy20171227104551m147962v48", size=466413},
["49"] = {name="yhdliosy20180104200833m168497v49", size=161576},
["50"] = {name="yhdliosy20180111212241m210334v50", size=127616},
["51"] = {name="yhdliosy20180118172015m680232v51", size=128585},
["52"] = {name="yhdliosy20180211192815m962597v52", size=104733271},
["53"] = {name="yhdliosy20180523211722m836150v53", size=20233611},
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
    update = CDN_URL.."/update/update_ios_sy",
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

UPDATE_MODE_BY_INC = true
INC_VER_DOWNLOAD_PRO_MAX = 8


function PAY_ID_FUNC(id, money)
local list = {
    [1]='com.syzh.hx.30',
    [2]='com.syzh.hx.68',
    [3]='com.syzh.hx.6',
    [4]='com.syzh.hx1.30',
    [5]='com.syzh.hx.98',
    [6]='com.syzh.hx.198',
    [7]='com.syzh.hx.328',
    [8]='com.syzh.hx.648',
    [20]='com.syzh.hx1.68',
    [21]='com.syzh.hx.128',
    [100]='com.syzh.hx.88',
    [12]='com.syzh.hx2.30',
    [16]='com.syzh.hx1.128',
    [17]='com.syzh.hx1.98',
    [18]='com.syzh.hx2.128',
    [26]='com.syzh.hx3.128',
    [27]='com.syzh.hx1.198',
    [28]='com.syzh.hx1.328',
    [29]='com.syzh.hx1.648',
    [150]='com.syzh.hx.12',
    [151]='com.syzh.hx3.30',
    [152]='com.syzh.hx4.128',
    [153]='com.syzh.hx2.198',
    [154]='com.syzh.hx2.328',
}
    return list[id] or string.format("com.syzh.hx.%s", money)
end

-- 神印召唤
-- -- if cc.GameDevice:callFunc("package_version",'',0,0,'') == "1.0.0" then
if BUILD_VERSION >= 1 then
    UPDATE_SKIP = true
    IS_VERIFYIOS = true
    VERIFYIOS_SERVER_NAME = GAME_NAME
    cc.FileUtils:getInstance():addSearchPath("res_verifyios", true)
    FINAL_SERVERS = {platform = 'verifyios', zone_id = 2, name = GAME_NAME, host = 's2.verifyios.huanxiang.shiyuegame.com', port = '10002', begin_time = 0}
end
