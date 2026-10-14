<?php
/**
 * User: dengzhenhua Email:dengzhenhua@shiyuegame.com
 * Date: 2017/12/5
 * Time: 17:52
 */
namespace Modules;

use Framework\Api;
use Framework\Db;

class Service
{
    /**
     * 服区世界等级
     * */
    public static function level()
    {
        $product_name = Api::getVar('product_name', true);
        $platform_name = Api::getVar('platform_name', true);
        $gameserver_no = Api::getInt('gameserver_no');
        $open_time = date('Y-m-d H:i:s',Api::getInt('open_time'));
        $post_time = date('Y-m-d H:i:s',Api::getInt('date_time'));
        $lv = Api::getInt('lv');

        $date_time = Api::getInt('date_time');
        $sign = Api::getVar('sign');

        if ($sign != md5($product_name . $date_time . $GLOBALS['cfg']['server_key'])) Api::out(false, 'sign error');

        //插入数据库
        $insert = compact('product_name', 'platform_name', 'gameserver_no', 'lv', 'open_time', 'post_time');

        $db = Db::getInstance();
        $ret = $db->insert('gm_service_level', $insert);

        if ($ret) {
            Api::out(true, '上报成功');
        } else {
            Api::out(false, '上报失败');
        }
    }
}