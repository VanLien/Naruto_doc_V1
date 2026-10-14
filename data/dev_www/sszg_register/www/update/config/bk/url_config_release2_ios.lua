UPDATE_TRY_VERSION_MAX = 20
UPDATE_VERSION_MAX = 20
VerPath = {
["1"] = {name="zsryiorelease220171228171133m147277v1", size=2302153},
["2"] = {name="zsryiorelease220171228180712m122048v2", size=1196977},
["3"] = {name="zsryiorelease220171228225441m373603v3", size=16377578},
["4"] = {name="zsryiorelease220171228231800m346374v4", size=56204},
["5"] = {name="zsryiorelease220180103145025m617667v5", size=21381255},
["6"] = {name="zsryiorelease220180103165749m478833v6", size=17109363},
["7"] = {name="zsryiorelease220180103205704m088104v7", size=14835239},
["8"] = {name="zsryiorelease220180104125442m589500v8", size=10291942},
["9"] = {name="zsryiorelease220180104213249m911530v9", size=27642753},
["10"] = {name="zsryiorelease220180105172738m555391v10", size=12528486},
["11"] = {name="zsryiorelease220180106151547m468401v11", size=11422702},
["12"] = {name="zsryiorelease220180108111454m345221v12", size=9124080},
["13"] = {name="zsryiorelease220180108212142m731214v13", size=6587866},
["14"] = {name="zsryiorelease220180109153049m146081v14", size=15763618},
["15"] = {name="zsryiorelease220180110164055m545287v15", size=6707204},
["16"] = {name="zsryiorelease220180110203409m349524v16", size=2219149},
["17"] = {name="zsryiorelease220180110232124m534251v17", size=810344},
["18"] = {name="zsryiorelease220180111001253m767209v18", size=122011},
["19"] = {name="zsryiorelease220180111004817m555596v19", size=17964},
["20"] = {name="zsryiorelease220180111024432m068879v20", size=4087},
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
    update = CDN_URL.."/update/update_ios_release2",
    register = REG_URL 
}
URL_PATH_ALL.get = function(platform)
    local data = URL_PATH_ALL[platform] or URL_PATH_ALL["other"]
    return data
end

function get_servers_url(account, platform, channelid, srvid, start, num)
    return string.format("%s/index.php/server/all2?account=%s&platform=%s&chanleId=%s&srvid=%s&start=%s&num=%s", URL_PATH.register, account, platform, channelid or '', srvid or '', start or 0, num or 0)
end

function get_notice_url(days, loginData)
	local host = REAL_LOGIN_DATA and REAL_LOGIN_DATA.host or loginData.host
    local channel = LoginPlatForm:getInstance():getChannel()
    return string.format("http://%s/api.php/local/local/notice/?channel=%s&time=%s", host, channel, os.time())
end

