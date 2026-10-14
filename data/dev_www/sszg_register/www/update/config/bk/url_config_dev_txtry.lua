UPDATE_TRY_VERSION_MAX = 0
UPDATE_VERSION_MAX = 0
VerPath = {
}
VerMergePath = {
}
----------------------- 公共函数 ----------
-- CDN_URL = "http://cdnres.jstm.shiyuegame.com"
-- CDN_URL = "https://cdn.huanxiang.shiyue.cn"
CDN_URL = "http://register.huanxiang.shiyuegame.com" 
REG_URL = "http://register.huanxiang.shiyuegame.com" 

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

CDN_URL="http://cdn.demo.zsyz.shiyuegame.com"
CDN_PATH_BASE = CDN_URL.."/update/update_all/"

URL_PATH_ALL = {}
URL_PATH_ALL.demo = { 
    update = CDN_URL.."/update/update_android_demo",
    register = CDN_URL 
}
URL_PATH_ALL.get = function(platform)
    local data = URL_PATH_ALL[platform] or URL_PATH_ALL["other"]
    return data
end

function get_servers_url(account, platform, channelid, srvid, start, num)
    return string.format("%s/api/sszg_txtry.php?account=%s&platform=%s&chanleId=%s&srvid=%s", URL_PATH.register, account, platform, DEF_CHANNEL or 'dev', srvid)
end

function get_notice_url(days, loginData)
	local host = REAL_LOGIN_DATA and REAL_LOGIN_DATA.host or loginData.host
    return string.format("http://%s/api.php/local/local/notice/?%s", host, os.time())
end

FINAL_SERVERS = {platform = 'dev', zone_id = 19, name = "闪烁tx广告", host = 'cdn.demo.zsyz.shiyuegame.com', port = '9719', begin_time = 0}
