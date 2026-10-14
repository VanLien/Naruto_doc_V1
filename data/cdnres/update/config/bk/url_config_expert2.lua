UPDATE_TRY_VERSION_MAX = 0
UPDATE_VERSION_MAX = 0
VerPath = {
}
VerMergePath = {
}
----------------------- 公共函数 ----------
-- CDN_URL = "http://cdnres.jstm.shiyuegame.com"
CDN_URL = "https://cdn.jstm.ewan.cn"

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
PartnerCallView.createRootWnd_bak = PartnerCallView.createRootWnd
function PartnerCallView:createRootWnd()
   self:createRootWnd_bak()
   local items = self.root_wnd:getChildren()
   local i = #items
   local item = items[i]
   item:setString("1.低级召唤和高级召唤每日限制10次\n2.各级召唤概率如下：\n低级召唤：英雄概率40%，英雄碎片概率30%，材料概率30%\n高级召唤：英雄概率30%，英雄碎片概率70%")
end
end

CDN_URL="http://cdn.demo.zsyz.shiyuegame.com"
CDN_PATH_BASE = CDN_URL.."/update/update_all/"

URL_PATH_ALL = {}
URL_PATH_ALL.other = { 
    update = CDN_URL.."/update/update_android_expert",
    register = CDN_URL 
}
URL_PATH_ALL.get = function(platform)
    local data = URL_PATH_ALL[platform] or URL_PATH_ALL["other"]
    return data
end

function get_servers_url(account, platform, channelid, srvid, start, num)
    return string.format("%s/update/update_android_expert2/servers.php?account=%s&platform=%s&chanleId=%s&srvid=%s", URL_PATH.register, account, platform, channelid, srvid)
end

function get_notice_url(days, loginData)
	local host = REAL_LOGIN_DATA and REAL_LOGIN_DATA.host or loginData.host
    return string.format("http://%s/api.php/local/local/notice/?%s", host, os.time())
end

