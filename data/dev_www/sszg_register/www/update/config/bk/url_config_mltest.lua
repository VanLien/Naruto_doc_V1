UPDATE_TRY_VERSION_MAX = 9
UPDATE_VERSION_MAX = 9
VerPath = {
["1"] = {name="yhdlanmltest20170914203454m762373v1", size=6974},
["2"] = {name="yhdlanmltest20170915153608m853244v2", size=21415},
["3"] = {name="yhdlanmltest20170918155422m580737v3", size=12233685},
["4"] = {name="yhdlanmltest20170919120257m464981v4", size=846076},
["5"] = {name="yhdlanmltest20170919204558m738087v5", size=268177},
["6"] = {name="yhdlanmltest20170920103320m703320v6", size=134012},
["7"] = {name="yhdlanmltest20170921121538m318858v7", size=17638},
["8"] = {name="zsryanmltest20180111011039m586817v8", size=31648526},
["9"] = {name="zsryanmltest20180111205846m702221v9", size=43883},
}
VerMergePath = {
}
cc.FileUtils:getInstance():purgeCachedEntries()
MOVE_CREATE_BUILD = true
CDN_URL = "http://cdnres.huangxiang.shiyuegame.com" 
REG_URL = "http://register.zsry.shiyuegame.com" 
CDN_RES_URL = CDN_URL .. "/update/update_allres3"
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
    function createSpineByName(spine_name, action_name, root, zorder, scale, pixelformal)
        spine_name = spine_name or "H99999"
        local frist_letter = string.sub(spine_name, 1, 1)
        pixelformal = pixelformal or PIXEL_FORMAT_DEFAULT
        if frist_letter == "H" then
            pixelformal = ROLE_FORMAT_DEFAULT
        end
        local js_path, atlas_path, png_path = PathTool.getSpineByName(spine_name, action_name)
        local armature = spSkeletonAnimationCreate(js_path, atlas_path, pixelformal)
        if not armature then 
            armature = spSkeletonAnimationCreate(js_path, atlas_path, pixelformal)
        end
        if not tolua.isnull(root) then
            root:addChild(armature, zorder or 0)
        end
        if scale and type(scale) == "number" then
            armature:setScale(scale)
        end
        return armature
    end

    if ViewManager:getInstance() then
        local manager = ViewManager:getInstance()
        function manager:getBaseLayout()
            return self.base_layout
        end
    end
end

CDN_PATH_BASE = CDN_URL.."/update/update_all/"
UPDATE_MODE_BY_INC = true
INC_VER_DOWNLOAD_PRO_MAX = 8

URL_PATH_ALL = {}
URL_PATH_ALL.other = { 
    update = CDN_URL.."/update/update_android_mltest",
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

function sdkBackInit()
end

if GAME_CODE == 'huanxiang' then
    VER_MAINTAIN_MSG = '封测完成'
end

