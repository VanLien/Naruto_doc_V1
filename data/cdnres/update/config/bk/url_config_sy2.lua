UPDATE_TRY_VERSION_MAX = 100
UPDATE_VERSION_MAX = 100
VerPath = {
["73"] = {name="yhdlansy220180202052626m375911v73", size=3264286},
["74"] = {name="yhdlansy220180202062305m347887v74", size=14830},
["75"] = {name="yhdlansy220180202172428m740944v75", size=20332},
["76"] = {name="yhdlansy220180211155650m380201v76", size=7752735},
["77"] = {name="yhdlansy220180211165106m794906v77", size=6418},
["78"] = {name="yhdlansy220180227100812m325719v78", size=1448467},
["79"] = {name="yhdlansy220180227201943m377674v79", size=128783},
["80"] = {name="yhdlansy220180307092020m306386v80", size=3500015},
["81"] = {name="yhdlansy220180313220930m662849v81", size=615737},
["82"] = {name="yhdlansy220180320205415m100290v82", size=1997124},
["83"] = {name="yhdlansy220180321153539m218922v83", size=31433},
["84"] = {name="yhdlansy220180327214955m438483v84", size=516911},
["85"] = {name="yhdlansy220180328131940m303938v85", size=746},
["86"] = {name="yhdlansy220180328220210m863824v86", size=50393},
["87"] = {name="yhdlansy220180403213229m501554v87", size=184094},
["88"] = {name="yhdlansy220180411211118m085745v88", size=113207},
["89"] = {name="yhdlansy220180418094407m604255v89", size=83207997},
["90"] = {name="yhdlansy220180418144727m018161v90", size=11917},
["91"] = {name="yhdlansy220180420184648m488171v91", size=86071},
["92"] = {name="yhdlansy220180423200833m170378v92", size=546362},
["93"] = {name="yhdlansy220180426000932m031330v93", size=676008},
["94"] = {name="yhdlansy220180427103930m959872v94", size=5218918},
["95"] = {name="yhdlansy220180427115903m283194v95", size=85282},
["96"] = {name="yhdlansy220180427183752m370534v96", size=639945},
["97"] = {name="yhdlansy220180508094032m105801v97", size=1177079},
["98"] = {name="yhdlansy220180509212600m824990v98", size=229281},
["99"] = {name="yhdlansy220180523210225m200026v99", size=148741},
["100"] = {name="yhdlansy220180530101710m600337v100", size=89265},
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
CDN_RES_URL = CDN_URL .. "/update/update_allres5"
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
end




CDN_PATH_BASE = CDN_URL.."/update/update_all/"

URL_PATH_ALL = {}
URL_PATH_ALL.other = { 
    update = CDN_URL.."/update/update_android_sy2",
    register = REG_URL 
}
URL_PATH_ALL.get = function(platform)
    local data = URL_PATH_ALL[platform] or URL_PATH_ALL["other"]
    return data
end

function get_servers_url(account, platform, channelid, srvid, start, num)
    return string.format("%s/index.php/server/lists2?account=%s&platform=%s&chanleId=%s&srvid=%s&start=%s&num=%s", URL_PATH.register, account, platform, channelid or '', srvid or '', start or 0, num or 0)
end

function get_notice_url(days, loginData)
	local host = REAL_LOGIN_DATA and REAL_LOGIN_DATA.host or loginData.host
    local channel = LoginPlatForm:getInstance():getChannel()
    return string.format("http://%s/api.php/local/local/notice/?channel=%s&time=%s", host, channel, os.time())
end

-- local now_ver = cc.UserDefault:getInstance():getIntegerForKey("local_version", 0)
-- now_ver = math.max(now_ver, NOW_VERSION)
-- local channel = cc.GameDevice:callFunc("channel", '', 0, 0, '')
-- if channel == "10001" or channel == "1002" then -- 测试散文件下载
-- if UPDATE_VERSION_MAX - now_ver > 3 then
UPDATE_MODE_BY_INC = true
INC_VER_DOWNLOAD_PRO_MAX = 8

