UPDATE_TRY_VERSION_MAX = 19
UPDATE_VERSION_MAX = 19
VerPath = {
["1"] = {name="zsryanrelease220171228171155m323544v1", size=822779},
["2"] = {name="zsryanrelease220171228180657m214095v2", size=643891},
["3"] = {name="zsryanrelease220171228225454m661560v3", size=15031186},
["4"] = {name="zsryanrelease220171228231822m186774v4", size=14802},
["5"] = {name="zsryanrelease220180103144925m834346v5", size=19836147},
["6"] = {name="zsryanrelease220180103165814m157111v6", size=17083405},
["7"] = {name="zsryanrelease220180103205758m168518v7", size=14148198},
["8"] = {name="zsryanrelease220180104125527m840160v8", size=9728066},
["9"] = {name="zsryanrelease220180104213343m315320v9", size=26051041},
["10"] = {name="zsryanrelease220180105172830m527818v10", size=11382423},
["11"] = {name="zsryanrelease220180106151644m952019v11", size=11902374},
["12"] = {name="zsryanrelease220180108111548m375662v12", size=6979285},
["13"] = {name="zsryanrelease220180108212242m306294v13", size=5129399},
["14"] = {name="zsryanrelease220180109152359m663519v14", size=15132837},
["15"] = {name="zsryanrelease220180110203309m774484v15", size=6527413},
["16"] = {name="zsryanrelease220180110232145m761318v16", size=381511},
["17"] = {name="zsryanrelease220180111001303m011930v17", size=21684},
["18"] = {name="zsryanrelease220180111004826m170042v18", size=21733},
["19"] = {name="zsryanrelease220180111024448m819187v19", size=114584},
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
UPDATE_MODE_BY_INC = true
INC_VER_DOWNLOAD_PRO_MAX = 8

URL_PATH_ALL = {}
URL_PATH_ALL.other = { 
    update = CDN_URL.."/update/update_android_release2",
    register = REG_URL 
}
URL_PATH_ALL.get = function(platform)
    local data = URL_PATH_ALL[platform] or URL_PATH_ALL["other"]
    return data
end

function get_servers_url(account, platform, channelid, srvid, start, num)
    if TEST_APK then
        return string.format("http://cdn.demo.zsyz.shiyuegame.com/api/server_release2.php?account=%s&platform=%s&chanleId=%s&srvid=%s", register, account, platform, DEF_CHANNEL or 'release', srvid)
    end
    if TEST_REG then
        return string.format("http://register.yhdl.shiyuegame.com/index.php/server/lists2?account=%s&platform=%s&chanleId=%s&srvid=%s&start=%s&num=%s", account, platform, channelid or '', srvid or '', start or 0, num or 0)
    end
    if TEST_FLAG then
        return string.format("%s/index.php/server/lists2?account=%s&platform=%s&chanleId=%s&srvid=%s&start=%s&num=%s", URL_PATH.register, account, platform, channelid or '', srvid or '', start or 0, num or 0)
    end
    return string.format("%s/index.php/server/all2?account=%s&platform=%s&chanleId=%s&srvid=%s&start=%s&num=%s", URL_PATH.register, account, platform, channelid or '', srvid or '', start or 0, num or 0)
end

function get_notice_url(days, loginData)
	local host = REAL_LOGIN_DATA and REAL_LOGIN_DATA.host or loginData.host
    local channel = LoginPlatForm:getInstance():getChannel()
    return string.format("http://%s/api.php/local/local/notice/?channel=%s&time=%s", host, channel, os.time())
end

