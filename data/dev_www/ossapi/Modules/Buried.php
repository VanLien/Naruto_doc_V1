<?php
/**
 * User: zhenhua
 * Date: 2018/6/7
 * Time: 下午5:18
 * 埋点日志
 */

namespace Modules;

use Framework\Api;
use Framework\Db;

class Buried
{

    public static function buried()
    {
        $product_name = Api::getVar('product_name');
        $platform_name = Api::getVar('platform_name');
        $channel_name = Api::getVar('channel_name');
        $gameserver_no = Api::getInt('gameserver_no');
        $post_time = date('Y-m-d H:i:s', Api::getInt('post_time'));
        $account = Api::getVar('account');
        $role_id = sprintf('%d_%s_%d', Api::getVar('role_id'), $platform_name, $gameserver_no);
        $role_name = Api::getVar('role_name');
        $lv = Api::getVar('lv');
        $vip_lv = Api::getVar('vip_lv');
        $career = Api::getVar('career');
        $gender = Api::getVar('gender');
        $reg_time =date('Y-m-d H:i:s', Api::getInt('reg_time'));
        $type = Api::getInt('type') ?? 1;
        $click_num = Api::getInt('click_num') ?? 1;
        $package_id = Api::getVar('package_id');
        $package_name = Api::getVar('package_name');

        $date_time = Api::getVar('date_time');
        if ($product_name == 'xianxia') Api::out(false, '接口停止接收数据');
        $sign = Api::getVar('sign');
        if ($product_name == 'h5sszg'){
            $sercet  = $GLOBALS['cfg']['h5sszg_secret_key'];
        }else{
            $sercet  = $GLOBALS['cfg']['secret_key'];
        }
        if ($sign != md5($product_name . $date_time . $sercet) && $sign != md5($product_name . $date_time . $GLOBALS['cfg']['server_key'])) {
            Api::out(false, 'sign error');
        }

        //插入数据库
        try{
            $ret = Db::getInstance()->insert('gm_buried', compact('product_name', 'platform_name', 'channel_name', 'gameserver_no', 'post_time', 'account',
                'role_id', 'role_name', 'lv', 'vip_lv', 'career', 'gender', 'reg_time', 'package_id', 'package_name', 'type', 'click_num'));
        }catch (\Exception $e){
            $ret = false;
        }

        //支持跨域访问
        header("Access-Control-Allow-Origin: *");
        if ($ret) {
            Api::out(true, '上报成功');
        } else {
            Api::out(false, '上报失败');
        }

    }
}