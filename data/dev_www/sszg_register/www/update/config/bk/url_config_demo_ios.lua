UPDATE_TRY_VERSION_MAX = 4
UPDATE_VERSION_MAX = 4
VerPath = {
["2"] = {name="yhdliodemo20170803095539m137244v2", size=55362225},
["3"] = {name="yhdliodemo20170826181928m128239v3", size=65657000},
["4"] = {name="yhdliodemo20170826184157m441231v4", size=33736585},
}
VerMergePath = {
}
----------------------- 公共函数 ----------
-- CDN_URL = "http://cdnres.jstm.shiyuegame.com"
-- CDN_URL = "https://cdn.huanxiang.shiyue.cn"
CDN_URL = "http://cdnres.huangxiang.shiyuegame.com" 
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
    update = CDN_URL.."/update/update_ios_demo",
    register = CDN_URL 
}
URL_PATH_ALL.get = function(platform)
    local data = URL_PATH_ALL[platform] or URL_PATH_ALL["other"]
    return data
end

function get_servers_url(account, platform, channelid, srvid, start, num)
    return string.format("%s/api/role.php?account=%s&platform=%s&chanleId=%s&srvid=%s", URL_PATH.register, account, platform, DEF_CHANNEL or 'dev', srvid)
end

function get_notice_url(days, loginData)
	local host = REAL_LOGIN_DATA and REAL_LOGIN_DATA.host or loginData.host
    return string.format("http://%s/api.php/local/local/notice/?%s", host, os.time())
end

