UPDATE_TRY_VERSION_MAX = 100
UPDATE_VERSION_MAX = 0
if MAIN_VERSION < 102  then
return
end  
VerPath = {
  ["1"] = {name="assets1", size=1},
  ["2"] = {name="assets2", size=1},
  ["3"] = {name="assets3", size=1},
  ["4"] = {name="assets4", size=1},
  ["5"] = {name="assets5", size=1},
  ["6"] = {name="assets6", size=1},
  ["7"] = {name="assets7", size=1},
  ["8"] = {name="assets8", size=1},
  ["9"] = {name="assets9", size=1},
  ["10"] = {name="assets10", size=1},
  ["11"] = {name="assets11", size=1},
  ["12"] = {name="assets12", size=1},
  ["13"] = {name="assets13", size=1},
  ["14"] = {name="assets14", size=1},
  ["15"] = {name="assets15", size=1},
  ["16"] = {name="assets16", size=1},
  ["17"] = {name="assets17", size=1},
  ["18"] = {name="assets18", size=1},
  ["19"] = {name="assets19", size=1},
  ["20"] = {name="assets20", size=1},

}
VerMergePath = {
}
----------------------- 公共函数 ----------
CDN_URL = "http://180.93.52.88:86"

REG_URL = "http://180.93.52.88:81" 
DOWN_APK_URL = "http://180.93.52.88:82/index.php/ChannelBag/bag"

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
end


CDN_PATH_BASE = CDN_URL.."/update/update_ios/"
PLATFORM_NAME               = "symlf"
FINAL_CHANNEL               = "symlf"

SHOW_BAIDU_TIEBA            = false                  -- 是否显示百度贴吧
SHOW_SINGLE_INVICODE        = false                  -- 是否显示个人推荐码
SHOW_BIND_PHONE             = false                  -- 是否需要显示手机绑定界面
SHOW_WECHAT_CERTIFY         = false                  -- 是否显示微信公众号
SHOW_GAME_SHARE             = false                  -- 是否显示游戏分享
SHOW_GM=false
URL_PATH_ALL = {}
URL_PATH_ALL.other = { 
    update = CDN_URL.."/update/update_android_sszg",
    register = CDN_URL
--	register = REG_URL
}
URL_PATH_ALL.get = function(platform)
    local data = URL_PATH_ALL[platform] or URL_PATH_ALL["other"]
    return data
end




function get_servers_url(account, platform, channelid, srvid, start, num)

function sdkOnPay(money, buyNum, prodId, productName, productDesc)
    -- 游客模式下,且非认证的用户,调用充值,会弹出认证确认面板,如果游客模式允许跳过则不判断,个别渠道允许跳过
--    if NEED_CHECK_VISITIOR_STATUS and DO_NOT_REALNAME_STATUS and (not ALLOW_SKIP_RECHARGE) then 
--        OPEN_SDK_VISITIOR_WINDOW = true
--        callFunc("touristMode", "10")
    if 1 > 2 then 
	   callFunc("touristMode", "10")
    else
        local loginData = LoginController:getInstance():getModel():getLoginData()
        local roleVo = RoleController:getInstance():getRoleVo()
        if not roleVo then return end
--        local productId = string.format("%s.%s", callFunc("package_name"), prodId)
		local productId = string.format("%s",  prodId)
        if PAY_ID_FUNC then
            productId = PAY_ID_FUNC(prodId, money)
        elseif PAY_ID_NORMAL then
            productId = prodId
        end
        local config = Config.ChargeData.data_charge_data[prodId]
        if config and config.val ~= money then return end
        productName = productName or (money * 10)..TI18N("钻石")
        productDesc = productDesc or productName
        local price = money
        if USE_RMB_FEN then
            price = money * 100
        end
        buyNum = buyNum or 1
        local srvData = loginData
        local channel = LoginPlatForm:getInstance():getChannel()
        local gold = roleVo.gold
        local platform, serverId = unpack(Split(roleVo.srv_id, "_"))
        local serverName = srvData.srv_name
        local roleId = roleVo.rid
        local srv_id = roleVo.srv_id		
        local roleName = roleVo.name
        local roleLev = roleVo.lev
        local vip = "vip"..roleVo.vip_lev
        local ext = roleVo.rid.."$$"..platform.."$$"..serverId.."$$"..channel.."$$"..prodId.."$$"..productName
--        local host = "cdn.symlf.sszg.yangsugame.com"
		local host = srvData.host
        local account_id = account
		--local account_id = LoginController:getInstance():getUId()
		
        local info = table.concat({productId, productName, productDesc, price, buyNum, gold, serverId, serverName, roleId, roleName, roleLev, vip, ext, host, channel, account_id}, "#")
        -- 冰鸟的英灵勇士充值的特殊处理
        if IS_IOS_PLATFORM == true and not MAKELIFEBETTER and FINAL_CHANNEL == "bingniao_bnylys" and ICEBIRD_USERID then
				local str = string.format( TI18N("确定要充值吗?"),  roleName)
		        CommonAlert.show( str, TI18N("确定"), function()
			    iceBirdOnPay(productId, productName, productDesc, price, buyNum, gold, serverId, serverName, roleId, roleName, roleLev, vip, ext, host,srv_id,money,account_id)
    	        end, TI18N("取消"))
           -- iceBirdOnPay(productId, productName, productDesc, price, buyNum, gold, serverId, serverName, roleId, roleName, roleLev, vip, ext, host,srv_id,money,account_id)
			--RoleController:getInstance():requestThirdCharge(prodId, host, info,roleId,account_id ,srv_id)
        else
          --  local info = table.concat({productId, productName, productDesc, price, buyNum, gold, serverId, serverName, roleId, roleName, roleLev, vip, ext, host, channel, account_id}, "#")
            if (IS_IOS_PLATFORM == true and FINAL_CHANNEL == "syios_sszgzssx") or (FINAL_CHANNEL == "release2") then   -- 如果是正式包,可能存在第三方
                --RoleController:getInstance():requestThirdCharge(prodId, host, info,roleId,account_id,srv_id)
			    local str = string.format( TI18N("确定要充值吗?"),  roleName)
		        CommonAlert.show( str, TI18N("确定"), function()
			    iceBirdOnPay(productId, productName, productDesc, price, buyNum, gold, serverId, serverName, roleId, roleName, roleLev, vip, ext, host,srv_id,money,account_id)
    	        end, TI18N("取消"))
				--iceBirdOnPay(productId, productName, productDesc, price, buyNum, gold, serverId, serverName, roleId, roleName, roleLev, vip, ext, host,srv_id,money,account_id)
            else
                if IS_SY_DAN then
                    --sdkCallFunc("dan", info)
					--RoleController:getInstance():requestThirdCharge(prodId, host, info,roleId,account_id,srv_id)
				local str = string.format( TI18N("确定要充值吗?"),  roleName)
		        CommonAlert.show( str, TI18N("确定"), function()
			    iceBirdOnPay(productId, productName, productDesc, price, buyNum, gold, serverId, serverName, roleId, roleName, roleLev, vip, ext, host,srv_id,money,account_id)
    	        end, TI18N("取消"))
				--	iceBirdOnPay(productId, productName, productDesc, price, buyNum, gold, serverId, serverName, roleId, roleName, roleLev, vip, ext, host,srv_id,money,account_id)
                else
                   -- sdkCallFunc("pay", info)
					--RoleController:getInstance():requestThirdCharge(prodId, host, info,roleId,account_id,srv_id)
				--	iceBirdOnPay(productId, productName, productDesc, price, buyNum, gold, serverId, serverName, roleId, roleName, roleLev, vip, ext, host,srv_id,money,account_id)
								local str = string.format( TI18N("确定要充值吗?"),  roleName)
		        CommonAlert.show( str, TI18N("确定"), function()
			    iceBirdOnPay(productId, productName, productDesc, price, buyNum, gold, serverId, serverName, roleId, roleName, roleLev, vip, ext, host,srv_id,money,account_id)
    	        end, TI18N("取消"))
                end
            end
        end
    end
end
      --local srvid = roleVo.gold_acc
--  return string.format("%s/index.php/server/lists2?account=%s&platform=%s&chanleId=%s&srvid=%s&start=%s&num=%s", URL_PATH.register, account, platform, channelid or '', srvid or '', start or 0, num or 0)
  return string.format("%s/api/role.php?account=%s&platform=%s&chanleId=%s&srvid=%s", URL_PATH.register, account, platform, DEF_CHANNEL or 'symlf', srvid)
end

function get_notice_url(days, loginData)
	local host = REAL_LOGIN_DATA and REAL_LOGIN_DATA.host or loginData.host
    return string.format("http://180.93.52.88:79/gonggao.php", host, os.time())
end

require("cli_log")
