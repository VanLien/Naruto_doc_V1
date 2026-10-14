UPDATE_TRY_VERSION_MAX = 0
UPDATE_VERSION_MAX = 0
VerPath = {
}
VerMergePath = {
}
cc.FileUtils:getInstance():purgeCachedEntries()
MOVE_CREATE_BUILD = true
CDN_URL = "http://cdnres.huangxiang.shiyuegame.com" 
REG_URL = "http://register.zsry.shiyuegame.com" 
CDN_RES_URL = CDN_URL .. "/update/update_allres2"
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
end

-- 加载模块完成 初始化instance调用完成时调用 
function webFunc_initInstanceEnd()
end

-- 游戏开时完毕时调用 
function webFunc_GameStart()
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
}
    return list[id] or string.format("com.gmry.hx.%s", money)
end

-- 光明荣耀
-- -- if cc.GameDevice:callFunc("package_version",'',0,0,'') == "1.0.0" then
if BUILD_VERSION >= 1 then
    UPDATE_SKIP = true
    IS_VERIFYIOS = true
    VERIFYIOS_SERVER_NAME = GAME_NAME
    cc.FileUtils:getInstance():addSearchPath("res_verifyios", true)
    FINAL_SERVERS = {platform = 'verifyios', zone_id = 1, name = GAME_NAME, host = 's1.verifyios.zsry.shiyuegame.com', port = '10011', begin_time = 0}
end
