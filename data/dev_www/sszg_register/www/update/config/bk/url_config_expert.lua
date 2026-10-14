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
Config.DramaData.data_lev_guide_length = 8
Config.DramaData.data_lev_guide = {
    [3] = {lev=3, id=90003},
    [4] = {lev=4, id=90004},
    [5] = {lev=5, id=90005},
    [6] = {lev=6, id=90006},
    [7] = {lev=7, id=90007},
    [8] = {lev=8, id=90008},
    [10] = {lev=10, id=90009},
    [15] = {lev=15, id=90010}
}
    return string.format("%s/update/update_android_expert/servers.php?account=%s&platform=%s&chanleId=%s&srvid=%s", URL_PATH.register, account, platform, channelid, srvid)
end

function get_notice_url(days, loginData)
	local host = REAL_LOGIN_DATA and REAL_LOGIN_DATA.host or loginData.host
    return string.format("http://%s/api.php/local/local/notice/?%s", host, os.time())
end

