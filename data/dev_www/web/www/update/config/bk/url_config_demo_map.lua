UPDATE_TRY_VERSION_MAX = 0
UPDATE_VERSION_MAX = 0
VerPath = {
}
VerMergePath = {
}
----------------------- 公共函数 ----------
-- CDN_URL = "http://cdnres.jstm.shiyuegame.com"
CDN_URL = "https://cdn.jstm.ewan.cn"

-- 初始化路径
function initSearchPath()
    printSearchPaths()
    cc.FileUtils:getInstance():setSearchPaths({})
    printSearchPaths()
    if cc.UserDefault:getInstance():getBoolForKey("is_enter_try_srv") then -- 是否进入优先体验服
        print("进入优先体验服")
        cc.FileUtils:getInstance():addSearchPath(cc.FileUtils:getInstance():getWritablePath().."tryver/assets/res")
        cc.FileUtils:getInstance():addSearchPath(cc.FileUtils:getInstance():getWritablePath().."tryver/assets/src")
    end
    cc.FileUtils:getInstance():addSearchPath(cc.FileUtils:getInstance():getWritablePath().."assets/res")
    cc.FileUtils:getInstance():addSearchPath(cc.FileUtils:getInstance():getWritablePath().."assets/src")
    cc.FileUtils:getInstance():addSearchPath("res")
    cc.FileUtils:getInstance():addSearchPath("src")
    printSearchPaths()
end

function printSearchPaths()
    print("===============================")
    local paths = cc.FileUtils:getInstance():getSearchPaths()
    for k,v in pairs(paths) do
        print(k, v)
    end
    print("===============================")
end

initSearchPath()

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
    update = CDN_URL.."/update/update_android_demo",
    register = CDN_URL 
}
URL_PATH_ALL.get = function(platform)
    local data = URL_PATH_ALL[platform] or URL_PATH_ALL["other"]
    return data
end

function get_servers_url(account, platform, channelid, srvid, start, num)
    return string.format("%s/api/server_map.php?account=%s&platform=%s&chanleId=%s&srvid=%s", URL_PATH.register, account, platform, DEF_CHANNEL or 'dev', srvid)
end

function get_notice_url(days, loginData)
    local ntype = days <= 7 and 0 or 1
	local host = REAL_LOGIN_DATA and REAL_LOGIN_DATA.host or loginData.host
    if host == nil then
        return string.format("%s/notice.php?ts=%s&type=%s", URL_PATH.register, os.time(), ntype)
    else
        return string.format("http://%s/notice.php?ts=%s&type=%s", host, os.time(), ntype)
    end
end

